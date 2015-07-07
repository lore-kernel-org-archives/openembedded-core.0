Return-Path: <ticotimo@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4C5B075D37;
	Tue,  7 Jul 2015 16:58:52 +0000 (UTC)
Received: by igcsj18 with SMTP id sj18so266637721igc.1;
	Tue, 07 Jul 2015 09:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=p6lJY3fp/H3j16P2SilniyOglR4BgH/Q2QgaYJOaEwU=;
	b=gAx9Mr9mTqbki8TUaqYSjvV7PmCJRZSB5xsGkZeld1fcV3gs54lJ+kE6fCOfV2+yAa
	YgyCC915+xUCxfQ9QYSdj/qtcMZJ+Noqa+E943ofRqcQOgOV3H8uaM9FBXuGfqdEu8dE
	EJqksh8YDNwc9qexWirHjARCJEuS4JVQiHzcEkfYTgnFOycmueJg563CI4eEqveS6u7R
	2Nk068jKRC9w9M9SKpUryErNzlQ0Ra8e2f3eGEiHgpixe2utfcnuq8FpOAbcPwR9qobn
	nd1VlEKPtRjCybmwrWS4d8vWBJMIy8kZuckTqQYSDCrK+TEIR8Mfxbyh7qiJ7U2Gr6is
	n4FA==
MIME-Version: 1.0
X-Received: by 10.50.2.3 with SMTP id 3mr79885480igq.34.1436288332718; Tue, 07
	Jul 2015 09:58:52 -0700 (PDT)
Received: by 10.36.215.129 with HTTP; Tue, 7 Jul 2015 09:58:52 -0700 (PDT)
In-Reply-To: <20150707105449.GA2397@jama>
References: <20150707105449.GA2397@jama>
Date: Tue, 7 Jul 2015 09:58:52 -0700
Message-ID: <CANx9H-AHXXY_FQ9FSVs2Wg-H7mhSGFPw5EyeUm53aEBgdMPeCA@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2015-07-04
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Jul 2015 16:58:53 -0000
Content-Type: multipart/alternative; boundary=089e0111b970ddea03051a4bef21

--089e0111b970ddea03051a4bef21
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 7, 2015 at 3:54 AM, Martin Jansa <martin.jansa@gmail.com> wrote:

> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> <snip>
>
> == Failed tasks 2015-07-04 ==
>
> INFO: jenkins-job.sh-1.3.1 Complete log available at
> http://logs.nslu2-linux.org/buildlogs/oe/world/log.report.20150705_101525.log
>
> === common (9) ===
>     * /meta-openembedded/meta-efl/recipes-efl/efl/epdf_svn.bb, do_compile
>     * /meta-openembedded/meta-multimedia/recipes-mkv/mkvtoolnix/
> mkvtoolnix_git.bb, do_compile
>     * /meta-openembedded/meta-oe/recipes-extended/cmpi-bindings/
> cmpi-bindings_git.bb, do_compile
>     * /meta-openembedded/meta-oe/recipes-extended/openwsman/
> openwsman_2.6.0.bb, do_compile
>     * /meta-openembedded/meta-oe/recipes-extended/polkit/polkit_0.112.bb,
> do_configure
>     * /meta-openembedded/meta-oe/recipes-extended/sblim-sfcb/
> sblim-sfcb_1.4.8.bb, do_compile
>     * /meta-openembedded/meta-perl/recipes-perl/libextutils/
> libextutils-cppguess-perl_0.07.bb, do_configure
>     * /meta-openembedded/meta-perl/recipes-perl/libmodule/
> libmodule-pluggable-perl_5.1.bb, do_configure
>     * /meta-openembedded/meta-perl/recipes-perl/libmodule/
> libmodule-runtime-perl_0.014.bb, do_configure
>
> <snip>


The three perl modules are failing because libmodule-build-perl is no
longer included in perl 5.22 upgrade and this commit:
http://git.openembedded.org/openembedded-core/commit/?id=80afd9650328de2eb17ba0e104ee2c76a7fb983e

Rather than cripple cpan-build.bbclass, a recipe for libmodule-build-perl
direct from CPAN is needed and will need to be added to oe-core, unless we
want cpan-build.bbclass to do nothing useful.

I am working on it after hours, but it may take a few days.

--Tim

