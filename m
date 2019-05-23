Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9D2147E454
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 20:59:39 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id z6so4695403qkl.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 13:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cNaGONcJrOsXT7PRQCNh99yDlfMxtyy7jxhhHL4Wm+k=;
	b=f3efJRcPXuwsY9AgGWrfVG7xgkO655PzUXo6eO7Xw+Bq72ybAqa2nsdpMOSivt9daP
	0hXulHexRHBkKZudworZ1UxcBV+kR6bWtKyzKLB7LAp56lbPLlAeUSk0QONLfh6n4BOx
	A3oUKoM2Dw+JNEAyxE+qu/67w9kwKokPf8gAqnMDpTUgo8PH9dT4IydH+JSo05i7BSuo
	Xyaf6s9q6g+taJHFDWVPFUW1Ssqme7RfQ4Zct4G2Ak8iwZ7PzYFDMlxlc2AT9TshOhhF
	9Ml1P6LsbfhbQQStfIyYZq9vTNz5QsieSghDcsMFsY/UYoCsCmXnL1z2+S4zc8Uv06p3
	KNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cNaGONcJrOsXT7PRQCNh99yDlfMxtyy7jxhhHL4Wm+k=;
	b=HJEhkKPbiNuUpyxNwFQ36LziC4UHqq1JY9kYi284StRhWETUrV6zflAhhgfSOh98VV
	q3c3ojOB9Qd2WNXi+vuSKQ5MQMua4AYGdJw7G//CZTOP0DtfoufV0gL7ldH2UUk3LB/U
	vUME+nsg+Te/S8aoBlLQQNkKx5o22+dLZYOCS9QXn+KlzLWm23nHNael/s00UX9S7hQI
	MlX2So0ug86Id+mAcpm2WTRLcDjY4zMFJOT5bYb848pl/KNPbGLt/VLyFcI+aCpD4gXD
	oEobd6CXbMgrxIcrne3gs5sPXjgiZOjcqFfImLQAKpzUDwMaJ0TYdLIo1xif2FYhqkB5
	BBNg==
X-Gm-Message-State: APjAAAWYZbrYKiqEwPNSrRI5rw3CVLa4JcKB9ku0eg/d4ecWX7zNFfIT
	4FCENaUq8+CRXW8i80GRDq9bRDmJqM6XO+CTrj0=
X-Google-Smtp-Source: APXvYqz6b2/QFQR3PJ/pjI7dM9CCRT6IvIcsKZ2jtBBx8/mBNF8uJJ/u4nem9cAMm8ZlM8Bwulv9b6nDMYT5J0w1Vsk=
X-Received: by 2002:a37:59c7:: with SMTP id n190mr77973538qkb.24.1558645180265;
	Thu, 23 May 2019 13:59:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190523082558.3805-1-kai.kang@windriver.com>
	<20190523082558.3805-2-kai.kang@windriver.com>
	<36fa4c4d62d448588b54a0a4b0a5c92a@XBOX04.axis.com>
In-Reply-To: <36fa4c4d62d448588b54a0a4b0a5c92a@XBOX04.axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 May 2019 13:59:29 -0700
Message-ID: <CAMKF1spu88QXmGms77KzQXVGYSw7dR=40G_Ldd37G0DC1pc68w@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/2] local.conf.sample: make systemd as default init manager
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
X-List-Received-Date: Thu, 23 May 2019 20:59:39 -0000
Content-Type: multipart/alternative; boundary="0000000000004cf88f0589945c8a"

--0000000000004cf88f0589945c8a
Content-Type: text/plain; charset="UTF-8"

