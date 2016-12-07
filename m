Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7ECDE6FEF3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 11:06:08 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id w33so374109335qtc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Dec 2016 03:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lFxUDTSXURP8lxX2MzkWzr9Bo1Qk2pEs3k1I7qViRPE=;
	b=Ky3gTf+U3Y/b48Iep07QATwEmw8v98K68hakBBhHQMuBJb+b90bFQsM9YhLQ52CYGM
	wVAMJ9rAdQFd45uX0h0jilv6NBsIQl7Ct4SInK5XCkiVblV5dCAHNX0vI5i8uusMq4/O
	d04cuGPJbmx364Kb34KqzI9eXEAxXizMQVHBBSNx734u845J0sOM/7t57m8Oj5BacUfU
	RYkS4c0KpgbryGZ7/J1HVTOuBCJmntOg2xheCq8fjQFO4xobFZHDn4CMFzmFrfOlYjzW
	kNZ4LX5LTvsdQpolvRbl8F2BnQFGfWyxAqfOLYPhc4OCaagnoaoPU9UikFXHaK8aozsd
	GrWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lFxUDTSXURP8lxX2MzkWzr9Bo1Qk2pEs3k1I7qViRPE=;
	b=V6qixaohSBvp1f+IWgMK6GuWkhpFCHq0O6YxTU9/gTyckDWVxuPkAn/XSIBNDkjUHL
	foj2IdzmMdWEgHPLJFvKo2epOUvb4rzr2h63gyR5jMujxvVSTNJlX7mE9Vz3i05H8f+X
	fJ/AOb6F71hm71x3wqzRfeNymUuWxEiM2qJs6+3fW75raihjJqbViYWmAWhtAMbni271
	FAGTjg7ZG9E4dROGaJsHXk1Fl96M5K6YNBIoK4SeFj9JC/sZ4P/bGEnh0MIrl5dxMZ3F
	vqTiFfmS3fPsfhkczXDvz095uJsODWJjKoeVSYGIlGLNk0IzcRUfl5Z7TMLVHJ9Qsij3
	UUmA==
X-Gm-Message-State: AKaTC02VSxmhRzXWI44PgTVUmvJSoDdJjVF2YZBUY/vBq6khgQe8ZilmpkDcExE/aij9Y2qonyq7FKJTjSXWqkGF
X-Received: by 10.237.36.154 with SMTP id t26mr57617457qtc.188.1481108769279; 
	Wed, 07 Dec 2016 03:06:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Wed, 7 Dec 2016 03:05:48 -0800 (PST)
In-Reply-To: <1481106793-126356-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1481106793-126356-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 7 Dec 2016 11:05:48 +0000
Message-ID: <CAJTo0Lbv+uXP4hy7huVCsW+3Lhf8NZRWX=iEquAbnG2YvqDpvg@mail.gmail.com>
To: root <zhengrq.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xkeyboard-config: 2.18 -> 2.19
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
X-List-Received-Date: Wed, 07 Dec 2016 11:06:08 -0000
Content-Type: multipart/alternative; boundary=001a1141058e112c6005430f825c

--001a1141058e112c6005430f825c
Content-Type: text/plain; charset=UTF-8

Can you resend with a proper From: address please not just root?

Ross

On 7 December 2016 at 10:33, root <zhengrq.fnst@cn.fujitsu.com> wrote:

