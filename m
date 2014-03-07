Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 531276F695
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 07:00:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s27704Wr017147
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Mar 2014 23:00:04 -0800 (PST)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 6 Mar 2014 23:00:00 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Mar 2014 01:59:33 -0500
Message-ID: <a9d1eeeadbd96d90bbbfd53e90227fa80d352e14.1394174908.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1394174908.git.liezhi.yang@windriver.com>
References: <cover.1394174908.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 12/14] e2fsprogs: enable the "-d" related patches
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
X-List-Received-Date: Fri, 07 Mar 2014 07:00:03 -0000
Content-Type: text/plain

These patches should be enabled at the same time, so enable them in a
single commit, and thus we can disable it easily.

[YOCTO #4083]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
index 0c8ec71..b369038 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
@@ -6,6 +6,17 @@ SRC_URI += "file://acinclude.m4 \
             file://fix-icache.patch \
             file://populate-extfs.sh \
             file://quiet-debugfs.patch \
+            file://0001-mke2fs-add-the-ability-to-copy-files-from-a-given-di.patch \
+            file://0002-misc-create_inode.c-copy-files-recursively.patch \
+            file://0003-misc-create_inode.c-create-special-file.patch \
+            file://0004-misc-create_inode.c-create-symlink.patch \
+            file://0005-misc-create_inode.c-copy-regular-file.patch \
+            file://0006-misc-create_inode.c-create-directory.patch \
+            file://0007-misc-create_inode.c-set-owner-mode-time-for-the-inod.patch \
+            file://0008-mke2fs.c-add-an-option-d-root-directory.patch \
+            file://0009-misc-create_inode.c-handle-hardlinks.patch \
+            file://0010-debugfs-use-the-functions-in-misc-create_inode.c.patch \
+            file://0011-mke2fs.8.in-update-the-manual-for-the-d-option.patch \
 "
 
 SRC_URI[md5sum] = "3f8e41e63b432ba114b33f58674563f7"
-- 
1.7.10.4


