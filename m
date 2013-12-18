Return-Path: <kmsywula@ecsmtp.ir.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C2F0F60D87
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 15:02:06 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 Dec 2013 06:58:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,508,1384329600"; d="scan'208";a="454268917"
Received: from irvmail001.ir.intel.com ([163.33.26.43])
	by orsmga002.jf.intel.com with ESMTP; 18 Dec 2013 07:02:06 -0800
Received: from irsectmgbld0302.ir.intel.com (irsectmgbld0302.ir.intel.com
	[163.33.26.92])
	by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
	rBIF26Uc029853; Wed, 18 Dec 2013 15:02:06 GMT
Received: from irsectmgbld0302.ir.intel.com (localhost [127.0.0.1])
	by irsectmgbld0302.ir.intel.com with ESMTP id rBIF26cS017851;
	Wed, 18 Dec 2013 15:02:06 GMT
Received: (from kmsywula@localhost)
	by irsectmgbld0302.ir.intel.com with œ id rBIF25Ep017847;
	Wed, 18 Dec 2013 15:02:05 GMT
From: krzysztof.m.sywula@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2013 15:01:54 +0000
Message-Id: <1387378914-17809-1-git-send-email-krzysztof.m.sywula@intel.com>
X-Mailer: git-send-email 1.7.12.2
Subject: [PATCH] Minicom depends on libiconv
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
X-List-Received-Date: Wed, 18 Dec 2013 15:02:06 -0000

From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>

Signed-off-by: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
---
 meta/recipes-extended/minicom/minicom_2.6.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/minicom/minicom_2.6.2.bb b/meta/recipes-extended/minicom/minicom_2.6.2.bb
index 5694cc2..071682d 100644
--- a/meta/recipes-extended/minicom/minicom_2.6.2.bb
+++ b/meta/recipes-extended/minicom/minicom_2.6.2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Text-based modem control and terminal emulation program"
 DESCRIPTION = "Minicom is a text-based modem control and terminal emulation program for Unix-like operating systems"
 SECTION = "console/network"
-DEPENDS = "ncurses"
+DEPENDS = "ncurses virtual/libiconv"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=420477abc567404debca0a2a1cb6b645 \
                     file://src/minicom.h;beginline=1;endline=12;md5=a58838cb709f0db517f4e42730c49e81"
-- 
1.7.12.2


