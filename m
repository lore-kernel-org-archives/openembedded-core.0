Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 93A1271FEC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 00:19:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 06 Nov 2014 16:17:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,329,1413270000"; d="scan'208";a="632989754"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.21])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2014 16:19:51 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Nov 2014 16:19:28 -0800
Message-Id: <9df9015ca3589968b52f7d9c8fbabdf458fc9b62.1415319473.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1415319473.git.sgw@linux.intel.com>
References: <cover.1415319473.git.sgw@linux.intel.com>
In-Reply-To: <cover.1415319473.git.sgw@linux.intel.com>
References: <cover.1415319473.git.sgw@linux.intel.com>
Subject: [PATCH 03/19] npth: Upgrade to 1.0
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
X-List-Received-Date: Fri, 07 Nov 2014 00:19:55 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/npth/{npth_0.91.bb => npth_1.0.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-support/npth/{npth_0.91.bb => npth_1.0.bb} (78%)

diff --git a/meta/recipes-support/npth/npth_0.91.bb b/meta/recipes-support/npth/npth_1.0.bb
similarity index 78%
rename from meta/recipes-support/npth/npth_0.91.bb
rename to meta/recipes-support/npth/npth_1.0.bb
index 7105b94..3356ba0 100644
--- a/meta/recipes-support/npth/npth_0.91.bb
+++ b/meta/recipes-support/npth/npth_1.0.bb
@@ -8,8 +8,9 @@ LIC_FILES_CHKSUM = "\
     "
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/npth/npth-${PV}.tar.bz2 \
           "
-SRC_URI[md5sum] = "87712f0cee656c390b49773923e26e7f"
-SRC_URI[sha256sum] = "caef86ced4a331e162897818a5b924860c8d6003e52da5bdf76da00e8e0dfae1"
+
+SRC_URI[md5sum] = "36869bf10378ea08c155cd5c3580a1dd"
+SRC_URI[sha256sum] = "9ad49de376310effab7fdad69581054b0fa9023d062032d06e73058146c8f76e"
 
 BINCONFIG = "${bindir}/npth-config"
 
-- 
1.8.3.1


