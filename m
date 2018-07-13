Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B9AFE77029
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2018 01:09:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6D193DN026277
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 18:09:04 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Thu, 12 Jul 2018 18:08:57 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Jul 2018 09:08:56 +0800
Message-ID: <1531444136-336197-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] epiphany: fix epiphany cannot start problem
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
X-List-Received-Date: Fri, 13 Jul 2018 01:09:03 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Add RDEPEND of gsettings-desktop-schemas to fix below error:
Error: GLib-GIO-ERROR: Settings schema 'org.gnome.desktop.background'
is not installed

This depend was setted in gnome-desktop before, but dropped when we
drop gnome-desktop after upgrade epiphany to 3.28.1.1.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-gnome/epiphany/epiphany_3.28.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.28.1.1.bb b/meta/recipes-gnome/epiphany/epiphany_3.28.1.1.bb
index d6f8eda..65e7b45 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.28.1.1.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.28.1.1.bb
@@ -19,4 +19,4 @@ SRC_URI[archive.sha256sum] = "99426aa0e386742e924d84b59ec16bf394195fb9fce85d07f7
 EXTRA_OEMESON += " -Ddistributor_name=${DISTRO}"
 
 FILES_${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
-RDEPENDS_${PN} = "iso-codes adwaita-icon-theme"
+RDEPENDS_${PN} = "iso-codes adwaita-icon-theme gsettings-desktop-schemas"
-- 
2.7.4


