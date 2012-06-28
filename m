Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SkJeE-0003sm-AG
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 20:40:58 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Jun 2012 11:30:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="164125092"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.222])
	by orsmga002.jf.intel.com with ESMTP; 28 Jun 2012 11:30:00 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jun 2012 19:29:48 +0100
Message-Id: <dfdd61d5d2f3c413b6b19db1b9d9371e46b32aa5.1340908084.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1340908084.git.paul.eggleton@linux.intel.com>
References: <cover.1340908084.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1340908084.git.paul.eggleton@linux.intel.com>
References: <cover.1340908084.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] apr: add util-linux to DEPENDS for libuuid
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Jun 2012 18:40:59 -0000

apr will use libuuid if it is present, and thus we should require that
it is there so that we have a deterministic build.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-support/apr/apr_1.4.6.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/apr/apr_1.4.6.bb b/meta/recipes-support/apr/apr_1.4.6.bb
index 6cd37f1..54c47fe 100644
--- a/meta/recipes-support/apr/apr_1.4.6.bb
+++ b/meta/recipes-support/apr/apr_1.4.6.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "Apache Portable Runtime (APR) library"
 HOMEPAGE = "http://apr.apache.org/"
 SECTION = "libs"
+DEPENDS = "util-linux"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0c35ff3c4c83b89d2f076e315caac28b \
-- 
1.7.9.5



