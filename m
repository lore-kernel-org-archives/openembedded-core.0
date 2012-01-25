Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rq8ey-0006xz-2I
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 20:37:32 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 25 Jan 2012 11:29:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="100524978"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.96])
	by orsmga001.jf.intel.com with ESMTP; 25 Jan 2012 11:29:42 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2012 11:29:39 -0800
Message-Id: <d5beebc025cb2db00ec1d10fa3c1837d2712e510.1327519635.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1327519635.git.sgw@linux.intel.com>
References: <cover.1327519635.git.sgw@linux.intel.com>
In-Reply-To: <cover.1327519635.git.sgw@linux.intel.com>
References: <cover.1327519635.git.sgw@linux.intel.com>
Subject: [PATCH 4/4] libgcc: Add INSANE_SKIP of staticdev for libgcc-dev and libgcov-dev
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
X-List-Received-Date: Wed, 25 Jan 2012 19:37:32 -0000

Skip the staticdev QA test since the static archives belong
with the -dev.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/gcc/libgcc_4.6.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/gcc/libgcc_4.6.bb b/meta/recipes-devtools/gcc/libgcc_4.6.bb
index 0c50988..01a3b57 100644
--- a/meta/recipes-devtools/gcc/libgcc_4.6.bb
+++ b/meta/recipes-devtools/gcc/libgcc_4.6.bb
@@ -48,3 +48,6 @@ do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_package"
 
 BBCLASSEXTEND = "nativesdk"
 
+INSANE_SKIP_libgcc-dev = "staticdev"
+INSANE_SKIP_libgcov-dev = "staticdev"
+
-- 
1.7.6.5



