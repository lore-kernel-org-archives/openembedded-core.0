Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6DCC36D196
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 17:49:24 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 21 Oct 2013 10:49:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,540,1378882800"; d="scan'208";a="414632847"
Received: from unknown (HELO swold-linux.host.org) ([10.255.12.37])
	by fmsmga001.fm.intel.com with ESMTP; 21 Oct 2013 10:49:17 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Oct 2013 10:49:13 -0700
Message-Id: <1382377754-4904-3-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1382377754-4904-1-git-send-email-sgw@linux.intel.com>
References: <1382377754-4904-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/3] kbd: Use libcheck instead of check
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
X-List-Received-Date: Mon, 21 Oct 2013 17:49:26 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/kbd/kbd_2.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/kbd/kbd_2.0.0.bb b/meta/recipes-core/kbd/kbd_2.0.0.bb
index eafa0b0..e66018f 100644
--- a/meta/recipes-core/kbd/kbd_2.0.0.bb
+++ b/meta/recipes-core/kbd/kbd_2.0.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "This package contains keytable files and keyboard utilities"
 # everything minus console-fonts is GPLv2+
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a5fcc36121d93e1f69d96a313078c8b5"
-DEPENDS = "check"
+DEPENDS = "libcheck"
 
 inherit autotools gettext ptest
 
-- 
1.8.3.1


