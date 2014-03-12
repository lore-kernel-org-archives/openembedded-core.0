Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2A4736B181
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 07:47:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2C7lGJv018467
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 00:47:16 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Wed, 12 Mar 2014 00:47:12 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Mar 2014 15:47:00 +0800
Message-ID: <b84fe2bf41cf2fbc2ef07acd682368136aad9788.1394610315.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1394610315.git.kai.kang@windriver.com>
References: <cover.1394610315.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 4/5] alsa-tools: update to version 1.0.27
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
X-List-Received-Date: Wed, 12 Mar 2014 07:47:15 -0000
Content-Type: text/plain

Update alsa-tools to latest version 1.0.27:

* remove PR
* update autotools.patch
* add build dependency gkt+3 that hdajackretask requires it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-multimedia/alsa/alsa-tools/autotools.patch   | 15 ++++++---------
 .../alsa/{alsa-tools_1.0.26.1.bb => alsa-tools_1.0.27.bb} |  8 +++-----
 2 files changed, 9 insertions(+), 14 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-tools_1.0.26.1.bb => alsa-tools_1.0.27.bb} (87%)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch b/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch
index 294e970..5aec84c 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch
+++ b/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch
@@ -19,17 +19,14 @@ diff -ruN alsa-tools-1.0.24.1-orig//ld10k1/gitcompile alsa-tools-1.0.24.1/ld10k1
 diff -ruN alsa-tools-1.0.24.1-orig//Makefile alsa-tools-1.0.24.1/Makefile
 --- alsa-tools-1.0.24.1-orig//Makefile	2011-07-06 11:27:40.207665000 +0800
 +++ alsa-tools-1.0.24.1/Makefile	2011-07-14 15:08:08.877665009 +0800
-@@ -1,9 +1,9 @@
- VERSION = 1.0.26.1
+@@ -1,8 +1,8 @@
+ VERSION = 1.0.27
  TOP = .
--SUBDIRS = ac3dec as10k1 envy24control hdsploader hdspconf hdspmixer \
--	  mixartloader pcxhrloader rmedigicontrol sb16_csp seq sscape_ctl \
+-SUBDIRS = as10k1 envy24control hdsploader hdspconf hdspmixer \
++SUBDIRS = as10k1 envy24control \
+ 	  mixartloader pcxhrloader rmedigicontrol sb16_csp seq sscape_ctl \
 -	  us428control usx2yloader vxloader echomixer ld10k1 qlo10k1 \
--	  hwmixvolume hdajackretask hda-verb
-+SUBDIRS = ac3dec as10k1 envy24control \
-+	  mixartloader pcxhrloader rmedigicontrol sb16_csp seq sscape_ctl \
 +	  us428control usx2yloader vxloader echomixer \
-+	  hwmixvolume hda-verb
+ 	  hwmixvolume hdajackretask hda-verb
  
  all:
- 	@for i in $(SUBDIRS); do \
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb
similarity index 87%
rename from meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
rename to meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb
index b154233..b3c02b3 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb
@@ -3,9 +3,7 @@ HOMEPAGE = "http://www.alsa-project.org"
 BUGTRACKER = "https://bugtrack.alsa-project.org/alsa-bug/login_page.php"
 SECTION = "console/utils"
 LICENSE = "GPLv2 & LGPLv2+"
-DEPENDS = "alsa-lib ncurses"
-
-PR = "r1"
+DEPENDS = "alsa-lib ncurses gtk+3"
 
 LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://ld10k1/COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
@@ -15,8 +13,8 @@ SRC_URI = "ftp://ftp.alsa-project.org/pub/tools/alsa-tools-${PV}.tar.bz2 \
            file://autotools.patch \
            ${@base_contains('DISTRO_FEATURES', 'x11', '', 'file://makefile_no_gtk.patch', d)}"
 
-SRC_URI[md5sum] = "805526ea5d6c40e1f2c94cee86141230"
-SRC_URI[sha256sum] = "553338693707fe6ddfc430b9edc4cd2677390e200c9e38de82ede3394e733841"
+SRC_URI[md5sum] = "1ea381d00a6069a98613aa7effa4cb51"
+SRC_URI[sha256sum] = "6562611b5a6560712f109e09740a9d4fa47296b07ed9590cb44139c5f154ada2"
 
 inherit autotools-brokensep
 
-- 
1.8.1.2


