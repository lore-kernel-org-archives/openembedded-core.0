Return-Path: <Ovidiu.Panait@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 228CA7C4BA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Feb 2019 09:26:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x119Q2bu023997
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Feb 2019 01:26:02 -0800 (PST)
Received: from l1.corp.ad.wrs.com (128.224.124.169) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.435.0;
	Fri, 1 Feb 2019 01:26:02 -0800
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Feb 2019 11:26:19 +0200
Message-ID: <20190201092619.26187-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH 1/1] sysprof: inherit gsettings
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
X-List-Received-Date: Fri, 01 Feb 2019 09:26:03 -0000
Content-Type: text/plain

Fix the following error when launching sysprof:
$ sysprof
GLib-GIO-ERROR **: Settings schema 'org.gnome.sysprof2' is not installed

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta/recipes-kernel/sysprof/sysprof_3.30.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/sysprof/sysprof_3.30.2.bb b/meta/recipes-kernel/sysprof/sysprof_3.30.2.bb
index 866642cd1e..27f37f808e 100644
--- a/meta/recipes-kernel/sysprof/sysprof_3.30.2.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_3.30.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://src/sp-application.c;endline=17;md5=40e55577ef122c88fe20052acda64875"
 
 GNOMEBASEBUILDCLASS = "meson"
-inherit gnomebase gettext systemd upstream-version-is-even
+inherit gnomebase gettext systemd upstream-version-is-even gsettings
 
 DEPENDS = "glib-2.0 libxml2-native glib-2.0-native"
 
-- 
2.20.1


