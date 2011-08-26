Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joelagnel@ti.com>) id 1QwkUn-0003nn-9m
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 02:42:05 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id p7Q0bGtW005560
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 19:37:17 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id p7Q0bGC4026570
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 19:37:16 -0500 (CDT)
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p7Q0bGg1001486
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 19:37:16 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 25 Aug 2011 19:37:16 -0500
Received: from localhost.localdomain (chase-ubuntu.am.dhcp.ti.com
	[128.247.105.25])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	p7Q0bFaq011622;	Thu, 25 Aug 2011 19:37:16 -0500
From: Joel A Fernandes <joelagnel@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Aug 2011 19:28:17 -0500
Message-ID: <1314318504-9524-3-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1314318504-9524-1-git-send-email-joelagnel@ti.com>
References: <1314318504-9524-1-git-send-email-joelagnel@ti.com>
MIME-Version: 1.0
Subject: [RFC meta-oe 2/2] gnome-system-monitor: Add dependency on gnome-icon-theme
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
X-List-Received-Date: Fri, 26 Aug 2011 00:42:05 -0000
Content-Type: text/plain

Without this, the configure stage of this recipe fails as pkg-config cannot find
the gnome-icon-theme package

Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
---
 .../gnome-system-monitor_2.28.2.bb                 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb
index 72ad32b..aa6731d 100644
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



