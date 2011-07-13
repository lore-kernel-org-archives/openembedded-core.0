Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Qh4oY-0002kb-Rq
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 21:09:43 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Qh4kh-0000r3-W0 from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 12:05:44 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 13 Jul 2011 12:05:43 -0700
Received: from localhost.localdomain ([172.30.80.65]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 13 Jul 2011 13:05:39 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2011 12:05:34 -0700
Message-Id: <c522cd2ce93b6d965d615a1745d0523ad7e31fbc.1310583292.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <da0990e947463da6c333254055750f36967565ba.1310583292.git.tom_rini@mentor.com>
References: <da0990e947463da6c333254055750f36967565ba.1310583292.git.tom_rini@mentor.com>
In-Reply-To: <cover.1310583292.git.tom_rini@mentor.com>
References: <cover.1310583292.git.tom_rini@mentor.com>
X-OriginalArrivalTime: 13 Jul 2011 19:05:40.0004 (UTC)
	FILETIME=[DB2AB640:01CC418F]
Subject: [PATCH 3/4] groff: Disable x11 support
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
X-List-Received-Date: Wed, 13 Jul 2011 19:09:43 -0000

groff will build with, or without x11 support depending on if X has
been built already or not.  Disable x11 support for consistency.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/recipes-extended/groff/groff_1.20.1.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-extended/groff/groff_1.20.1.bb b/meta/recipes-extended/groff/groff_1.20.1.bb
index e0e198f..7085911 100644
--- a/meta/recipes-extended/groff/groff_1.20.1.bb
+++ b/meta/recipes-extended/groff/groff_1.20.1.bb
@@ -18,6 +18,7 @@ DEPENDS_virtclass-native = ""
 
 inherit autotools
 
+EXTRA_OECONF = "--without-x"
 PARALLEL_MAKE = ""
 
 do_configure_prepend() {
-- 
1.7.0.4



