Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TDaJa-0003JM-OS
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Sep 2012 14:20:38 +0200
Received: by mail-wi0-f177.google.com with SMTP id hn17so1899814wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2012 05:08:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=8dj/HmRDWgxorNLtXefp7Fo2+vPut2mF8KbrLr1SANk=;
	b=eWr1YadOPLMv60iDBBIVImSNoR64Pa/ixo+yBFM7zvD0eLGetufiDisl252neVURm7
	uS6hKJPiu7fRF7Xr4bvZnKZmNPi8cPpbzowl2ajehFw1TnO6ycREL2oiWSDMQEXTN1tr
	WYqSHA5Pj7+5Qoz4b+uH7hj8/jdmYw5N19WFXjzLb5OaLJbyLP5uZoKHunLQFITHBGfp
	3OrlZRKpZfNGNaLxWW5MkzlyizFCHvo3/owsCrydRMy2MwMignP9z6sQhGZPHBrRtsPy
	DT1AC/AeJ89mmre/p88FA2mH4H5MYylDgxAdlcJPegKYJW1FY4v1KKh8XL+05KbyVJhC
	iUXw==
Received: by 10.217.1.79 with SMTP id m57mr5781659wes.121.1347883682473;
	Mon, 17 Sep 2012 05:08:02 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id k20sm17570403wiv.11.2012.09.17.05.08.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 05:08:01 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Sep 2012 14:07:31 +0200
Message-Id: <1347883657-17529-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1347883657-17529-1-git-send-email-koen@dominion.thruhere.net>
References: <1347883657-17529-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkJ5yy802n37ONysAhb5/K11cW/qET0WLQQrYcqyTgC2z/IJEsGwNpdFc2E5KH4shGu7VlK
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [for-denzil][pulseaudio-updates 04/10] pulseaudio: upgrade to 2.0
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
X-List-Received-Date: Mon, 17 Sep 2012 12:20:38 -0000

From: Cristian Iorga <cristian.iorga@intel.com>

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Conflicts:

	meta/recipes-multimedia/pulseaudio/pulseaudio_2.0.bb
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    2 +-
 .../pulseaudio/pulseaudio_1.1.bb                   |   22 --------------------
 .../pulseaudio/pulseaudio_2.0.bb                   |   21 +++++++++++++++++++
 3 files changed, 22 insertions(+), 23 deletions(-)
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio_2.0.bb

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index a2f0d9f..b952d68 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -6,7 +6,7 @@ LICENSE = "GPLv2+ & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://GPL;md5=4325afd396febcb659c36b49533135d4 \
                     file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://src/modules/bluetooth/proximity-helper.c;beginline=1;endline=25;md5=e4cc710e40a4d900c2c294167bc58270 \
-                    file://src/pulsecore/vector.h;beginline=1;endline=21;md5=1b561f0a2ca47b1fa49862a6ccaacff1"
+                    file://src/pulsecore/resampler.h;beginline=4;endline=23;md5=c3d539b93f8c82a1780bfa3cfa544a95"
 DEPENDS = "libatomics-ops liboil avahi libsamplerate0 libsndfile1 libtool \
            ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxtst libice libsm libxcb gtk+', '', d)}"
 # optional
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
deleted file mode 100644
index 02d4180..0000000
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-require pulseaudio.inc
-
-PR = "r9"
-
-DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
-
-inherit gettext perlnative
-
-SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/pulseaudio-${PV}.tar.xz \
-  file://volatiles.04_pulse \
-  file://pulseaudio_fix_for_x32.patch \
-"
-
-SRC_URI[md5sum] = "17d21df798cee407b769c6355fae397a"
-SRC_URI[sha256sum] = "6fe531136f6ebce2d35872a2d2c914278cdc5dcdd5eea516dc52c81f9001f5ee"
-
-do_compile_prepend() {
-    cd ${S}
-    mkdir -p ${S}/libltdl
-    cp ${STAGING_LIBDIR}/libltdl* ${S}/libltdl
-}
-
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.0.bb
new file mode 100644
index 0000000..7e57e5e
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.0.bb
@@ -0,0 +1,21 @@
+require pulseaudio.inc
+
+PR = "r0"
+
+DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
+
+inherit gettext perlnative
+
+SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/pulseaudio-${PV}.tar.xz \
+  file://volatiles.04_pulse \
+"
+
+SRC_URI[md5sum] = "9bbde657c353fe675c3b693054175a8e"
+SRC_URI[sha256sum] = "28b42edd42f4879a6884af5f0ec11801ac001eb7582881215b36649aa37e2061"
+
+do_compile_prepend() {
+    cd ${S}
+    mkdir -p ${S}/libltdl
+    cp ${STAGING_LIBDIR}/libltdl* ${S}/libltdl
+}
+
-- 
1.7.7.6



