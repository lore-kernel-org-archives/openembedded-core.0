Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Qh4oU-0002hh-Rl
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 21:09:39 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Qh4kd-0000pa-VE from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 12:05:39 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 13 Jul 2011 12:04:01 -0700
Received: from localhost.localdomain ([172.30.80.65]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 13 Jul 2011 13:05:39 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2011 12:05:33 -0700
Message-Id: <64da3fe941f5db344d9550d3d7c0e94fe673f638.1310583292.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <da0990e947463da6c333254055750f36967565ba.1310583292.git.tom_rini@mentor.com>
References: <da0990e947463da6c333254055750f36967565ba.1310583292.git.tom_rini@mentor.com>
In-Reply-To: <cover.1310583292.git.tom_rini@mentor.com>
References: <cover.1310583292.git.tom_rini@mentor.com>
X-OriginalArrivalTime: 13 Jul 2011 19:05:39.0176 (UTC)
	FILETIME=[DAAC5E80:01CC418F]
Subject: [PATCH 2/4] hicolor-icon-theme: Use ${BPN}-${PV} not ${P} to unbreak nativesdk
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
X-List-Received-Date: Wed, 13 Jul 2011 19:09:39 -0000

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 .../hicolor-icon-theme/hicolor-icon-theme_0.12.bb  |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
index 98c0d91..c9d65a2 100644
--- a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
+++ b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
@@ -10,7 +10,7 @@ inherit gnome
 
 PR = "r0"
 
-SRC_URI = "http://icon-theme.freedesktop.org/releases/${P}.tar.gz \
+SRC_URI = "http://icon-theme.freedesktop.org/releases/${BPN}-${PV}.tar.gz \
         file://index.theme"
 
 SRC_URI[md5sum] = "55cafbcef8bcf7107f6d502149eb4d87"
-- 
1.7.0.4



