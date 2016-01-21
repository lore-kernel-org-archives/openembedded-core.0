Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id C02EF731A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 02:43:37 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id j3so1413892oig.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 18:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=G5AkABe6uwlSo6NbsAvKQn7sIteryuCTL7hwZjfqj0c=;
	b=Tm2q+f8dsKpKrR3Bc35jXROELYlHrdFcVQ3djpht7wCquptO5LoW+U6W5u13nNjnDN
	xWOTR4rOwOWy1+/pWyrZJDztieTLfvhm/2eIjicj/eJ8vUnmmuscjj0IlrogP1F/U4Jd
	Np7Qev8tKAI9hSxeyxvDXigJpI4MOKb/miK9oG4yFZjF0aS7Bp1+kMbbH/httc6mH0x7
	4bJn0K/Q/BuY2qZxVc6NwnVPrshZJFggVaxXsm/zaXOMGDDMWjAPRym8hpydKlXQFKwT
	kmzuEqxnO+JGprpXW1Ow++xN3sXuDby/+4CkJhgaInvvgjAe13xc8QGHbQQBHL/Gvut5
	A+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=G5AkABe6uwlSo6NbsAvKQn7sIteryuCTL7hwZjfqj0c=;
	b=SUd5tcp9YmyBiFJBTSJRXiloeZy2qVv96pORv9khDwbmg/59Pd7SD3wz0WS91HYiCf
	tGrfZ8h+Hd6vGcS7df7yi9b6mhyXY8cNM9DFYI3kfVjg70Uwpsnfw4/jHGlX0CbSmdeZ
	0aedlxZgzkIKmHSYxwND44B+teLop/m5meXXg/buXXO7jAKVF5qu/zsaeJ4leXQL3+9I
	VHdfvm9xVfca9gDMWpvPybTSE0Ka7hkBSUrozkEUK4hPUN1/o8vI+OCmfUWawprx6u56
	dIqptzLIbN3tMFRAkOGOmKfSNXy84kf2/JgUZY4JlRDb8897N1zxs04IGZ7BCO6hKsnt
	I3zA==
X-Gm-Message-State: ALoCoQkQDBsgQPnuJ6miltYzgKBAf+AqVhSqxlZvUvdhEBKPYh3EYJUN+zgRPedb1NcmtapZEoqw9bBuQDBpkgLo0Bgbn6mcpw==
X-Received: by 10.202.86.5 with SMTP id k5mr30137800oib.125.1453344218407;
	Wed, 20 Jan 2016 18:43:38 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id l3sm19310608oeq.0.2016.01.20.18.43.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 18:43:37 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 18:43:01 -0800
Message-Id: <1453344203-7118-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
References: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 03/25] gstreamer1.0: minor formatting improvements
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
X-List-Received-Date: Thu, 21 Jan 2016 02:43:38 -0000

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


