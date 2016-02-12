Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0060B6FF93
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 18:55:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 12 Feb 2016 10:55:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,436,1449561600"; d="scan'208";a="910925101"
Received: from vagarw3-mobl1.amr.corp.intel.com (HELO swold-mobl.jf.intel.com)
	([10.252.133.144])
	by orsmga002.jf.intel.com with ESMTP; 12 Feb 2016 10:55:38 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Fri, 12 Feb 2016 10:55:37 -0800
Message-Id: <1455303337-2957-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1455303337-2957-1-git-send-email-sgw@linux.intel.com>
References: <1455303337-2957-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/2] qemu.inc: Add rng-tools to qemu images
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
X-List-Received-Date: Fri, 12 Feb 2016 18:55:54 -0000

This patch adds rng-tools to MACHINE_EXTRA_RRECOMMENDS so that can be
used to provide the additional entropy to prevent hangs in getrandom()
for qemu images

[YOCTO #8681]
[YOCTO #8816]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/machine/include/qemu.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 16e9469..f44dbe6 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -27,3 +27,5 @@ EXTRA_IMAGEDEPENDS += "qemu-native qemu-helper-native"
 
 # Provide the nfs server kernel module for all qemu images
 KERNEL_FEATURES_append_pn-linux-yocto = " features/nfsd/nfsd-enable.scc"
+
+MACHINE_EXTRA_RRECOMMENDS += "rng-tools"
-- 
2.5.0


