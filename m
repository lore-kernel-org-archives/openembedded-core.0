Received: from mail-vb0-f45.google.com ([209.85.212.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1U4TiK-0004cH-8V
	for openembedded-core@lists.openembedded.org;
	Sun, 10 Feb 2013 11:01:07 +0100
Received: by mail-vb0-f45.google.com with SMTP id p1so3253207vbi.32
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Feb 2013 01:44:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:x-originating-ip:in-reply-to:references
	:from:date:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=UmCIHU3TyOFiD0l+eeMOsnQcSP7+CX/R/fcrejIrRhk=;
	b=mu2AIRmMe/ukeminOEM1JV6yRXvs4iZEBRslm6FkZ82ZRIor77KfziUvr3suAaF9ua
	1R6smgQgcu3CkRYaO5GKce6z4Bv2MpFNn2SZvg3+tictPfGyHmftAv4E5GxJhoo1Zuog
	k1XOr0H9Du93+Wz3PFP0lu1ipQFEK6d1vzUYfp5r4AKunZREkywhBhAjWq/fGl2DKFx5
	KsH3dZ3X7pnLITMabiZLMp4OeYK0+qNR6PJzN9DDSifOeEWFQn81RqgQztg67+Kc39ye
	MUbB0eCw48gtBOy+LH1YKsA8KlL2J+vh+Eb5rO/uPIBi7VtB/KHGaMlpbLhIKCJqTu4Q
	F4Sw==
X-Received: by 10.52.95.243 with SMTP id dn19mr12192136vdb.110.1360489491257; 
	Sun, 10 Feb 2013 01:44:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.229.195 with HTTP; Sun, 10 Feb 2013 01:44:31 -0800 (PST)
X-Originating-IP: [5.13.217.124]
In-Reply-To: <1360454631.10722.130.camel@ted>
References: <1360431352-29452-1-git-send-email-andrei@gherzan.ro>
	<1360454631.10722.130.camel@ted>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Sun, 10 Feb 2013 11:44:31 +0200
Message-ID: <CAK18fxGfHdYy3D35LQO5vUAompMm=+RYXgXkErERGxCTHmYi3Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQnisQbp4oDJgSELapcdIn0Dm26z97KqInseyB9OwgZ01oOwcZP24wUE0IwbLxn3A2KWmWtf
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] eglibc: Add missing dependency of gettext-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 10 Feb 2013 10:01:10 -0000
Content-Type: multipart/alternative; boundary=20cf307f3bc4d8db6704d55ba4d7

--20cf307f3bc4d8db6704d55ba4d7
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Feb 10, 2013 at 2:03 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2013-02-09 at 19:35 +0200, Andrei Gherzan wrote:
> > /bin/bash: msgfmt: command not found
> > | make[2]: *** [be.mo] Error 127
> >
> > Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> > ---
> >  meta/recipes-core/eglibc/eglibc_2.17.bb |    4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-core/eglibc/eglibc_2.17.bbb/meta/recipes-core/eglibc/
> eglibc_2.17.bb
> > index fb49ac4..03e0ea4 100644
> > --- a/meta/recipes-core/eglibc/eglibc_2.17.bb
> > +++ b/meta/recipes-core/eglibc/eglibc_2.17.bb
> > @@ -1,8 +1,8 @@
> >  require eglibc.inc
> >
> > -PR = "r3"
> > +PR = "r4"
> >
> > -DEPENDS += "gperf-native kconfig-frontends-native"
> > +DEPENDS += "gperf-native kconfig-frontends-native gettext-native"
> >
> >  SRC_URI = "
> http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr22064.tar.bz2\
> >             file://eglibc-svn-arm-lowlevellock-include-tls.patch \
>
> This will seriously hurt build times :(
>
> I'm not saying this is wrong but I would like to understand how we've
> managed for as long without it...
>

Seems like a classic racing issue. This can't be reproduced in a clean
build. It happened to me yesterday, when I updated the layers and baked a
core-image-minimal.


-- 
*Andrei Gherzan*
m: +40.744.478.414 |  f: +40.31.816.28.12

--20cf307f3bc4d8db6704d55ba4d7
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><div class=3D"gmail_quote">=
On Sun, Feb 10, 2013 at 2:03 AM, Richard Purdie <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.=
purdie@linuxfoundation.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On S=
at, 2013-02-09 at 19:35 +0200, Andrei Gherzan wrote:<br>
&gt; /bin/bash: msgfmt: command not found<br>
&gt; | make[2]: *** [be.mo] Error 127<br>
&gt;<br>
&gt; Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro"=
>andrei@gherzan.ro</a>&gt;<br>
&gt; ---<br>
&gt; =A0meta/recipes-core/eglibc/<a href=3D"http://eglibc_2.17.bb" target=
=3D"_blank">eglibc_2.17.bb</a> | =A0 =A04 ++--<br>
&gt; =A01 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/eglibc/<a href=3D"http://eglibc_2.17.bb=
" target=3D"_blank">eglibc_2.17.bb</a> b/meta/recipes-core/eglibc/<a href=
=3D"http://eglibc_2.17.bb" target=3D"_blank">eglibc_2.17.bb</a><br>
&gt; index fb49ac4..03e0ea4 100644<br>
&gt; --- a/meta/recipes-core/eglibc/<a href=3D"http://eglibc_2.17.bb" targe=
t=3D"_blank">eglibc_2.17.bb</a><br>
&gt; +++ b/meta/recipes-core/eglibc/<a href=3D"http://eglibc_2.17.bb" targe=
t=3D"_blank">eglibc_2.17.bb</a><br>
&gt; @@ -1,8 +1,8 @@<br>
&gt; =A0require eglibc.inc<br>
&gt;<br>
&gt; -PR =3D &quot;r3&quot;<br>
&gt; +PR =3D &quot;r4&quot;<br>
&gt;<br>
&gt; -DEPENDS +=3D &quot;gperf-native kconfig-frontends-native&quot;<br>
&gt; +DEPENDS +=3D &quot;gperf-native kconfig-frontends-native gettext-nati=
ve&quot;<br>
&gt;<br>
&gt; =A0SRC_URI =3D &quot;<a href=3D"http://downloads.yoctoproject.org/rele=
ases/eglibc/eglibc-${PV}-svnr22064.tar.bz2" target=3D"_blank">http://downlo=
ads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr22064.tar.bz2</a> \<b=
r>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 file://eglibc-svn-arm-lowlevellock-include-tls=
.patch \<br>
<br>
</div></div>This will seriously hurt build times :(<br>
<br>
I&#39;m not saying this is wrong but I would like to understand how we&#39;=
ve<br>
managed for as long without it...<br></blockquote><div>=A0</div><div style>=
Seems like a classic racing issue. This can&#39;t be reproduced in a clean =
build. It happened to me yesterday, when I updated the layers and baked a c=
ore-image-minimal.</div>

</div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"><div style=
=3D"text-align:center"></div><div style=3D"text-align:center"><div align=3D=
"left" style=3D"font-family:&#39;Times New Roman&#39;;font-size:medium"><b =
style=3D"color:rgb(51,51,51);font-family:Arial;font-size:small;text-align:c=
enter">Andrei Gherzan</b><font face=3D"Arial" color=3D"#333333" size=3D"-1"=
><br>

</font><font face=3D"Arial" color=3D"#333333" size=3D"-1">m: +40.744.478.41=
4 | =A0f: +40.31.816.28.12</font><br></div></div></div>
</div></div>

--20cf307f3bc4d8db6704d55ba4d7--
