Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 58F117709E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 20:18:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9NKIeod029331
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 23 Oct 2015 13:18:40 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 23 Oct 2015 13:18:40 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 23 Oct 2015 16:18:33 -0400
Message-ID: <e6c420c0f851a3c9631780664d492deb7fd5a87d.1445631234.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1445631234.git.bruce.ashfield@windriver.com>
References: <cover.1445631234.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] linux-yocto/3.19: fix ARM boot with gcc5.x
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
X-List-Received-Date: Fri, 23 Oct 2015 20:18:41 -0000
Content-Type: text/plain

Updating the SRCREVs to apply the same fix as 3.14 and 4.1 already
have to fix qemuarm boots with gcc5.x

[YOCTO: #8415]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.19.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.19.bb b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
index 4143a093627e..3c10bcb54899 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/common-pc"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "963b4df663dba2584ac864e0c016825de0046558"
+SRCREV_machine_qemuarm ?= "857048f10bfe7089ca6007e72431f1c098b07115"
 SRCREV_machine_qemuarm64 ?= "e152349de59b43b2a75f2c332b44171df461d5a0"
 SRCREV_machine_qemumips ?= "cedbbc7b5e72df2e820bb9e7885f12132c5e2fff"
 SRCREV_machine_qemuppc ?= "23a83386e10986a63e6cef712a045445499d002b"
 SRCREV_machine_qemux86 ?= "e152349de59b43b2a75f2c332b44171df461d5a0"
 SRCREV_machine_qemux86-64 ?= "e152349de59b43b2a75f2c332b44171df461d5a0"
 SRCREV_machine_qemumips64 ?= "3eb70cea3532e22ab1b6da9864446621229e6616"
-SRCREV_machine ?= "e152349de59b43b2a75f2c332b44171df461d5a0"
+SRCREV_machine ?= "151571a39785218a57c3ae3355cd63694890cc8d"
 SRCREV_meta ?= "1016714868249d64fc16692fd7679672b1efa17b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.19.git;name=machine;branch=${KBRANCH}; \
-- 
2.1.0


