Return-Path: <Ming.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2BBE16B1C3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 08:19:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6H8JhvX021018
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 01:19:43 -0700 (PDT)
Received: from pek-lpgbuild1.wrs.com (128.224.153.21) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Wed, 17 Jul 2013 01:19:42 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jul 2013 16:19:39 +0800
Message-ID: <1374049179-19107-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH V1] util-linux: replace += with _append to EXTRA_OECONF_virtclass-native
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
X-List-Received-Date: Wed, 17 Jul 2013 08:19:42 -0000
Content-Type: text/plain

The native/nativesdk overrides of EXTRA_OECONF should take effect before
append operator, otherwise, it will cause EXTRA_OECONF be overridden instead
of be appended at native/nativesdk build time.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/recipes-core/util-linux/util-linux_2.23.1.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.23.1.bb b/meta/recipes-core/util-linux/util-linux_2.23.1.bb
index 12f5021..ae80450 100644
--- a/meta/recipes-core/util-linux/util-linux_2.23.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.23.1.bb
@@ -18,5 +18,5 @@ SRC_URI[md5sum] = "6741eeaff93ff5a6bacdd3816bdd87c4"
 SRC_URI[sha256sum] = "ad4a7831d7b27d0172996fd343e809716c2403b32a94e15194d8ea797223c4af"
 
 CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=as"
-EXTRA_OECONF_class-native += "--disable-fallocate --disable-use-tty-group"
-EXTRA_OECONF_class-nativesdk += "--disable-fallocate --disable-use-tty-group"
+EXTRA_OECONF_append_class-native += "--disable-fallocate --disable-use-tty-group"
+EXTRA_OECONF_append_class-nativesdk += "--disable-fallocate --disable-use-tty-group"
-- 
1.7.1


