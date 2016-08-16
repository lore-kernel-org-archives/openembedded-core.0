Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 4283C70018
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 21:40:14 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id m101so119928659ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 14:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OiUCUO66je5ElNklf1CdGtz7mGi5x3mk3uul4k6Rr00=;
	b=Shiotv4rqAesY8qQPGgmS3RBC7SrSTiy6ais5LXN/uiKpT6f4PDLqhSyhdj3oZzE1F
	mssHVQKzF09EHrImJURgUO5FZh+4vTfARkBACg2xY4bL8oUuP9V8Roca5znHUT1Qs4T+
	bIKejYg+UM9lR/MToh3vIdQ2hnjtS+2+vUrGJdJVndcSkBGmRXQmnLTOCtUXOn/SGXwe
	dWIqigU6KQBsZLTzqimMZMMcG1Vm51UJ8npq/BuQGUmdYAZsM1EBFadjBb9DPC/1bqfs
	+oQ33+ATa4ua21De6RYv+kxCCdbogZlsbf9tfEezs6toD5KqVVBo6eYee9by6XnWcZ7P
	N2tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OiUCUO66je5ElNklf1CdGtz7mGi5x3mk3uul4k6Rr00=;
	b=JD5FliM2IYiJwImZYH0MXuDdNWkYJTbbvqr0YjFKW+GwVguaYvMD3EUPYZoplQC9eP
	bl+aanve399kTsPV58NRUokzfsUU/wNxcOSaxDomck0UpWIU+ZpEnhqFanZ/bhy6YPRd
	uKk9DRX793SaG2b5/fJZP4xuDPcsK9wkPAaiATHeGEHLrPdoFhB9L2cNm2jUayRqvt1q
	P0kZOmOh7O1fiVlAp0UWdW1/Oq/OB4w8p55MCkVRbo8KzYqVuyuuZEtoIz2mVs3dUf4O
	NYPE1DZGtOa0ptCCQWoKyHVui8QEh2PtuuVvMCjiTqI7fR6xLB8sER3FoeDdHV13dB0d
	uE/Q==
X-Gm-Message-State: AEkooutnrxEOFS5+afUNwPgaeC+/BvQAswjqz8NXYcRy+NtFv8Eq9i+p4zWYohsKQnSDsXmkMTiujfyFX8of5ayO
X-Received: by 10.107.135.142 with SMTP id r14mr46505289ioi.133.1471383615441; 
	Tue, 16 Aug 2016 14:40:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 16 Aug 2016 14:39:55 -0700 (PDT)
In-Reply-To: <1470821429-6094-8-git-send-email-maxin.john@intel.com>
References: <1470821429-6094-1-git-send-email-maxin.john@intel.com>
	<1470821429-6094-8-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Aug 2016 22:39:55 +0100
Message-ID: <CAJTo0LbM=t159Ak4tmoKcXN22WeQCXCdRgjaR9y4qfd9bDFSRQ@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/10] tslib: remove recipe
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
X-List-Received-Date: Tue, 16 Aug 2016 21:40:15 -0000
Content-Type: multipart/alternative; boundary=001a113eccbcba3c75053a37313f

--001a113eccbcba3c75053a37313f
Content-Type: text/plain; charset=UTF-8

Hi Maxin,

This breaks meta-qt4 which currently just depends on oe-core.

Can you see if we can make qt4-embedded have a configurable dependency on
tslib which is disabled by default?

Ross

On 10 August 2016 at 10:30, Maxin B. John <maxin.john@intel.com> wrote:

