Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E45987E6EE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 01:54:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5C1sqXM025580
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 18:54:53 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Tue, 11 Jun 2019 18:54:51 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Jun 2019 10:06:33 +0800
Message-ID: <6c141cf1421c58dd5fed46481b94c82143628bab.1560305170.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1560305170.git.Qi.Chen@windriver.com>
References: <cover.1560305170.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] util-linux: upgrade to 2.33.2
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
X-List-Received-Date: Wed, 12 Jun 2019 01:54:52 -0000
Content-Type: text/plain

The license files' names are changed, but the contents remain the
same.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc              | 16 ++++++++--------
 .../{util-linux_2.32.1.bb => util-linux_2.33.2.bb}       |  4 ++--
 2 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux_2.32.1.bb => util-linux_2.33.2.bb} (72%)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 7b9b4d2..eaaf408 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -8,15 +8,15 @@ SECTION = "base"
 
 LICENSE = "GPLv2+ & LGPLv2.1+ & BSD"
 
-LIC_FILES_CHKSUM = "file://README.licensing;md5=1715f5ee3e01203ca1e1e0b9ee65918c \
+LIC_FILES_CHKSUM = "file://README.licensing;md5=972a134f1e14b2b060e365df2fab0099 \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://Documentation/licenses/COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://Documentation/licenses/COPYING.LGPLv2.1;md5=4fbd65380cdd255951079008b364516c \
-                    file://Documentation/licenses/COPYING.BSD-3;md5=58dcd8452651fc8b07d1f65ce07ca8af \
-                    file://Documentation/licenses/COPYING.UCB;md5=263860f8968d8bafa5392cab74285262 \
-                    file://libuuid/COPYING;md5=b442ffb762cf8d3e9df1b99e0bb4af70 \
-                    file://libmount/COPYING;md5=fb93f01d4361069c5616327705373b16 \
-                    file://libblkid/COPYING;md5=fb93f01d4361069c5616327705373b16"
+                    file://Documentation/licenses/COPYING.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://Documentation/licenses/COPYING.LGPL-2.1-or-later;md5=4fbd65380cdd255951079008b364516c \
+                    file://Documentation/licenses/COPYING.BSD-3-Clause;md5=58dcd8452651fc8b07d1f65ce07ca8af \
+                    file://Documentation/licenses/COPYING.BSD-4-Clause-UC;md5=263860f8968d8bafa5392cab74285262 \
+                    file://libuuid/COPYING;md5=6d2cafc999feb2c2de84d4d24b23290c \
+                    file://libmount/COPYING;md5=7c7e39fb7d70ffe5d693a643e29987c2 \
+                    file://libblkid/COPYING;md5=693bcbbe16d3a4a4b37bc906bc01cc04"
 
 #gtk-doc is not enabled as it requires xmlto which requires util-linux
 inherit autotools gettext manpages pkgconfig systemd update-alternatives python3-dir bash-completion ptest
diff --git a/meta/recipes-core/util-linux/util-linux_2.32.1.bb b/meta/recipes-core/util-linux/util-linux_2.33.2.bb
similarity index 72%
rename from meta/recipes-core/util-linux/util-linux_2.32.1.bb
rename to meta/recipes-core/util-linux/util-linux_2.33.2.bb
index e0bd383..538e276 100644
--- a/meta/recipes-core/util-linux/util-linux_2.32.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.33.2.bb
@@ -9,5 +9,5 @@ SRC_URI += "file://configure-sbindir.patch \
             file://avoid_parallel_tests.patch \
             file://check-for-_HAVE_STRUCT_TERMIOS_C_OSPEED.patch \
 "
-SRC_URI[md5sum] = "9e5b1b8c1dc99455bdb6b462cf9436d9"
-SRC_URI[sha256sum] = "86e6707a379c7ff5489c218cfaf1e3464b0b95acf7817db0bc5f179e356a67b2"
+SRC_URI[md5sum] = "91653b90fcbe9c161153e39b8cc69fb5"
+SRC_URI[sha256sum] = "631be8eac6cf6230ba478de211941d526808dba3cd436380793334496013ce97"
-- 
1.9.1


