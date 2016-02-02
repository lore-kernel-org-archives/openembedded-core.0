Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 63ADB731C7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 11:01:19 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 02 Feb 2016 03:01:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,384,1449561600"; d="scan'208";a="739004276"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 02 Feb 2016 03:01:20 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 462606A4002
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 03:49:11 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 13:04:09 +0200
Message-Id: <1454411051-15095-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/3] Revert "matchbox-keyboard: export GTK_IM_MODULE_FILE location"
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
X-List-Received-Date: Tue, 02 Feb 2016 11:01:20 -0000

This reverts commit a8c25af91e56f20b9cfd4fa298b5002efc7af809.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.sh | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.sh b/meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.sh
index 63d9b8d..6cf188b 100644
--- a/meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.sh
+++ b/meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.sh
@@ -1,7 +1,6 @@
 #!/bin/sh
 
 . /etc/formfactor/config
-export GTK_IM_MODULE_FILE="/etc/gtk-2.0/gtk.immodules"
 
 CMD=""
 
-- 
2.4.0


