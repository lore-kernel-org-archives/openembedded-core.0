Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SCAa5-00087N-E8
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 16:07:34 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-d3.ottawa.windriver.com [128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2QDwNPL010189;
	Mon, 26 Mar 2012 06:58:26 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 26 Mar 2012 09:57:58 -0400
Message-Id: <4fafabde1f9e7d4ac9108f58219c28b5adc2f80b.1332770094.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1332770094.git.bruce.ashfield@windriver.com>
References: <cover.1332770094.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1332770094.git.bruce.ashfield@windriver.com>
References: <cover.1332770094.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 1/1] linux-yocto: common-pc: Add PCNET32 to the config
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
X-List-Received-Date: Mon, 26 Mar 2012 14:07:34 -0000

Updating the meta SRCREV to pick up this commit:

[
    common-pc: Add PCNET32 to the config

    Qemu and VM Ware both support PCNET32 and the latter requires it for
    32 bit images.

    Signed-off-by: Darren Hart <dvhart@linux.intel.com>
]

Signed-off-by: Darren Hart <dvhart@linux.intel.com>5A
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.2.bb    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
index f31baeb..6184e46 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
@@ -16,7 +16,7 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 SRCREV_machine ?= "32ecb53e9ff759bbd297a10712b62a6575daaf86"
 SRCREV_machine_qemuppc ?= "0d5625bb868cc2471d5dd49eb7abe7eb5fe1044b"
-SRCREV_meta ?= "514847185c78c07f52e02750fbe0a03ca3a31d8f"
+SRCREV_meta ?= "867fc7a19f2ea74253d1f20c3d61b7829635175b"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
index 94423b6..5658d25 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
@@ -23,7 +23,7 @@ SRCREV_machine_qemuppc ?= "92de4e2f3c6b397c8b363e079cc4d5e9bcadf877"
 SRCREV_machine_qemux86 ?= "8ada1bb97415fe959a57a08504be4eb8a656ed30"
 SRCREV_machine_qemux86-64 ?= "4ca7e2c5d42e755e1b4c3e1478128f047a8ed2a8"
 SRCREV_machine ?= "01e948c2bdf7f5ad9f2b30047a8d3493a1a2880a"
-SRCREV_meta ?= "514847185c78c07f52e02750fbe0a03ca3a31d8f"
+SRCREV_meta ?= "867fc7a19f2ea74253d1f20c3d61b7829635175b"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.5.4



