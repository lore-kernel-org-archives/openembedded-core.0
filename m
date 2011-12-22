Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rddc6-0005NF-IA
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 09:02:55 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2011 23:55:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="89233769"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.90])
	by orsmga001.jf.intel.com with ESMTP; 21 Dec 2011 23:55:40 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2011 23:55:24 -0800
Message-Id: <fbc18c31c97636c2dc11dd41390c5c6beaeaaea0.1324540323.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 18/26] prelink: update to latest git version
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
X-List-Received-Date: Thu, 22 Dec 2011 08:02:56 -0000

From: Scott Garman <scott.a.garman@intel.com>

New version includes:

2011-12-08 Mark Hatle <mark.hatle@windriver.com>
    * rtld/rtld.c: Fix an issue where missing objects would trigger
      an assert in dl-version.c
    * rtld/rtld.h: Add _dl_new_object prototype
    * rtld/rtld.c: Add support for $ORIGIN, $PLATFORM and $LIB.
      Note: $PLATFORM = ""

These fixes are needed to prevent prelink-rtld from crashing when
running the new unsafe-references-in-binaries QA test.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    8 ++++----
 meta/recipes-devtools/prelink/prelink_git.bb       |    2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 3c4eca4..0346ea3 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -3068,10 +3068,10 @@ RECIPE_LAST_UPDATE_pn-perl = "Oct 22, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-perl = "Nov 16, 2011"
 RECIPE_MAINTAINER_pn-perl = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
-RECIPE_STATUS_pn-prelink="red" 
-RECIPE_LATEST_VERSION_pn-prelink="1.0+git0+0x909470ee441237563d6236c505cb2d02ddc48704"
-RECIPE_LAST_UPDATE_pn-prelink = "Jul 23, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-prelink = "Dec 01, 2011"
+RECIPE_STATUS_pn-prelink="green" 
+RECIPE_LATEST_VERSION_pn-prelink="1.0+git0+0xbb1b660c5e3859b6c5a2ac8d739713e9989a4dd7"
+RECIPE_LAST_UPDATE_pn-prelink = "Dec 15, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-prelink = "Dec 15, 2011"
 RECIPE_MAINTAINER_pn-prelink = "Mark Hatle <mark.hatle@windriver.com>"
 
 RECIPE_STATUS_pn-python-dbus="green" 
diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
index af6de8e..31c22ef 100644
--- a/meta/recipes-devtools/prelink/prelink_git.bb
+++ b/meta/recipes-devtools/prelink/prelink_git.bb
@@ -8,7 +8,7 @@ and executables, so that far fewer relocations need to be resolved at \
 runtime and thus programs come up faster."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
-SRCREV = "3e3f9b0876aa5ac83a783a95b8bab52cb38ed785"
+SRCREV = "bb1b660c5e3859b6c5a2ac8d739713e9989a4dd7"
 PV = "1.0+git${SRCPV}"
 PR = "r7"
 
-- 
1.7.6.4



