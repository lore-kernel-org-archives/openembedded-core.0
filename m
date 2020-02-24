Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4E2906154A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 03:12:28 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id z12so4378174pgl.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 19:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=tQDQVPp71+KDMTmcXEmDk39J/+qwBSlvRBS0l4IZgF8=;
	b=nDEgIop2a7jeqEgRNu0jBgmkb5sBRJ/KB0b6lna6xi9zuUcGwxqSTuXihzV57wJGC0
	YecunIvZNRHe6XhnEd5rS41NEqK3vKnvQJ794nsfH3897WZC4x3JBEHssaILlcwRVtTA
	b6u62ZY2r9VWj4z/heFZ6IiJzeoMwxqkVRKW4wZ6ECaM5UIPa5eYfUT+OO3aXZPBMCWV
	xrhbeSqaTw0T4t1Z4DsO2E2fPMQp/idfsgXbm1DZnz5jRGdhuZIqiJ0SB6oCGv/2u8uh
	JTrIIKNz+reExRhmDJMeYr0EoHiuKxiLs1dyMDsONQkNKQmToRjnZmtFPqpORuSX8rhV
	15Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=tQDQVPp71+KDMTmcXEmDk39J/+qwBSlvRBS0l4IZgF8=;
	b=AuZ7m4FC+6pMYYUm4s4x13qtebe0j4dwhNv8ETYcXidjNT3KpyIREASkdEE2kiCFZA
	KuWAWy7F0jlee1v6bV1XyXJWtXCnrbnODVTDEO0jexAkvcjbHYRYqVMQQ3wE7N9OFxAa
	OvtHzZlaIcPLzbzlSDg74hVNJcgNhS3DczZm0K8Z/wm6J+had8FeaEEthHuTwCFs7Su+
	6zqweJZanYVMXhgB7E/2fwby2orf0UkaIObxjUkqOB3aH/1UA16ZUpVEosT5/Saks3M1
	wLkWUcPiyLhzHXlpSDDPm1mfLDexjb+Ujw9cvi9Sp61qm0gfuZaed/4IYpfSxTTdhVSI
	faAg==
X-Gm-Message-State: APjAAAXCCdqvRBzulBDitoSkxLG0QRJCtU7PK8Xlhw6XaHh2blCkzYI+
	VyT0rS78vFA6mr7EJZMqwTPIIGgd
X-Google-Smtp-Source: APXvYqwjGuM2p40z9w1/2tlwA2OcfGU1rIUIT96g3QJsh5N0N/OGQooUES/WzXhObkEuBHo0YOfLoQ==
X-Received: by 2002:a63:7c16:: with SMTP id x22mr51161972pgc.335.1582513948852;
	Sun, 23 Feb 2020 19:12:28 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:7dff:acc3:c23d:7c90])
	by smtp.gmail.com with ESMTPSA id
	f8sm10049668pjg.28.2020.02.23.19.12.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 23 Feb 2020 19:12:28 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Feb 2020 19:12:26 -0800
Message-Id: <20200224031226.6965-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] e2fsprogs: update to 1.45.5
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
X-List-Received-Date: Mon, 24 Feb 2020 03:12:28 -0000

Dropping patch 0001-misc-create_inode.c-set-dir-s-mode-correctly.patch as upstream has not been accepted for over 2 years and we should not carry it if upstream has not taking it after all that time.

Includes: CVE-2019-5188

see http://e2fsprogs.sourceforge.net/e2fsprogs-release.html#1.45.5 for more information.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...ate_inode.c-set-dir-s-mode-correctly.patch | 41 -------------------
 ...2fsprogs_1.45.4.bb => e2fsprogs_1.45.5.bb} |  3 +-
 2 files changed, 1 insertion(+), 43 deletions(-)
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-set-dir-s-mode-correctly.patch
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.45.4.bb => e2fsprogs_1.45.5.bb} (97%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-set-dir-s-mode-correctly.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-set-dir-s-mode-correctly.patch
deleted file mode 100644
index fc4a5409860..00000000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-set-dir-s-mode-correctly.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From f6d188580c2c9599319076fee22f2424652c711c Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Wed, 13 Sep 2017 19:55:35 -0700
-Subject: [PATCH] misc/create_inode.c: set dir's mode correctly
-
-The dir's mode has been set by ext2fs_mkdir() with umask, so
-reset it to the source's mode in set_inode_extra().
-
-Fixed when source dir's mode is 521, but tarball would be 721, this was
-incorrect.
-
-Upstream-Status: Submitted
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- misc/create_inode.c | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/misc/create_inode.c b/misc/create_inode.c
-index 8ce3faf..50fbaa8 100644
---- a/misc/create_inode.c
-+++ b/misc/create_inode.c
-@@ -116,7 +116,14 @@ static errcode_t set_inode_extra(ext2_filsys fs, ext2_ino_t ino,
- 
- 	inode.i_uid = st->st_uid;
- 	inode.i_gid = st->st_gid;
--	inode.i_mode |= st->st_mode;
-+	/*
-+	 * The dir's mode has been set by ext2fs_mkdir() with umask, so
-+	 * reset it to the source's mode
-+	 */
-+	if S_ISDIR(st->st_mode)
-+		inode.i_mode = LINUX_S_IFDIR | st->st_mode;
-+	else
-+		inode.i_mode |= st->st_mode;
- 	inode.i_atime = st->st_atime;
- 	inode.i_mtime = st->st_mtime;
- 	inode.i_ctime = st->st_ctime;
--- 
-2.10.2
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.5.bb
similarity index 97%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.5.bb
index 6e69eea21c3..7cd42b8137a 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.5.bb
@@ -4,7 +4,6 @@ SRC_URI += "file://remove.ldconfig.call.patch \
            file://run-ptest \
            file://ptest.patch \
            file://mkdir_p.patch \
-           file://0001-misc-create_inode.c-set-dir-s-mode-correctly.patch \
            file://0001-configure.ac-correct-AM_GNU_GETTEXT.patch \
            file://0001-intl-do-not-try-to-use-gettext-defines-that-no-longe.patch \
            "
@@ -13,7 +12,7 @@ SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permissio
                                 file://quiet-debugfs.patch \
 "
 
-SRCREV = "984ff8d6a0a1d5dc300505f67b38ed5047d51dac"
+SRCREV = "c2b1ec5fbc99ab8a2b71dae45d486b3ea004f618"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
-- 
2.17.1


