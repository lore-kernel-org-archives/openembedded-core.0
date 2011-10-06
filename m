Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RBqgi-0008VG-2I
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 18:20:48 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 06 Oct 2011 09:15:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,496,1312182000"; d="scan'208";a="59495951"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.197])
	by azsmga001.ch.intel.com with ESMTP; 06 Oct 2011 09:15:08 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Oct 2011 09:14:58 -0700
Message-Id: <760fe7f7c068fb96df21aa5579625e7c930c0d55.1317917297.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1317917297.git.sgw@linux.intel.com>
References: <cover.1317917297.git.sgw@linux.intel.com>
In-Reply-To: <cover.1317917297.git.sgw@linux.intel.com>
References: <cover.1317917297.git.sgw@linux.intel.com>
Subject: [PATCH 19/21] lsof: Update to 4.84
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
X-List-Received-Date: Thu, 06 Oct 2011 16:20:48 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../lsof/{lsof_4.84.bb => lsof_4.85.bb}            |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/lsof/{lsof_4.84.bb => lsof_4.85.bb} (89%)

diff --git a/meta/recipes-extended/lsof/lsof_4.84.bb b/meta/recipes-extended/lsof/lsof_4.85.bb
similarity index 89%
rename from meta/recipes-extended/lsof/lsof_4.84.bb
rename to meta/recipes-extended/lsof/lsof_4.85.bb
index 9e76096..96bc0c5 100644
--- a/meta/recipes-extended/lsof/lsof_4.84.bb
+++ b/meta/recipes-extended/lsof/lsof_4.85.bb
@@ -7,8 +7,9 @@ PR = "r0"
 
 SRC_URI = "ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "a09326df500ef7e4550af546868338d6"
-SRC_URI[sha256sum] = "20893a2d9b443fba519602f05692d5f72054a9f6dc1236bcb2616cc5330dc725"
+SRC_URI[md5sum] = "102ee2081172bbe76dccaa6cceda8573"
+SRC_URI[sha256sum] = "49aa58e63539c45bada514a6a2e5a1c9f946ada1f4137dc9154cf4bf6054a1c1"
+
 LOCALSRC = "file://${WORKDIR}/lsof_${PV}/lsof_${PV}_src.tar"
 S = "${WORKDIR}/lsof_${PV}_src"
 
-- 
1.7.6.2



