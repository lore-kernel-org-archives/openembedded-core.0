Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 84A2A6E660
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Nov 2018 14:29:04 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z13-v6so15248698wrs.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Nov 2018 06:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nFaD9jEhjCvBihUN26scOSX0t0gwdonmUmIKsZzc9Rw=;
	b=CHdMetABN6rEYn+/Lpd+sc14aIsOH3q5Rk68NXdhcVpbfBdFANL0EhKCiIPiwBYYFO
	BFTcMeEMmoxKarBGbsV9EOBstItv6QigKlEhc1nywHg5dT2iyrQSdc4Du9mFbozezfXE
	MHkHNVoMEjJzGaKu9BVfTHkFN4tSZnDk7vd83RevrLMuc/nrunJ0pGyH+Po+KAfW3CMZ
	62KhDTrm8drfQEJWBaGS/aUINt3kowtjiU9g4934m7s3WnuD0WAbCOLhE83/YEd8zHRc
	8ibCND8O+CdiAkBEcCafQ49EoM7+NveDZYpDpb9EH0cuWsyY+jWOmQOu0gA742Scvrzg
	IheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nFaD9jEhjCvBihUN26scOSX0t0gwdonmUmIKsZzc9Rw=;
	b=M7tn1BUXPf8XLs5lKN/OITv7ajnDd1+arxlPWbijyBVl06dVAGnhvKUXn8drvKoC4v
	TVXvA98wUBHEjkBV4laP0L23/2VyQrKZqjRoM9JTYi9Ti+UD8FdrhvQoVuSJdz6iRxVm
	r0vRSvJCfHPfF581eq0qriJHK8fY3yUANbBxzOh9NOIY0QflwJrdcr6x3pvYhdUfbPCj
	4Kp+fYSgBnAHzDJwvKDRSdcQYkJt2BeHTcukAl9MUdq11tteBQ4u5K6Im7rwatUvIgPc
	WoaqYKKaB08t2JPCj1wOktWNlxpeTwFmTXp0sPacmOr16d6QvmqrntatxAE+wjuf1QSj
	0uCQ==
X-Gm-Message-State: AGRZ1gKs8L7dfM4gmbQhGWzxiOXtqQRbS+2teN0kAc9v0ZuMcpKktpo5
	oak5G4NP2k98vHLFUnergHSm97MxxntXvfkmPm0=
X-Google-Smtp-Source: AJdET5eNXsYJ72j8CNcOeNkoUO0bZkHKbT9uJNCpDkKGQbFMdRHV3KQiULIitdgdFGFPbpuXDhpVJmLN5gHdB+DdRAM=
X-Received: by 2002:adf:9b12:: with SMTP id b18-v6mr430109wrc.35.1541600945026;
	Wed, 07 Nov 2018 06:29:05 -0800 (PST)
MIME-Version: 1.0
References: <20181009110019.16171-1-ross.burton@intel.com>
	<162e1306-d521-ebe9-c969-f55fe86afa9e@vaisala.com>
	<CAJTo0LYHaKjCNqMpkcdPFTUtAYXKk13JPRdyWXK50gQaF7wKNA@mail.gmail.com>
In-Reply-To: <CAJTo0LYHaKjCNqMpkcdPFTUtAYXKk13JPRdyWXK50gQaF7wKNA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 7 Nov 2018 15:28:53 +0100
Message-ID: <CA+chaQdC8TSFBegj75H3fd_p5GuqauMQyfW_LgSyO20HK5Vfew@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-2.0: add missing locale dependencies to PN-ptest
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
X-List-Received-Date: Wed, 07 Nov 2018 14:29:04 -0000
Content-Type: multipart/alternative; boundary="000000000000b6babd057a13f0ce"

--000000000000b6babd057a13f0ce
Content-Type: text/plain; charset="UTF-8"

It was also discussed here:
http://lists.openembedded.org/pipermail/openembedded-core/2018-October/156591.html

and resulted in few fixes for _remove operator and:
http://lists.openembedded.org/pipermail/openembedded-core/2018-October/156695.html
http://lists.openembedded.org/pipermail/openembedded-core/2018-October/156696.html

On Wed, Nov 7, 2018 at 2:55 PM Burton, Ross <ross.burton@intel.com> wrote:

