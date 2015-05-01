Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D500373C8C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 May 2015 01:34:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t411YNn0005781
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 Apr 2015 18:34:23 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Thu, 30 Apr 2015 18:34:22 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 30 Apr 2015 21:34:17 -0400
Message-ID: <febb641b6f1765ff959777150b08818779cf51f8.1430443583.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1430443583.git.bruce.ashfield@windriver.com>
References: <cover.1430443583.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] linux-yocto: add core bluetooth support to qemux86* and common-pc*
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
X-List-Received-Date: Fri, 01 May 2015 01:34:23 -0000
Content-Type: text/plain

Updating the configuration for the common x86 platforms to always
include core bluetooth support.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_3.19.bb      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
index 15fc536e0a41..1f91471dd622 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
@@ -10,7 +10,7 @@ KMETA = "meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "d5d30ba4d20e65c15df624ffce7a5cd38150348b"
-SRCREV_meta ?= "1b28e65444c0da26c347eba6272984547ab4983b"
+SRCREV_meta ?= "7215fe431391a322c7e39f410e7b8f2a2b507892"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.19.bb b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
index e47e22b39695..6ddbe8c59336 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "d5d30ba4d20e65c15df624ffce7a5cd38150348b"
 SRCREV_machine_qemux86-64 ?= "d5d30ba4d20e65c15df624ffce7a5cd38150348b"
 SRCREV_machine_qemumips64 ?= "f631de1c3df29a85a4b882acf19682fe05eec0f3"
 SRCREV_machine ?= "d5d30ba4d20e65c15df624ffce7a5cd38150348b"
-SRCREV_meta ?= "1b28e65444c0da26c347eba6272984547ab4983b"
+SRCREV_meta ?= "7215fe431391a322c7e39f410e7b8f2a2b507892"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.19.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
2.1.0


