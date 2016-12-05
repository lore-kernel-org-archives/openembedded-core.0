Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id B72736007A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2016 19:08:38 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id e9so17225650pgc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2016 11:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=82RH8HqjDR54gaUvsZ6+xZimCv1w7Td8YLFlZOnPPWk=;
	b=hJfu8peUs4dZExW7zz+0q6/ZKFRDIOFd9zheakxJxaDtMJ9ILMFuuyhvA1tlHZTYV2
	6PslcxkFhuxho7MA4YcQaF+i2qjRTfdxruiHWLli5tVyfuh7yotRZx1huMtPCFJu0d25
	YrVvGrqzSXkY9OFhoPLlbbnM12Okfj9Ndb/8k/9NgjLYM4exdFxqrI/YIMmvH0+wkVMF
	uBlh4t0WlNFcd4rwxXvzuhNZSdkWwWcS6yjp5aaVGChMWnK5Lm7QbiAR8Le7/su0KdoP
	C2JropUUsBEBt9wX3jtghPrN5wPq6Rr5hvn3EI8Uk3GoRizHwvUPQ7Q3SSFw++qe8iWg
	hn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=82RH8HqjDR54gaUvsZ6+xZimCv1w7Td8YLFlZOnPPWk=;
	b=hJlaqcON6oHZm+6kHCu4i59Vaei7W5OA1W/utG9DbXFVh06eZwfr7qPggaZBw2NAVn
	CjyXxWp6b5skstAfCpp6BX/LFaS3LEpOJjAOzXAuxK/VzhtykzMfemvrRC7FTJZ2P5cm
	8EWoVnitEdtTzUqSrt141Sq3WyAwN0+m8oOZgc+YHShaNFiZMm4aqO3VBGBLtwNEqhkk
	YcBKTOi1ANCn32o0m/ISfcVEZBanbdWyRKObgjYUxPrRvzLqrcNWJkdFxCTZA5l7i/qd
	NwL3uuF04np6tZbCNZRR1CbNwg8e+yzv2n/71Dj2b0ys/ucv0L8PBhz6tzKChVHhC0s3
	y3Gw==
X-Gm-Message-State: AKaTC01bJrnwq2W5g70H7iiqYSHoDZOyklBrVa7rBuY9DcaVMD9kuNGXsZgCaY4hREWJyg==
X-Received: by 10.98.52.71 with SMTP id b68mr59826855pfa.18.1480964919546;
	Mon, 05 Dec 2016 11:08:39 -0800 (PST)
Received: from ?IPv6:2601:646:8882:b8c:5415:7777:3f68:ee0e?
	([2601:646:8882:b8c:5415:7777:3f68:ee0e])
	by smtp.gmail.com with ESMTPSA id
	u23sm29139362pfg.86.2016.12.05.11.08.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Dec 2016 11:08:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Message-Id: <6D6B8004-668B-4C5B-96BE-7A231F365788@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
Date: Mon, 5 Dec 2016 11:08:37 -0800
In-Reply-To: <CAHiDW_ERJNEoc4OfTQtV6Bi3UPzQkt9RMPJDUx-RAVJnrj2feA@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
References: <20161201083726.6160-1-raj.khem@gmail.com>
	<CAHiDW_ERJNEoc4OfTQtV6Bi3UPzQkt9RMPJDUx-RAVJnrj2feA@mail.gmail.com>
X-Mailer: Apple Mail (2.3251)
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
X-List-Received-Date: Mon, 05 Dec 2016 19:08:39 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_CD756C5D-EAFC-42FA-90BD-3D9FF2146028"

