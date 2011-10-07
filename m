Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RCERW-0006wt-5M
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 19:42:42 +0200
Received: by pzd13 with SMTP id 13so10641097pzd.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 10:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=06ZmeXBLmLWliWzGy+IEN3Dfv7sQ9yk8jBIwifkhIaE=;
	b=B/+6jWxABS6yn1tILqFRNNR8zsnErBmCyN2HUNiboTTiBJzfW2wys6lQsi541lYJwr
	U846jmuIj44LAkEkLowt6OemDS50xCrKmMM+/llwux9DJfTIEl5ehcV1f1MQEIqUpRIf
	igSlBgke65Wv9Eojv7ls/9kF2T/f7kwbk9vgc=
Received: by 10.68.59.10 with SMTP id v10mr15770460pbq.16.1318009023272;
	Fri, 07 Oct 2011 10:37:03 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id z3sm6886128pbu.7.2011.10.07.10.37.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 10:37:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2011 10:36:57 -0700
Message-Id: <1318009017-6186-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] farsight2, ldconfig-native, gnutls: There is no GPLv2.1, correct the fields
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
X-List-Received-Date: Fri, 07 Oct 2011 17:42:42 -0000

The licenses were either LGPLv2.1 or GPLv2
make the changes appropriately

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../farsight/farsight2_0.0.9.bb                    |    4 ++--
 meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb |    4 ++--
 meta/recipes-support/gnutls/gnutls.inc             |    4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-demoapps/recipes-connectivity/farsight/farsight2_0.0.9.bb b/meta-demoapps/recipes-connectivity/farsight/farsight2_0.0.9.bb
index a7bdc97..ee0ce8a 100644
--- a/meta-demoapps/recipes-connectivity/farsight/farsight2_0.0.9.bb
+++ b/meta-demoapps/recipes-connectivity/farsight/farsight2_0.0.9.bb
@@ -1,12 +1,12 @@
 DESCRIPTION = "FarSight is an audio/video conferencing framework specifically designed for Instant Messengers."
 HOMEPAGE = "http://farsight.sf.net"
 SRC_URI = "http://farsight.freedesktop.org/releases/farsight2/${BPN}-${PV}.tar.gz"
-LICENSE = "GPLv2.1"
+LICENSE = "LGPLv2.1"
 DEPENDS = "libnice glib-2.0 libxml2 zlib dbus gstreamer gst-plugins-base"
 
 inherit autotools
 
-PR = "r1"
+PR = "r2"
 
 EXTRA_OECONF = " \
   --disable-debug \
diff --git a/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb b/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb
index 00edb6e..2a93913 100644
--- a/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb
+++ b/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "A standalone native ldconfig build"
 
-LICENSE = "GPLv2.1"
+LICENSE = "GPLv2+"
 
 LIC_FILES_CHKSUM = "file://${S}/ldconfig.c;endline=17;md5=1d15f20937c055cb5de2329a4c054399"
 
@@ -12,7 +12,7 @@ SRC_URI = "file://ldconfig-native-2.12.1.tar.bz2 \
            file://flag_fix.patch \
            file://endianess-header.patch"
 
-PR = "r1"
+PR = "r2"
 
 inherit native
 
diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 9257880..d73c799 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -3,11 +3,11 @@ HOMEPAGE = "http://www.gnu.org/software/gnutls/"
 BUGTRACKER = "https://savannah.gnu.org/support/?group=gnutls"
 DEPENDS = "zlib lzo libtasn1 libgcrypt (>= 1.4.2) libcap"
 
-INC_PR = "r2"
+INC_PR = "r3"
 
 LICENSE = "GPLv3+ & LGPLv2.1+"
 LICENSE_${PN} = "LGPLv2.1+"
-LICENSE_${PN}-xx = "GPLv2.1+"
+LICENSE_${PN}-xx = "LGPLv2.1+"
 LICENSE_${PN}-bin = "GPLv3+"
 LICENSE_${PN}-extra = "GPLv3+"
 LICENSE_${PN}-openssl = "GPLv3+"
-- 
1.7.5.4



