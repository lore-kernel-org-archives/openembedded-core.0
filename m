Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BEF486AEA3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Dec 2013 00:29:09 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 Dec 2013 16:29:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,539,1384329600"; d="scan'208";a="454819337"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.16])
	by fmsmga002.fm.intel.com with ESMTP; 23 Dec 2013 16:29:10 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Dec 2013 16:29:08 -0800
Message-Id: <1387844949-23516-4-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1387844949-23516-1-git-send-email-sgw@linux.intel.com>
References: <1387844949-23516-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 3/4] tzdata: Update to 2013i
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
X-List-Received-Date: Tue, 24 Dec 2013 00:29:10 -0000

The solar* time file are no longer distributed (see tzdata's NEWS for details)

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/tzdata/{tzdata_2013h.bb => tzdata_2013i.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2013h.bb => tzdata_2013i.bb} (97%)

diff --git a/meta/recipes-extended/tzdata/tzdata_2013h.bb b/meta/recipes-extended/tzdata/tzdata_2013i.bb
similarity index 97%
rename from meta/recipes-extended/tzdata/tzdata_2013h.bb
rename to meta/recipes-extended/tzdata/tzdata_2013i.bb
index 16d67d3..719aa2e 100644
--- a/meta/recipes-extended/tzdata/tzdata_2013h.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2013i.bb
@@ -15,15 +15,15 @@ RCONFLICTS_${PN} = "timezones timezone-africa timezone-america timezone-antarcti
 
 SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
 
-SRC_URI[tzdata.md5sum] = "d310abe42cbe87e76ceb69e2c7003c92"
-SRC_URI[tzdata.sha256sum] = "6b9e17e823eec0e09e12f74b452a70be4face1ef14c2fb1917b7c7e60564de27"
+SRC_URI[tzdata.md5sum] = "8bc69eb75bea496ebe1d5a9ab576702d"
+SRC_URI[tzdata.sha256sum] = "1cd56a6ee964143ef0c65229968a5093988335b95e9115235b5e7b7e45e67dda"
 
 S = "${WORKDIR}"
 
 DEFAULT_TIMEZONE ?= "Universal"
 
 TZONES= "africa antarctica asia australasia europe northamerica southamerica  \
-         factory solar87 solar88 solar89 etcetera backward systemv \
+         factory etcetera backward systemv \
         "
 # pacificnew 
 
-- 
1.8.3.1


