Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B32C1731B5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 08:14:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4A8E9w8002630
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 01:14:09 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 10 May 2016 01:14:09 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 May 2016 01:14:00 -0700
Message-ID: <02ff617262d0b3040b6861214594f89438f79acd.1462867278.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1462867278.git.liezhi.yang@windriver.com>
References: <cover.1462867278.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [RFC PATCH 2/8] qemu.inc: set QEMU_BOOT_SUPPORTED to 1
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
X-List-Received-Date: Tue, 10 May 2016 08:14:09 -0000
Content-Type: text/plain

All the qemu boards should be able to boot by runqemu.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/machine/include/qemu.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index f44dbe6..04276ab 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -29,3 +29,5 @@ EXTRA_IMAGEDEPENDS += "qemu-native qemu-helper-native"
 KERNEL_FEATURES_append_pn-linux-yocto = " features/nfsd/nfsd-enable.scc"
 
 MACHINE_EXTRA_RRECOMMENDS += "rng-tools"
+
+QEMU_BOOT_SUPPORTED = "1"
-- 
2.7.4


