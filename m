Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1ROU5M-0005HC-O6
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 13:50:28 +0100
Received: by wwf25 with SMTP id 25so417932wwf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2011 04:44:12 -0800 (PST)
Received: by 10.180.84.33 with SMTP id v1mr5928752wiy.4.1320929052342;
	Thu, 10 Nov 2011 04:44:12 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id v10sm4775958wiy.23.2011.11.10.04.44.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 Nov 2011 04:44:11 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Nov 2011 13:44:04 +0100
Message-Id: <1320929044-13077-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] hicolor-icon-theme 0.12: add BBCLASSEXTEND=native for xfce tools
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
X-List-Received-Date: Thu, 10 Nov 2011 12:50:28 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../hicolor-icon-theme/hicolor-icon-theme_0.12.bb  |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
index 759c9d8..aeb89c9 100644
--- a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
+++ b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
@@ -5,6 +5,8 @@ BUGTRACKER = "https://bugs.freedesktop.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f08a446809913fc9b3c718f0eaea0426"
 
+BBCLASSEXTEND = "native"
+
 SECTION = "unknown"
 inherit gnome allarch
 
-- 
1.7.2.5



