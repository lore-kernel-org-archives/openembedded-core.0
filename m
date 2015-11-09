Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 07F8B73D46
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 10:38:29 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 09 Nov 2015 02:38:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,265,1444719600"; d="scan'208";a="815263677"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 09 Nov 2015 02:38:29 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 78E8B6A4005
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 02:37:25 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Nov 2015 12:37:59 +0200
Message-Id: <1447065479-7700-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] acpid: upgrade to version 2.0.25
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
X-List-Received-Date: Mon, 09 Nov 2015 10:38:30 -0000

upgrade from version 2.0.23 -> 2.0.25

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-bsp/acpid/{acpid_2.0.23.bb => acpid_2.0.25.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/acpid/{acpid_2.0.23.bb => acpid_2.0.25.bb} (55%)

diff --git a/meta/recipes-bsp/acpid/acpid_2.0.23.bb b/meta/recipes-bsp/acpid/acpid_2.0.25.bb
similarity index 55%
rename from meta/recipes-bsp/acpid/acpid_2.0.23.bb
rename to meta/recipes-bsp/acpid/acpid_2.0.25.bb
index a5317a4..f00d25a 100644
--- a/meta/recipes-bsp/acpid/acpid_2.0.23.bb
+++ b/meta/recipes-bsp/acpid/acpid_2.0.25.bb
@@ -3,5 +3,5 @@ require acpid.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://acpid.h;endline=24;md5=324a9cf225ae69ddaad1bf9d942115b5"
 
-SRC_URI[md5sum] = "d7bcdcdefcd53b03730e50ba842554ea"
-SRC_URI[sha256sum] = "4396aaec13510c3a1faa941a15a4b5335b6ae4fbec8438b9249b88c3b66187ee"
+SRC_URI[md5sum] = "69bb0cc4a0a89eb2dfecc4851087f568"
+SRC_URI[sha256sum] = "0b700a8072bec162c512f72cbe419195601ab3e0ffd2138f9bd95ed3097a5c68"
-- 
2.4.0


