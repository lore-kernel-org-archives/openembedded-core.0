Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 702736CF3F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2013 21:04:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r98L4HHP015355
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 8 Oct 2013 14:04:17 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 8 Oct 2013 14:04:16 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 8 Oct 2013 17:04:13 -0400
Message-ID: <ba9d52d1c06db3ee480af71967b77d71da1e93f2.1381266137.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1381266137.git.bruce.ashfield@windriver.com>
References: <cover.1381266137.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] linux-yocto/3.8: re-use common-pc-64 for hasswell-wc
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
X-List-Received-Date: Tue, 08 Oct 2013 21:04:16 -0000
Content-Type: text/plain

Updating the meta branch SRCREV with the following commit:

[
    meta-haswell-wc: update bsp scc to use linux-yocto-3.8 standard/common-pc-64/base branch

    Remove "branch haswell-wc" from haswell-wc-standard.scc
    so that "haswell-wc" BSP uses standard/common-pc-64/base branch
    on linux-yocto-3.8 repo.

    Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_3.8.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
index 003b936..9706948 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
@@ -10,7 +10,7 @@ KMETA = "meta"
 
 SRCREV_machine ?= "4fb187301ca153d496b2a96293dffde34d3b1a56"
 SRCREV_machine_qemuppc ?= "547c4ea570933ab7ece9f10d2c46875b460cd337"
-SRCREV_meta ?= "467a74c47bd70c52d0b81597007d8cc39cadaefd"
+SRCREV_meta ?= "cb96851e7e559f9247d616d08406db6135c357cb"
 
 PR = "${INC_PR}.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
index b936262..41b9f9f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
@@ -13,7 +13,7 @@ LINUX_VERSION ?= "3.8.13"
 KMETA = "meta"
 
 SRCREV_machine ?= "f20047520a57322f05d95a18a5fbd082fb15cb87"
-SRCREV_meta ?= "467a74c47bd70c52d0b81597007d8cc39cadaefd"
+SRCREV_meta ?= "cb96851e7e559f9247d616d08406db6135c357cb"
 
 PR = "${INC_PR}.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.8.bb b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
index 5ae92fc..6f34480 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
@@ -10,7 +10,7 @@ SRCREV_machine_qemuppc ?= "698eada61d9385b42dd117858b943655b565084b"
 SRCREV_machine_qemux86 ?= "f20047520a57322f05d95a18a5fbd082fb15cb87"
 SRCREV_machine_qemux86-64 ?= "f20047520a57322f05d95a18a5fbd082fb15cb87"
 SRCREV_machine ?= "f20047520a57322f05d95a18a5fbd082fb15cb87"
-SRCREV_meta ?= "467a74c47bd70c52d0b81597007d8cc39cadaefd"
+SRCREV_meta ?= "cb96851e7e559f9247d616d08406db6135c357cb"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.8.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.8.1.2


