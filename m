Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RFykG-0001h9-3V
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Oct 2011 03:45:32 +0200
Received: by mail-gx0-f175.google.com with SMTP id q1so96059ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 18:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=s6HvvAT4R9HNzXnGtb2km6Fj2brRbUEKjs1vJ9/KFvw=;
	b=ENvJvj1EsLOitPbgCSmSn2LH1DkpTwxM7nYeBJ2zwwkp4PvahBr1wZIuTw79LUJha1
	L4BinTaeLfPTfq6G1sderIm4R91xuwgp5Gtq42vdZ4w6GbsrxIOEKIJGujOEoR6LcIWt
	PDkl8Whya3jp6+IZw9T1NVohFwRiSq4o4T2q0=
Received: by 10.68.26.101 with SMTP id k5mr1286319pbg.4.1318901984694;
	Mon, 17 Oct 2011 18:39:44 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id ji3sm1897253pbc.2.2011.10.17.18.39.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Oct 2011 18:39:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Oct 2011 18:39:25 -0700
Message-Id: <bb4834366391a733cbb331a52cae44f295bda2a1.1318901607.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1318901607.git.raj.khem@gmail.com>
References: <cover.1318901607.git.raj.khem@gmail.com>
Subject: [PATCH 1/3] bluez4: Add glib-2.0 to DEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Oct 2011 01:45:32 -0000

Fixes

| attrib/utils.c:25:18: fatal error: glib.h: No such file or directory
| compilation terminated.
| make[1]: *** [attrib/utils.o] Error 1
| make[1]: *** Waiting for unfinished jobs....
| attrib/interactive.c:27:18: fatal error: glib.h: No such file or
directory
| compilation terminated.
| make[1]: *** [attrib/interactive.o] Error 1
| make: *** [all] Error 2

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/bluez/bluez4.inc     |    2 +-
 meta/recipes-connectivity/bluez/bluez4_4.96.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/bluez/bluez4.inc b/meta/recipes-connectivity/bluez/bluez4.inc
index fc515f6..9158687 100644
--- a/meta/recipes-connectivity/bluez/bluez4.inc
+++ b/meta/recipes-connectivity/bluez/bluez4.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
                     file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e \
                     file://sbc/sbc.c;beginline=1;endline=25;md5=1a40781ed30d50d8639323a184aeb191"
-DEPENDS = "udev alsa-lib libusb dbus-glib"
+DEPENDS = "udev alsa-lib libusb dbus-glib glib-2.0"
 RDEPENDS_${PN}-dev = "bluez-hcidump"
 
 ASNEEDED = ""
diff --git a/meta/recipes-connectivity/bluez/bluez4_4.96.bb b/meta/recipes-connectivity/bluez/bluez4_4.96.bb
index 52268cf..88ec7a4 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.96.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.96.bb
@@ -1,6 +1,6 @@
 require bluez4.inc
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI += "file://bluetooth.conf"
 
-- 
1.7.5.4



