Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9FA3F6DBCF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 07:14:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAL7EbkQ025198
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 23:14:37 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 20 Nov 2013 23:14:37 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <liezhi.yang@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 01:13:57 -0600
Message-ID: <1385018038-23380-12-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1385018038-23380-1-git-send-email-mark.hatle@windriver.com>
References: <1385018038-23380-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [RFC PATCH 11/12] e2fsprogs: enable the "-d" related patches
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
X-List-Received-Date: Thu, 21 Nov 2013 07:14:37 -0000
Content-Type: text/plain

From: Robert Yang <liezhi.yang@windriver.com>

These patches should be enabled at the same time, so enable them in a
single commit, and thus we can disable it easily.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
index d4de9e3..0098f7a 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
@@ -9,6 +9,16 @@ SRC_URI += "file://acinclude.m4 \
             file://debugfs-extent-header.patch \
             file://populate-extfs.sh \
             file://e2fsprogs-fix-tests-f_extent_oobounds.patch \
+            file://0001-mke2fs.c-add-an-option-d-root-directory.patch \
+            file://0002-misc-util.c-implement-populate_fs.patch \
+            file://0003-misc-util.c-create-special-file.patch \
+            file://0004-misc-util.c-create-symlink.patch \
+            file://0005-misc-util.c-copy-regular-file.patch \
+            file://0006-misc-util.c-create-directory.patch \
+            file://0007-misc-util.c-set-more-information-for-inode.patch \
+            file://0008-misc-util.c-handle-hardlinks.patch \
+            file://0009-mke2fs.8.in-update-the-manual-for-the-d-option.patch \
+            file://0010-debugfs-use-the-functions-in-misc-util.c.patch \
 "
 
 SRC_URI[md5sum] = "8ef664b6eb698aa6b733df59b17b9ed4"
-- 
1.8.1.2.545.g2f19ada