> Modern systems generally use the kernel driver or libinput instead
> of tslib. Move tslib from oe-core along with xtscal.
>
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  meta/recipes-graphics/tslib/tslib/ts.conf  | 25 --------------
>  meta/recipes-graphics/tslib/tslib/tslib.sh |  8 -----
>  meta/recipes-graphics/tslib/tslib_1.1.bb   | 53
> ------------------------------
>  3 files changed, 86 deletions(-)
>  delete mode 100644 meta/recipes-graphics/tslib/tslib/ts.conf
>  delete mode 100644 meta/recipes-graphics/tslib/tslib/tslib.sh
>  delete mode 100644 meta/recipes-graphics/tslib/tslib_1.1.bb
>
> diff --git a/meta/recipes-graphics/tslib/tslib/ts.conf
> b/meta/recipes-graphics/tslib/tslib/ts.conf
> deleted file mode 100644
> index 1b0da93..0000000
> --- a/meta/recipes-graphics/tslib/tslib/ts.conf
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -# Uncomment if you wish to use the linux input layer event interface
> -module_raw input
> -
> -# Uncomment if you're using a Sharp Zaurus SL-5500/SL-5000d
> -# module_raw collie
> -
> -# Uncomment if you're using a Sharp Zaurus SL-C700/C750/C760/C860
> -# module_raw corgi
> -
> -# Uncomment if you're using a device with a UCB1200/1300/1400 TS interface
> -# module_raw ucb1x00
> -
> -# Uncomment if you're using an HP iPaq h3600 or similar
> -# module_raw h3600
> -
> -# Uncomment if you're using a Hitachi Webpad
> -# module_raw mk712
> -
> -# Uncomment if you're using an IBM Arctic II
> -# module_raw arctic2
> -
> -module pthres pmin=1
> -module variance delta=30
> -module dejitter delta=100
> -module linear
> diff --git a/meta/recipes-graphics/tslib/tslib/tslib.sh
> b/meta/recipes-graphics/tslib/tslib/tslib.sh
> deleted file mode 100644
> index 7068e8d..0000000
> --- a/meta/recipes-graphics/tslib/tslib/tslib.sh
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -#!/bin/sh
> -
> -if [ -e /dev/input/touchscreen0 ]; then
> -    TSLIB_TSDEVICE=/dev/input/touchscreen0
> -
> -    export TSLIB_TSDEVICE
> -fi
> -
> diff --git a/meta/recipes-graphics/tslib/tslib_1.1.bb
> b/meta/recipes-graphics/tslib/tslib_1.1.bb
> deleted file mode 100644
> index b0264c3..0000000
> --- a/meta/recipes-graphics/tslib/tslib_1.1.bb
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -SUMMARY = "An abstraction layer for touchscreen panel events"
> -DESCRIPTION = "Tslib is an abstraction layer for touchscreen panel \
> -events, as well as a filter stack for the manipulation of those events. \
> -Tslib is generally used on embedded devices to provide a common user \
> -space interface to touchscreen functionality."
> -HOMEPAGE = "http://tslib.berlios.de/"
> -
> -AUTHOR = "Russell King w/ plugins by Chris Larson et. al."
> -SECTION = "base"
> -LICENSE = "LGPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=f30a9716ef3762e3467a2f62bf790f0a"
> -
> -SRC_URI = "https://github.com/kergoth/tslib/releases/download/${PV}/
> tslib-${PV}.tar.xz;downloadfilename=tslib-${PV}.tar.xz \
> -           file://ts.conf \
> -           file://tslib.sh \
> -"
> -
> -SRC_URI[md5sum] = "14771f8607b341bb4b297819d37e837d"
> -SRC_URI[sha256sum] = "fe35e5f710ea933b118f710e2ce440
> 3ac076fe69926b570333867d4de082a51c"
> -
> -UPSTREAM_CHECK_URI = "https://github.com/kergoth/tslib/releases"
> -
> -inherit autotools pkgconfig
> -
> -EXTRA_OECONF = "--enable-shared --disable-h3600 --enable-input
> --disable-corgi --disable-collie --disable-mk712 --disable-arctic2
> --disable-ucb1x00"
> -
> -do_install_prepend() {
> -       install -m 0644 ${WORKDIR}/ts.conf ${S}/etc/ts.conf
> -}
> -
> -do_install_append() {
> -       install -d ${D}${sysconfdir}/profile.d/
> -       install -m 0755 ${WORKDIR}/tslib.sh ${D}${sysconfdir}/profile.d/
> -}
> -
> -# People should consider using udev's /dev/input/touchscreen0 symlink
> -# instead of detect-stylus
> -#RDEPENDS_tslib-conf_weird-machine = "detect-stylus"
> -RPROVIDES_tslib-conf = "libts-0.0-conf"
> -
> -PACKAGES =+ "tslib-conf tslib-tests tslib-calibrate"
> -DEBIAN_NOAUTONAME_tslib-conf = "1"
> -DEBIAN_NOAUTONAME_tslib-tests = "1"
> -DEBIAN_NOAUTONAME_tslib-calibrate = "1"
> -
> -RDEPENDS_${PN} = "tslib-conf"
> -RRECOMMENDS_${PN} = "pointercal"
> -
> -FILES_${PN}-dev += "${libdir}/ts/*.la"
> -FILES_tslib-conf = "${sysconfdir}/ts.conf ${sysconfdir}/profile.d/tslib.sh
> ${datadir}/tslib"
> -FILES_${PN} = "${libdir}/*.so.* ${libdir}/ts/*.so*"
> -FILES_tslib-calibrate += "${bindir}/ts_calibrate"
> -FILES_tslib-tests = "${bindir}/ts_harvest ${bindir}/ts_print
> ${bindir}/ts_print_raw ${bindir}/ts_test"
> --
> 2.4.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113eccbcba3c75053a37313f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Maxin,<div><br></div><div>This breaks meta-qt4 which cu=
rrently just depends on oe-core.<div><div><br></div><div>Can you see if we =
can make qt4-embedded have a configurable dependency on tslib which is disa=
bled by default?</div><div><br></div><div>Ross</div></div></div></div><div =
class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 10 August 2016 at 1=
0:30, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D"mailto:maxin.john@inte=
l.com" target=3D"_blank">maxin.john@intel.com</a>&gt;</span> wrote:<br><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">Modern systems generally use the kernel driver o=
r libinput instead<br>
of tslib. Move tslib from oe-core along with xtscal.<br>
<br>
Signed-off-by: Maxin B. John &lt;<a href=3D"mailto:maxin.john@intel.com">ma=
xin.john@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/tslib/<wbr>tslib/ts.conf=C2=A0 | 25 -----------=
---<br>
=C2=A0meta/recipes-graphics/tslib/<wbr>tslib/tslib.sh |=C2=A0 8 -----<br>
=C2=A0meta/recipes-graphics/tslib/<a href=3D"http://tslib_1.1.bb" rel=3D"no=
referrer" target=3D"_blank">ts<wbr>lib_1.1.bb</a>=C2=A0 =C2=A0| 53 --------=
----------------------<br>
=C2=A03 files changed, 86 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-graphics/tslib/<wbr>tslib/ts.conf<br>
=C2=A0delete mode 100644 meta/recipes-graphics/tslib/<wbr>tslib/tslib.sh<br=
>
=C2=A0delete mode 100644 meta/recipes-graphics/tslib/<a href=3D"http://tsli=
b_1.1.bb" rel=3D"noreferrer" target=3D"_blank">ts<wbr>lib_1.1.bb</a><br>
<br>
diff --git a/meta/recipes-graphics/tslib/<wbr>tslib/ts.conf b/meta/recipes-=
graphics/tslib/<wbr>tslib/ts.conf<br>
deleted file mode 100644<br>
index 1b0da93..0000000<br>
--- a/meta/recipes-graphics/tslib/<wbr>tslib/ts.conf<br>
+++ /dev/null<br>
@@ -1,25 +0,0 @@<br>
-# Uncomment if you wish to use the linux input layer event interface<br>
-module_raw input<br>
-<br>
-# Uncomment if you&#39;re using a Sharp Zaurus SL-5500/SL-5000d<br>
-# module_raw collie<br>
-<br>
-# Uncomment if you&#39;re using a Sharp Zaurus SL-C700/C750/C760/C860<br>
-# module_raw corgi<br>
-<br>
-# Uncomment if you&#39;re using a device with a UCB1200/1300/1400 TS inter=
face<br>
-# module_raw ucb1x00<br>
-<br>
-# Uncomment if you&#39;re using an HP iPaq h3600 or similar<br>
-# module_raw h3600<br>
-<br>
-# Uncomment if you&#39;re using a Hitachi Webpad<br>
-# module_raw mk712<br>
-<br>
-# Uncomment if you&#39;re using an IBM Arctic II<br>
-# module_raw arctic2<br>
-<br>
-module pthres pmin=3D1<br>
-module variance delta=3D30<br>
-module dejitter delta=3D100<br>
-module linear<br>
diff --git a/meta/recipes-graphics/tslib/<wbr>tslib/tslib.sh b/meta/recipes=
-graphics/tslib/<wbr>tslib/tslib.sh<br>
deleted file mode 100644<br>
index 7068e8d..0000000<br>
--- a/meta/recipes-graphics/tslib/<wbr>tslib/tslib.sh<br>
+++ /dev/null<br>
@@ -1,8 +0,0 @@<br>
-#!/bin/sh<br>
-<br>
-if [ -e /dev/input/touchscreen0 ]; then<br>
-=C2=A0 =C2=A0 TSLIB_TSDEVICE=3D/dev/input/<wbr>touchscreen0<br>
-<br>
-=C2=A0 =C2=A0 export TSLIB_TSDEVICE<br>
-fi<br>
-<br>
diff --git a/meta/recipes-graphics/tslib/<a href=3D"http://tslib_1.1.bb" re=
l=3D"noreferrer" target=3D"_blank"><wbr>tslib_1.1.bb</a> b/meta/recipes-gra=
phics/tslib/<a href=3D"http://tslib_1.1.bb" rel=3D"noreferrer" target=3D"_b=
lank"><wbr>tslib_1.1.bb</a><br>
deleted file mode 100644<br>
index b0264c3..0000000<br>
--- a/meta/recipes-graphics/tslib/<a href=3D"http://tslib_1.1.bb" rel=3D"no=
referrer" target=3D"_blank"><wbr>tslib_1.1.bb</a><br>
+++ /dev/null<br>
@@ -1,53 +0,0 @@<br>
-SUMMARY =3D &quot;An abstraction layer for touchscreen panel events&quot;<=
br>
-DESCRIPTION =3D &quot;Tslib is an abstraction layer for touchscreen panel =
\<br>
-events, as well as a filter stack for the manipulation of those events. \<=
br>
-Tslib is generally used on embedded devices to provide a common user \<br>
-space interface to touchscreen functionality.&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"http://tslib.berlios.de/" rel=3D"noreferrer"=
 target=3D"_blank">http://tslib.berlios.de/</a>&quot;<br>
