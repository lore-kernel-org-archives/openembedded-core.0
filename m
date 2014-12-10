Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BC3F472384
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 10:49:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBAAnpeM024395
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 10 Dec 2014 02:49:51 -0800 (PST)
Received: from yow-bashfiel-d4.corp.ad.wrs.com (128.224.20.249) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 10 Dec 2014 02:49:51 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <saul.wold@intel.com>
Date: Wed, 10 Dec 2014 05:49:43 -0500
Message-ID: <afe9e4465a3cc8ddf84782cdf93b820a0d9fbfbe.1418208337.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1418208337.git.bruce.ashfield@windriver.com>
References: <cover.1418208337.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4][daisy] linux-yocto-rt/3.14: update to 3.14-rt5
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
X-List-Received-Date: Wed, 10 Dec 2014 10:49:53 -0000
Content-Type: text/plain

Updating the the latest 3.14-rt release.

(From OE-Core rev: ca1d952c964ce25bf78d47c7a856105d59d72cac)

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index a8e344728d8d..2e224307544d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -3,9 +3,9 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "00343b1573f3392688ddceac0b3da0d307ab81b9"
-SRCREV_machine_qemuppc ?= "c7eae6cfd7bbe69d2340c6fd6bf35fbca88706c4"
-SRCREV_meta ?= "6fe191e807c9f6f3df57a72c5fc2ffb147f3129a"
+SRCREV_machine ?= "08229402523bdb153dceed0a7260180837396e7f"
+SRCREV_machine_qemuppc ?= "08229402523bdb153dceed0a7260180837396e7f"
+SRCREV_meta ?= "62f236c734996f240d91daee2cb6a05669c7326c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
-- 
2.1.0


