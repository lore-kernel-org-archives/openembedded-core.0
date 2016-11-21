Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AF72F71A11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 12:22:24 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 21 Nov 2016 04:22:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,675,1473145200"; 
   d="scan'208";a="7375595"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 21 Nov 2016 04:22:25 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id 31CE06A4006
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 04:21:45 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Nov 2016 14:22:49 +0200
Message-Id: <1479730971-23120-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1479730971-23120-1-git-send-email-maxin.john@intel.com>
References: <1479730971-23120-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 3/5] ofono: upgrade to 1.19
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
X-List-Received-Date: Mon, 21 Nov 2016 12:22:24 -0000

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-connectivity/ofono/{ofono_1.18.bb => ofono_1.19.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/ofono/{ofono_1.18.bb => ofono_1.19.bb} (52%)

diff --git a/meta/recipes-connectivity/ofono/ofono_1.18.bb b/meta/recipes-connectivity/ofono/ofono_1.19.bb
similarity index 52%
rename from meta/recipes-connectivity/ofono/ofono_1.18.bb
rename to meta/recipes-connectivity/ofono/ofono_1.19.bb
index b070731..adebd71 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.18.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.19.bb
@@ -4,7 +4,7 @@ SRC_URI  = "\
   ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
   file://ofono \
 "
-SRC_URI[md5sum] = "0a6b37c8ace891cb2a7ca5d121043a0a"
-SRC_URI[sha256sum] = "53cdbf342913f46bce4827241c60e24255a3d43a94945edf77482ae5b312d51f"
+SRC_URI[md5sum] = "a5f8803ace110511b6ff5a2b39782e8b"
+SRC_URI[sha256sum] = "a0e09bdd8b53b8d2e4b54f1863ecd9aebe4786477a6cbf8f655496e8edb31c81"
 
 CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
-- 
2.4.0


