Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f196.google.com (mail-ob0-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3994A7317D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 05:37:09 +0000 (UTC)
Received: by mail-ob0-f196.google.com with SMTP id x5so2016976obg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 21:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=G5AkABe6uwlSo6NbsAvKQn7sIteryuCTL7hwZjfqj0c=;
	b=N/ECYNhXv8bgQcuD2f9nlCIkyWngYzjK1IltbIWZ4j2HNEACgbNUiOk4NAki1MoeL7
	05zXjIGlg4GcTQRSrr5iG5mq32ZGTVk3NWPrUL4RcgwcDcczViY23+4BLwykK+NVpt/P
	gopr2GZcygBJfjklu9vhkipgaFmAfROdz5OmDkS5Du1DKKr04ICY4Ushd1ALcySk90uS
	OSR4yB8ICuFCyNqi4fVjbezVMVaPIjZaMPsydieX152mzaY/E+qdq+gaybqe9v7eY4mz
	u+Dy5sgO5vAzcB7lfj+3Ll/+ST2GW5rozpwp1P+FoMxMNM4cOhawWQakR/DPF+rq27gO
	Kszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=G5AkABe6uwlSo6NbsAvKQn7sIteryuCTL7hwZjfqj0c=;
	b=Bhjvae892BQ4VaAJ3uV3BqQyDOf8cmFJityHy//mN9+ad/BnHm5ck+IqpjTI5FzYa2
	pMOreZxfuLS2jr5lh8M3Vm895XUUxq6JzIA83Bi2GpZD+V5o3m01Xd0XcG0Ed2Vp8iLy
	+9FVLwkUNJ7u/FUnjNzMZxfY7ndCcNNNYrgi1dURECr8BDCOjuEt0ieg0pQYsPoC3Jod
	diQGFwqTg9+jxWc2pWsJ4qalM/LQOcffu0oyVElD1e0fKXDXklPgGx481mc4icjlwkpB
	IIxp2Kc4BLmzG18n/gCl3tECBBsIXLYjQ5turgukDM/h615uMFJNCYDOYTunOTImYaui
	rdng==
X-Gm-Message-State: ALoCoQlbEjm8hnmNOkx7Lrz0iat+4ek1EeBy529mwKoc4TdSh1RJwt44dmsjATwRbm4HoA+XepuWSccw12UC4kldjS/pp6VRbg==
X-Received: by 10.60.57.134 with SMTP id i6mr30536776oeq.11.1453354630586;
	Wed, 20 Jan 2016 21:37:10 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	w143sm19735990oiw.16.2016.01.20.21.37.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 21:37:09 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 21:36:21 -0800
Message-Id: <1453354610-19218-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
References: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 03/32] gstreamer1.0: minor formatting improvements
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
X-List-Received-Date: Thu, 21 Jan 2016 05:37:10 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc | 29 ++++++++++++----------
 .../gstreamer/gstreamer1.0_1.6.2.bb                |  2 +-
 .../gstreamer/gstreamer1.0_git.bb                  |  4 +--
 3 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
index c10f66f..a08e226 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
@@ -5,27 +5,30 @@ HOMEPAGE = "http://gstreamer.freedesktop.org/"
 BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
 SECTION = "multimedia"
 LICENSE = "LGPLv2+"
-DEPENDS = "glib-2.0 libxml2 bison-native flex-native libcap"
+
+DEPENDS = "glib-2.0 libcap libxml2 bison-native flex-native"
 
 inherit autotools pkgconfig gettext upstream-version-is-even
 
-PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
 PACKAGECONFIG[check] = "--enable-check,--disable-check"
+PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
 PACKAGECONFIG[tests] = "--enable-tests,--disable-tests"
 PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,valgrind,"
 
-EXTRA_OECONF = "--disable-docbook --disable-gtk-doc \
-                --disable-dependency-tracking \
-                --disable-examples \
-                "
-
-RRECOMMENDS_${PN}_qemux86    += "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
-RRECOMMENDS_${PN}_qemux86-64 += "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
+EXTRA_OECONF = " \
+    --disable-dependency-tracking \
+    --disable-docbook \
+    --disable-examples \
+    --disable-gtk-doc \
+"
 
 CACHED_CONFIGUREVARS += "ac_cv_header_valgrind_valgrind_h=no"
 
-FILES_${PN} += " ${libdir}/gstreamer-1.0/*.so"
-FILES_${PN}-dev += " ${libdir}/gstreamer-1.0/*.la ${libdir}/gstreamer-1.0/*.a ${libdir}/gstreamer-1.0/include"
-FILES_${PN}-bash-completion += " ${datadir}/bash-completion/completions/ ${datadir}/bash-completion/helpers/gst*"
+PACKAGES += "${PN}-bash-completion"
+
+FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
+FILES_${PN}-dev += "${libdir}/gstreamer-1.0/*.la ${libdir}/gstreamer-1.0/*.a ${libdir}/gstreamer-1.0/include"
+FILES_${PN}-bash-completion += "${datadir}/bash-completion/completions/ ${datadir}/bash-completion/helpers/gst*"
 
-PACKAGES += " ${PN}-bash-completion"
+RRECOMMENDS_${PN}_qemux86 += "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
+RRECOMMENDS_${PN}_qemux86-64 += "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.2.bb
index ba46c77..3e9825c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.2.bb
@@ -7,8 +7,8 @@ SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
     file://0001-Fix-crash-with-gst-inspect.patch \
 "
+
 SRC_URI[md5sum] = "5e610b5a94c209487310739b39b6c464"
 SRC_URI[sha256sum] = "5896716bd8e089dba452932a2eff2bb6f6c9d58ff64a96635d157f1ffaf8feb2"
 
 S = "${WORKDIR}/gstreamer-${PV}"
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
index cb00d31..f7e2351 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
@@ -6,13 +6,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
                     file://gst/gst.h;beginline=1;endline=21;md5=e059138481205ee2c6fc1c079c016d0d"
 
 SRC_URI = "git://anongit.freedesktop.org/gstreamer/gstreamer;branch=master"
-S = "${WORKDIR}/git"
 
 SRCREV = "3b8181a8c550e74acaba4e8c55bdc649fa551dc9"
 
+S = "${WORKDIR}/git"
+
 do_configure_prepend() {
 	cd ${S}
 	./autogen.sh --noconfigure
 	cd ${B}
 }
-
-- 
1.9.1


