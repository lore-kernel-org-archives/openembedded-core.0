Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UKVPj-0002Vt-4D
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 16:04:22 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2QEklIm015604
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Mar 2013 07:46:47 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 26 Mar 2013 07:46:47 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 26 Mar 2013 07:46:33 -0700
Message-ID: <5ee388111743b282006b95459625c36e42c8c0ff.1364308617.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1364308617.git.bruce.ashfield@windriver.com>
References: <cover.1364308617.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] linux/yocto-3.4: update to v3.8.4
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
X-List-Received-Date: Tue, 26 Mar 2013 15:04:46 -0000
X-List-Received-Date: Tue, 26 Mar 2013 15:04:46 -0000
X-List-Received-Date: Tue, 26 Mar 2013 15:04:46 -0000
X-List-Received-Date: Tue, 26 Mar 2013 15:04:46 -0000
Content-Type: text/plain

Updating the base v3.8 kernel to the 3.8.4 -stable version.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.8.bb |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.8.bb b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
index f29675a..2b46c3d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
@@ -3,17 +3,17 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "0bed12bdbdd7a2aa39d8390b7a802dd72244b963"
-SRCREV_machine_qemumips  ?= "4328dc8c1b73bdfe90656f217d99dc4ffa47da1f"
-SRCREV_machine_qemuppc ?= "c12eb257c5fd9441b434c1216c3d987c89ecdd68"
-SRCREV_machine_qemux86 ?= "3fa6521f19ce15c8e950042f843f33986ef2546d"
-SRCREV_machine_qemux86-64 ?= "3fa6521f19ce15c8e950042f843f33986ef2546d"
-SRCREV_machine ?= "3fa6521f19ce15c8e950042f843f33986ef2546d"
-SRCREV_meta ?= "cc572ff970662c844c0a8dd2dab93cc10b8b2a3f"
+SRCREV_machine_qemuarm ?= "358940bfd596167b6ed03caa4113944c7845a855"
+SRCREV_machine_qemumips  ?= "7d995e09dfb21185442d37f62db0a5655b1adba3"
+SRCREV_machine_qemuppc ?= "1c65b040e7952d177ac4c83df5551efd90fc29f2"
+SRCREV_machine_qemux86 ?= "c753c612377f08f5172b528b9b07715f2b3b5735"
+SRCREV_machine_qemux86-64 ?= "c753c612377f08f5172b528b9b07715f2b3b5735"
+SRCREV_machine ?= "c753c612377f08f5172b528b9b07715f2b3b5735"
+SRCREV_meta ?= "2a6d36e75ca0a121570a389d7bab76ec240cbfda"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.8.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.8.1"
+LINUX_VERSION ?= "3.8.4"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.10.4



