Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 33CFB60962
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 23:28:42 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 18 May 2015 16:28:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,455,1427785200"; d="scan'208";a="712140373"
Received: from ihoshino-mobl.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.255.86.199])
	by fmsmga001.fm.intel.com with ESMTP; 18 May 2015 16:28:43 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon, 18 May 2015 16:28:40 -0700
Message-Id: <1431991720-19892-6-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1431991720-19892-1-git-send-email-sgw@linux.intel.com>
References: <1431991720-19892-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 5/5] liburcu: Upgrade to 0.8.7
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
X-List-Received-Date: Mon, 18 May 2015 23:28:42 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/liburcu/{liburcu_0.8.6.bb => liburcu_0.8.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/liburcu/{liburcu_0.8.6.bb => liburcu_0.8.7.bb} (83%)

diff --git a/meta/recipes-support/liburcu/liburcu_0.8.6.bb b/meta/recipes-support/liburcu/liburcu_0.8.7.bb
similarity index 83%
rename from meta/recipes-support/liburcu/liburcu_0.8.6.bb
rename to meta/recipes-support/liburcu/liburcu_0.8.7.bb
index 263b77e..71cb149 100644
--- a/meta/recipes-support/liburcu/liburcu_0.8.6.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.8.7.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2 \
            file://aarch64.patch \
           "
 
-SRC_URI[md5sum] = "834d91d939dd55108a05763be9879856"
-SRC_URI[sha256sum] = "b1a5d3bce014ba7a702759bc60b692c1cd46ff0e8a5b53f0d0a95e22db74ab21"
+SRC_URI[md5sum] = "7a6ee17871d31226db3f618e28351d22"
+SRC_URI[sha256sum] = "b523f22c4726ca6bb77a77d258e76d8c33c89724433bd65313024b98e55c4295"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
 CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
-- 
2.1.0


