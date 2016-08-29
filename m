Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 17C807316B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 14:32:08 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 29 Aug 2016 07:32:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,596,1464678000"; d="scan'208";a="1048688726"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by fmsmga002.fm.intel.com with ESMTP; 29 Aug 2016 07:32:05 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 17:30:16 +0300
Message-Id: <e702a991cf06c5270d3b0c767beee8baa5ed4c36.1472480768.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
References: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
References: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 09/15] kexec-tools: update to 2.0.13
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
X-List-Received-Date: Mon, 29 Aug 2016 14:32:08 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../kexec/{kexec-tools_2.0.12.bb => kexec-tools_2.0.13.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.12.bb => kexec-tools_2.0.13.bb} (88%)

diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.12.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.13.bb
similarity index 88%
rename from meta/recipes-kernel/kexec/kexec-tools_2.0.12.bb
rename to meta/recipes-kernel/kexec/kexec-tools_2.0.13.bb
index 59376c8..338a7d9 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.12.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.13.bb
@@ -10,8 +10,8 @@ SRC_URI += " \
             file://0001-vmcore-dmesg-Define-_GNU_SOURCE.patch \
          "
 
-SRC_URI[md5sum] = "10ddaae0e86af54407b164a1f5a39cc3"
-SRC_URI[sha256sum] = "cc7b60dad0da202004048a6179d8a53606943062dd627a2edba45a8ea3a85135"
+SRC_URI[md5sum] = "b7595eb4705e482ee6fc1121a5b6131b"
+SRC_URI[sha256sum] = "70df562d76213e54833228379710ada1afd98a86ee1ce5644eaa68c54e102e25"
 
 PACKAGES =+ "kexec kdump vmcore-dmesg"
 
-- 
2.9.3


