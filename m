Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8FE597BD97
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 16:53:51 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id d126so1671961pfd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 09:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=OMw1gKFrJZlflO/PxWbrGJ2xFnaYUY3FYuIFJ2AEsrU=;
	b=SN5H6l3dzFSAuSfOa83h+jAvLB2gvVEJfh2dSEtCnhZErKAEjgCxoZNPdyVQ9IfXdu
	siZh16cfZGsDN/dzRTdB6b7hFPlO9bAxtUXF24jueKT0LNkL0U3aNeOf5VZtMGbzMZEZ
	SsGInQJlBPY1dBrZw27OSqb/MdvM6smCL9YoIN9zlRBEkKo034LOEziz7xY0BlFtlmkw
	pJTbo8kK/ZJuZ1hvD8coq4M77dVEmh4RGhUT/+7F2D0eIRwIbPyhrqFjyvO4Qry7K4m5
	kUvzCMWCds8V0bNCn4E4SuTQ+CYA/DRmFHcmitcVGSgCGiEHbXMeLoAoQSdysaOxko+0
	+D6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=OMw1gKFrJZlflO/PxWbrGJ2xFnaYUY3FYuIFJ2AEsrU=;
	b=qtg0JIbBm0tGPSuDf+kZT7frnfsXO/c3mdH/jedVJxYGYgSbmOZCNVnVocvK5w+mDC
	27AaLgRy9PhgMQz461Usq4L5/fJnwk+uzU6kwnDnwi6oCO4SHeXHB7f4Bnq4WyxC25X4
	1rzg/3cf76F5ym4tPC4ob31ctzRRhxC4mAIvR7OXCg6tFv2q9FTbC9Ly59PezEbb8Inm
	4MBrP1O3rOAcODHZax4w9fpGvEb10ZC5rC0s2Ape4oGLJ/mLKOcZ95g7p6Hjs0QTHTvf
	eWDsXPwQHa2anU5KE2WZETcU6+yyim6IBRo1HqtAMoaEunXOqRb9gIjAdBtXkkrhw48f
	QpuA==
X-Gm-Message-State: APjAAAVBaEP2i93VFo3XWzU3a60vJtuNTHgw6Y5AOhfLnYlNICern5Z3
	j5Mkh0ycHQzw84YGBNzUtMJbFk7U8o8=
X-Google-Smtp-Source: APXvYqz3K3Y8nzPOoOuBAwYcQnp+gspZPGlFQXAGChM0g//40vMI0Rn1iLwQ29LBBc+6q0bte1TAyA==
X-Received: by 2002:a17:90a:17c4:: with SMTP id
	q62mr54948pja.104.1561568032600; 
	Wed, 26 Jun 2019 09:53:52 -0700 (PDT)
Received: from localhost.localdomain ([45.19.219.178])
	by smtp.gmail.com with ESMTPSA id
	t11sm15339687pgp.1.2019.06.26.09.53.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Jun 2019 09:53:52 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2019 09:53:19 -0700
Message-Id: <fc77edc8245ab90eee1f1e857f470b6842dc256f.1561566521.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561566521.git.akuster808@gmail.com>
References: <cover.1561566521.git.akuster808@gmail.com>
Subject: [thud][ 18/25] Tar: Security fix CVE-2019-0023
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
X-List-Received-Date: Wed, 26 Jun 2019 16:53:51 -0000

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