On Thu, May 23, 2019 at 1:41 PM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> > core-bounces@lists.openembedded.org> On Behalf Of
> > kai.kang@windriver.com
> > Sent: den 23 maj 2019 10:26
> > To: richard.purdie@linuxfoundation.org
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH v3 1/2] local.conf.sample: make systemd as
> > default init manager
> >
> > From: Kai Kang <kai.kang@windriver.com>
> >
> > Move configurations from local.conf.sample.extended to local.conf.sample
> > to make systemd as default init manager for poky.
>
> If we're going to change the default init manager to be systemd, wouldn't
> it be more appropriate to change the real default values in bitbake.conf
> and packagegroup-core-boot.bb? And then include an example in
> local.conf.sample.extended to show how to configure sysvinit as init
> manager?


That would change it for Oe-core and other distributions as well which is
not the intention

>
>
> >
> > [YOCTO #13031]
> >
> > Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > ---
> >  meta-poky/conf/local.conf.sample          | 9 +++++++++
> >  meta-poky/conf/local.conf.sample.extended | 9 ---------
> >  2 files changed, 9 insertions(+), 9 deletions(-)
> >
> > diff --git a/meta-poky/conf/local.conf.sample b/meta-
> > poky/conf/local.conf.sample
> > index 9068e567dc..3a07105e44 100644
> > --- a/meta-poky/conf/local.conf.sample
> > +++ b/meta-poky/conf/local.conf.sample
> > @@ -249,3 +249,12 @@ PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl"
> >  # track the version of this file when it was generated. This can
> > safely be ignored if
> >  # this doesn't mean anything to you.
> >  CONF_VERSION = "1"
> > +
> > +#
> > +# Use systemd for system initialization
> > +#
> > +DISTRO_FEATURES_append = " systemd"
> > +DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
> > +VIRTUAL-RUNTIME_login_manager = "shadow-base"
> > +VIRTUAL-RUNTIME_init_manager = "systemd"
> > +VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
> > diff --git a/meta-poky/conf/local.conf.sample.extended b/meta-
> > poky/conf/local.conf.sample.extended
> > index 26603debe6..e20fc5dbf3 100644
> > --- a/meta-poky/conf/local.conf.sample.extended
> > +++ b/meta-poky/conf/local.conf.sample.extended
> > @@ -377,12 +377,3 @@ DISTRO_FEATURES_remove = "x11"
> >  #VIRTUAL-RUNTIME_initscripts = "initscripts"
> >  #VIRTUAL-RUNTIME_keymaps = "keymaps"
> >  #DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
> > -
> > -#
> > -# Use systemd for system initialization
> > -#
> > -#DISTRO_FEATURES_append = " systemd"
> > -#DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
> > -#VIRTUAL-RUNTIME_login_manager = "shadow-base"
> > -#VIRTUAL-RUNTIME_init_manager = "systemd"
> > -#VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
> > --
> > 2.18.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000004cf88f0589945c8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, May 23, 2019 at 1:41 PM Peter Kjellerstedt &lt;<a h=
ref=3D"mailto:peter.kjellerstedt@axis.com">peter.kjellerstedt@axis.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt; -----Original Messa=
ge-----<br>
&gt; From: <a href=3D"mailto:openembedded-core-bounces@lists.openembedded.o=
rg" target=3D"_blank">openembedded-core-bounces@lists.openembedded.org</a> =
&lt;openembedded-<br>
&gt; <a href=3D"mailto:core-bounces@lists.openembedded.org" target=3D"_blan=
k">core-bounces@lists.openembedded.org</a>&gt; On Behalf Of<br>
&gt; <a href=3D"mailto:kai.kang@windriver.com" target=3D"_blank">kai.kang@w=
indriver.com</a><br>
&gt; Sent: den 23 maj 2019 10:26<br>
&gt; To: <a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation.org</a><br>
&gt; Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Subject: [OE-core] [PATCH v3 1/2] local.conf.sample: make systemd as<b=
r>
&gt; default init manager<br>
&gt; <br>
&gt; From: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" target=3D=
"_blank">kai.kang@windriver.com</a>&gt;<br>
&gt; <br>
&gt; Move configurations from local.conf.sample.extended to local.conf.samp=
le<br>
&gt; to make systemd as default init manager for poky.<br>
<br>
If we&#39;re going to change the default init manager to be systemd, wouldn=
&#39;t <br>
it be more appropriate to change the real default values in bitbake.conf <b=
r>
and <a href=3D"http://packagegroup-core-boot.bb" rel=3D"noreferrer" target=
=3D"_blank">packagegroup-core-boot.bb</a>? And then include an example in <=
br>
local.conf.sample.extended to show how to configure sysvinit as init manage=
r?</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">That would cha=
nge it for Oe-core and other distributions as well which is not the intenti=
on=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
&gt; <br>
&gt; [YOCTO #13031]<br>
&gt; <br>
&gt; Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" =
target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-poky/conf/local.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 9 +++++++++<br>
&gt;=C2=A0 meta-poky/conf/local.conf.sample.extended | 9 ---------<br>
&gt;=C2=A0 2 files changed, 9 insertions(+), 9 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta-poky/conf/local.conf.sample b/meta-<br>
&gt; poky/conf/local.conf.sample<br>
&gt; index 9068e567dc..3a07105e44 100644<br>
&gt; --- a/meta-poky/conf/local.conf.sample<br>
&gt; +++ b/meta-poky/conf/local.conf.sample<br>
&gt; @@ -249,3 +249,12 @@ PACKAGECONFIG_append_pn-nativesdk-qemu =3D &quot;=
 sdl&quot;<br>
&gt;=C2=A0 # track the version of this file when it was generated. This can=
<br>
&gt; safely be ignored if<br>
&gt;=C2=A0 # this doesn&#39;t mean anything to you.<br>
&gt;=C2=A0 CONF_VERSION =3D &quot;1&quot;<br>
&gt; +<br>
&gt; +#<br>
&gt; +# Use systemd for system initialization<br>
&gt; +#<br>
&gt; +DISTRO_FEATURES_append =3D &quot; systemd&quot;<br>
&gt; +DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D &quot;sysvinit&quot;<br>
&gt; +VIRTUAL-RUNTIME_login_manager =3D &quot;shadow-base&quot;<br>
&gt; +VIRTUAL-RUNTIME_init_manager =3D &quot;systemd&quot;<br>
&gt; +VIRTUAL-RUNTIME_initscripts =3D &quot;systemd-compat-units&quot;<br>
&gt; diff --git a/meta-poky/conf/local.conf.sample.extended b/meta-<br>
&gt; poky/conf/local.conf.sample.extended<br>
&gt; index 26603debe6..e20fc5dbf3 100644<br>
&gt; --- a/meta-poky/conf/local.conf.sample.extended<br>
&gt; +++ b/meta-poky/conf/local.conf.sample.extended<br>
&gt; @@ -377,12 +377,3 @@ DISTRO_FEATURES_remove =3D &quot;x11&quot;<br>
&gt;=C2=A0 #VIRTUAL-RUNTIME_initscripts =3D &quot;initscripts&quot;<br>
&gt;=C2=A0 #VIRTUAL-RUNTIME_keymaps =3D &quot;keymaps&quot;<br>
&gt;=C2=A0 #DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D &quot;sysvinit&quot;<b=
r>
&gt; -<br>
&gt; -#<br>
&gt; -# Use systemd for system initialization<br>
&gt; -#<br>
&gt; -#DISTRO_FEATURES_append =3D &quot; systemd&quot;<br>
&gt; -#DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D &quot;sysvinit&quot;<br>
&gt; -#VIRTUAL-RUNTIME_login_manager =3D &quot;shadow-base&quot;<br>
&gt; -#VIRTUAL-RUNTIME_init_manager =3D &quot;systemd&quot;<br>
&gt; -#VIRTUAL-RUNTIME_initscripts =3D &quot;systemd-compat-units&quot;<br>
&gt; --<br>
&gt; 2.18.0<br>
&gt; <br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--0000000000004cf88f0589945c8a--
