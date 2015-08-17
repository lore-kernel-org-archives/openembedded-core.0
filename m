Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 956EC606E8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 12:42:42 +0000 (UTC)
Received: by qged69 with SMTP id d69so91966931qge.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 05:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5WkjRiu21c+GDVT4ac5defSSgk04rBDDbui62Fcc0Qo=;
	b=KQTkJiJeT+a3h4UWxQgPpuuJvJ8gA1Sk2re2g6BRSc8+0JEjQz0D9H3ofGYozKL9pb
	ui1qQuvBt/3In+fmx3vl6pyE1Qp2xsfhZMZkyuJrh3Qb7E9oKffgw4EX9vDmnZwLNZwX
	gVhfE9dNw4jdNomRfu3tkafq27pWxU/mO9YaecppLZ+whsk0dX+OIEA+5Gl2dbxI/2y9
	aqOV0d16Lr54sWa4Kx5XEpxRO+tEUqJR5Q+HBTjCKkfsnqo5BD6jv7bbwJ23x/xeqfme
	WRxOvT4aRQjGTpdHlxjQyPaE9FYBox46pyJ7JRI+piNBWQv30mxCdgY6a7+FTTRmU83s
	2JDg==
X-Gm-Message-State: ALoCoQlZ3M63z7yEwBLlb/SI6XElrcowkWD0stugcJnBNFptGG7YYVnuUm9/3BNjPfYyMVsNNhS5
X-Received: by 10.140.237.150 with SMTP id i144mr2110927qhc.22.1439815362266; 
	Mon, 17 Aug 2015 05:42:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Mon, 17 Aug 2015 05:42:22 -0700 (PDT)
In-Reply-To: <1439787800-21088-1-git-send-email-raj.khem@gmail.com>
References: <1439787800-21088-1-git-send-email-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 17 Aug 2015 13:42:22 +0100
Message-ID: <CAJTo0LZRWXQOc+SCbL1PeJ9QXn_9WHKDC3y6t+QpJ8-_689Y6w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4 V2] systemd: Upgrade 219 -> 224
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
X-List-Received-Date: Mon, 17 Aug 2015 12:42:43 -0000
Content-Type: multipart/alternative; boundary=001a113595aa35e1b3051d8123af

--001a113595aa35e1b3051d8123af
Content-Type: text/plain; charset=UTF-8

On 17 August 2015 at 06:03, Khem Raj <raj.khem@gmail.com> wrote:
>
> -LICENSE = "GPLv2 & LGPLv2.1 & MIT"
> +LICENSE = "GPLv2 & LGPLv2.1"
>  LIC_FILES_CHKSUM =
> "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
> -
> file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c \
> -
> file://LICENSE.MIT;md5=544799d0b492f119fa04641d1b8868ed"
> +
> file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
>

Why?


> -inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d
> update-alternatives qemu systemd ptest gettext
> +inherit useradd pkgconfig autotools perlnative update-rc.d
> update-alternatives qemu systemd ptest gettext
>

Why?

@@ -108,8 +103,6 @@ EXTRA_OECONF = " --with-rootprefix=${rootprefix} \