-<br>
-AUTHOR =3D &quot;Russell King w/ plugins by Chris Larson et. al.&quot;<br>
-SECTION =3D &quot;base&quot;<br>
-LICENSE =3D &quot;LGPLv2&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>f30a9716ef3762e3467a2=
f62bf790f<wbr>0a&quot;<br>
-<br>
-SRC_URI =3D &quot;<a href=3D"https://github.com/kergoth/tslib/releases/dow=
nload/${PV}/tslib-${PV}.tar.xz;downloadfilename=3Dtslib-${PV}.tar.xz" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/kergoth/<wbr>tslib/rel=
eases/download/${PV}/<wbr>tslib-${PV}.tar.xz;<wbr>downloadfilename=3Dtslib-=
${PV}.<wbr>tar.xz</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ts.conf \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://tslib.sh \<br>
-&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;<wbr>14771f8607b341bb4b297819d37e83<wbr>7d&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>fe35e5f710ea933b118f710e2ce440<wbr>3ac07=
6fe69926b570333867d4de082<wbr>a51c&quot;<br>
-<br>
-UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/kergoth/tslib/r=
eleases" rel=3D"noreferrer" target=3D"_blank">https://github.com/kergoth/<w=
br>tslib/releases</a>&quot;<br>
-<br>
-inherit autotools pkgconfig<br>
-<br>
-EXTRA_OECONF =3D &quot;--enable-shared --disable-h3600 --enable-input --di=
sable-corgi --disable-collie --disable-mk712 --disable-arctic2 --disable-uc=
b1x00&quot;<br>
-<br>
-do_install_prepend() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${WORKDIR}/ts.conf ${S}/etc/ts.=
conf<br>
-}<br>
-<br>
-do_install_append() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/profile.d/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${WORKDIR}/tslib.sh ${D}${sysco=
nfdir}/profile.d/<br>
-}<br>
-<br>
-# People should consider using udev&#39;s /dev/input/touchscreen0 symlink<=
br>
-# instead of detect-stylus<br>
-#RDEPENDS_tslib-conf_weird-<wbr>machine =3D &quot;detect-stylus&quot;<br>
-RPROVIDES_tslib-conf =3D &quot;libts-0.0-conf&quot;<br>
-<br>
-PACKAGES =3D+ &quot;tslib-conf tslib-tests tslib-calibrate&quot;<br>
-DEBIAN_NOAUTONAME_tslib-conf =3D &quot;1&quot;<br>
-DEBIAN_NOAUTONAME_tslib-tests =3D &quot;1&quot;<br>
-DEBIAN_NOAUTONAME_tslib-<wbr>calibrate =3D &quot;1&quot;<br>
-<br>
-RDEPENDS_${PN} =3D &quot;tslib-conf&quot;<br>
-RRECOMMENDS_${PN} =3D &quot;pointercal&quot;<br>
-<br>
-FILES_${PN}-dev +=3D &quot;${libdir}/ts/*.la&quot;<br>
-FILES_tslib-conf =3D &quot;${sysconfdir}/ts.conf ${sysconfdir}/profile.d/t=
slib.<wbr>sh ${datadir}/tslib&quot;<br>
-FILES_${PN} =3D &quot;${libdir}/*.so.* ${libdir}/ts/*.so*&quot;<br>
-FILES_tslib-calibrate +=3D &quot;${bindir}/ts_calibrate&quot;<br>
-FILES_tslib-tests =3D &quot;${bindir}/ts_harvest ${bindir}/ts_print ${bind=
ir}/ts_print_raw ${bindir}/ts_test&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.4.0<br>
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

--001a113eccbcba3c75053a37313f--
