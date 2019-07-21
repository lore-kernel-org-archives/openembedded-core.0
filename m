Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id CFBEE7EDF1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 14:25:40 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id p184so16119985pfp.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 07:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=OMw1gKFrJZlflO/PxWbrGJ2xFnaYUY3FYuIFJ2AEsrU=;
	b=LYovNO5F+pcZ6t8uB6PgdF6czfS/ZdOG9gykRqJpNhhuYlERLNKXKuv39lIgnWI2oS
	EZlnVOpVOlJGLx45T6KvkTweNuUrUoSsrEAt6Ri+xkDdEtvvUaN3wAroDyLnb1L0TwoI
	moMDhdN8/+Hcklkk8OZHdaJziiYWCiuYNIccV0VNT5qI7iVdTPUob+oTakBx5D+UFWvn
	x+nXGedJ7YWYHSbAYSKpEElDafw4m3CtfQf3jc2SgeX2IurV0m0R32GFoHORKaHqxSDA
	XbDHphj2iRq1RQG4F3DxVKk4aP2FG3utmlQK/qkXMy/laWxWfGfi49a6GNeZLMiGnThk
	ZczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=OMw1gKFrJZlflO/PxWbrGJ2xFnaYUY3FYuIFJ2AEsrU=;
	b=Liq1jSurkNz6U3Ymojamy/Gv6F5Bdg2AUZXS+i7dySwATTtE58zS9foa0CWl9PFqQg
	M+TVrCJGc7snatJyuLj3x9vxyVtnAERq7SrFP3niG61w12VvAZaawjWkuGwccMFPiSvr
	Kj88G6lp0vHpVFuaOOKWjLxhx04ZyKepVEHtLDHkxDTpLSUcJt7mCoOKbDRv/m01nq1p
	oszmtJ1qcX0UMzBLgu5WtJmw4CGttRk90ES6hQ8065rRfr3/cFunV+5JdCRhPMO0S1Yk
	dkGDC3eOXISnEa6Dww+fu+gwFuqcGyGAFEKlcbkJqut2NyuEjJdGZ7DjC7vJgEaU/JWX
	2dEQ==
X-Gm-Message-State: APjAAAXfTNjYAVh5UZJZpuTi/8v/CB1vRxs2yJoqkpKmSAVD8Qcu13ah
	pi8Wa3z6tGjMkTxUQwAYwoXYVXwU
X-Google-Smtp-Source: APXvYqxqFZWjo63f+sgHdJeR+4OXqyBNjrLZ+w5wLS46ea9YXy4l8+3oZLdQuf8TuA0aSdrgLEU+9Q==
X-Received: by 2002:a17:90a:a489:: with SMTP id
	z9mr69052636pjp.24.1563719141879; 
	Sun, 21 Jul 2019 07:25:41 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:bd4d:a6f4:da99:27b4])
	by smtp.gmail.com with ESMTPSA id
	a3sm28807750pfc.70.2019.07.21.07.25.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jul 2019 07:25:41 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Jul 2019 07:25:07 -0700
Message-Id: <fc77edc8245ab90eee1f1e857f470b6842dc256f.1563719003.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1563719003.git.akuster808@gmail.com>
References: <cover.1563719003.git.akuster808@gmail.com>
Subject: [thud] 18/30] Tar: Security fix CVE-2019-0023
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
X-List-Received-Date: Sun, 21 Jul 2019 14:25:41 -0000

From: Armin Kuster <akuster@mvista.com>

Source: tar.git
MR: 97928
Type: Security Fix
Disposition: Backport from http://git.savannah.gnu.org/cgit/tar.git/commit/?id=cb07844454d8cc9fb21f53ace75975f91185a120
ChangeID: 7aee4c0daf8ce813242fe7b872583560a32bc4e3
Description:

Affects tar < 1.32

fixes CVE-2019-9923

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tar/tar/CVE-2019-9923.patch | 38 +++++++++++++++++++++++
 meta/recipes-extended/tar/tar_1.30.bb             |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2019-9923.patch

diff --git a/meta/recipes-extended/tar/tar/CVE-2019-9923.patch b/meta/recipes-extended/tar/tar/CVE-2019-9923.patch
new file mode 100644
index 0000000..146cbff
--- /dev/null
+++ b/meta/recipes-extended/tar/tar/CVE-2019-9923.patch
@@ -0,0 +1,38 @@
+From cb07844454d8cc9fb21f53ace75975f91185a120 Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org>
+Date: Mon, 14 Jan 2019 15:22:09 +0200
+Subject: [PATCH] Fix possible NULL dereference (savannah bug #55369)
+
+* src/sparse.c (pax_decode_header): Check return from find_next_block.
+
+Upstream-Status: Backport
+CVE:  CVE-2019-9923
+Affects: tar < 1.32
+Signed-off-by: Armin kuster <akuster@mvista.com>
+
+---
+ src/sparse.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+Index: tar-1.30/src/sparse.c
+===================================================================
+--- tar-1.30.orig/src/sparse.c
++++ tar-1.30/src/sparse.c
+@@ -1231,6 +1231,8 @@ pax_decode_header (struct tar_sparse_fil
+ 	   set_next_block_after (b);                               \
+            file->dumped_size += BLOCKSIZE;                         \
+            b = find_next_block ();                                 \
++           if (!b)                                                 \
++             FATAL_ERROR ((0, 0, _("Unexpected EOF in archive"))); \
+            src = b->buffer;                                        \
+ 	   endp = b->buffer + BLOCKSIZE;                           \
+ 	 }                                                         \
+@@ -1243,6 +1245,8 @@ pax_decode_header (struct tar_sparse_fil
+       set_next_block_after (current_header);
+       file->dumped_size += BLOCKSIZE;
+       blk = find_next_block ();
++      if (!blk)
++        FATAL_ERROR ((0, 0, _("Unexpected EOF in archive")));
+       p = blk->buffer;
+       COPY_BUF (blk,nbuf,p);
+       if (!decode_num (&u, nbuf, TYPE_MAXIMUM (size_t)))
diff --git a/meta/recipes-extended/tar/tar_1.30.bb b/meta/recipes-extended/tar/tar_1.30.bb
index bd24f47..ab1b33b 100644
--- a/meta/recipes-extended/tar/tar_1.30.bb
+++ b/meta/recipes-extended/tar/tar_1.30.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2 \
            file://remove-gets.patch \
            file://musl_dirent.patch \
+           file://CVE-2019-9923.patch \
 "
 
 SRC_URI[md5sum] = "8404e4c1fc5a3000228ab2b8ad674a65"
-- 
2.7.4


