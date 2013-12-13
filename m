Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 334CE6E2F0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 10:55:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.95,477,1384297200"; d="scan'208";a="38067542"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 13 Dec 2013 11:55:16 +0100
Received: from COSNPREXC3.usr.ingenico.loc (10.1.1.182) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	id 14.2.328.9; Fri, 13 Dec 2013 11:55:16 +0100
Received: from u85.usr.ingenico.loc ([10.23.7.85]) by
	COSNPREXC3.usr.ingenico.loc with Microsoft SMTPSVC(6.0.3790.1830);
	Fri, 13 Dec 2013 11:55:15 +0100
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Dec 2013 11:50:17 +0100
Message-ID: <1386931817-28233-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.7.10.4
X-OriginalArrivalTime: 13 Dec 2013 10:55:15.0871 (UTC)
	FILETIME=[CE2F52F0:01CEF7F1]
MIME-Version: 1.0
Subject: [PATCH] gstreamer1.0-plugins-base: fix missing rprovides
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
X-List-Received-Date: Fri, 13 Dec 2013 10:55:19 -0000
Content-Type: text/plain

split_gstreamer10_packages creates libgst* packages which are missing in PACKAGES list.
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
index ebfa7cd..697b5bd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
@@ -7,6 +7,7 @@ DEPENDS += "freetype liboil util-linux"
 
 inherit gettext
 
+PACKAGES_DYNAMIC =+ "^libgst.*"
 
 PACKAGECONFIG ??= " \
     ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
-- 
1.8.2.1


