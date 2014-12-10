Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 64C5472369
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 10:39:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBAAd4PU024306
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 10 Dec 2014 02:39:04 -0800 (PST)
Received: from yow-bashfiel-d4.corp.ad.wrs.com (128.224.20.249) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 10 Dec 2014 02:39:03 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 10 Dec 2014 05:38:48 -0500
Message-ID: <73c3c83e75abec59bc612998e64358c543be9bac.1418207729.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1418207729.git.bruce.ashfield@windriver.com>
References: <cover.1418207729.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 9/9] linux-yocto/3.14: update to 3.14.26, integrate ltsi and -rt updates
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
X-List-Received-Date: Wed, 10 Dec 2014 10:39:06 -0000
Content-Type: text/plain

Updating the 3.14 tree to the latest korg 3.14.26, as well as
integrating 3.14 LTSI content, and refreshing preempt-rt. Minor
conflict resolutions were performed between ltsi, stable and -rt

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 16 ++++++++--------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index fc86725806e5..0d4a8f04bc36 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -3,9 +3,9 @@ KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "baad552ea168dc31db31f0be188edefaa28a4aec"
-SRCREV_machine_qemuppc ?= "db4221ed2e1c6c617ad07d3374f630bbb59cf8b5"
-SRCREV_meta ?= "fba2d0cdb745e0f807ce134fd9d1524b7bed9742"
+SRCREV_machine ?= "7f0712d10247ffca8e48e944f49707bcf9117ead"
+SRCREV_machine_qemuppc ?= "8bed2a975d491c963cff56496f7e35f5bcff926f"
+SRCREV_meta ?= "319f2d2b1c1a4966e632d54120022d9760b885ff"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index d168a2acbbb1..58603bed76aa 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -8,8 +8,8 @@ LINUX_VERSION ?= "3.14.24"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "c100e8665052051487a17169748c457829d3f88c"
-SRCREV_meta ?= "fba2d0cdb745e0f807ce134fd9d1524b7bed9742"
+SRCREV_machine ?= "02120556b0ebc20c30374ccf211e8e4ceac2bb1c"
+SRCREV_meta ?= "319f2d2b1c1a4966e632d54120022d9760b885ff"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index c30227e16021..24012b7b150e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -10,14 +10,14 @@ KBRANCH_qemux86  ?= "standard/common-pc/base"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "b768ebfe28a20b65aba734b9f6646a3fa0adc89b"
-SRCREV_machine_qemumips ?= "c76146e6c8a015c1225141fc55d867a3e47453c6"
-SRCREV_machine_qemuppc ?= "e54ab8451c482b695ff7a0c580ef2fb1be605299"
-SRCREV_machine_qemux86 ?= "146fcb1dd7b3c5547d67f04d50b082f0723741e9"
-SRCREV_machine_qemux86-64 ?= "c100e8665052051487a17169748c457829d3f88c"
-SRCREV_machine_qemumips64 ?= "71621ee758600abd3cf7187d7a8e7d51f4052c53"
-SRCREV_machine ?= "c100e8665052051487a17169748c457829d3f88c"
-SRCREV_meta ?= "fba2d0cdb745e0f807ce134fd9d1524b7bed9742"
+SRCREV_machine_qemuarm ?= "6166316d47b859aa38bfecc61f4808828af03937"
+SRCREV_machine_qemumips ?= "4ececcc09c6550a0896728163907e729d817c2fd"
+SRCREV_machine_qemuppc ?= "1cc5b09f8bb7f40b289d149d370c62dcc8109501"
+SRCREV_machine_qemux86 ?= "38cd560d5022ed2dbd1ab0dca9642e47c98a0aa1"
+SRCREV_machine_qemux86-64 ?= "02120556b0ebc20c30374ccf211e8e4ceac2bb1c"
+SRCREV_machine_qemumips64 ?= "737272b1dfd361d9ea19812a9717e2798e3c4576"
+SRCREV_machine ?= "02120556b0ebc20c30374ccf211e8e4ceac2bb1c"
+SRCREV_meta ?= "319f2d2b1c1a4966e632d54120022d9760b885ff"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
2.1.0