> Upgrade xkeyboard-config from 2.18 to 2.19
>
> Signed-off-by: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../xorg-lib/xkeyboard-config_2.18.bb              | 31
> ----------------------
>  .../xorg-lib/xkeyboard-config_2.19.bb              | 31
> ++++++++++++++++++++++
>  2 files changed, 31 insertions(+), 31 deletions(-)
>  delete mode 100644 meta/recipes-graphics/xorg-lib/
> xkeyboard-config_2.18.bb
>  create mode 100644 meta/recipes-graphics/xorg-lib/
> xkeyboard-config_2.19.bb
>
> diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.18.bb
> b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.18.bb
> deleted file mode 100644
> index 79fcbd8..0000000
> --- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.18.bb
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -SUMMARY = "Keyboard configuration database for X Window"
> -
> -DESCRIPTION = "The non-arch keyboard configuration database for X \
> -Window.  The goal is to provide the consistent, well-structured, \
> -frequently released open source of X keyboard configuration data for X \
> -Window System implementations.  The project is targeted to XKB-based \
> -systems."
> -
> -HOMEPAGE = "http://freedesktop.org/wiki/Software/XKeyboardConfig"
> -BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=
> xkeyboard-config"
> -
> -LICENSE = "MIT & MIT-style"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
> -
> -SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-$
> {PV}.tar.bz2"
> -SRC_URI[md5sum] = "c28cf45616bfec276879360bc36c6b27"
> -SRC_URI[sha256sum] = "c41d917d6c8a59feb7ccbda51c40a6
> ada824fdd1e9684b52dd48c9530617ddd0"
> -
> -SECTION = "x11/libs"
> -DEPENDS = "intltool-native virtual/gettext util-macros libxslt-native"
> -
> -EXTRA_OECONF = "--with-xkb-rules-symlink=xorg --disable-runtime-deps"
> -
> -FILES_${PN} += "${datadir}/X11/xkb"
> -
> -inherit autotools pkgconfig gettext
> -
> -do_install_append () {
> -    install -d ${D}${datadir}/X11/xkb/compiled
> -    cd ${D}${datadir}/X11/xkb/rules && ln -sf base xorg
> -}
> diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.19.bb
> b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.19.bb
> new file mode 100644
> index 0000000..79fcbd8
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.19.bb
> @@ -0,0 +1,31 @@
> +SUMMARY = "Keyboard configuration database for X Window"
> +
> +DESCRIPTION = "The non-arch keyboard configuration database for X \
> +Window.  The goal is to provide the consistent, well-structured, \
> +frequently released open source of X keyboard configuration data for X \
> +Window System implementations.  The project is targeted to XKB-based \
> +systems."
> +
> +HOMEPAGE = "http://freedesktop.org/wiki/Software/XKeyboardConfig"
> +BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=
> xkeyboard-config"
> +
> +LICENSE = "MIT & MIT-style"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
> +
> +SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-$
> {PV}.tar.bz2"
> +SRC_URI[md5sum] = "c28cf45616bfec276879360bc36c6b27"
> +SRC_URI[sha256sum] = "c41d917d6c8a59feb7ccbda51c40a6
> ada824fdd1e9684b52dd48c9530617ddd0"
> +
> +SECTION = "x11/libs"
> +DEPENDS = "intltool-native virtual/gettext util-macros libxslt-native"
> +
> +EXTRA_OECONF = "--with-xkb-rules-symlink=xorg --disable-runtime-deps"
> +
> +FILES_${PN} += "${datadir}/X11/xkb"
> +
> +inherit autotools pkgconfig gettext
> +
> +do_install_append () {
> +    install -d ${D}${datadir}/X11/xkb/compiled
> +    cd ${D}${datadir}/X11/xkb/rules && ln -sf base xorg
> +}
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1141058e112c6005430f825c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can you resend with a proper From: address please not just=
 root?<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><d=