--089e0111b970ddea03051a4bef21
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Jul 7, 2015 at 3:54 AM, Martin Jansa <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,2=
04);border-left-style:solid;padding-left:1ex"><a href=3D"http://www.openemb=
edded.org/wiki/Bitbake_World_Status" rel=3D"noreferrer" target=3D"_blank">h=
ttp://www.openembedded.org/wiki/Bitbake_World_Status</a><br>
<br>&lt;snip&gt;<br>
<br>
=3D=3D Failed tasks 2015-07-04 =3D=3D<br>
<br>
INFO: jenkins-job.sh-1.3.1 Complete log available at <a href=3D"http://logs=
.nslu2-linux.org/buildlogs/oe/world/log.report.20150705_101525.log" rel=3D"=
noreferrer" target=3D"_blank">http://logs.nslu2-linux.org/buildlogs/oe/worl=
d/log.report.20150705_101525.log</a><br>
<br>
=3D=3D=3D common (9) =3D=3D=3D<br>
=C2=A0 =C2=A0 * /meta-openembedded/meta-efl/recipes-efl/efl/<a href=3D"http=
://epdf_svn.bb" rel=3D"noreferrer" target=3D"_blank">epdf_svn.bb</a>, do_co=
mpile<br>
=C2=A0 =C2=A0 * /meta-openembedded/meta-multimedia/recipes-mkv/mkvtoolnix/<=
a href=3D"http://mkvtoolnix_git.bb" rel=3D"noreferrer" target=3D"_blank">mk=
vtoolnix_git.bb</a>, do_compile<br>
=C2=A0 =C2=A0 * /meta-openembedded/meta-oe/recipes-extended/cmpi-bindings/<=
a href=3D"http://cmpi-bindings_git.bb" rel=3D"noreferrer" target=3D"_blank"=
>cmpi-bindings_git.bb</a>, do_compile<br>
=C2=A0 =C2=A0 * /meta-openembedded/meta-oe/recipes-extended/openwsman/<a hr=
ef=3D"http://openwsman_2.6.0.bb" rel=3D"noreferrer" target=3D"_blank">openw=
sman_2.6.0.bb</a>, do_compile<br>
=C2=A0 =C2=A0 * /meta-openembedded/meta-oe/recipes-extended/polkit/<a href=
=3D"http://polkit_0.112.bb" rel=3D"noreferrer" target=3D"_blank">polkit_0.1=
12.bb</a>, do_configure<br>
=C2=A0 =C2=A0 * /meta-openembedded/meta-oe/recipes-extended/sblim-sfcb/<a h=
ref=3D"http://sblim-sfcb_1.4.8.bb" rel=3D"noreferrer" target=3D"_blank">sbl=
im-sfcb_1.4.8.bb</a>, do_compile<br>
=C2=A0 =C2=A0 * /meta-openembedded/meta-perl/recipes-perl/libextutils/<a hr=
ef=3D"http://libextutils-cppguess-perl_0.07.bb" rel=3D"noreferrer" target=
=3D"_blank">libextutils-cppguess-perl_0.07.bb</a>, do_configure<br>
=C2=A0 =C2=A0 * /meta-openembedded/meta-perl/recipes-perl/libmodule/<a href=
=3D"http://libmodule-pluggable-perl_5.1.bb" rel=3D"noreferrer" target=3D"_b=
lank">libmodule-pluggable-perl_5.1.bb</a>, do_configure<br>
=C2=A0 =C2=A0 * /meta-openembedded/meta-perl/recipes-perl/libmodule/<a href=
=3D"http://libmodule-runtime-perl_0.014.bb" rel=3D"noreferrer" target=3D"_b=
lank">libmodule-runtime-perl_0.014.bb</a>, do_configure<br>
<br>&lt;snip&gt;</blockquote><div><br></div><div>The three perl modules are=
 failing because libmodule-build-perl is no longer included in perl 5.22 up=
grade and this commit:</div><div><a href=3D"http://git.openembedded.org/ope=
nembedded-core/commit/?id=3D80afd9650328de2eb17ba0e104ee2c76a7fb983e">http:=
//git.openembedded.org/openembedded-core/commit/?id=3D80afd9650328de2eb17ba=
0e104ee2c76a7fb983e</a></div><div><br></div><div>Rather than cripple cpan-b=
uild.bbclass, a recipe for libmodule-build-perl direct from CPAN is needed =
and will need to be added to oe-core, unless we want cpan-build.bbclass to =
do nothing useful.</div><div><br></div><div>I am working on it after hours,=
 but it may take a few days.</div><div><br></div><div>--Tim=C2=A0</div></di=
v><br></div></div>

--089e0111b970ddea03051a4bef21--