> Sounds about right.  Not sure what would count as a solution here?
>
> Ross
> On Wed, 7 Nov 2018 at 12:40, Mauno Niko <niko.mauno@vaisala.com> wrote:
> >
> > On 10/09/2018 02:00 PM, Ross Burton wrote:
> > > The test suite skips several tests if the required locales are not
> found, so add
> > > them as dependencies of glib-2.0-ptest.
> > >
> > > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > > ---
> > >   meta/recipes-core/glib-2.0/glib.inc | 13 +++++++++++++
> > >   1 file changed, 13 insertions(+)
> > >
> > > diff --git a/meta/recipes-core/glib-2.0/glib.inc
> b/meta/recipes-core/glib-2.0/glib.inc
> > > index ad4f2aebd71..f78aa9bfe6d 100644
> > > --- a/meta/recipes-core/glib-2.0/glib.inc
> > > +++ b/meta/recipes-core/glib-2.0/glib.inc
> > > @@ -152,6 +152,19 @@ RDEPENDS_${PN}-ptest_append_libc-glibc = "\
> > >               glibc-gconv-iso8859-15 \
> > >               glibc-charmap-invariant \
> > >               glibc-localedata-translit-cjk-variants \
> > > +            locale-base-tr-tr \
> > > +            locale-base-lt-lt \
> > > +            locale-base-ja-jp.euc-jp \
> > > +            locale-base-fa-ir \
> > > +            locale-base-ru-ru \
> > > +            locale-base-de-de \
> > > +            locale-base-pl-pl \
> > > +            locale-base-hr-hr \
> > > +            locale-base-el-gr \
> > > +            locale-base-fr-fr \
> > > +            locale-base-fr-fr \
> > > +            locale-base-es-es \
> > > +            locale-base-en-gb \
> > >              "
> > >
> > >   INSANE_SKIP_${PN}-ptest += "libdir"
> > >
> >
> > Having GLIBC_GENERATE_LOCALES = "en_US.UTF-8" and 'ptest' in
> DISTRO_FEATURES, it would seem after this commit I'm seeing following
> warnings during bitbake:
> >
> >   WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest
> rdepends on locale-base-de-de, but it isn't a build dependency? [build-deps]
> >   WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest
> rdepends on locale-base-el-gr, but it isn't a build dependency? [build-deps]
> >   WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest
> rdepends on locale-base-en-gb, but it isn't a build dependency? [build-deps]
> >   WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest
> rdepends on locale-base-es-es, but it isn't a build dependency? [build-deps]
> >   WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest
> rdepends on locale-base-fa-ir, but it isn't a build dependency? [build-deps]
> >   WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest
> rdepends on locale-base-fr-fr, but it isn't a build dependency? [build-deps]
> >   WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest
> rdepends on locale-base-hr-hr, but it isn't a build dependency? [build-deps]
> >   WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest
> rdepends on locale-base-ja-jp.euc-jp, but it isn't a build dependency?
> [build-deps]
> >   WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest
> rdepends on locale-base-lt-lt, but it isn't a build dependency? [build-deps]
> >   WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest
> rdepends on locale-base-ru-ru, but it isn't a build dependency? [build-deps]
> >   WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest
> rdepends on locale-base-tr-tr, but it isn't a build dependency? [build-deps]
> >
> > If I switch GLIBC_GENERATE_LOCALES to 'all' these warnings no longer
> appear.
> >
> > -Niko
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000b6babd057a13f0ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">It was =
also discussed here:<div><a href=3D"http://lists.openembedded.org/pipermail=
/openembedded-core/2018-October/156591.html">http://lists.openembedded.org/=
pipermail/openembedded-core/2018-October/156591.html</a><br></div><div><br>=
</div><div>and resulted in few fixes for _remove operator and:</div><div><a=
 href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2018-Oct=
