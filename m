Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 017FB6F06D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 19:14:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1EJE5nF024887
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 14 Feb 2014 11:14:05 -0800 (PST)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 14 Feb 2014 11:14:05 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 14 Feb 2014 14:13:57 -0500
Message-ID: <885620d8936f101fc16137dd611d399479766087.1392404866.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1392404866.git.bruce.ashfield@windriver.com>
References: <cover.1392404866.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] linux-yocto/3.10: enable CONFIG_FHANDLE for standard and preempt-rt kernels
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
X-List-Received-Date: Fri, 14 Feb 2014 19:14:06 -0000
Content-Type: text/plain

    CONFIG_FHANDLE is now a requirement for systemd support:

      http://cgit.freedesktop.org/systemd/systemd/commit/README?id=c2cb7cbbd526e572b1caa1d7f70be68195b513a9

    So we add it into our default standard and preempt-rt kernel types, the
    overhead is small and having this always configured allows init system
    switching, without a kernel rebuild.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index b5bde68cfd3c..5e56b4c16121 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -5,7 +5,7 @@ KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
 SRCREV_machine ?= "f17f18f928d3af8b18b69fdf224b3e4ed86dbfbf"
 SRCREV_machine_qemuppc ?= "82c9f3bfe1c97ba8b653bff8d4e030cf54bc1de7"
-SRCREV_meta ?= "d57f7367a5f44a47b84425bb48601b41c6d0ed8a"
+SRCREV_meta ?= "8f8af5a3b1cd4ea4ec76e0db763efeb3807ad76c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index 48d6082a6b14..a987022ddce0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -10,7 +10,7 @@ LINUX_VERSION ?= "3.10.28"
 KMETA = "meta"
 
 SRCREV_machine ?= "3e0a296fae952d8d93eb0f96566bf6d4a978c8ee"
-SRCREV_meta ?= "d57f7367a5f44a47b84425bb48601b41c6d0ed8a"
+SRCREV_meta ?= "8f8af5a3b1cd4ea4ec76e0db763efeb3807ad76c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index 32d5fee02186..efbf24d3b3aa 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -18,7 +18,7 @@ SRCREV_machine_qemux86 ?= "3e0a296fae952d8d93eb0f96566bf6d4a978c8ee"
 SRCREV_machine_qemux86-64 ?= "3e0a296fae952d8d93eb0f96566bf6d4a978c8ee"
 SRCREV_machine_qemumips64 ?= "fe1fab7061b8369deca03b2ec59f186bdbe2b8d9"
 SRCREV_machine ?= "3e0a296fae952d8d93eb0f96566bf6d4a978c8ee"
-SRCREV_meta ?= "d57f7367a5f44a47b84425bb48601b41c6d0ed8a"
+SRCREV_meta ?= "8f8af5a3b1cd4ea4ec76e0db763efeb3807ad76c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.8.1.2


