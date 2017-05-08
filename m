Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1CB6371DEF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 10:46:16 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 May 2017 03:46:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,309,1491289200"; d="scan'208";a="965754361"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 08 May 2017 03:46:17 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id BD1C86A4006
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 03:46:03 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 May 2017 13:46:50 +0300
Message-Id: <1494240411-22597-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1494240411-22597-1-git-send-email-maxin.john@intel.com>
References: <1494240411-22597-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/3] ofono: upgrade to 1.20
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
X-List-Received-Date: Mon, 08 May 2017 10:46:17 -0000

1.19 -> 1.20

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-connectivity/ofono/{ofono_1.19.bb => ofono_1.20.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/ofono/{ofono_1.19.bb => ofono_1.20.bb} (52%)

diff --git a/meta/recipes-connectivity/ofono/ofono_1.19.bb b/meta/recipes-connectivity/ofono/ofono_1.20.bb
similarity index 52%
rename from meta/recipes-connectivity/ofono/ofono_1.19.bb
rename to meta/recipes-connectivity/ofono/ofono_1.20.bb
index adebd71..356a996 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.19.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.20.bb
@@ -4,7 +4,7 @@ SRC_URI  = "\
   ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
   file://ofono \
 "
-SRC_URI[md5sum] = "a5f8803ace110511b6ff5a2b39782e8b"
-SRC_URI[sha256sum] = "a0e09bdd8b53b8d2e4b54f1863ecd9aebe4786477a6cbf8f655496e8edb31c81"
+SRC_URI[md5sum] = "fad0630fce6a9aecdb7db37bc1f1db7d"
+SRC_URI[sha256sum] = "5d7ba8f481a7715d013a79f8d6477eb89d8aaae399395d5d008a1317c34a31d5"
 
 CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
-- 
2.4.0


