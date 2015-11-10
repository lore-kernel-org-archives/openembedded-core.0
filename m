Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4FD89766B2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 22:28:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAAMSZwZ008997
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 14:28:35 -0800
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 10 Nov 2015 14:28:34 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <randy.macleod@windriver.com>
Date: Tue, 10 Nov 2015 14:28:34 -0800
Message-ID: <1447194514-8949-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] libsecret: add dependency on intltool-native
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
X-List-Received-Date: Tue, 10 Nov 2015 22:28:38 -0000
Content-Type: text/plain

intltoolize is needed by configure.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-gnome/libsecret/libsecret_0.18.2.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb b/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb
index 8fc0018..a1dcc78 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6"
 
 inherit gnomebase gtk-doc
 
-DEPENDS = "glib-2.0 libgcrypt gettext-native"
+DEPENDS = "glib-2.0 libgcrypt gettext-native intltool-native"
 
 EXTRA_OECONF += "--disable-manpages"
 
-- 
1.7.9.5


