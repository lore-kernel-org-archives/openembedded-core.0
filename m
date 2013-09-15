Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 458136C79A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Sep 2013 16:21:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8FGLxPJ024921
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Sep 2013 09:21:59 -0700 (PDT)
Received: from fidler.corp.ad.wrs.com (128.224.22.90) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 15 Sep 2013 09:21:59 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 15 Sep 2013 12:21:47 -0400
Message-ID: <1379262107-31255-1-git-send-email-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 1.8.2.1
MIME-Version: 1.0
Subject: [PATCH] vala: add bison-native depends for vala-native
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
X-List-Received-Date: Sun, 15 Sep 2013 16:21:58 -0000
Content-Type: text/plain

vala-native builds were working because most systems have
bison installed on the host. Add an explicit dependency on
bison-native since bison isn't a sanity checked host tool.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-devtools/vala/vala.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
index 6cdc605..a8927d7 100644
--- a/meta/recipes-devtools/vala/vala.inc
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -3,7 +3,7 @@ Vala compiles to plain C and has no runtime environment nor penalities whatsoeve
 SECTION = "devel"
 DEPENDS = "glib-2.0 dbus gtk+"
 BBCLASSEXTEND = "native"
-DEPENDS_virtclass-native = "glib-2.0-native dbus-native"
+DEPENDS_virtclass-native = "bison-native glib-2.0-native dbus-native"
 HOMEPAGE = "http://vala-project.org"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-- 
1.8.2.1


