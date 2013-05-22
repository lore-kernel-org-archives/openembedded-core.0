Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B908B608CA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 00:40:38 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 21 May 2013 17:40:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,717,1363158000"; d="scan'208";a="341405595"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.171])
	by fmsmga002.fm.intel.com with ESMTP; 21 May 2013 17:40:28 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2013 17:40:23 -0700
Message-Id: <67c8939d905f9ddd106a65884181fa61545a30e7.1369183108.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1369183108.git.sgw@linux.intel.com>
References: <cover.1369183108.git.sgw@linux.intel.com>
In-Reply-To: <cover.1369183108.git.sgw@linux.intel.com>
References: <cover.1369183108.git.sgw@linux.intel.com>
Subject: [PATCH 5/7] mc: Update to 4.8.8
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
X-List-Received-Date: Wed, 22 May 2013 00:40:38 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/mc/{mc_4.8.7.bb => mc_4.8.8.bb} | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/mc/{mc_4.8.7.bb => mc_4.8.8.bb} (81%)

diff --git a/meta/recipes-extended/mc/mc_4.8.7.bb b/meta/recipes-extended/mc/mc_4.8.8.bb
similarity index 81%
rename from meta/recipes-extended/mc/mc_4.8.7.bb
rename to meta/recipes-extended/mc/mc_4.8.8.bb
index 0e8f3c1..20ae797 100644
--- a/meta/recipes-extended/mc/mc_4.8.7.bb
+++ b/meta/recipes-extended/mc/mc_4.8.8.bb
@@ -6,12 +6,10 @@ SECTION = "console/utils"
 DEPENDS = "ncurses glib-2.0"
 RDEPENDS_${PN} = "ncurses-terminfo"
 
-PR = "r0"
-
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "b113e50682293a953141134969dba785"
-SRC_URI[sha256sum] = "4e9c45925b47650dac58d7556a89c3e9b4275e48976b6c13b63c2f8eed3a383b"
+SRC_URI[md5sum] = "324ff5a192d30d3a3b234c130550eb0a"
+SRC_URI[sha256sum] = "7b5e6f90e6709d1c1bcb4a2bf6d2a62b9494adef3ff4325ffdb3551c29e42a1c"
 
 inherit autotools gettext
 
-- 
1.8.1.4


