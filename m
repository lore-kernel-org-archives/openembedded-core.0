Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E6DE1728C3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 15:42:38 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 06 Jan 2015 07:42:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,691,1406617200"; d="scan'208";a="508183851"
Received: from unknown (HELO localhost.intel.com) ([10.252.252.96])
	by orsmga003.jf.intel.com with ESMTP; 06 Jan 2015 07:37:00 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Jan 2015 07:42:21 -0800
Message-Id: <8aec1f74471e9117942d576b29bb4e5859b792eb.1420558836.git.sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1420558836.git.sgw@linux.intel.com>
References: <cover.1420558836.git.sgw@linux.intel.com>
In-Reply-To: <cover.1420558836.git.sgw@linux.intel.com>
References: <cover.1420558836.git.sgw@linux.intel.com>
Subject: [PATCH 11/12] liburcu: Upgrade to 0.8.6
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
X-List-Received-Date: Tue, 06 Jan 2015 15:42:39 -0000

Move patches from files to liburcu directory

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/liburcu/{files => liburcu}/aarch64.patch       | 0
 meta/recipes-support/liburcu/{liburcu_0.8.5.bb => liburcu_0.8.6.bb} | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/liburcu/{files => liburcu}/aarch64.patch (100%)
 rename meta/recipes-support/liburcu/{liburcu_0.8.5.bb => liburcu_0.8.6.bb} (83%)

diff --git a/meta/recipes-support/liburcu/files/aarch64.patch b/meta/recipes-support/liburcu/liburcu/aarch64.patch
similarity index 100%
rename from meta/recipes-support/liburcu/files/aarch64.patch
rename to meta/recipes-support/liburcu/liburcu/aarch64.patch
diff --git a/meta/recipes-support/liburcu/liburcu_0.8.5.bb b/meta/recipes-support/liburcu/liburcu_0.8.6.bb
similarity index 83%
rename from meta/recipes-support/liburcu/liburcu_0.8.5.bb
rename to meta/recipes-support/liburcu/liburcu_0.8.6.bb
index 62323d3..263b77e 100644
--- a/meta/recipes-support/liburcu/liburcu_0.8.5.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.8.6.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2 \
            file://aarch64.patch \
           "
 
-SRC_URI[md5sum] = "24ba9e03542b747d3378434eb0041acf"
-SRC_URI[sha256sum] = "a2562eaca107ec6eca2856632b6035c6aaf38df79020195ed8955a7b4773312a"
+SRC_URI[md5sum] = "834d91d939dd55108a05763be9879856"
+SRC_URI[sha256sum] = "b1a5d3bce014ba7a702759bc60b692c1cd46ff0e8a5b53f0d0a95e22db74ab21"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
 CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
-- 
2.1.0


