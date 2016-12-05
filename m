Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 742F865D00
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2016 13:21:11 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id n21so345316756qka.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2016 05:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bL3NwlAU3/yktcb+EiddOkWuTsKI+a40+97nqN+x8WI=;
	b=BgSZwo/upsMY0kivrRevGlEUjvLdwRAanb7NnVSVRdkkMki3qymP7W1YQq0WQbfUuj
	euMVCWsfGYdlIugWY59mCOTPbkFXFRdUjjdqA6Sgt6tz0Bc3C1/jWLiAJI73K09UkNaW
	B5yQsMUEUEw825dgh6U1RPukD0IprQuF1c/Odfm6aIwgg6lbZmtu/22x0zek9KFeMPp9
	fgYPWMrh1imSVXpG+CDKvVwFPd0ZeDUNkGLRNHBTxIgv9Uzd432WUeLPrBr+ha1qsKa1
	r0VXkq0bul0Pi2Z0iT6vFmr/VTZ+aTNrjKH/Wcudzz9e0X8bcBMeHG3WZqEkqQ467EST
	1cFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bL3NwlAU3/yktcb+EiddOkWuTsKI+a40+97nqN+x8WI=;
	b=k8DRcheUDYq7lqPVLmR3gem68mogPf0Bbllp8+SdyFU0cxr5+iqBSltyf6ZYaTPB3G
	8pxPw3GiQRBVrRZQz1YQNxK8KxvgHrAinZRpX2qkkR5BED8DcnGCLk3/haPfXRFcoKkL
	ziAXIc0NF0aVfue42AcQGVNtDOZwltmnAUfoslHR69VsxfEZAPqODokZqjfS8EXldEjs
	HAH1qSyyFojSgGvN2VvYDBoI2WGGAGkhMtSnHYUOxe09jS1XSkMbCI+c6s/vIprfKMcE
	kjllQX3aCS7v8P7Rj3uDre5EEaPdolxg4V39Kbg5Y30yM8XmcC3MY4ZV+HJegk7We0Hi
	1UiA==
X-Gm-Message-State: AKaTC00TC6/RGoAydmic2S8eFw/h6E0CS7q5bth1kjjBGH9EVZ1GTtu4Z7bJ5+XiZPFibl7F8Vgx3sJvsTvDwsTs
X-Received: by 10.55.47.71 with SMTP id v68mr50734706qkh.319.1480944072298;
	Mon, 05 Dec 2016 05:21:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.237.34.74 with HTTP; Mon, 5 Dec 2016 05:20:42 -0800 (PST)
In-Reply-To: <20161201083726.6160-1-raj.khem@gmail.com>
References: <20161201083726.6160-1-raj.khem@gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 5 Dec 2016 15:20:42 +0200
Message-ID: <CAHiDW_ERJNEoc4OfTQtV6Bi3UPzQkt9RMPJDUx-RAVJnrj2feA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-bad: Add PKG_CONFIG_SYSROOT_DIR to output of pkg-config
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
X-List-Received-Date: Mon, 05 Dec 2016 13:21:12 -0000
Content-Type: multipart/alternative; boundary=001a114f4e8c5cb40e0542e929c5

--001a114f4e8c5cb40e0542e929c5
Content-Type: text/plain; charset=UTF-8

On 1 December 2016 at 10:37, Khem Raj <raj.khem@gmail.com> wrote:

