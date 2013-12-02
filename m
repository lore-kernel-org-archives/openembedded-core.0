Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 482C26DEED
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2013 18:50:59 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 02 Dec 2013 10:50:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,812,1378882800"; d="scan'208";a="445490199"
Received: from pmcgurk-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.121.184])
	by orsmga002.jf.intel.com with ESMTP; 02 Dec 2013 10:50:58 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Dec 2013 18:50:46 +0000
Message-Id: <c5dfa0f54029aaf47e45a3661cc1d56eb19b9115.1386009885.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1386009885.git.paul.eggleton@linux.intel.com>
References: <cover.1386009885.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1386009885.git.paul.eggleton@linux.intel.com>
References: <cover.1386009885.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/8] classes/package: write PE and PKGE out to pkgdata
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
X-List-Received-Date: Mon, 02 Dec 2013 18:51:00 -0000

These are important parts of the version for every package, so we should
include them in PKGDATA just as we include PV/PR/PKGV/PKGR.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/package.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 2eb970d..44a852f 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1184,8 +1184,10 @@ python emit_pkgdata() {
         subdata_file = pkgdatadir + "/runtime/%s" % pkg
         sf = open(subdata_file, 'w')
         write_if_exists(sf, pkg, 'PN')
+        write_if_exists(sf, pkg, 'PE')
         write_if_exists(sf, pkg, 'PV')
         write_if_exists(sf, pkg, 'PR')
+        write_if_exists(sf, pkg, 'PKGE')
         write_if_exists(sf, pkg, 'PKGV')
         write_if_exists(sf, pkg, 'PKGR')
         write_if_exists(sf, pkg, 'LICENSE')
-- 
1.8.1.2


