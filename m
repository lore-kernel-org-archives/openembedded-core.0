Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 181F465E85
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 15:12:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3AFCptI013373
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 10 Apr 2014 08:12:51 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 10 Apr 2014 08:12:51 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 10 Apr 2014 11:12:33 -0400
Message-ID: <2ec30e5dc322d0a4046ed8dae1578e380aa90ffa.1397142033.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1397142033.git.bruce.ashfield@windriver.com>
References: <cover.1397142033.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] linux-yocto/3.10: intel-common: Add preempt-rt ktype targets
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
X-List-Received-Date: Thu, 10 Apr 2014 15:12:53 -0000
Content-Type: text/plain

Updating the meta SRCREV to incorporate the intel common preempt-rt kernel
support.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index 98bf996a7092..5cabb5ad007e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -5,7 +5,7 @@ KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
 SRCREV_machine ?= "d1e73a1e09f9641c44e7d713d1a6b5b088411459"
 SRCREV_machine_qemuppc ?= "9a34d9c957e69f28e89e879d9dd6e8fe5c7270c5"
-SRCREV_meta ?= "b6e58b33dd427fe471f8827c83e311acdf4558a4"
+SRCREV_meta ?= "5824403ba2b877eca33969425ac1ac5dbeb72720"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index 9e5c070c106d..7eacfc0f258a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -10,7 +10,7 @@ LINUX_VERSION ?= "3.10.35"
 KMETA = "meta"
 
 SRCREV_machine ?= "cee957655fe67826b2e827e2db41f156fa8f0cc4"
-SRCREV_meta ?= "b6e58b33dd427fe471f8827c83e311acdf4558a4"
+SRCREV_meta ?= "5824403ba2b877eca33969425ac1ac5dbeb72720"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index f275693ae4ed..38bba6815b84 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -18,7 +18,7 @@ SRCREV_machine_qemux86 ?= "cee957655fe67826b2e827e2db41f156fa8f0cc4"
 SRCREV_machine_qemux86-64 ?= "cee957655fe67826b2e827e2db41f156fa8f0cc4"
 SRCREV_machine_qemumips64 ?= "a1491c3b367a75c7003b2fb58706e3631413b337"
 SRCREV_machine ?= "cee957655fe67826b2e827e2db41f156fa8f0cc4"
-SRCREV_meta ?= "b6e58b33dd427fe471f8827c83e311acdf4558a4"
+SRCREV_meta ?= "5824403ba2b877eca33969425ac1ac5dbeb72720"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.8.1.2