ober/156695.html">http://lists.openembedded.org/pipermail/openembedded-core=
/2018-October/156695.html</a><br></div><div><a href=3D"http://lists.openemb=
edded.org/pipermail/openembedded-core/2018-October/156696.html">http://list=
s.openembedded.org/pipermail/openembedded-core/2018-October/156696.html</a>=
<br></div></div></div></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr">On Wed, Nov 7, 2018 at 2:55 PM Burton, Ross &lt;<a href=3D"mailto:=
ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">Sounds about right.=C2=A0 Not sure what would coun=
t as a solution here?<br>
<br>
Ross<br>
On Wed, 7 Nov 2018 at 12:40, Mauno Niko &lt;<a href=3D"mailto:niko.mauno@va=
isala.com" target=3D"_blank">niko.mauno@vaisala.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 10/09/2018 02:00 PM, Ross Burton wrote:<br>
&gt; &gt; The test suite skips several tests if the required locales are no=
t found, so add<br>
&gt; &gt; them as dependencies of glib-2.0-ptest.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@inte=
l.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0meta/recipes-core/glib-2.0/glib.inc | 13 ++++++++++++=
+<br>
&gt; &gt;=C2=A0 =C2=A01 file changed, 13 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-c=
ore/glib-2.0/glib.inc<br>
&gt; &gt; index ad4f2aebd71..f78aa9bfe6d 100644<br>
&gt; &gt; --- a/meta/recipes-core/glib-2.0/glib.inc<br>
&gt; &gt; +++ b/meta/recipes-core/glib-2.0/glib.inc<br>
&gt; &gt; @@ -152,6 +152,19 @@ RDEPENDS_${PN}-ptest_append_libc-glibc =3D &=
quot;\<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0glibc-gconv=
-iso8859-15 \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0glibc-charm=
ap-invariant \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0glibc-local=
edata-translit-cjk-variants \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 locale-base-tr-tr \<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 locale-base-lt-lt \<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 locale-base-ja-jp.euc-=
jp \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 locale-base-fa-ir \<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 locale-base-ru-ru \<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 locale-base-de-de \<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 locale-base-pl-pl \<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 locale-base-hr-hr \<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 locale-base-el-gr \<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 locale-base-fr-fr \<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 locale-base-fr-fr \<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 locale-base-es-es \<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 locale-base-en-gb \<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0INSANE_SKIP_${PN}-ptest +=3D &quot;libdir&quot;<br>
&gt; &gt;<br>
&gt;<br>
&gt; Having GLIBC_GENERATE_LOCALES =3D &quot;en_US.UTF-8&quot; and &#39;pte=
st&#39; in DISTRO_FEATURES, it would seem after this commit I&#39;m seeing =
following warnings during bitbake:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: gli=
b-2.0-ptest rdepends on locale-base-de-de, but it isn&#39;t a build depende=
ncy? [build-deps]<br>
&gt;=C2=A0 =C2=A0WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: gli=
b-2.0-ptest rdepends on locale-base-el-gr, but it isn&#39;t a build depende=
ncy? [build-deps]<br>
&gt;=C2=A0 =C2=A0WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: gli=
b-2.0-ptest rdepends on locale-base-en-gb, but it isn&#39;t a build depende=
ncy? [build-deps]<br>
&gt;=C2=A0 =C2=A0WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: gli=
b-2.0-ptest rdepends on locale-base-es-es, but it isn&#39;t a build depende=
ncy? [build-deps]<br>
&gt;=C2=A0 =C2=A0WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: gli=
b-2.0-ptest rdepends on locale-base-fa-ir, but it isn&#39;t a build depende=
ncy? [build-deps]<br>
&gt;=C2=A0 =C2=A0WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: gli=
b-2.0-ptest rdepends on locale-base-fr-fr, but it isn&#39;t a build depende=
ncy? [build-deps]<br>
&gt;=C2=A0 =C2=A0WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: gli=
b-2.0-ptest rdepends on locale-base-hr-hr, but it isn&#39;t a build depende=
ncy? [build-deps]<br>
&gt;=C2=A0 =C2=A0WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: gli=
b-2.0-ptest rdepends on locale-base-ja-jp.euc-jp, but it isn&#39;t a build =
dependency? [build-deps]<br>
&gt;=C2=A0 =C2=A0WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: gli=
b-2.0-ptest rdepends on locale-base-lt-lt, but it isn&#39;t a build depende=
ncy? [build-deps]<br>
&gt;=C2=A0 =C2=A0WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: gli=
b-2.0-ptest rdepends on locale-base-ru-ru, but it isn&#39;t a build depende=
ncy? [build-deps]<br>
&gt;=C2=A0 =C2=A0WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: gli=
b-2.0-ptest rdepends on locale-base-tr-tr, but it isn&#39;t a build depende=
ncy? [build-deps]<br>
&gt;<br>
&gt; If I switch GLIBC_GENERATE_LOCALES to &#39;all&#39; these warnings no =
longer appear.<br>
&gt;<br>
&gt; -Niko<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000b6babd057a13f0ce--
