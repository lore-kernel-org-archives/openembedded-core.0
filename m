Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id F046A6AF56
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Dec 2013 00:29:09 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 Dec 2013 16:29:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,539,1384329600"; d="scan'208";a="454819339"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.16])
	by fmsmga002.fm.intel.com with ESMTP; 23 Dec 2013 16:29:10 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Dec 2013 16:29:09 -0800
Message-Id: <1387844949-23516-5-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1387844949-23516-1-git-send-email-sgw@linux.intel.com>
References: <1387844949-23516-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 4/4] tzcode: Update to 2013i
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

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../tzcode/{tzcode-native_2013h.bb => tzcode-native_2013i.bb}  | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/tzcode/{tzcode-native_2013h.bb => tzcode-native_2013i.bb} (59%)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2013h.bb b/meta/recipes-extended/tzcode/tzcode-native_2013i.bb
similarity index 59%
rename from meta/recipes-extended/tzcode/tzcode-native_2013h.bb
rename to meta/recipes-extended/tzcode/tzcode-native_2013i.bb
index 5cdc7ef..d883fda 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2013h.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2013i.bb
@@ -6,13 +6,13 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/README;md5=0b7570113550eb5d30aa4bd220964b8
 # note that we allow for us to use data later than our code version
 #
 SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
-           ftp://ftp.iana.org/tz/releases/tzdata2013h.tar.gz;name=tzdata"
+           ftp://ftp.iana.org/tz/releases/tzdata2013i.tar.gz;name=tzdata"
 
-SRC_URI[tzdata.md5sum] = "d310abe42cbe87e76ceb69e2c7003c92"
-SRC_URI[tzdata.sha256sum] = "6b9e17e823eec0e09e12f74b452a70be4face1ef14c2fb1917b7c7e60564de27"
+SRC_URI[tzcode.md5sum] = "86154c8b0cfb47f4e2027ecaa2ec547a"
+SRC_URI[tzcode.sha256sum] = "63bba6790afc1cb2ea0af2b998a35fc237e247608140dbe4e08b4216a8c31358"
 
-SRC_URI[tzcode.md5sum] = "14250703b253e1cfdf97f1e928541508"
-SRC_URI[tzcode.sha256sum] = "e14addfc4e0da3cf17ccc1c08cb8094a2a0d3ae9524f565b74e6373c9b83ca0e"
+SRC_URI[tzdata.md5sum] = "8bc69eb75bea496ebe1d5a9ab576702d"
+SRC_URI[tzdata.sha256sum] = "1cd56a6ee964143ef0c65229968a5093988335b95e9115235b5e7b7e45e67dda"
 
 S = "${WORKDIR}"
 
-- 
1.8.3.1


