Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id C51177FC92
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 13:28:12 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id y17so3390096wrh.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 05:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jGc1hT9KR0qEaWxXCXOqGeq3CD8I7AlJHyIcr5uP7wc=;
	b=PQvbPKLnLy+oH1hcmEWvF2d2my6qjaAdox/ZXkRtIQHSGdoe3V+6c4lQmbsUBlK68P
	T5/vCCwPxGPQVDfYWULfWYtxR0lwhyMsh4DX4pN4mI8RHnQteVpKiSbxb8eiJ2jMgRwt
	qtwde/qgoxL62RC3v2WMPYMGtkBHltrHMAI8L0fZso78e/eXf0QfK6nYjS4S7ZkNudeQ
	4Lj0zsSMr03FLzKRR5Xk504RHzlnwa6MbpvB+00B8kn+gviMcsnc2ObjCfz0SzLZXL+x
	13GHOXb1ZyFb2klA4e/CtqN1R9Lf+CiDRk4WHnzr0lm63QIHbt3wZfpY34BzuoA6NPyt
	OkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jGc1hT9KR0qEaWxXCXOqGeq3CD8I7AlJHyIcr5uP7wc=;
	b=Sb0C2swyOQS5gCeD+LaGz8VaIzfxEkxSshkZ9OokiCXuatG95xDTnPZ/lYB7EeUc6V
	9gI/B+bg6Py0VjQeeXNnmMaOFXNj1rq3g1WgSnymYrN86KltOz8hcyE+VcDZMKlqJrs/
	OD8LFwROBPbJ2PbtKrQ819HuIMBmjdQq5V5wlriNzHcnO9J7uFTYCqV1fSrQ6TKIzdq4
	CSNcq2hOPjDH2CeGUXZKsfoJZ55UCui7fTv14QMHBsRBUftKAi7AWLFZaq2awuh35NEQ
	HH0Kd1vrFwJxz/S6AvOwELGrmfyr3pQpvb7KxltHKAWtNbOnlDR7x8tFHnq6DzkAyMn6
	yPZQ==
X-Gm-Message-State: APjAAAUFPNq+Nyyv7XBmhIreO5JQvihf6Ey73RERy+PJsTQUcU5EY+dv
	Nczh7KgxFrLeS87hLgYSuKbOutlp/IY=
X-Google-Smtp-Source: APXvYqxFZ4tEWXBLZdnc289pYLGaX9rJPOW+BtvntV8NoWd3fvV5TV5DX1jzGhMPw8lKJHYwureA3g==
X-Received: by 2002:a5d:6211:: with SMTP id y17mr4565072wru.344.1578490093354; 
	Wed, 08 Jan 2020 05:28:13 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	x10sm4607028wrp.58.2020.01.08.05.28.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 05:28:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2020 14:27:39 +0100
Message-Id: <20200108132759.95603-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108132759.95603-1-alex.kanavin@gmail.com>
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
Subject: [PATCH 08/28] pseudo: adjust for attr 2.4.48
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
X-List-Received-Date: Wed, 08 Jan 2020 13:28:13 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...xattr-adjust-for-attr-2.4.48-release.patch | 48 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/0006-xattr-adjust-for-attr-2.4.48-release.patch

diff --git a/meta/recipes-devtools/pseudo/files/0006-xattr-adjust-for-attr-2.4.48-release.patch b/meta/recipes-devtools/pseudo/files/0006-xattr-adjust-for-attr-2.4.48-release.patch
new file mode 100644
index 00000000000..161357d5530
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0006-xattr-adjust-for-attr-2.4.48-release.patch
@@ -0,0 +1,48 @@
+From 93d95ed2eaedcca110c214e1fe3f8896b1f6f853 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 17 Dec 2019 20:24:27 +0100
+Subject: [PATCH] xattr: adjust for attr 2.4.48 release
+
+Latest versions of attr have removed the xattr.h header,
+with the rationale that libc is providing the same wrappers.
+
+attr/attributes.h is providing the ENOATTR definition.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ ports/linux/subports         | 5 +++--
+ ports/linux/xattr/portdefs.h | 3 ++-
+ 2 files changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/ports/linux/subports b/ports/linux/subports
+index 2c43ac9..740ec83 100755
+--- a/ports/linux/subports
++++ b/ports/linux/subports
+@@ -29,11 +29,12 @@ fi
+ if	$port_xattr; then
+ 	cat > dummy.c <<EOF
+ #include <sys/types.h>
+-#include <attr/xattr.h>
++#include <sys/xattr.h>
++#include <attr/attributes.h>
+ int i;
+ EOF
+ 	if ! ${CC} -c -o dummy.o dummy.c >/dev/null 2>&1; then
+-		echo >&2 "Warning: Can't compile trivial program using <attr/xattr.h>".
++		echo >&2 "Warning: Can't compile trivial program using <attr/attributes.h>".
+ 		echo >&2 "         xattr support will require that header."
+ 	fi
+ 	echo "linux/xattr"
+diff --git a/ports/linux/xattr/portdefs.h b/ports/linux/xattr/portdefs.h
+index 56cd3ca..068d39a 100644
+--- a/ports/linux/xattr/portdefs.h
++++ b/ports/linux/xattr/portdefs.h
+@@ -2,5 +2,6 @@
+  * SPDX-License-Identifier: LGPL-2.1-only
+  *
+  */
+-#include <attr/xattr.h>
++#include <sys/xattr.h>
++#include <attr/attributes.h>
+ #include <stdint.h>
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 7c75293ef17..d921d85a05c 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -9,6 +9,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo \
            file://0001-maketables-wrappers-use-Python-3.patch \
            file://0001-Add-statx.patch \
            file://0001-realpath.c-Remove-trailing-slashes.patch \
+           file://0006-xattr-adjust-for-attr-2.4.48-release.patch \
            "
 
 SRCREV = "060058bb29f70b244e685b3c704eb0641b736f73"
-- 
2.17.1


