Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AFD676BBDC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 02:13:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2K2DqAK009584
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 19:13:53 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 19 Mar 2014 19:13:49 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Mar 2014 10:19:06 +0800
Message-ID: <9753034a8ce8a49dff6c3c02b50786b4af643631.1395281861.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1395281861.git.liezhi.yang@windriver.com>
References: <cover.1395281861.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] mklibs-native: upgrade from 0.1.38 to 0.1.39
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
X-List-Received-Date: Thu, 20 Mar 2014 02:13:53 -0000
Content-Type: text/plain

* Fix the HOMEPAGE
* Fix the SRC_URI, .tar.gz has gone, only .tar.xz now.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../mklibs/{mklibs-native_0.1.38.bb => mklibs-native_0.1.39.bb}   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/mklibs/{mklibs-native_0.1.38.bb => mklibs-native_0.1.39.bb} (73%)

diff --git a/meta/recipes-devtools/mklibs/mklibs-native_0.1.38.bb b/meta/recipes-devtools/mklibs/mklibs-native_0.1.39.bb
similarity index 73%
rename from meta/recipes-devtools/mklibs/mklibs-native_0.1.38.bb
rename to meta/recipes-devtools/mklibs/mklibs-native_0.1.39.bb
index fd04c97..ff8d500 100644
--- a/meta/recipes-devtools/mklibs/mklibs-native_0.1.38.bb
+++ b/meta/recipes-devtools/mklibs/mklibs-native_0.1.39.bb
@@ -1,18 +1,18 @@
 SUMMARY = "Shared library optimisation tool"
 DESCRIPTION = "mklibs produces cut-down shared libraries that contain only the routines required by a particular set of executables."
-HOMEPAGE = "https://code.launchpad.net/mklibs"
+HOMEPAGE = "https://launchpad.net/mklibs"
 SECTION = "devel"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=98d31037b13d896e33890738ef01af64"
 DEPENDS = "python-native dpkg-native"
 
-SRC_URI = "http://ftp.de.debian.org/debian/pool/main/m/mklibs/${BPN}_${PV}.tar.gz \
+SRC_URI = "http://ftp.de.debian.org/debian/pool/main/m/mklibs/${BPN}_${PV}.tar.xz \
 	file://ac_init_fix.patch\
 	file://fix_STT_GNU_IFUNC.patch\
 "
 
-SRC_URI[md5sum] = "e597b01548204874feef396403615d9f"
-SRC_URI[sha256sum] = "e7fe79db2673bb26c98c63fd8b40dcb44b9b94c4bc52a8c4c8112a5cbaf29bf4"
+SRC_URI[md5sum] = "38a579a531401eb76f4bab4ccfb774a2"
+SRC_URI[sha256sum] = "fa2881ab4fe72b0504878357f1fc6b17920459b56e8a60dfb083ca28fb64e733"
 
 inherit autotools gettext native pythonnative
 
-- 
1.8.3.1


