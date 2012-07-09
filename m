Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SoGyu-00041S-7t
	for Openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 18:38:40 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2012 09:27:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="175108536"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jul 2012 09:27:30 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2012 09:26:07 -0700
Message-Id: <5db3511dbe8ab20cf8105a148993896df3e5d594.1341850982.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <8d1d42a68d5930bc374b9d6126cc1371a22a37db.1341850982.git.nitin.a.kamble@intel.com>
References: <8d1d42a68d5930bc374b9d6126cc1371a22a37db.1341850982.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1341850982.git.nitin.a.kamble@intel.com>
References: <cover.1341850982.git.nitin.a.kamble@intel.com>
Subject: [PATCH 06/15] dates: fix build with automake 1.12.x
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
X-List-Received-Date: Mon, 09 Jul 2012 16:38:40 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

automake 1.12.x automatically deletes empty directories, so
the additional rmdir from the do_install_append fails.

cleanup the do_install_append for automake 1.12.x

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-sato/pimlico/dates_git.bb |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-sato/pimlico/dates_git.bb b/meta/recipes-sato/pimlico/dates_git.bb
index 73258ae..9ee0105 100644
--- a/meta/recipes-sato/pimlico/dates_git.bb
+++ b/meta/recipes-sato/pimlico/dates_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 
 SRCREV = "514185dc1f6588085fda41eb59898b93d0487dd4"
 PV = "0.4.11+git${SRCPV}"
-PR = "r7"
+PR = "r8"
 
 S = "${WORKDIR}/git"
 
@@ -16,7 +16,3 @@ SRC_URI = "git://git.gnome.org/${BPN};protocol=git \
 	   file://dso_linking_change_build_fix.patch \
 	   file://uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch \
           "
-
-do_install_append () {
-	rmdir ${D}/srv
-}
-- 
1.7.3.4



