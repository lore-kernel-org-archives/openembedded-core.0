Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 101FF60842
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 23:54:00 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 23 Jul 2013 16:53:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,731,1367996400"; d="scan'208";a="335789704"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.5])
	by azsmga001.ch.intel.com with ESMTP; 23 Jul 2013 16:53:59 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jul 2013 16:53:55 -0700
Message-Id: <d2054859a16da94477f560a7aaa295de9d9cd8aa.1374622196.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1374622196.git.sgw@linux.intel.com>
References: <cover.1374622196.git.sgw@linux.intel.com>
In-Reply-To: <cover.1374622196.git.sgw@linux.intel.com>
References: <cover.1374622196.git.sgw@linux.intel.com>
Subject: [PATCH 1/3] consolekit: Update to 0.4.6
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
X-List-Received-Date: Tue, 23 Jul 2013 23:54:00 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../consolekit/{consolekit_0.4.5.bb => consolekit_0.4.6.bb}       | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-support/consolekit/{consolekit_0.4.5.bb => consolekit_0.4.6.bb} (90%)

diff --git a/meta/recipes-support/consolekit/consolekit_0.4.5.bb b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
similarity index 90%
rename from meta/recipes-support/consolekit/consolekit_0.4.5.bb
rename to meta/recipes-support/consolekit/consolekit_0.4.6.bb
index 7d66b39..63da028 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.5.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
@@ -2,8 +2,6 @@ DESCRIPTION = "ConsoleKit is a framework for defining and tracking users, login
 HOMEPAGE="http://www.freedesktop.org/wiki/Software/ConsoleKit"
 BUGTRACKER="https://bugs.freedesktop.org/buglist.cgi?query_format=specific&product=ConsoleKit"
 
-PR = "r10"
-
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://src/main.c;endline=21;md5=0a994e09769780220163255d8f9071c3"
@@ -13,11 +11,11 @@ RDEPENDS_${PN} += "base-files"
 
 inherit autotools pkgconfig
 
-SRC_URI = "http://www.freedesktop.org/software/ConsoleKit/dist/ConsoleKit-${PV}.tar.bz2 \
+SRC_URI = "http://www.freedesktop.org/software/ConsoleKit/dist/ConsoleKit-${PV}.tar.xz \
            file://sepbuildfix.patch"
-SRC_URI[md5sum] = "f2657f93761206922d558471a936fbc3"
-SRC_URI[sha256sum] = "43e0780c53078e125efcec3f847e484dc3533e49b408ce6a0ab1b223686b9c38"
 
+SRC_URI[md5sum] = "611792b4d616253a5bdec9175f8b7678"
+SRC_URI[sha256sum] = "b41d17e06f80059589fbeefe96ad07bcc564c49e65516da1caf975146475565c"
 
 S = "${WORKDIR}/ConsoleKit-${PV}"
 
-- 
1.8.1.4


