Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 666C071F45
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 18:05:20 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 31 Oct 2014 10:59:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="409245002"
Received: from kcathuko-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.isw.intel.com) ([10.252.122.50])
	by FMSMGA003.fm.intel.com with ESMTP; 31 Oct 2014 10:56:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Oct 2014 18:05:08 +0000
Message-Id: <3f6854a43cb744188e6df9a27e02cdbec0c638c5.1414778669.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1414778669.git.paul.eggleton@linux.intel.com>
References: <cover.1414778669.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1414778669.git.paul.eggleton@linux.intel.com>
References: <cover.1414778669.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] wget: upgrade to 1.16
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
X-List-Received-Date: Fri, 31 Oct 2014 18:05:21 -0000

Among other things, fixes CVE-2014-4877:
http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-4877

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-extended/wget/{wget_1.15.bb => wget_1.16.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/wget/{wget_1.15.bb => wget_1.16.bb} (45%)

diff --git a/meta/recipes-extended/wget/wget_1.15.bb b/meta/recipes-extended/wget/wget_1.16.bb
similarity index 45%
rename from meta/recipes-extended/wget/wget_1.15.bb
rename to meta/recipes-extended/wget/wget_1.16.bb
index c2fcca7..257b534 100644
--- a/meta/recipes-extended/wget/wget_1.15.bb
+++ b/meta/recipes-extended/wget/wget_1.16.bb
@@ -1,7 +1,8 @@
 SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://fix_makefile.patch \
           "
-SRC_URI[md5sum] = "506df41295afc6486662cc47470b4618"
-SRC_URI[sha256sum] = "52126be8cf1bddd7536886e74c053ad7d0ed2aa89b4b630f76785bac21695fcd"
+
+SRC_URI[md5sum] = "293a37977c41b5522f781d3a3a078426"
+SRC_URI[sha256sum] = "b977fc10ac7a72d987d48136251aeb332f2dced1aabd50d6d56bdf72e2b79101"
 
 require wget.inc
-- 
1.9.3


