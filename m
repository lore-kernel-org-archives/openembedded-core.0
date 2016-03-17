Return-Path: <sgw@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 44FF86FFD4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 20:16:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 17 Mar 2016 13:16:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,351,1455004800"; d="scan'208";a="913318029"
Received: from mmaidmen-mobl3.amr.corp.intel.com (HELO
	swold-mobl.jf.intel.com) ([10.254.103.97])
	by orsmga001.jf.intel.com with ESMTP; 17 Mar 2016 13:16:18 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Thu, 17 Mar 2016 13:16:17 -0700
Message-Id: <1458245777-2535-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] matchbox-keyboard: Update to latest HEAD to fix 64bit issue
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
X-List-Received-Date: Thu, 17 Mar 2016 20:16:19 -0000

This brings us to the current HEAD and adds the following patches:

ebc330e Saul Wold matchbox-keyboard-ui.c: Fix int -> long to address 32bit vs 64 bit addressing
8063096 Khem Raj config-parser: Use matching printf format

[YOCTO #9254]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
index acfd2bb..183cba2 100644
--- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
+++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 DEPENDS = "libfakekey expat libxft gtk+ matchbox-panel-2"
 
-SRCREV = "217f1bfe14c41cf7e291d04a63aa2d79cc13d063"
+SRCREV = "ebc330eac8b9d38e9aef9f01e7241c904bd01073"
 PV = "0.0+git${SRCPV}"
 PR = "r4"
 
-- 
2.5.0


