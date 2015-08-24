Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9A27A6AC1E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 13:51:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7ODpQou005926
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 24 Aug 2015 06:51:26 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Mon, 24 Aug 2015 06:51:26 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 24 Aug 2015 09:51:19 -0400
Message-ID: <5f7689d993d07fafd014a5c3b4318475e09a93a1.1440424002.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1440424002.git.bruce.ashfield@windriver.com>
References: <cover.1440424002.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] linux-yocto/4.1: fix qemuarm preempt-rt configuration
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
X-List-Received-Date: Mon, 24 Aug 2015 13:51:28 -0000
Content-Type: text/plain

With the recent changes to the kernel meta data handling and the
removal of BSP branches, we need to shuffle some patches around to
match.

This prevents patches from being applied twice, and the qemuarm BSP
can be configured for preempt-rt.

[YOCTO: #8122]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index a7a52cb62762..9eff93d35764 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "4e30e64c44df9e59bd13239951bb8d2b5b276e6f"
 SRCREV_machine_qemux86-64 ?= "4e30e64c44df9e59bd13239951bb8d2b5b276e6f"
 SRCREV_machine_qemumips64 ?= "5c2b3697082a4ec6641aa5a8eca3974ca609cecf"
 SRCREV_machine ?= "4e30e64c44df9e59bd13239951bb8d2b5b276e6f"
-SRCREV_meta ?= "45393dd54f5ad77d43014c407c2b3520da42f427"
+SRCREV_meta ?= "0a1457774f203eae4213822a0bd17a07f3b5d89a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
-- 
2.1.0