> When configure pokes for wayland-protocols isntallations it ended up
> using the ones from host, which is because it did not account for sysroot
> prefix
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../gstreamer/gstreamer1.0-plugins-bad.inc         |  2 +-
>  ...G_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch | 37
> ++++++++++++++++++++++
>  .../gstreamer/gstreamer1.0-plugins-bad_1.10.1.bb   |  1 +
>  3 files changed, 39 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-bad/0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> index d26a6a9..d3c5326 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> @@ -64,7 +64,7 @@ PACKAGECONFIG[srtp]            =
> "--enable-srtp,--disable-srtp,libsrtp"
>  PACKAGECONFIG[uvch264]         = "--enable-uvch264,--disable-uvch264,libusb1
> libgudev"
>  PACKAGECONFIG[voaacenc]        = "--enable-voaacenc,--disable-
> voaacenc,vo-aacenc"
>  PACKAGECONFIG[voamrwbenc]      = "--enable-voamrwbenc,--
> disable-voamrwbenc,vo-amrwbenc"
> -PACKAGECONFIG[wayland]         = "--enable-wayland,--disable-wayland,wayland-native
> wayland"
> +PACKAGECONFIG[wayland]         = "--enable-wayland,--disable-wayland,wayland-native
> wayland wayland-protocols"
>  PACKAGECONFIG[webp]            = "--enable-webp,--disable-webp,libwebp"
>
>  # these plugins have not been ported to 1.0 (yet):
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-bad/0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-bad/0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch
> new file mode 100644
> index 0000000..eb789df
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-bad/0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch
> @@ -0,0 +1,37 @@
> +From c271503d7e233428ac0323c51d6517113e26bef7 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Thu, 1 Dec 2016 00:27:13 -0800
> +Subject: [PATCH] Prepend PKG_CONFIG_SYSROOT_DIR to pkg-config output
> +
> +In cross environment we have to prepend the sysroot to the path found by
> +pkgconfig since the path returned from pkgconfig does not have sysroot
> prefixed
> +it ends up using the files from host system. If build host has wayland
> installed
> +the build will succeed but if you dont have wayland-protocols installed
> on build host then
> +it wont find the files on build host
> +
> +This should work ok with non sysrooted builds too since in those cases
> PKG_CONFIG_SYSROOT_DIR
> +will be empty
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index f8ac96b..dc87b08 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -2233,7 +2233,7 @@ AG_GST_CHECK_FEATURE(WAYLAND, [wayland sink],
> wayland , [
> +     PKG_CHECK_MODULES(WAYLAND_PROTOCOLS, wayland-protocols >= 1.4, [
> +       if test "x$wayland_scanner" != "x"; then
> +         HAVE_WAYLAND="yes"
> +-        AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, `$PKG_CONFIG
> --variable=pkgdatadir wayland-protocols`)
> ++        AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, ${PKG_CONFIG_SYSROOT_DIR}`$PKG_CONFIG
> --variable=pkgdatadir wayland-protocols`)
>

I believe this breaks multilib because wayland-protocols is allarch so
PKG_CONFIG_SYSROOT_DIR may then be incorrect.

I've set "WAYLAND_PROTOCOLS_SYSROOT_DIR=${STAGING_DIR}/${MACHINE}"
in EXTRA_OECONF in other recipes and used that variable in the patches.
It's not pretty but seems to work.

Jussi

+       else
> +         AC_MSG_RESULT([wayland-scanner is required to build the wayland
> plugin])
> +         HAVE_WAYLAND="no"
> +--
> +2.10.2
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-bad_1.10.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-bad_1.10.1.bb
> index 9cd892e..6c6f011 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.1.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.1.bb
> @@ -14,6 +14,7 @@ SRC_URI = " \
>      file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch
> \
>      file://0009-glimagesink-Downrank-to-marginal.patch \
>      file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch
> \
> +    file://0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch
> \
>  "
>  SRC_URI[md5sum] = "491d2d5aab55ffc60c66e714d3d664ea"
>  SRC_URI[sha256sum] = "133e0ed9fe21011b15d3898e3d3a9d
> 17ab74eed31996da2e353353e688ca921d"
> --
> 2.10.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114f4e8c5cb40e0542e929c5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 1 December 2016 at 10:37, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"=
mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">When config=
ure pokes for wayland-protocols isntallations it ended up<br>
using the ones from host, which is because it did not account for sysroot<b=
r>
prefix<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@=
gmail.com</a>&gt;<br>
---<br>
=C2=A0.../gstreamer/gstreamer1.0-<wbr>plugins-bad.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0...G_CONFIG_SYSROOT_DIR-to-<wbr>pkg-config-output.patch | 37 ++++++++=
++++++++++++++<br>
=C2=A0.../gstreamer/<a href=3D"http://gstreamer1.0-plugins-bad_1.10.1.bb" r=
el=3D"noreferrer" target=3D"_blank">gstreamer1.0-<wbr>plugins-bad_1.10.1.bb=
</a>=C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A03 files changed, 39 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.=
0-<wbr>plugins-bad/0001-Prepend-PKG_<wbr>CONFIG_SYSROOT_DIR-to-pkg-<wbr>con=
fig-output.patch<br>
<br>
diff --git a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugi=
ns-bad.inc b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugi=
ns-bad.inc<br>
index d26a6a9..d3c5326 100644<br>
--- a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugins-bad.=
inc<br>
+++ b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugins-bad.=
inc<br>
@@ -64,7 +64,7 @@ PACKAGECONFIG[srtp]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D &quot;--enable-srtp,--disable-srtp,<wbr>libsrtp&quot;<br>
=C2=A0PACKAGECONFIG[uvch264]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;--e=
nable-uvch264,--disable-<wbr>uvch264,libusb1 libgudev&quot;<br>
=C2=A0PACKAGECONFIG[voaacenc]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;--enable=
-voaacenc,--disable-<wbr>voaacenc,vo-aacenc&quot;<br>
=C2=A0PACKAGECONFIG[voamrwbenc]=C2=A0 =C2=A0 =C2=A0 =3D &quot;--enable-voam=
rwbenc,--<wbr>disable-voamrwbenc,vo-<wbr>amrwbenc&quot;<br>
-PACKAGECONFIG[wayland]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;--enable=
-wayland,--disable-<wbr>wayland,wayland-native wayland&quot;<br>
+PACKAGECONFIG[wayland]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;--enable=
-wayland,--disable-<wbr>wayland,wayland-native wayland wayland-protocols&qu=
ot;<br>
=C2=A0PACKAGECONFIG[webp]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quo=
t;--enable-webp,--disable-webp,<wbr>libwebp&quot;<br>
<br>
=C2=A0# these plugins have not been ported to 1.0 (yet):<br>
diff --git a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugi=
ns-bad/0001-Prepend-PKG_<wbr>CONFIG_SYSROOT_DIR-to-pkg-<wbr>config-output.p=
atch b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugins-bad=
/0001-Prepend-PKG_<wbr>CONFIG_SYSROOT_DIR-to-pkg-<wbr>config-output.patch<b=
r>
new file mode 100644<br>
index 0000000..eb789df<br>
--- /dev/null<br>
+++ b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugins-bad/=
0001-Prepend-PKG_<wbr>CONFIG_SYSROOT_DIR-to-pkg-<wbr>config-output.patch<br=
>
@@ -0,0 +1,37 @@<br>
+From c271503d7e233428ac0323c51d6517<wbr>113e26bef7 Mon Sep 17 00:00:00 200=
1<br>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
+Date: Thu, 1 Dec 2016 00:27:13 -0800<br>
+Subject: [PATCH] Prepend PKG_CONFIG_SYSROOT_DIR to pkg-config output<br>
+<br>
+In cross environment we have to prepend the sysroot to the path found by<b=
r>
+pkgconfig since the path returned from pkgconfig does not have sysroot pre=
fixed<br>
+it ends up using the files from host system. If build host has wayland ins=
talled<br>
+the build will succeed but if you dont have wayland-protocols installed on=
 build host then<br>
+it wont find the files on build host<br>
+<br>
+This should work ok with non sysrooted builds too since in those cases PKG=
_CONFIG_SYSROOT_DIR<br>
+will be empty<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
+---<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
+index f8ac96b..dc87b08 100644<br>
+--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
+@@ -2233,7 +2233,7 @@ AG_GST_CHECK_FEATURE(WAYLAND, [wayland sink], waylan=
d , [<br>
+=C2=A0 =C2=A0 =C2=A0PKG_CHECK_MODULES(WAYLAND_<wbr>PROTOCOLS, wayland-prot=
ocols &gt;=3D 1.4, [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;x$wayland_scanner&quot; !=3D &quo=
t;x&quot;; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HAVE_WAYLAND=3D&quot;yes&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_SUBST(WAYLAND_PROTOCOLS_<wbr>DATADIR, `$PK=
G_CONFIG --variable=3Dpkgdatadir wayland-protocols`)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_SUBST(WAYLAND_PROTOCOLS_<wbr>DATADIR, ${PK=
G_CONFIG_SYSROOT_DIR}`$<wbr>PKG_CONFIG --variable=3Dpkgdatadir wayland-prot=
ocols`)<br>
</blockquote><div><br></div><div>I believe this breaks multilib because way=
land-protocols is allarch so PKG_CONFIG_SYSROOT_DIR may then be incorrect.<=
/div><div><br></div><div>I&#39;ve set &quot;WAYLAND_PROTOCOLS_SYSROOT_DIR=
=3D${STAGING_DIR}/${MACHINE}&quot; in=C2=A0EXTRA_OECONF in other recipes an=
d used that variable in the patches. It&#39;s not pretty but seems to work.=
<br></div><div><br></div><div>Jussi</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_MSG_RESULT([wayland-scanner is requir=
ed to build the wayland plugin])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HAVE_WAYLAND=3D&quot;no&quot;<br>
+--<br>
+2.10.2<br>
+<br>
diff --git a/meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"http://gstre=
amer1.0-plugins-bad_1.10.1.bb" rel=3D"noreferrer" target=3D"_blank">gstream=
er1.0-<wbr>plugins-bad_1.10.1.bb</a> b/meta/recipes-multimedia/<wbr>gstream=
er/<a href=3D"http://gstreamer1.0-plugins-bad_1.10.1.bb" rel=3D"noreferrer"=
 target=3D"_blank">gstreamer1.0-<wbr>plugins-bad_1.10.1.bb</a><br>
index 9cd892e..6c6f011 100644<br>
--- a/meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"http://gstreamer1.0=
-plugins-bad_1.10.1.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-<=
wbr>plugins-bad_1.10.1.bb</a><br>
+++ b/meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"http://gstreamer1.0=
-plugins-bad_1.10.1.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-<=
wbr>plugins-bad_1.10.1.bb</a><br>
@@ -14,6 +14,7 @@ SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-gstreamer-gl.pc.<wbr>in-don-t-append-GL_CFL=
AGS-to-<wbr>CFLAGS.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0009-glimagesink-<wbr>Downrank-to-marginal.patch=
 \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-introspection.m4-<wbr>prefix-pkgconfig-path=
s-with-<wbr>PKG_CON.patch \<br>
+=C2=A0 =C2=A0 file://0001-Prepend-PKG_<wbr>CONFIG_SYSROOT_DIR-to-pkg-<wbr>=
config-output.patch \<br>
=C2=A0&quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>491d2d5aab55ffc60c66e714d3d664<wbr>ea&=
quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;<wbr>133e0ed9fe21011b15d3898e3d3a9d<wbr>=
17ab74eed31996da2e353353e688ca<wbr>921d&quot;<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888">--<br>
2.10.2<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div></div>

--001a114f4e8c5cb40e0542e929c5--
