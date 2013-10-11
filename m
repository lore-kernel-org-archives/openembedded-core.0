Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 2CB9D6CF02
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 15:27:31 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Oct 2013 08:27:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1081,1371106800"; d="scan'208";a="373506438"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.234])
	by azsmga001.ch.intel.com with ESMTP; 11 Oct 2013 08:27:32 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2013 08:27:17 -0700
Message-Id: <40aba556e77296444a175763dbd5593a255e8504.1381505051.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <664cd9c705a03b0529f30e091b6e8b721ef13a09.1381505051.git.sgw@linux.intel.com>
References: <664cd9c705a03b0529f30e091b6e8b721ef13a09.1381505051.git.sgw@linux.intel.com>
In-Reply-To: <cover.1381505051.git.sgw@linux.intel.com>
References: <cover.1381505051.git.sgw@linux.intel.com>
Subject: [PATCH 11/18] tzcode: Update to 2013g
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
X-List-Received-Date: Fri, 11 Oct 2013 15:27:31 -0000

The updated README now mentions that some files are derived from BSD,
so update the LICENSE to be PD & BSD.

(From OE-Core rev: 0d7d8b124f1984f3593ba818a4fe22de62b1a717)

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{tzcode-native_2013d.bb => tzcode-native_2013g.bb}     | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-extended/tzcode/{tzcode-native_2013d.bb => tzcode-native_2013g.bb} (48%)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2013d.bb b/meta/recipes-extended/tzcode/tzcode-native_2013g.bb
similarity index 48%
rename from meta/recipes-extended/tzcode/tzcode-native_2013d.bb
rename to meta/recipes-extended/tzcode/tzcode-native_2013g.bb
index af21151..411520e 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2013d.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2013g.bb
@@ -1,18 +1,18 @@
 DESCRIPTION = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
-LICENSE = "PD"
+LICENSE = "PD & BSD"
 
-LIC_FILES_CHKSUM = "file://${WORKDIR}/README;md5=d7a19b8c6d8a28785c4cd04ff2e46d27"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/README;md5=0b7570113550eb5d30aa4bd220964b8f"
 
 # note that we allow for us to use data later than our code version
 #
 SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
-           ftp://ftp.iana.org/tz/releases/tzdata2013d.tar.gz;name=tzdata"
+           ftp://ftp.iana.org/tz/releases/tzdata2013g.tar.gz;name=tzdata"
 
-SRC_URI[tzdata.md5sum] = "65b6818162230fc02f86f293376c73df"
-SRC_URI[tzdata.sha256sum] = "cd1c96f0676e0edceebc6a418a2222ffb05becb41180dd9f847b9c7cef303b04"
+SRC_URI[tzcode.md5sum] = "cc2a52297310ba1a673dc60973ea3ad8"
+SRC_URI[tzcode.sha256sum] = "c7c358b459bb65cfab7b7bdd6a9689233fc393f1f9fdf4f0f46ca7dac5a9587b"
 
-SRC_URI[tzcode.md5sum] = "4616a9560270f180eeb9a08540636890"
-SRC_URI[tzcode.sha256sum] = "2d9eb90c94644cddb74a490d1184ef9f88efcaa7a2b1bf88be0ee9eeeab707b6"
+SRC_URI[tzdata.md5sum] = "76dbc3b5a81913fc0d824376c44a5d15"
+SRC_URI[tzdata.sha256sum] = "b6cdd3998dcc732a6ae5e101e1394f9d4d6dff68bd48a8fb78c44c2b997d3a4f"
 
 S = "${WORKDIR}"
 
-- 
1.8.3.1


