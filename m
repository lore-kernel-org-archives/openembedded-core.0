Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UMiVq-0006fS-NO
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Apr 2013 19:27:19 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r31H9rv8014806
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Apr 2013 10:09:54 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 1 Apr 2013 10:09:53 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 1 Apr 2013 10:09:33 -0700
Message-ID: <9736d8a916ce626b428b9be77306bada314ca878.1364835699.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1364835699.git.bruce.ashfield@windriver.com>
References: <cover.1364835699.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] linux-yocto/3.8: update mips SA_RESTORER fix
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
X-List-Received-Date: Mon, 01 Apr 2013 17:27:19 -0000
Content-Type: text/plain

During the 3.8.4 integration there was a build issue on MIPS due to
SA_RESTORER changes. A solution was put in place for mips, but it
didn't cover other impacted architectures.

This is a backport of the proposed fix for the next 3.8-stable,
since the full -stable might not be available in the right timeframe.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb |    4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.8.bb    |   12 ++++++------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
index 255e2e3..7b9a4f8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
@@ -8,8 +8,8 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "f35992f80c81dc5fa1a97165dfd5cbb84661f7cb"
-SRCREV_machine_qemuppc ?= "5789e3f33c1d5df35ced60d0153cafca7cd0e319"
+SRCREV_machine ?= "c122468c96f47f281eb3ab51f96507d66dcc60d7"
+SRCREV_machine_qemuppc ?= "dc0440c8bbf12676a54c7aa29879155d925a7565"
 SRCREV_meta ?= "1b534b2f8bbe9b8a773268cfa30a4850346f6f5f"
 
 PR = "${INC_PR}.0"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.8.bb b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
index 95a4906..10fc693 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
@@ -3,12 +3,12 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "3a73643770a32ea6c86724e92e1e5abecb5dc822"
-SRCREV_machine_qemumips  ?= "1aefa19417793412ef87217a4cb5d1074dc549ba"
-SRCREV_machine_qemuppc ?= "8844013c81e9ad80246aabca6573eed9dbaac646"
-SRCREV_machine_qemux86 ?= "15a0766b3d007e5fafce3503375694dff2b0603e"
-SRCREV_machine_qemux86-64 ?= "15a0766b3d007e5fafce3503375694dff2b0603e"
-SRCREV_machine ?= "15a0766b3d007e5fafce3503375694dff2b0603e"
+SRCREV_machine_qemuarm ?= "bf458ca0e48f4f57cbb02b52070a000f361eec84"
+SRCREV_machine_qemumips  ?= "c7297b41016919c95a2c779cafc0aad736f6a400"
+SRCREV_machine_qemuppc ?= "f8848d222d1fcd1ebc517d28f289735621708449"
+SRCREV_machine_qemux86 ?= "42ddf06111efe45f3c36012d5a04a1eeb9781f42"
+SRCREV_machine_qemux86-64 ?= "42ddf06111efe45f3c36012d5a04a1eeb9781f42"
+SRCREV_machine ?= "42ddf06111efe45f3c36012d5a04a1eeb9781f42"
 SRCREV_meta ?= "1b534b2f8bbe9b8a773268cfa30a4850346f6f5f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.8.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
-- 
1.7.10.4



