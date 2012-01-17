Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rn4b6-0006h2-0X
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 09:40:52 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jan 2012 00:33:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96633060"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 00:33:08 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 00:32:31 -0800
Message-Id: <b03a52bb97711441ce5388bd1352dbfa240fb433.1326786990.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 46/62] prelink: Update to latest version
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
X-List-Received-Date: Tue, 17 Jan 2012 08:44:37 -0000

From: Mark Hatle <mark.hatle@windriver.com>

The latest version of prelink corrects a problem when attempting
to prelink MIPS architectures.

    2012-01-04 Mark Hatle <mark.hatle@windriver.com>
      * exec.c: Check that a section is larger then 0 bytes when
        determining the section to segment mapping. This matches
        the behavior of elfutils - readelf. Otherwise an empty
        PROGBITS section at the end of a segment will cause a
        failure.

[YOCTO #1463]

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    6 +++---
 meta/recipes-devtools/prelink/prelink_git.bb       |    4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 4d66393..a4aacfb 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -3105,9 +3105,9 @@ RECIPE_MANUAL_CHECK_DATE_pn-perl = "Nov 16, 2011"
 RECIPE_MAINTAINER_pn-perl = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-prelink="green" 
-RECIPE_LATEST_VERSION_pn-prelink="1.0+git0+0xbb1b660c5e3859b6c5a2ac8d739713e9989a4dd7"
-RECIPE_LAST_UPDATE_pn-prelink = "Dec 15, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-prelink = "Dec 15, 2011"
+RECIPE_LATEST_VERSION_pn-prelink="1.0+git0+0x7b47f2f8a15ed13b7905bc120bb2586f3e164f7d"
+RECIPE_LAST_UPDATE_pn-prelink = "Jan 13, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-prelink = "Jan 13, 2012"
 RECIPE_MAINTAINER_pn-prelink = "Mark Hatle <mark.hatle@windriver.com>"
 
 RECIPE_STATUS_pn-python-dbus="green" 
diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
index 17141e9..c94bdf5 100644
--- a/meta/recipes-devtools/prelink/prelink_git.bb
+++ b/meta/recipes-devtools/prelink/prelink_git.bb
@@ -8,9 +8,9 @@ and executables, so that far fewer relocations need to be resolved at \
 runtime and thus programs come up faster."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
-SRCREV = "bb1b660c5e3859b6c5a2ac8d739713e9989a4dd7"
+SRCREV = "7b47f2f8a15ed13b7905bc120bb2586f3e164f7d"
 PV = "1.0+git${SRCPV}"
-PR = "r8"
+PR = "r9"
 
 #
 # The cron script attempts to re-prelink the system daily -- on
-- 
1.7.6.5



