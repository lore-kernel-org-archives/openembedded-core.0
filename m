Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3310A607AC
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Sep 2018 10:44:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w89Aipxq026771
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 9 Sep 2018 03:44:51 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Sun, 9 Sep 2018 03:44:50 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <bruce.ashfield@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Sun, 9 Sep 2018 03:44:50 -0700
Message-ID: <20180909104450.11900-1-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] linux-yocto-rt: Add paravirt_kvm support for qemux86-64
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
X-List-Received-Date: Sun, 09 Sep 2018 10:44:51 -0000
Content-Type: text/plain

This feature includes paravirtualized KVM guest support, including
KVMCLOCK for enhancing clock accuracy of guest OS.

Signed-off-by: He Zhe <zhe.he@windriver.com>
Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
index d9953c32be..ab088f4d18 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
@@ -38,4 +38,4 @@ KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/ta
 KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
 KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
+KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
index 5b102069f1..de3b538b5d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
@@ -40,4 +40,4 @@ KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/ta
 KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
 KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
+KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
-- 
2.11.0


