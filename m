Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CB97572369
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 10:49:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBAAnrPT008077
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 10 Dec 2014 02:49:53 -0800 (PST)
Received: from yow-bashfiel-d4.corp.ad.wrs.com (128.224.20.249) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 10 Dec 2014 02:49:52 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <saul.wold@intel.com>
Date: Wed, 10 Dec 2014 05:49:44 -0500
Message-ID: <782bac7e5f7d81d2fa683ed6712d972d7ed9c62c.1418208337.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1418208337.git.bruce.ashfield@windriver.com>
References: <cover.1418208337.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4][daisy] beaglebone: enable the nowayout option for the watchdog
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
X-List-Received-Date: Wed, 10 Dec 2014 10:49:55 -0000
Content-Type: text/plain

Bumping the meta SRCREV for the following fix:

[
  The default watchdog behaviour is to stop the timer if the process
  managing it closes the file /dev/watchdog. The system would not reboot
  if watchdog daemon crashes due to a bug in it or get killed by other
  malicious code. So we prefer to enable nowayout option for the
  watchdong. With this enabled, there is no way of disabling the watchdog
  once it has been started. This option is also enabled in the predecessor
  of this BSP (beagleboard)
]

[YOCTO: 3937]

(From OE-Core rev: 7006412c285a4a6c75d5349f60dc71b0b735ff90)

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index 2e224307544d..995df3e0ea50 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -5,7 +5,7 @@ KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
 SRCREV_machine ?= "08229402523bdb153dceed0a7260180837396e7f"
 SRCREV_machine_qemuppc ?= "08229402523bdb153dceed0a7260180837396e7f"
-SRCREV_meta ?= "62f236c734996f240d91daee2cb6a05669c7326c"
+SRCREV_meta ?= "183622e8095545999a64bd72adedea2dffb6ec4b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index 626add9dc303..b26ae250166d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "3.14.4"
 KMETA = "meta"
 
 SRCREV_machine ?= "cb22733185cd9db3e8945dadb899d9eb3831b9ad"
-SRCREV_meta ?= "6fe191e807c9f6f3df57a72c5fc2ffb147f3129a"
+SRCREV_meta ?= "183622e8095545999a64bd72adedea2dffb6ec4b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index 1179640b005a..14647e9c45a5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -17,7 +17,7 @@ SRCREV_machine_qemux86 ?= "4aa41764bf8dba2044ff9fae806d61cac7cdd9de"
 SRCREV_machine_qemux86-64 ?= "cb22733185cd9db3e8945dadb899d9eb3831b9ad"
 SRCREV_machine_qemumips64 ?= "342ccacd4e28d1cc7e30277ee4ac6caa3086ff2f"
 SRCREV_machine ?= "cb22733185cd9db3e8945dadb899d9eb3831b9ad"
-SRCREV_meta ?= "6fe191e807c9f6f3df57a72c5fc2ffb147f3129a"
+SRCREV_meta ?= "183622e8095545999a64bd72adedea2dffb6ec4b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
2.1.0


