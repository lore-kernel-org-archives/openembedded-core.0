Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 77DF6785DC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 00:54:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAE0s4Kl022223
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 16:54:04 -0800 (PST)
Received: from pek-lpg-core1.windriver.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Mon, 13 Nov 2017 16:54:03 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Nov 2017 01:58:43 +0800
Message-ID: <204d1f1e04d499a319a39b270bca2c8fbcb0798c.1510595883.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1510595883.git.liezhi.yang@windriver.com>
References: <cover.1510595883.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 03/10] e2fsprogs: 1.43.5 -> 1.43.7
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
X-List-Received-Date: Tue, 14 Nov 2017 00:54:03 -0000
Content-Type: text/plain

Remove reproducible-doc.patch which is already in the source.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../e2fsprogs/e2fsprogs/reproducible-doc.patch      | 21 ---------------------
 .../{e2fsprogs_1.43.5.bb => e2fsprogs_1.43.7.bb}    |  3 +--
 2 files changed, 1 insertion(+), 23 deletions(-)
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/reproducible-doc.patch
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.43.5.bb => e2fsprogs_1.43.7.bb} (97%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/reproducible-doc.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/reproducible-doc.patch
deleted file mode 100644
index 8e5d1d3..0000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/reproducible-doc.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-
-Suppport for binary reproducibility.
-When compressing, do not save the original file name and time stamp.
-
-Upstream-Status: Submitted [Theodore Ts'o tytso@mit.edu (maintainer)]
-
-Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
-
-diff --git a/doc/Makefile.in b/doc/Makefile.in
-index 9cb584c..0bee4e4 100644
---- a/doc/Makefile.in
-+++ b/doc/Makefile.in
-@@ -28,7 +28,7 @@ install-doc-libs: libext2fs.info libext2fs.dvi
- 		$(INSTALL_DATA) $$i $(DESTDIR)$(infodir)/$$i ; \
- 	done
- 	$(E) "	GZIP $(infodir)/libext2fs.info*"
--	-$(Q) gzip -9 $(DESTDIR)$(infodir)/libext2fs.info*
-+	-$(Q) gzip -9 -n $(DESTDIR)$(infodir)/libext2fs.info*
- 
- uninstall-doc-libs:
- 	$(RM) -rf $(DESTDIR)$(infodir)/libext2fs.info*
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.5.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.7.bb
similarity index 97%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.5.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.7.bb
index 00093cc..33a9918 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.5.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.7.bb
@@ -8,13 +8,12 @@ SRC_URI += "file://acinclude.m4 \
             file://mkdir.patch \
             file://Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch \
             file://mkdir_p.patch \
-            file://reproducible-doc.patch \
             file://0001-misc-create_inode.c-set-dir-s-mode-correctly.patch \
 "
 
 SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch"
 
-SRCREV = "2a13c84b513aa094d1cda727e92d35a89dd777da"
+SRCREV = "4c5e6cd6defb83f1b35a5ef6fccd68c86874ee06"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
-- 
2.7.4


