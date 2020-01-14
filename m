Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2B4727FA45
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 14:00:18 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id p17so13873733wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 06:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jGc1hT9KR0qEaWxXCXOqGeq3CD8I7AlJHyIcr5uP7wc=;
	b=XKbmIYc1mU5MiewF+LEPSjHphQPJ1lpMkGsBiF69qXgS+Ie1aCkB49nBtmycZD7cM/
	MyIFOSzQMoP5CBBekiXGoIXdiKvAoN+HVHOYgWjbpx70BW3NBbu0OlKWk9eAOyLqJ+u5
	8xO/fySy+RsMZoq+QdRy5BrgTgnVRlVZ1uJwdtVd/Wr5/CLBLkHJM0kc/lyKgVsPFKet
	jYJZLHpr0DiqCRep4YOm05bB0uw8mnOJUYortcTNfDDN5kRRs1FHKiqNLuCT7zn7y2+q
	Ifzq348r8TFcuxBX6oZX9fjiBaIGUxs4CsoTATxENbuilerKMHKkcxdGMfYaQBZNavCH
	wW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jGc1hT9KR0qEaWxXCXOqGeq3CD8I7AlJHyIcr5uP7wc=;
	b=dO9Wl//NOKCvBgrvJbdrpDebo+0eWjQyx+0gGvh4Key8jyKdJBNdMZhicSNHVp7RCH
	JrE4hhbDzthwgfyL1FgmxoWtBW5E76KaRshdyU5jeOwKkHyv8EMc4HVPZe7dUmsM/svL
	rhjIkoieTViob2yVMBudQuTJJWNeg1pGmlDSZPi707H0M/9Fw+ftT3Xts3WHtqkSl6eV
	Sb+n88V+ZGLAhId03j/kGoHRP63Vn65vSzaLJ3G1irPpz8nQc4aURPFa5Hb+yPjCtmgt
	sZNFs1uaECFu3M/1k2KvP5EvQ/46vzsLzxaYxSXnw35kvwKGU/HfJu9vpLGAw4DqrZnA
	I06A==
X-Gm-Message-State: APjAAAW4V5RtOBIaDqjgymofRN0MV5dWoMMi8xu5N5GGpto7lOpUot5l
	328KPVwxHtBzMNSvP4PiYSCK2AwK
X-Google-Smtp-Source: APXvYqzl1srPEoaWo4JnpKzGRLG9H/hokvIc54VV+fUGJ8/7gaEL7Q2XiL1JKZK+B/gUwGhNXChh9w==
X-Received: by 2002:a1c:f001:: with SMTP id a1mr25900192wmb.76.1579010418667; 
	Tue, 14 Jan 2020 06:00:18 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	r62sm20147333wma.32.2020.01.14.06.00.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 06:00:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2020 14:59:54 +0100
Message-Id: <20200114140007.36622-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200114140007.36622-1-alex.kanavin@gmail.com>
References: <20200114140007.36622-1-alex.kanavin@gmail.com>
Subject: [PATCH 07/20] pseudo: adjust for attr 2.4.48
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
X-List-Received-Date: Tue, 14 Jan 2020 14:00:18 -0000

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