iv class=3D"gmail_quote">On 7 December 2016 at 10:33, root <span dir=3D"ltr=
">&lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.com" target=3D"_blank">zhen=
grq.fnst@cn.fujitsu.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">Upgrade xkeyboard-config from 2.18 to 2.19<br>
<br>
Signed-off-by: zhengruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.co=
m">zhengrq.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../xorg-lib/<a href=3D"http://xkeyboard-config_2.18.bb" rel=3D"noref=
errer" target=3D"_blank">xkeyboard-config_<wbr>2.18.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 31 ----------------------<br>
=C2=A0.../xorg-lib/<a href=3D"http://xkeyboard-config_2.19.bb" rel=3D"noref=
errer" target=3D"_blank">xkeyboard-config_<wbr>2.19.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 31 ++++++++++++++++++++++<br>
=C2=A02 files changed, 31 insertions(+), 31 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-graphics/xorg-<wbr>lib/<a href=3D"htt=
p://xkeyboard-config_2.18.bb" rel=3D"noreferrer" target=3D"_blank">xkeyboar=
d-config_2.18.bb</a><br>
=C2=A0create mode 100644 meta/recipes-graphics/xorg-<wbr>lib/<a href=3D"htt=
p://xkeyboard-config_2.19.bb" rel=3D"noreferrer" target=3D"_blank">xkeyboar=
d-config_2.19.bb</a><br>
<br>
diff --git a/meta/recipes-graphics/xorg-<wbr>lib/<a href=3D"http://xkeyboar=
d-config_2.18.bb" rel=3D"noreferrer" target=3D"_blank">xkeyboard-config_2.1=
8.bb</a> b/meta/recipes-graphics/xorg-<wbr>lib/<a href=3D"http://xkeyboard-=
config_2.18.bb" rel=3D"noreferrer" target=3D"_blank">xkeyboard-config_2.18.=
bb</a><br>
deleted file mode 100644<br>
index 79fcbd8..0000000<br>
--- a/meta/recipes-graphics/xorg-<wbr>lib/<a href=3D"http://xkeyboard-confi=
g_2.18.bb" rel=3D"noreferrer" target=3D"_blank">xkeyboard-config_2.18.bb</a=
><br>
+++ /dev/null<br>
@@ -1,31 +0,0 @@<br>
-SUMMARY =3D &quot;Keyboard configuration database for X Window&quot;<br>
-<br>
-DESCRIPTION =3D &quot;The non-arch keyboard configuration database for X \=
<br>
-Window.=C2=A0 The goal is to provide the consistent, well-structured, \<br=
>
-frequently released open source of X keyboard configuration data for X \<b=
r>
-Window System implementations.=C2=A0 The project is targeted to XKB-based =
\<br>
-systems.&quot;<br>
-<br>
-HOMEPAGE =3D &quot;<a href=3D"http://freedesktop.org/wiki/Software/XKeyboa=
rdConfig" rel=3D"noreferrer" target=3D"_blank">http://freedesktop.org/wiki/=
<wbr>Software/XKeyboardConfig</a>&quot;<br>
-BUGTRACKER =3D &quot;<a href=3D"https://bugs.freedesktop.org/enter_bug.cgi=
?product=3Dxkeyboard-config" rel=3D"noreferrer" target=3D"_blank">https://b=
ugs.freedesktop.org/<wbr>enter_bug.cgi?product=3D<wbr>xkeyboard-config</a>&=
quot;<br>
-<br>
-LICENSE =3D &quot;MIT &amp; MIT-style&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>0e7f21ca7db975c63467d=
2e7624a12<wbr>f9&quot;<br>
-<br>
-SRC_URI =3D &quot;${XORG_MIRROR}/individual/<wbr>data/xkeyboard-config/${B=
PN}-$<wbr>{PV}.tar.bz2&quot;<br>
-SRC_URI[md5sum] =3D &quot;<wbr>c28cf45616bfec276879360bc36c6b<wbr>27&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>c41d917d6c8a59feb7ccbda51c40a6<wbr>ada82=
4fdd1e9684b52dd48c9530617<wbr>ddd0&quot;<br>
-<br>
-SECTION =3D &quot;x11/libs&quot;<br>
-DEPENDS =3D &quot;intltool-native virtual/gettext util-macros libxslt-nati=
ve&quot;<br>
-<br>
-EXTRA_OECONF =3D &quot;--with-xkb-rules-symlink=3Dxorg --disable-runtime-d=
eps&quot;<br>
-<br>
-FILES_${PN} +=3D &quot;${datadir}/X11/xkb&quot;<br>
-<br>
-inherit autotools pkgconfig gettext<br>
-<br>
-do_install_append () {<br>
-=C2=A0 =C2=A0 install -d ${D}${datadir}/X11/xkb/<wbr>compiled<br>
-=C2=A0 =C2=A0 cd ${D}${datadir}/X11/xkb/rules &amp;&amp; ln -sf base xorg<=
br>
-}<br>
diff --git a/meta/recipes-graphics/xorg-<wbr>lib/<a href=3D"http://xkeyboar=
d-config_2.19.bb" rel=3D"noreferrer" target=3D"_blank">xkeyboard-config_2.1=
9.bb</a> b/meta/recipes-graphics/xorg-<wbr>lib/<a href=3D"http://xkeyboard-=
config_2.19.bb" rel=3D"noreferrer" target=3D"_blank">xkeyboard-config_2.19.=
bb</a><br>
new file mode 100644<br>
index 0000000..79fcbd8<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/xorg-<wbr>lib/<a href=3D"http://xkeyboard-confi=
g_2.19.bb" rel=3D"noreferrer" target=3D"_blank">xkeyboard-config_2.19.bb</a=
><br>
@@ -0,0 +1,31 @@<br>
+SUMMARY =3D &quot;Keyboard configuration database for X Window&quot;<br>
+<br>
+DESCRIPTION =3D &quot;The non-arch keyboard configuration database for X \=
<br>
+Window.=C2=A0 The goal is to provide the consistent, well-structured, \<br=
>
+frequently released open source of X keyboard configuration data for X \<b=
r>
+Window System implementations.=C2=A0 The project is targeted to XKB-based =
\<br>
+systems.&quot;<br>
+<br>
+HOMEPAGE =3D &quot;<a href=3D"http://freedesktop.org/wiki/Software/XKeyboa=
rdConfig" rel=3D"noreferrer" target=3D"_blank">http://freedesktop.org/wiki/=
<wbr>Software/XKeyboardConfig</a>&quot;<br>
+BUGTRACKER =3D &quot;<a href=3D"https://bugs.freedesktop.org/enter_bug.cgi=
?product=3Dxkeyboard-config" rel=3D"noreferrer" target=3D"_blank">https://b=
ugs.freedesktop.org/<wbr>enter_bug.cgi?product=3D<wbr>xkeyboard-config</a>&=
quot;<br>
+<br>
+LICENSE =3D &quot;MIT &amp; MIT-style&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>0e7f21ca7db975c63467d=
2e7624a12<wbr>f9&quot;<br>
+<br>
+SRC_URI =3D &quot;${XORG_MIRROR}/individual/<wbr>data/xkeyboard-config/${B=
PN}-$<wbr>{PV}.tar.bz2&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>c28cf45616bfec276879360bc36c6b<wbr>27&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>c41d917d6c8a59feb7ccbda51c40a6<wbr>ada82=
4fdd1e9684b52dd48c9530617<wbr>ddd0&quot;<br>
+<br>
+SECTION =3D &quot;x11/libs&quot;<br>
+DEPENDS =3D &quot;intltool-native virtual/gettext util-macros libxslt-nati=
ve&quot;<br>
+<br>
+EXTRA_OECONF =3D &quot;--with-xkb-rules-symlink=3Dxorg --disable-runtime-d=
eps&quot;<br>
+<br>
+FILES_${PN} +=3D &quot;${datadir}/X11/xkb&quot;<br>
+<br>
+inherit autotools pkgconfig gettext<br>
+<br>
+do_install_append () {<br>
+=C2=A0 =C2=A0 install -d ${D}${datadir}/X11/xkb/<wbr>compiled<br>
+=C2=A0 =C2=A0 cd ${D}${datadir}/X11/xkb/rules &amp;&amp; ln -sf base xorg<=
br>
+}<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a1141058e112c6005430f825c--
