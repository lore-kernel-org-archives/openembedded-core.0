Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 180A17F7A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:20:02 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id q26so1850631pfn.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=O3Tc2HaSC4J+5GQ6YmhGULcPN4Upqm0aEKS2H+u8eXA=;
	b=b+x1eb9LOnjM/2dUBLZPnRSJE3o8GHupxsnvDW7TK97qX4YCb19nDj/n0Xf1qASBUr
	xWawabVoP32AuQHsA3UYWcg/Qxi5RvjKj5yqvF5BSDqMAeIYktxmDHoX562IxINeUtsm
	miQ5gCp5LvcT+sZnEhAhHj7X9lTw9hdVij5zR8Xkq9jXkSHAA9HxU1mMIarRSG/giHhA
	eitD0P59kecp4VNPMeKpEe3LXp1eyjJGQAJvicX/slB4d42fBF3iMM+bspPAvzu9QFUs
	hp+9NTEsQoIo1fKoiTzMJurJ2IMXfxbnj0VLZ/PwybeB7M+SOMvk1K5hRaflRKuJ9FvV
	Oq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=O3Tc2HaSC4J+5GQ6YmhGULcPN4Upqm0aEKS2H+u8eXA=;
	b=ipJY6rON/NQmFpjQOe9W5Q/i5OHpOoefnvYdrNwZsq+xiZx99aYZPmq9X3HXv0ssY7
	9Tifpo9fjzyb6bklwYD7rDejEeXJwgkDgZtEgCMNEDgsvv1yob4Cl3mNKf46+Cebkjii
	Dp49yzWm62esWvPfZYjzOvwbCagi+O3D9mCc5hbn42qGqGe6aEsEwCiuD0UyznufIUqF
	udAYJXFxAGYE0XYKM6W5Lw30Rm/DqTpjOFlWBOu/KJoQFURSuLf8o4XdViKYrY6X+AT9
	pAjXdvFo4WgfxGGFnqSDIIrDV120rsPjVFyJGBuCfEaEpYINtggY4hhm6Dz7Elc1p644
	3sxQ==
X-Gm-Message-State: APjAAAVK/9a2sOIEIiP83L9aI8GtyeL7VFLny24Dgo4Bfux4RjA1r8mQ
	X+vNBBcnEZKWRGS1eoad2v5JK2u+
X-Google-Smtp-Source: APXvYqxrlPUN7TWpV21Ulr0EfOetqCgFRkmjKxGFRCSi1zeUKL9R8lKgSl7hfR26mabXF/MQp8LBfA==
X-Received: by 2002:a17:90a:1b69:: with SMTP id
	q96mr5649093pjq.89.1573658403210; 
	Wed, 13 Nov 2019 07:20:03 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id t8sm2622242pjr.25.2019.11.13.07.20.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:20:02 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:19:20 -0800
Message-Id: <c2c6f30554f96e551b71b3d66fb599a5d28a10bb.1573658232.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658232.git.akuster808@gmail.com>
References: <cover.1573658232.git.akuster808@gmail.com>
Subject: [warrior 17/25] python3: Fix .pyc file reproduciblility
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
X-List-Received-Date: Wed, 13 Nov 2019 15:20:03 -0000

From: Joshua Watt <jpewhacker@gmail.com>

Applies a patch to python that makes the pre-compiled .pyc files
generated during the build reproducible.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...-Use-FLAG_REF-always-for-interned-strings.patch | 35 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.7.4.bb      |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch

diff --git a/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch b/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch
new file mode 100644
index 0000000..8fcb344
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch
@@ -0,0 +1,35 @@
+From 6c8ea7c1dacd42f3ba00440231ec0e6b1a38300d Mon Sep 17 00:00:00 2001
+From: Inada Naoki <songofacandy@gmail.com>
+Date: Sat, 14 Jul 2018 00:46:11 +0900
+Subject: [PATCH] Use FLAG_REF always for interned strings
+
+Upstream-status: Submitted [https://github.com/python/cpython/pull/8226]
+Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+---
+ Python/marshal.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/Python/marshal.c b/Python/marshal.c
+index 6d06266c6a..51db2e3b2e 100644
+--- a/Python/marshal.c
++++ b/Python/marshal.c
+@@ -275,9 +275,14 @@ w_ref(PyObject *v, char *flag, WFILE *p)
+     if (p->version < 3 || p->hashtable == NULL)
+         return 0; /* not writing object references */
+ 
+-    /* if it has only one reference, it definitely isn't shared */
+-    if (Py_REFCNT(v) == 1)
++    /* If it has only one reference, it definitely isn't shared.
++     * But we use TYPE_REF always for interned string, to PYC file stable
++     * as possible.
++     */
++    if (Py_REFCNT(v) == 1 &&
++            !(PyUnicode_CheckExact(v) && PyUnicode_CHECK_INTERNED(v))) {
+         return 0;
++    }
+ 
+     entry = _Py_HASHTABLE_GET_ENTRY(p->hashtable, v);
+     if (entry != NULL) {
+-- 
+2.21.0
+
diff --git a/meta/recipes-devtools/python/python3_3.7.4.bb b/meta/recipes-devtools/python/python3_3.7.4.bb
index e9ec604..bd86d51 100644
--- a/meta/recipes-devtools/python/python3_3.7.4.bb
+++ b/meta/recipes-devtools/python/python3_3.7.4.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 	   file://0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch \
 	   file://crosspythonpath.patch \
            file://reformat_sysconfig.py \
+           file://0001-Use-FLAG_REF-always-for-interned-strings.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.7.4


