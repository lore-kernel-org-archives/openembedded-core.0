Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QwKU2-0003IO-AU
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 22:55:34 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-146-223.ottawa.windriver.com [128.224.146.223])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7OKoecG009007;
	Wed, 24 Aug 2011 13:50:44 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 24 Aug 2011 16:50:28 -0400
Message-Id: <6d0f1146b188f7efffc46477590b3b5615ae3035.1314218754.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1314218753.git.bruce.ashfield@windriver.com>
References: <cover.1314218753.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1314218753.git.bruce.ashfield@windriver.com>
References: <cover.1314218753.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 4/4] linux-yocto/2.6.37: apmd + get time of day fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Aug 2011 20:55:34 -0000

Fixes [YOCTO #916]
Fixes [YOCTO #900]

Merging:

[
  commit 4ae8f8605c81c39b959948e23f7123294a5dfb3f
  Author: Liming Wang <liming.wang@windriver.com>
  Date:   Wed Aug 24 10:45:19 2011 +0800

    x86: use vdso gettime fallback versus returning an error

    __vdso_clock_gettime should fall back to call vdso_fallback_gettime function
    if no clockid is selected, not just return error.

    Signed-off-by: Liming Wang <liming.wang@windriver.com
]
[
  commit aeea99683c7283f1f3320bf2ee7085ee252d4e7e
  Author: Liming Wang <liming.wang@windriver.com>
  Date:   Fri Aug 19 17:43:49 2011 +0800

    meta: add APM Emulation option to beagleboard

    apmd daemon needs this option to work, so add this to beagleboard
    kernel config file.

    Signed-off-by: Liming Wang <liming.wang@windriver.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_2.6.37.bb |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb b/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
index 145abe1..4199137 100644
--- a/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
@@ -14,12 +14,12 @@ KMETA = meta
 LINUX_VERSION ?= "2.6.37"
 LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
 
-SRCREV_machine_qemuarm = "f5aaddc24d0866ac12e924c4cee1382cce4cdb44"
-SRCREV_machine_qemumips = "f988df822335de0e463056f8c43f2984c29e2bd1"
-SRCREV_machine_qemuppc = "b03682b7db2f21c7dcabbbe4073061b601ad5ee9"
-SRCREV_machine_qemux86 = "ff1a08b4f5a0c4afa04160460421d67f37299f2c"
-SRCREV_machine_qemux86-64 = "be49445d1504c3d4021c01471223208cd3cc9c4f"
-SRCREV_machine = "ffd73d6b2a9bfa0de5710b90a2237f4be66ae9a7"
+SRCREV_machine_qemuarm = "b3e53a090eaa23aa82e64fa0a563a93a2b4dbb5d"
+SRCREV_machine_qemumips = "91f2eb4a3b447476b36aac8e6e198d08c98e0680"
+SRCREV_machine_qemuppc = "862faf3666b3a4e4bc1d469ff5fb3fb90c25f621"
+SRCREV_machine_qemux86 = "27ad78e1f6378da554775a7d6760730c92f8c5a7"
+SRCREV_machine_qemux86-64 = "af2bfbe5f757361b5b027a24d67a93bfdfaaf33c"
+SRCREV_machine = "4ae8f8605c81c39b959948e23f7123294a5dfb3f"
 SRCREV_meta = "aeea99683c7283f1f3320bf2ee7085ee252d4e7e"
 
 PR = "r20"
-- 
1.7.4.1



