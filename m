Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9BD9271FF3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 00:19:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 06 Nov 2014 16:17:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,329,1413270000"; d="scan'208";a="632989760"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.21])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2014 16:19:51 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Nov 2014 16:19:29 -0800
Message-Id: <c90bd4b56d28e95fdbf5a23594304f96dc5fbfc4.1415319473.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1415319473.git.sgw@linux.intel.com>
References: <cover.1415319473.git.sgw@linux.intel.com>
In-Reply-To: <cover.1415319473.git.sgw@linux.intel.com>
References: <cover.1415319473.git.sgw@linux.intel.com>
Subject: [PATCH 04/19] liburcu: Ugrade to 0.8.5
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
 meta/recipes-support/liburcu/{liburcu_0.8.4.bb => liburcu_0.8.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/liburcu/{liburcu_0.8.4.bb => liburcu_0.8.5.bb} (83%)

diff --git a/meta/recipes-support/liburcu/liburcu_0.8.4.bb b/meta/recipes-support/liburcu/liburcu_0.8.5.bb
similarity index 83%
rename from meta/recipes-support/liburcu/liburcu_0.8.4.bb
rename to meta/recipes-support/liburcu/liburcu_0.8.5.bb
index 963029e..04c990e 100644
--- a/meta/recipes-support/liburcu/liburcu_0.8.4.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.8.5.bb
@@ -11,8 +11,8 @@ SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2 \
            file://Revert-Blacklist-ARM-gcc-4.8.0-4.8.1-4.8.2.patch \
           "
 
-SRC_URI[md5sum] = "2ca6671b20a550aa0e8020a1a9a96fd4"
-SRC_URI[sha256sum] = "96c0a157e94a15b1506efe9aedd98145e6eb41a3fbcf5b0d118b7a783b22fe12"
+SRC_URI[md5sum] = "24ba9e03542b747d3378434eb0041acf"
+SRC_URI[sha256sum] = "a2562eaca107ec6eca2856632b6035c6aaf38df79020195ed8955a7b4773312a"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
 CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
-- 
1.8.3.1


