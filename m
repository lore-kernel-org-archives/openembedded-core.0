Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QI0Ac-0002Vw-6r
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 17:08:50 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QI082-0005eW-36 from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 08:06:10 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 5 May 2011 08:04:52 -0700
Received: from localhost.localdomain ([172.30.0.24]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 5 May 2011 09:06:08 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 May 2011 08:05:57 -0700
Message-Id: <60d05770b0ad7815f1171b299c8689881a6553ac.1304607797.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1304607797.git.tom_rini@mentor.com>
References: <cover.1304607797.git.tom_rini@mentor.com>
X-OriginalArrivalTime: 05 May 2011 15:06:09.0078 (UTC)
	FILETIME=[F6ECAD60:01CC0B35]
Subject: [PATCH 4/4] bash.inc: Add bison-native to DEPENDS
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
X-List-Received-Date: Thu, 05 May 2011 15:08:50 -0000

This is f0652d96ff5c3b08b8e4c4972f7fb0296df6d898 from OE.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/recipes-extended/bash/bash.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index ecbd75d..e218304 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -5,7 +5,7 @@ SECTION = "base/shell"
 # GPLv2+ (< 4.0), GPLv3+ (>= 4.0)
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-DEPENDS = "ncurses"
+DEPENDS = "ncurses bison-native"
 
 inherit autotools gettext
 
-- 
1.7.0.4



