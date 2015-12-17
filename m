Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B08557319F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 15:11:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Dec 2015 07:11:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,441,1444719600"; d="scan'208";a="875739976"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 17 Dec 2015 07:11:32 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Dec 2015 17:08:49 +0200
Message-Id: <2c2d6243a813b175fa00518c39566dc3813253d4.1450364672.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
References: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
References: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 12/17] kexec-tools: update to 2.0.11
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
X-List-Received-Date: Thu, 17 Dec 2015 15:11:33 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../kexec/{kexec-tools_2.0.10.bb => kexec-tools_2.0.11.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.10.bb => kexec-tools_2.0.11.bb} (87%)

diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.10.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.11.bb
similarity index 87%
rename from meta/recipes-kernel/kexec/kexec-tools_2.0.10.bb
rename to meta/recipes-kernel/kexec/kexec-tools_2.0.11.bb
index f211217..7173767 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.10.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.11.bb
@@ -9,8 +9,8 @@ SRC_URI += "file://kexec-tools-Refine-kdump-device_tree-sort.patch \
             file://0001-purgatory-Pass-r-directly-to-linker.patch \
          "
 
-SRC_URI[md5sum] = "6cb4d22bcec71b6e070aa8e9d990a5e6"
-SRC_URI[sha256sum] = "c31bb83deef9547a28e8cfc1f0916e70f8e6b92a6bd2ef7077e12e3338239af3"
+SRC_URI[md5sum] = "86de066859f289048f1b286af6f03f78"
+SRC_URI[sha256sum] = "84f652ebf1de3f7b9de757a50cdbf6d5639d88c1d5b5ef9f525edde5ef9590c2"
 
 PACKAGES =+ "kexec kdump vmcore-dmesg"
 
-- 
2.6.2


