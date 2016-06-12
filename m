Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6E6EE6FFD8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 08:25:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5C8PJ0c010059
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 01:25:19 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 12 Jun 2016 01:25:19 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 12 Jun 2016 01:25:07 -0700
Message-ID: <651363b0d1ef58b04b96adde325dd9108be40fd7.1465719878.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1465719878.git.liezhi.yang@windriver.com>
References: <cover.1465719878.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 05/11] make: 4.1 -> 4.2
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
X-List-Received-Date: Sun, 12 Jun 2016 08:25:19 -0000
Content-Type: text/plain

Remove backport patch 0001-main.c-main-SV-43434-Handle-NULL-returns-from-ttynam.patch

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../0001-main.c-main-SV-43434-Handle-NULL-returns-from-ttynam.patch | 0
 meta/recipes-devtools/make/{make_4.1.bb => make_4.2.bb}             | 6 ++----
 2 files changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/make/{make-4.1 => make-4.2}/0001-main.c-main-SV-43434-Handle-NULL-returns-from-ttynam.patch (100%)
 rename meta/recipes-devtools/make/{make_4.1.bb => make_4.2.bb} (60%)

diff --git a/meta/recipes-devtools/make/make-4.1/0001-main.c-main-SV-43434-Handle-NULL-returns-from-ttynam.patch b/meta/recipes-devtools/make/make-4.2/0001-main.c-main-SV-43434-Handle-NULL-returns-from-ttynam.patch
similarity index 100%
rename from meta/recipes-devtools/make/make-4.1/0001-main.c-main-SV-43434-Handle-NULL-returns-from-ttynam.patch
rename to meta/recipes-devtools/make/make-4.2/0001-main.c-main-SV-43434-Handle-NULL-returns-from-ttynam.patch
diff --git a/meta/recipes-devtools/make/make_4.1.bb b/meta/recipes-devtools/make/make_4.2.bb
similarity index 60%
rename from meta/recipes-devtools/make/make_4.1.bb
rename to meta/recipes-devtools/make/make_4.2.bb
index 78fe0b5..6327d6c 100644
--- a/meta/recipes-devtools/make/make_4.1.bb
+++ b/meta/recipes-devtools/make/make_4.2.bb
@@ -4,11 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://glob/COPYING.LIB;md5=4a770b67e6be0f60da244beb2de0fce4"
 require make.inc
 
-SRC_URI += "file://0001-main.c-main-SV-43434-Handle-NULL-returns-from-ttynam.patch"
-
 EXTRA_OECONF += "--without-guile"
 
-SRC_URI[md5sum] = "57a7a224a822f94789a587ccbcedff69"
-SRC_URI[sha256sum] = "0bc7613389650ee6a24554b52572a272f7356164fd2c4132b0bcf13123e4fca5"
+SRC_URI[md5sum] = "85ad14d08766201ffe71efa866f4fb91"
+SRC_URI[sha256sum] = "4e5ce3b62fe5d75ff8db92b7f6df91e476d10c3aceebf1639796dc5bfece655f"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.8.0


