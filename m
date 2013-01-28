Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1Tzvua-0004oa-QO
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 22:06:41 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Jan 2013 12:50:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,554,1355126400"; d="scan'208";a="253767412"
Received: from unknown (HELO localhost) ([10.255.12.52])
	by orsmga001.jf.intel.com with ESMTP; 28 Jan 2013 12:50:58 -0800
From: tom.zanussi@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2013 14:50:56 -0600
Message-Id: <a0ec6e8cff3eac14c1ed44836efae553e6cf05a8.1359405784.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <cover.1359405784.git.tom.zanussi@linux.intel.com>
References: <cover.1359405784.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 1/2] oprofile: add kernel dependency
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jan 2013 21:06:42 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

oprofile-0.9.8 adds 'operf' which depends on the kernel's perf_events
subsystem to be present when building, which adds the kernel
dependency that we specify in a new DEPENDS for oprofile-0.9.8.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 meta/recipes-kernel/oprofile/oprofile_0.9.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/oprofile/oprofile_0.9.8.bb b/meta/recipes-kernel/oprofile/oprofile_0.9.8.bb
index 4491e7d..6075163 100644
--- a/meta/recipes-kernel/oprofile/oprofile_0.9.8.bb
+++ b/meta/recipes-kernel/oprofile/oprofile_0.9.8.bb
@@ -2,6 +2,8 @@ require oprofile.inc
 
 PR = "${INC_PR}.1"
 
+DEPENDS += "virtual/kernel"
+
 SRC_URI += "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
             file://0001-Add-rmb-definition-for-AArch64-architecture.patch \
             file://0001-OProfile-doesn-t-build-for-32-bit-ppc-the-operf_util.patch \
-- 
1.7.11.4



