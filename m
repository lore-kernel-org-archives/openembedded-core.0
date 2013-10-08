Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B1E8F6CF68
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2013 21:04:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r98L4IuU015371
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 8 Oct 2013 14:04:18 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 8 Oct 2013 14:04:18 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 8 Oct 2013 17:04:15 -0400
Message-ID: <72ca7801f3b733f7fc63326c1d8c98a3c32a519f.1381266137.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1381266137.git.bruce.ashfield@windriver.com>
References: <cover.1381266137.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] linux-yocto/3.10: integrate lxc kernel feature and 32 bit x86 config
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
X-List-Received-Date: Tue, 08 Oct 2013 21:04:17 -0000
Content-Type: text/plain

Updating the meta branch SRCREV to incorporate the two following
configuration changes:

  452f067 lxc: Add lxc kernel config
  a249eba x86_32: Enable X86_32 and disable 64BIT explicitly

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index 9ca87f3..1a85995 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -5,7 +5,7 @@ KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
 SRCREV_machine ?= "f1e003e9441f0366d7b9a2209ef3108438745ea3"
 SRCREV_machine_qemuppc ?= "12be459359d5b20dbf856aa3649304c6f618d420"
-SRCREV_meta ?= "d671e0ec09b330d68f70f13a7813cc9ecfceaa8d"
+SRCREV_meta ?= "452f0679ea93a6cb4433bebd7177629228a5cf68"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index 6bd7ab2..1405e411 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -10,7 +10,7 @@ LINUX_VERSION ?= "3.10.11"
 KMETA = "meta"
 
 SRCREV_machine ?= "e1aa804148370cda6f85640281af156ffa007d52"
-SRCREV_meta ?= "d671e0ec09b330d68f70f13a7813cc9ecfceaa8d"
+SRCREV_meta ?= "452f0679ea93a6cb4433bebd7177629228a5cf68"
 
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index d49fdac..fa37e8a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -10,7 +10,7 @@ SRCREV_machine_qemux86 ?= "e1aa804148370cda6f85640281af156ffa007d52"
 SRCREV_machine_qemux86-64 ?= "e1aa804148370cda6f85640281af156ffa007d52"
 SRCREV_machine_qemumips64 ?= "6973844d304411893420a7e57545edc4dc854bd7"
 SRCREV_machine ?= "e1aa804148370cda6f85640281af156ffa007d52"
-SRCREV_meta ?= "d671e0ec09b330d68f70f13a7813cc9ecfceaa8d"
+SRCREV_meta ?= "452f0679ea93a6cb4433bebd7177629228a5cf68"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.8.1.2


