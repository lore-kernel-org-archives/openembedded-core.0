Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 38F036013D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 09:45:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u679j7Lp023171
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jul 2016 02:45:07 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 7 Jul 2016 02:45:06 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Jul 2016 17:45:35 +0800
Message-ID: <26506f2ad6e3d1229e246cccd9b36a1c1462acd6.1467884643.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1467884643.git.Qi.Chen@windriver.com>
References: <cover.1467884643.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] gettext_0.16.1: remove useless files to avoid sysroot conflicts
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
X-List-Received-Date: Thu, 07 Jul 2016 09:45:08 -0000
Content-Type: text/plain

Do as the 0.19.6 version do, remove these files to avoid sysroot conflicts
with gettext-native-minimal.

[YOCTO #9890]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/gettext/gettext_0.16.1.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-core/gettext/gettext_0.16.1.bb b/meta/recipes-core/gettext/gettext_0.16.1.bb
index 6095c83..f85cce1 100644
--- a/meta/recipes-core/gettext/gettext_0.16.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.16.1.bb
@@ -98,6 +98,13 @@ do_install_append() {
 	rm -f ${D}${libdir}/preloadable_libintl.so
 }
 
+do_install_append_class-native () {
+	rm ${D}${datadir}/aclocal/*
+	rm ${D}${datadir}/gettext/config.rpath
+	rm ${D}${datadir}/gettext/po/Makefile.in.in
+	rm ${D}${datadir}/gettext/po/remove-potcdate.sin
+}
+
 # Anyone inheriting gettext will have both gettext-native and gettext
 # available, and we don't want to use older macros from the target gettext in
 # a non-gplv3 build, so kill them and let dependent recipes rely on
-- 
1.9.1