>                   --with-rootlibdir=${rootlibdir} \
>                   --with-roothomedir=${ROOT_HOME} \
>                   --disable-coredump \
> -                 --disable-introspection \
> -                 --disable-kdbus \
>                   --enable-split-usr \
>                   --without-python \
>                   --with-sysvrcnd-path=${sysconfdir} \
> @@ -210,7 +203,7 @@ python populate_packages_prepend (){
>  PACKAGES_DYNAMIC += "^lib(udev|systemd).*"
>
>  PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze
> ${PN}-kernel-install \
> -             ${PN}-rpm-macros ${PN}-binfmt ${PN}-pam ${PN}-zsh libgudev"
> +             ${PN}-rpm-macros ${PN}-binfmt ${PN}-pam ${PN}-zsh
> ${PN}-xorg-xinitrc"
>

Why?


>  SYSTEMD_PACKAGES = "${PN}-binfmt"
>  SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
> @@ -224,8 +217,6 @@ FILES_${PN}-analyze = "${bindir}/systemd-analyze"
>  FILES_${PN}-initramfs = "/init"
>  RDEPENDS_${PN}-initramfs = "${PN}"
>
> -FILES_libgudev = "${libdir}/libgudev*${SOLIBS}"
> -
>

Why?

Okay, I know that kdbus is now enabled by default and gudev was removed and
is now part of GNOME, but that should be explicit in the commit message and
a rationale for moving from the "stable" series to latest release made.

Ross

--001a113595aa35e1b3051d8123af
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 August 2015 at 06:03, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> w=
rote:<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">
-LICENSE =3D &quot;GPLv2 &amp; LGPLv2.1 &amp; MIT&quot;<br>
+LICENSE =3D &quot;GPLv2 &amp; LGPLv2.1&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.GPL2;md5=3D751419260aa95449=
9f7abaabaa882bbe \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://LICENSE.LGPL2.1;md5=3D4fbd65380cdd255951079008b364516c \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://LICENSE.MIT;md5=3D544799d0b492f119fa04641d1b8868ed&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://LICENSE.LGPL2.1;md5=3D4fbd65380cdd255951079008b364516c&quot;<br></blockq=
uote><div><br></div><div>Why?</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">-inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d=
 update-alternatives qemu systemd ptest gettext<br>
+inherit useradd pkgconfig autotools perlnative update-rc.d update-alternat=
ives qemu systemd ptest gettext<br></blockquote><div><br></div><div>Why?</d=
iv><div>=C2=A0</div><div>@@ -108,8 +103,6 @@ EXTRA_OECONF =3D &quot; --with=
-rootprefix=3D${rootprefix} \</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-rootl=
ibdir=3D${rootlibdir} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-rooth=
omedir=3D${ROOT_HOME} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-co=
redump \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-in=
trospection \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-kd=
bus \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-spl=
it-usr \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --without-py=
thon \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-sysvr=
cnd-path=3D${sysconfdir} \<br>
@@ -210,7 +203,7 @@ python populate_packages_prepend (){<br>
=C2=A0PACKAGES_DYNAMIC +=3D &quot;^lib(udev|systemd).*&quot;<br>
<br>
=C2=A0PACKAGES =3D+ &quot;${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${=
PN}-analyze ${PN}-kernel-install \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PN}-rpm-macros ${PN}-bin=
fmt ${PN}-pam ${PN}-zsh libgudev&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PN}-rpm-macros ${PN}-bin=
fmt ${PN}-pam ${PN}-zsh ${PN}-xorg-xinitrc&quot;<br></blockquote><div><br><=
/div><div>Why?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
=C2=A0SYSTEMD_PACKAGES =3D &quot;${PN}-binfmt&quot;<br>
=C2=A0SYSTEMD_SERVICE_${PN}-binfmt =3D &quot;systemd-binfmt.service&quot;<b=
r>
@@ -224,8 +217,6 @@ FILES_${PN}-analyze =3D &quot;${bindir}/systemd-analyze=
&quot;<br>
=C2=A0FILES_${PN}-initramfs =3D &quot;/init&quot;<br>
=C2=A0RDEPENDS_${PN}-initramfs =3D &quot;${PN}&quot;<br>
<br>
-FILES_libgudev =3D &quot;${libdir}/libgudev*${SOLIBS}&quot;<br>
-<br></blockquote><div><br></div><div>Why?=C2=A0</div><div><br></div><div>O=
kay, I know that kdbus is now enabled by default and gudev was removed and =
is now part of GNOME, but that should be explicit in the commit message and=
 a rationale for moving from the &quot;stable&quot; series to latest releas=
e made.</div><div><br></div><div>Ross</div></div></div></div>

--001a113595aa35e1b3051d8123af--
