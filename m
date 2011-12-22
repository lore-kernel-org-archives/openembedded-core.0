Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RdlhY-00033T-Jw
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 17:41:04 +0100
Received: by werm13 with SMTP id m13so3782439wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 08:33:58 -0800 (PST)
Received: by 10.216.132.204 with SMTP id o54mr6206508wei.27.1324571638316;
	Thu, 22 Dec 2011 08:33:58 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id
	fw16sm10313522wbb.13.2011.12.22.08.33.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Dec 2011 08:33:57 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Dec 2011 17:33:54 +0100
Message-Id: <1324571634-17144-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] connman-gnome: update SRC_URI to new repo
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
X-List-Received-Date: Thu, 22 Dec 2011 16:41:04 -0000

13:33 < koen> holtmann: any plans to repopulate the connman-gnome git repo on kernel.org?
17:25 < holtmann> koen: We moved that to https://github.com/connectivity/connman-gnome
17:26 < holtmann> Just have not gotten around to delete the other one.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../connman/connman-gnome_0.5.bb                   |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.5.bb b/meta/recipes-connectivity/connman/connman-gnome_0.5.bb
index 9c78186..3fde66d 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.5.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.5.bb
@@ -8,10 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
 
 DEPENDS = "gtk+ dbus"
 
-PR = "r7"
+PR = "r8"
 
 SRCREV = "78d3c39db6f3f7977b466305110faa8ca5f74ec8"
-SRC_URI = "git://git.kernel.org/pub/scm/network/connman/connman-gnome.git;protocol=git \
+SRC_URI = "git://github.com/connectivity/connman-gnome.git;protocol=git \
            file://3g.patch \
            file://security-type.patch"
 
-- 
1.7.2.5