--Apple-Mail=_CD756C5D-EAFC-42FA-90BD-3D9FF2146028
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Dec 5, 2016, at 5:20 AM, Jussi Kukkonen <jussi.kukkonen@intel.com> =
wrote:
>=20
>=20
>=20
> On 1 December 2016 at 10:37, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> When configure pokes for wayland-protocols isntallations it ended up
> using the ones from host, which is because it did not account for =
sysroot
> prefix
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>>
> ---
>  .../gstreamer/gstreamer1.0-plugins-bad.inc         |  2 +-
>  ...G_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch | 37 =
++++++++++++++++++++++
>  .../gstreamer/gstreamer1.0-plugins-bad_1.10.1.bb =
<http://gstreamer1.0-plugins-bad_1.10.1.bb/>   |  1 +
>  3 files changed, 39 insertions(+), 1 deletion(-)
>  create mode 100644 =
meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Prepend-PK=
G_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch
>=20
> diff --git =
a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc =
b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> index d26a6a9..d3c5326 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> @@ -64,7 +64,7 @@ PACKAGECONFIG[srtp]            =3D =
"--enable-srtp,--disable-srtp,libsrtp"
>  PACKAGECONFIG[uvch264]         =3D =
"--enable-uvch264,--disable-uvch264,libusb1 libgudev"
>  PACKAGECONFIG[voaacenc]        =3D =
"--enable-voaacenc,--disable-voaacenc,vo-aacenc"
>  PACKAGECONFIG[voamrwbenc]      =3D =
"--enable-voamrwbenc,--disable-voamrwbenc,vo-amrwbenc"
> -PACKAGECONFIG[wayland]         =3D =
"--enable-wayland,--disable-wayland,wayland-native wayland"
> +PACKAGECONFIG[wayland]         =3D =
"--enable-wayland,--disable-wayland,wayland-native wayland =
wayland-protocols"
>  PACKAGECONFIG[webp]            =3D =
"--enable-webp,--disable-webp,libwebp"
>=20
>  # these plugins have not been ported to 1.0 (yet):
> diff --git =
a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Prepend-=
PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch =
b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Prepend-=
PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch
> new file mode 100644
> index 0000000..eb789df
> --- /dev/null
> +++ =
b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Prepend-=
PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch
> @@ -0,0 +1,37 @@
> +=46rom c271503d7e233428ac0323c51d6517113e26bef7 Mon Sep 17 00:00:00 =
2001
> +From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
> +Date: Thu, 1 Dec 2016 00:27:13 -0800
> +Subject: [PATCH] Prepend PKG_CONFIG_SYSROOT_DIR to pkg-config output
> +
> +In cross environment we have to prepend the sysroot to the path found =
by
> +pkgconfig since the path returned from pkgconfig does not have =
sysroot prefixed
> +it ends up using the files from host system. If build host has =
wayland installed
> +the build will succeed but if you dont have wayland-protocols =
installed on build host then
> +it wont find the files on build host
> +
> +This should work ok with non sysrooted builds too since in those =
cases PKG_CONFIG_SYSROOT_DIR
> +will be empty
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>>
> +---
> + configure.ac <http://configure.ac/> | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac <http://configure.ac/> b/configure.ac =
<http://configure.ac/>
> +index f8ac96b..dc87b08 100644
> +--- a/configure.ac <http://configure.ac/>
> ++++ b/configure.ac <http://configure.ac/>
> +@@ -2233,7 +2233,7 @@ AG_GST_CHECK_FEATURE(WAYLAND, [wayland sink], =
wayland , [
> +     PKG_CHECK_MODULES(WAYLAND_PROTOCOLS, wayland-protocols >=3D 1.4, =
[
> +       if test "x$wayland_scanner" !=3D "x"; then
> +         HAVE_WAYLAND=3D"yes"
> +-        AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, `$PKG_CONFIG =
--variable=3Dpkgdatadir wayland-protocols`)
> ++        AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, =
${PKG_CONFIG_SYSROOT_DIR}`$PKG_CONFIG --variable=3Dpkgdatadir =
wayland-protocols`)
>=20
> I believe this breaks multilib because wayland-protocols is allarch so =
PKG_CONFIG_SYSROOT_DIR may then be incorrect.

Realized my last reply is too terse. expanding on it a bit more.
this is not really the case. Since PKG_CONFIG_SYSROOT_DIR is set to  =
STAGING_DIR_HOST which is then set to ${STAGING_DIR}/${MACHINE} so =
effectively its just
reusing an existing var compared to your case where a new redundant =
variable is introduced.=20

having said that, there could be a multilib issue if pkgdatadir thats in =
.pc file from wayland-protocols package is using variables like =
${libdir} which then are
multilib dependent, if this is the case then we need to fix .pc file. =
however when I look at the =
<target-sysroot>/usr/share/pkgconfig/wayland-protocols.pc it has

prefix=3D/usr
datarootdir=3D${prefix}/share
pkgdatadir=3D/usr/share/wayland-protocols

seems to be free of multilib deps.

>=20
> I've set "WAYLAND_PROTOCOLS_SYSROOT_DIR=3D${STAGING_DIR}/${MACHINE}" =
in EXTRA_OECONF in other recipes and used that variable in the patches. =
It's not pretty but seems to work.
>=20
> Jussi
>=20
> +       else
> +         AC_MSG_RESULT([wayland-scanner is required to build the =
wayland plugin])
> +         HAVE_WAYLAND=3D"no"
> +--
> +2.10.2
> +
> diff --git =
a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.1.bb =
<http://gstreamer1.0-plugins-bad_1.10.1.bb/> =
b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.1.bb =
<http://gstreamer1.0-plugins-bad_1.10.1.bb/>
> index 9cd892e..6c6f011 100644
> --- =
a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.1.bb =
<http://gstreamer1.0-plugins-bad_1.10.1.bb/>
> +++ =
b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.1.bb =
<http://gstreamer1.0-plugins-bad_1.10.1.bb/>
> @@ -14,6 +14,7 @@ SRC_URI =3D " \
>      =
file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch \
>      file://0009-glimagesink-Downrank-to-marginal.patch \
>      =
file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
> +    =
file://0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch \
>  "
>  SRC_URI[md5sum] =3D "491d2d5aab55ffc60c66e714d3d664ea"
>  SRC_URI[sha256sum] =3D =
"133e0ed9fe21011b15d3898e3d3a9d17ab74eed31996da2e353353e688ca921d"
> --
> 2.10.2
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org =
<mailto:Openembedded-core@lists.openembedded.org>
> http://lists.openembedded.org/mailman/listinfo/openembedded-core =
<http://lists.openembedded.org/mailman/listinfo/openembedded-core>

--Apple-Mail=_CD756C5D-EAFC-42FA-90BD-3D9FF2146028
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Dec 5, 2016, at 5:20 AM, Jussi Kukkonen &lt;<a =
href=3D"mailto:jussi.kukkonen@intel.com" =
class=3D"">jussi.kukkonen@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><br =
class=3D"Apple-interchange-newline"><br style=3D"font-family: =
Times-Roman; font-size: 14px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: =
0px;" class=3D""><div class=3D"gmail_quote" style=3D"font-family: =
Times-Roman; font-size: 14px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: =
0px;">On 1 December 2016 at 10:37, Khem Raj<span =
class=3D"Apple-converted-space">&nbsp;</span><span dir=3D"ltr" =
class=3D"">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank" =
class=3D"">raj.khem@gmail.com</a>&gt;</span><span =
class=3D"Apple-converted-space">&nbsp;</span>wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px =
0px 0.8ex; border-left-width: 1px; border-left-style: solid; =
border-left-color: rgb(204, 204, 204); padding-left: 1ex;">When =
configure pokes for wayland-protocols isntallations it ended up<br =
class=3D"">using the ones from host, which is because it did not account =
for sysroot<br class=3D"">prefix<br class=3D""><br =
class=3D"">Signed-off-by: Khem Raj &lt;<a =
href=3D"mailto:raj.khem@gmail.com" =
class=3D"">raj.khem@gmail.com</a>&gt;<br class=3D"">---<br =
class=3D"">&nbsp;.../gstreamer/gstreamer1.0-<wbr =
class=3D"">plugins-bad.inc&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 2 =
+-<br class=3D"">&nbsp;...G_CONFIG_SYSROOT_DIR-to-<wbr =
class=3D"">pkg-config-output.patch | 37 ++++++++++++++++++++++<br =
class=3D"">&nbsp;.../gstreamer/<a =
href=3D"http://gstreamer1.0-plugins-bad_1.10.1.bb/" rel=3D"noreferrer" =
target=3D"_blank" class=3D"">gstreamer1.0-<wbr =
class=3D"">plugins-bad_1.10.1.bb</a>&nbsp; &nbsp;|&nbsp; 1 +<br =
class=3D"">&nbsp;3 files changed, 39 insertions(+), 1 deletion(-)<br =
class=3D"">&nbsp;create mode 100644 meta/recipes-multimedia/<wbr =
class=3D"">gstreamer/gstreamer1.0-<wbr =
class=3D"">plugins-bad/0001-Prepend-PKG_<wbr =
class=3D"">CONFIG_SYSROOT_DIR-to-pkg-<wbr =
class=3D"">config-output.patch<br class=3D""><br class=3D"">diff --git =
a/meta/recipes-multimedia/<wbr class=3D"">gstreamer/gstreamer1.0-<wbr =
class=3D"">plugins-bad.inc b/meta/recipes-multimedia/<wbr =
class=3D"">gstreamer/gstreamer1.0-<wbr class=3D"">plugins-bad.inc<br =
class=3D"">index d26a6a9..d3c5326 100644<br class=3D"">--- =
a/meta/recipes-multimedia/<wbr class=3D"">gstreamer/gstreamer1.0-<wbr =
class=3D"">plugins-bad.inc<br class=3D"">+++ =
b/meta/recipes-multimedia/<wbr class=3D"">gstreamer/gstreamer1.0-<wbr =
class=3D"">plugins-bad.inc<br class=3D"">@@ -64,7 +64,7 @@ =
PACKAGECONFIG[srtp]&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D =
"--enable-srtp,--disable-srtp,<wbr class=3D"">libsrtp"<br =
class=3D"">&nbsp;PACKAGECONFIG[uvch264]&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;=3D "--enable-uvch264,--disable-<wbr class=3D"">uvch264,libusb1 =
libgudev"<br class=3D"">&nbsp;PACKAGECONFIG[voaacenc]&nbsp; &nbsp; =
&nbsp; &nbsp; =3D "--enable-voaacenc,--disable-<wbr =
class=3D"">voaacenc,vo-aacenc"<br =
class=3D"">&nbsp;PACKAGECONFIG[voamrwbenc]&nbsp; &nbsp; &nbsp; =3D =
"--enable-voamrwbenc,--<wbr class=3D"">disable-voamrwbenc,vo-<wbr =
class=3D"">amrwbenc"<br class=3D"">-PACKAGECONFIG[wayland]&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;=3D "--enable-wayland,--disable-<wbr =
class=3D"">wayland,wayland-native wayland"<br =
class=3D"">+PACKAGECONFIG[wayland]&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D =
"--enable-wayland,--disable-<wbr class=3D"">wayland,wayland-native =
wayland wayland-protocols"<br class=3D"">&nbsp;PACKAGECONFIG[webp]&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D =
"--enable-webp,--disable-webp,<wbr class=3D"">libwebp"<br class=3D""><br =
class=3D"">&nbsp;# these plugins have not been ported to 1.0 (yet):<br =
class=3D"">diff --git a/meta/recipes-multimedia/<wbr =
class=3D"">gstreamer/gstreamer1.0-<wbr =
class=3D"">plugins-bad/0001-Prepend-PKG_<wbr =
class=3D"">CONFIG_SYSROOT_DIR-to-pkg-<wbr class=3D"">config-output.patch =
b/meta/recipes-multimedia/<wbr class=3D"">gstreamer/gstreamer1.0-<wbr =
class=3D"">plugins-bad/0001-Prepend-PKG_<wbr =
class=3D"">CONFIG_SYSROOT_DIR-to-pkg-<wbr =
class=3D"">config-output.patch<br class=3D"">new file mode 100644<br =
class=3D"">index 0000000..eb789df<br class=3D"">--- /dev/null<br =
class=3D"">+++ b/meta/recipes-multimedia/<wbr =
class=3D"">gstreamer/gstreamer1.0-<wbr =
class=3D"">plugins-bad/0001-Prepend-PKG_<wbr =
class=3D"">CONFIG_SYSROOT_DIR-to-pkg-<wbr =
class=3D"">config-output.patch<br class=3D"">@@ -0,0 +1,37 @@<br =
class=3D"">+=46rom c271503d7e233428ac0323c51d6517<wbr =
class=3D"">113e26bef7 Mon Sep 17 00:00:00 2001<br class=3D"">+From: Khem =
Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" =
class=3D"">raj.khem@gmail.com</a>&gt;<br class=3D"">+Date: Thu, 1 Dec =
2016 00:27:13 -0800<br class=3D"">+Subject: [PATCH] Prepend =
PKG_CONFIG_SYSROOT_DIR to pkg-config output<br class=3D"">+<br =
class=3D"">+In cross environment we have to prepend the sysroot to the =
path found by<br class=3D"">+pkgconfig since the path returned from =
pkgconfig does not have sysroot prefixed<br class=3D"">+it ends up using =
the files from host system. If build host has wayland installed<br =
class=3D"">+the build will succeed but if you dont have =
wayland-protocols installed on build host then<br class=3D"">+it wont =
find the files on build host<br class=3D"">+<br class=3D"">+This should =
work ok with non sysrooted builds too since in those cases =
PKG_CONFIG_SYSROOT_DIR<br class=3D"">+will be empty<br class=3D"">+<br =
class=3D"">+Upstream-Status: Pending<br class=3D"">+<br =
class=3D"">+Signed-off-by: Khem Raj &lt;<a =
href=3D"mailto:raj.khem@gmail.com" =
class=3D"">raj.khem@gmail.com</a>&gt;<br class=3D"">+---<br =
class=3D"">+<span class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"http://configure.ac/" rel=3D"noreferrer" target=3D"_blank" =
class=3D"">configure.ac</a><span =
class=3D"Apple-converted-space">&nbsp;</span>| 2 +-<br class=3D"">+ 1 =
file changed, 1 insertion(+), 1 deletion(-)<br class=3D"">+<br =
class=3D"">+diff --git a/<a href=3D"http://configure.ac/" =
rel=3D"noreferrer" target=3D"_blank" class=3D"">configure.ac</a><span =
class=3D"Apple-converted-space">&nbsp;</span>b/<a =
href=3D"http://configure.ac/" rel=3D"noreferrer" target=3D"_blank" =
class=3D"">configure.ac</a><br class=3D"">+index f8ac96b..dc87b08 =
100644<br class=3D"">+--- a/<a href=3D"http://configure.ac/" =
rel=3D"noreferrer" target=3D"_blank" class=3D"">configure.ac</a><br =
class=3D"">++++ b/<a href=3D"http://configure.ac/" rel=3D"noreferrer" =
target=3D"_blank" class=3D"">configure.ac</a><br class=3D"">+@@ -2233,7 =
+2233,7 @@ AG_GST_CHECK_FEATURE(WAYLAND, [wayland sink], wayland , [<br =
class=3D"">+&nbsp; &nbsp; &nbsp;PKG_CHECK_MODULES(WAYLAND_<wbr =
class=3D"">PROTOCOLS, wayland-protocols &gt;=3D 1.4, [<br =
class=3D"">+&nbsp; &nbsp; &nbsp; &nbsp;if test "x$wayland_scanner" !=3D =
"x"; then<br class=3D"">+&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;HAVE_WAYLAND=3D"yes"<br class=3D"">+-&nbsp; &nbsp; &nbsp; &nbsp; =
AC_SUBST(WAYLAND_PROTOCOLS_<wbr class=3D"">DATADIR, `$PKG_CONFIG =
--variable=3Dpkgdatadir wayland-protocols`)<br class=3D"">++&nbsp; =
&nbsp; &nbsp; &nbsp; AC_SUBST(WAYLAND_PROTOCOLS_<wbr class=3D"">DATADIR, =
${PKG_CONFIG_SYSROOT_DIR}`$<wbr class=3D"">PKG_CONFIG =
--variable=3Dpkgdatadir wayland-protocols`)<br =
class=3D""></blockquote><div class=3D""><br class=3D""></div><div =
class=3D"">I believe this breaks multilib because wayland-protocols is =
allarch so PKG_CONFIG_SYSROOT_DIR may then be =
incorrect.</div></div></div></blockquote><div><br =
class=3D""></div><div>Realized my last reply is too terse. expanding on =
it a bit more.</div><div>this is not really the case. Since =
PKG_CONFIG_SYSROOT_DIR is set to &nbsp;STAGING_DIR_HOST which is then =
set to&nbsp;${STAGING_DIR}/${MACHINE} so effectively its =
just</div><div>reusing an existing var compared to your case where a new =
redundant variable is introduced.&nbsp;</div><div><br =
class=3D""></div><div>having said that, there could be a multilib issue =
if pkgdatadir thats in .pc file from wayland-protocols package is using =
variables like ${libdir} which then are</div><div>multilib dependent, if =
this is the case then we need to fix .pc file. however when I look at =
the &lt;target-sysroot&gt;/usr/share/pkgconfig/wayland-protocols.pc it =
has</div><div><br =
class=3D""></div><div><div>prefix=3D/usr</div><div>datarootdir=3D${prefix}=
/share</div><div>pkgdatadir=3D/usr/share/wayland-protocols</div><div><br =
class=3D""></div><div>seems to be free of multilib deps.</div></div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
class=3D"gmail_quote" style=3D"font-family: Times-Roman; font-size: =
14px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; orphans: auto; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: =
auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><div =
class=3D""><br class=3D""></div><div class=3D"">I've set =
"WAYLAND_PROTOCOLS_SYSROOT_DIR=3D${STAGING_DIR}/${MACHINE}" =
in&nbsp;EXTRA_OECONF in other recipes and used that variable in the =
patches. It's not pretty but seems to work.<br class=3D""></div><div =
class=3D""><br class=3D""></div><div class=3D"">Jussi</div><div =
class=3D""><br class=3D""></div><blockquote class=3D"gmail_quote" =
style=3D"margin: 0px 0px 0px 0.8ex; border-left-width: 1px; =
border-left-style: solid; border-left-color: rgb(204, 204, 204); =
padding-left: 1ex;">+&nbsp; &nbsp; &nbsp; &nbsp;else<br class=3D"">+&nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;AC_MSG_RESULT([wayland-scanner is required =
to build the wayland plugin])<br class=3D"">+&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;HAVE_WAYLAND=3D"no"<br class=3D"">+--<br class=3D"">+2.10.2<br =
class=3D"">+<br class=3D"">diff --git a/meta/recipes-multimedia/<wbr =
class=3D"">gstreamer/<a =
href=3D"http://gstreamer1.0-plugins-bad_1.10.1.bb/" rel=3D"noreferrer" =
target=3D"_blank" class=3D"">gstreamer1.0-<wbr =
class=3D"">plugins-bad_1.10.1.bb</a><span =
class=3D"Apple-converted-space">&nbsp;</span>b/meta/recipes-multimedia/<wb=
r class=3D"">gstreamer/<a =
href=3D"http://gstreamer1.0-plugins-bad_1.10.1.bb/" rel=3D"noreferrer" =
target=3D"_blank" class=3D"">gstreamer1.0-<wbr =
class=3D"">plugins-bad_1.10.1.bb</a><br class=3D"">index =
9cd892e..6c6f011 100644<br class=3D"">--- a/meta/recipes-multimedia/<wbr =
class=3D"">gstreamer/<a =
href=3D"http://gstreamer1.0-plugins-bad_1.10.1.bb/" rel=3D"noreferrer" =
target=3D"_blank" class=3D"">gstreamer1.0-<wbr =
class=3D"">plugins-bad_1.10.1.bb</a><br class=3D"">+++ =
b/meta/recipes-multimedia/<wbr class=3D"">gstreamer/<a =
href=3D"http://gstreamer1.0-plugins-bad_1.10.1.bb/" rel=3D"noreferrer" =
target=3D"_blank" class=3D"">gstreamer1.0-<wbr =
class=3D"">plugins-bad_1.10.1.bb</a><br class=3D"">@@ -14,6 +14,7 @@ =
SRC_URI =3D " \<br class=3D"">&nbsp; &nbsp; &nbsp;<a =
href=3D"file://0001-gstreamer-gl.pc" =
class=3D"">file://0001-gstreamer-gl.pc</a>.<wbr =
class=3D"">in-don-t-append-GL_CFLAGS-to-<wbr class=3D"">CFLAGS.patch =
\<br class=3D"">&nbsp; &nbsp; &nbsp;<a href=3D"file:///0009-glimagesink-" =
class=3D"">file://0009-glimagesink-</a><wbr =
class=3D"">Downrank-to-marginal.patch \<br class=3D"">&nbsp; &nbsp; =
&nbsp;<a href=3D"file:///0001-introspection.m4-" =
class=3D"">file://0001-introspection.m4-</a><wbr =
class=3D"">prefix-pkgconfig-paths-with-<wbr class=3D"">PKG_CON.patch =
\<br class=3D"">+&nbsp; &nbsp; <a href=3D"file:///0001-Prepend-PKG_" =
class=3D"">file://0001-Prepend-PKG_</a><wbr =
class=3D"">CONFIG_SYSROOT_DIR-to-pkg-<wbr class=3D"">config-output.patch =
\<br class=3D"">&nbsp;"<br class=3D"">&nbsp;SRC_URI[md5sum] =3D "<wbr =
class=3D"">491d2d5aab55ffc60c66e714d3d664<wbr class=3D"">ea"<br =
class=3D"">&nbsp;SRC_URI[sha256sum] =3D "<wbr =
class=3D"">133e0ed9fe21011b15d3898e3d3a9d<wbr =
class=3D"">17ab74eed31996da2e353353e688ca<wbr class=3D"">921d"<br =
class=3D""><span class=3D"gmail-HOEnZb"><font color=3D"#888888" =
class=3D"">--<br class=3D"">2.10.2<br class=3D""><br class=3D"">--<br =
class=3D"">______________________________<wbr =
class=3D"">_________________<br class=3D"">Openembedded-core mailing =
list<br class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">Openembedded-core@lists.<wbr class=3D"">openembedded.org</a><br=
 class=3D""><a =
href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core" =
rel=3D"noreferrer" target=3D"_blank" =
class=3D"">http://lists.openembedded.org/<wbr =
class=3D"">mailman/listinfo/openembedded-<wbr =
class=3D"">core</a></font></span></blockquote></div></div></blockquote></d=
iv><br class=3D""></body></html>=

--Apple-Mail=_CD756C5D-EAFC-42FA-90BD-3D9FF2146028--
