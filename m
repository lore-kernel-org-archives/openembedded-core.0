Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id ACC787FF53
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 14:38:14 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id q9so2083297wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 06:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4XT3yWJmLysqbbUXe/wra2gOk54Upqq84ul+EThRkoI=;
	b=jWtgBHFBUgTuOxU4Q9fb2KVj8aSYVMSiEky1UurhTk9yFmUjF0pcq7lDKaoL/oDlpk
	6+0CqnKJ5i9ZSSNxKLrZHf9xkuZQJ2mrKGeXFvexh58dMimo/iGiS3MlMQ6/2ZUqiBtN
	1R+jOAYdCxTG+H5WS7O3lpjoe0zvPkpZJgLW7JBHVZEpaiyAZxrmLUAZWwfqnEki+8A7
	zI5SNEtnFnxn2MjnRfV2EOIhxwvAWY3ThduZsaEHCOClAMiJlAC2eiAMTgvsLcRJMfc+
	opIBLq/J5GiHMSFp65M6nNBXDT9cHbCGU6J+IqCphew+FByBK6nJ5I4b3eqsE1ERQ1Im
	/cdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4XT3yWJmLysqbbUXe/wra2gOk54Upqq84ul+EThRkoI=;
	b=L85P4rm3yP866kUyBsPPXJV1brqv6jO0B3G7NJA0NgwCY55cY+sW/8MWjLCMbKpQxq
	i++GVC8+8P1h03HQHJNSmxCOqbUnJf3cWTnHexTlRmEMP8eSKEaO9ReMKuatlMU59x5C
	RvFwzAm7ptcL/0Hpcaoxu83MK8Bsk69C1OPXQwJB9O+s3r6oX2jnTRQAd5uPHYCCIxQk
	2PEIGI1BysH2xfU2QDnriG0vkEU54plwEpGcTaMXcGK4v1dtEbT9rxKAEutd0mrGnA0p
	fPgdyMGKkIlBlMYlC4XDcA55JAqkma/Q/N5VbR2a21NDBr4JVKKn2xL7XMwJISSfwzda
	speQ==
X-Gm-Message-State: APjAAAXFqUxvdoSojcZX/Y+xYnvOcv9b7csypzjxjxnDryXDpuI9zxE1
	WkNnDfiHpow3ILOw8QFZSyOeWQBWLyo=
X-Google-Smtp-Source: APXvYqywU0gvcI9U+kKohhYrPRtlYdcpdCuMfzXais5yPO4XODvblpB5KvOd3LE0tFD493edi5qnZQ==
X-Received: by 2002:a1c:a78c:: with SMTP id q134mr3480830wme.98.1576679895335; 
	Wed, 18 Dec 2019 06:38:15 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	d10sm2747313wrw.64.2019.12.18.06.38.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Dec 2019 06:38:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2019 15:37:46 +0100
Message-Id: <20191218143758.129308-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218143758.129308-1-alex.kanavin@gmail.com>
References: <20191218143758.129308-1-alex.kanavin@gmail.com>
Subject: [PATCH 13/25] pseudo: adjust for attr 2.4.48
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
X-List-Received-Date: Wed, 18 Dec 2019 14:38:15 -0000

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
index 1f2df4a427e..6da111232c4 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -8,6 +8,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo \
            file://toomanyfiles.patch \
            file://0001-maketables-wrappers-use-Python-3.patch \
            file://0001-Add-statx.patch \
+           file://0006-xattr-adjust-for-attr-2.4.48-release.patch \
            "
 
 SRCREV = "060058bb29f70b244e685b3c704eb0641b736f73"
-- 
2.17.1


