Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QtVs9-0002Il-Q6
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 04:28:49 +0200
Received: by yia28 with SMTP id 28so443572yia.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2011 19:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=qyFtw0/KX16cSLFMHDdaXFiXIKzDXIDLBLVJhEcLqL4=;
	b=xkc6e8WCNBfxmkUduAHuFJwbOCLgw+g6yc75Fnkn2JYt1hiJSqjrD9XF+FjlW6Sj94
	1ehNCprk3fKQ9uLTDPxCNPIHDDbCbdDt64z6KjoYE/SWCw6Re8/1Z3xiDa40BfJBEyUa
	HwA22dLSZBcJnIk7WdBk+UG456kiyAKddRH2c=
Received: by 10.236.193.106 with SMTP id j70mr1494271yhn.86.1313547851309;
	Tue, 16 Aug 2011 19:24:11 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id c63sm786805yhe.46.2011.08.16.19.24.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 16 Aug 2011 19:24:10 -0700 (PDT)
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 21:16:14 -0500
Message-Id: <1313547374-10263-1-git-send-email-agnel.joel@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: jdk@ti.com, k-kooi@ti.com
Subject: [meta-oe] [PATCH] gnome-system-monitor: Add dependency on gnome-icon-theme
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
X-List-Received-Date: Wed, 17 Aug 2011 02:28:50 -0000

Without this, the configure stage of this recipe fails with pkg-config not finding
the gnome-icon-theme package

Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
Cc: jdk@ti.com
Cc: k-kooi@ti.com
---
 .../gnome-system-monitor_2.28.2.bb                 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb
index 72ad32b..6ce4f92 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11/gnome"
 
-DEPENDS = "libgtop gtkmm glibmm gnome-doc-utils libwnck gtk+ dbus-glib librsvg" 
+DEPENDS = "libgtop gtkmm glibmm gnome-doc-utils gnome-icon-theme libwnck gtk+ dbus-glib librsvg"
 
 inherit gnome
 SRC_URI[archive.md5sum] = "3f0bca9b0ebc7a365466851cd580d167"
-- 
1.7.0.4



