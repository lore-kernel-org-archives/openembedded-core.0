Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 23E7B7489E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2018 19:13:05 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id ay10-v6so432337plb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 May 2018 12:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8lkmZ6q/x1fUh6E27jHSijdE/x9fx7u22sqvA2MAlYQ=;
	b=HJ+Uou3hMY+0TRvqNpyXBfNLao4KhK11jU6IkfZ3bJ5o3ZRQyX9Qt2DkYwJQBl4kEC
	v5MITn2a/m46T8bWI27lunq0c5+7eLQlF4kMlLye4ArOFWfRlZtXpiLouT9EbSOesCuz
	blI/3n2LUUWdXxrxOaOMX3sOHm+wpNZ6vqYJCvWA16HFvAWRwDPbEZNQPjhd9RVwPnvW
	I0U7x0SnBbRSNewraM2YZJBZm20nao5P695EiOKrTGFSK6KoJ5Dusyij/0wLNbiU2ZMu
	XGyTnPSfZUcr78TmfHdKqx2yaGA5kXq+2PSd0DA4Jwaw4mI9CMN9WmZsC+FewatlYB4X
	StMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8lkmZ6q/x1fUh6E27jHSijdE/x9fx7u22sqvA2MAlYQ=;
	b=S8vkTyk2qVuFtV3Kf7MvVf5FYxvfNIbLx+ZSLUEzt7IyRyTqWb+/DZlaQxyI3T0KUO
	i2SEE8jXF9Du65zQAGyQ506Ek96oYtfDZAuqXJhrK9pDm1C9Z8klmTRe6bripE0Hqu/J
	NnWebpitkQzSC6weB5unTzugLdXMe5hJHJgPrNb8Jx1Tktag7livO8S0/04zvypyrlGt
	2Ckas8AsdoCjjafSxmgr5HnBI3ZKTov5btgAfuNnB4LTr+arA1zoOAnfwP2M0dcH8zRE
	QK31vLdDTVkMyh+fvP62ZsSKci1XpsNTiWkYwaGbfooduggPN7xOdeyMvfQuv3AolbMz
	75Ew==
X-Gm-Message-State: ALQs6tDljkgOSvzLTj8j4UrEtQgOVECdoXW9TKefyjKd/+7L+BOz0qkL
	qx+dOQaUuXsyLIPK6tpMjeUjmw==
X-Google-Smtp-Source: AB8JxZpvDBhC5j2mxTnk9ErK7Rnssfwgq12uxUM/RYjY9yOeJpcUZ61bfT9PF/aO6ZyTyCYGMy6+wg==
X-Received: by 2002:a17:902:108a:: with SMTP id
	c10-v6mr39774185pla.111.1525720386489; 
	Mon, 07 May 2018 12:13:06 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	a77sm12976074pfe.70.2018.05.07.12.13.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 May 2018 12:13:05 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 May 2018 12:12:59 -0700
Message-Id: <1525720379-30070-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] gcc7: drop stray uClibc specific patch
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
X-List-Received-Date: Mon, 07 May 2018 19:13:06 -0000

The patch seems to have been left behind when other uClibc specific
patches were purged from gcc in:

  http://git.openembedded.org/openembedded-core/commit/?id=ec03023d2165b49a52b83bac1ea2f0bfded7b852

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-7.3.inc              |  1 -
 .../gcc/gcc-7.3/0008-c99-snprintf.patch            | 28 ----------------------
 2 files changed, 29 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0008-c99-snprintf.patch

diff --git a/meta/recipes-devtools/gcc/gcc-7.3.inc b/meta/recipes-devtools/gcc/gcc-7.3.inc
index d968c32..faf0622 100644
--- a/meta/recipes-devtools/gcc/gcc-7.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-7.3.inc
@@ -32,7 +32,6 @@ BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
 SRC_URI = "\
            ${BASEURI} \
            file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
-           file://0008-c99-snprintf.patch \
            file://0009-gcc-poison-system-directories.patch \
            file://0010-gcc-poison-dir-extend.patch \
            file://0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch \
diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0008-c99-snprintf.patch b/meta/recipes-devtools/gcc/gcc-7.3/0008-c99-snprintf.patch
deleted file mode 100644
index ebd562b..0000000
--- a/meta/recipes-devtools/gcc/gcc-7.3/0008-c99-snprintf.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 732f10eead61830a8aee1bf38cce892da25c35b1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 08:49:03 +0400
-Subject: [PATCH 08/47] c99-snprintf
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- libstdc++-v3/include/c_std/cstdio | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libstdc++-v3/include/c_std/cstdio b/libstdc++-v3/include/c_std/cstdio
-index 43969892aa2..12148457909 100644
---- a/libstdc++-v3/include/c_std/cstdio
-+++ b/libstdc++-v3/include/c_std/cstdio
-@@ -144,7 +144,7 @@ namespace std
-   using ::vsprintf;
- } // namespace std
- 
--#if _GLIBCXX_USE_C99_STDIO
-+#if _GLIBCXX_USE_C99_STDIO || defined(__UCLIBC__)
- 
- #undef snprintf
- #undef vfscanf
--- 
-2.12.2
-
-- 
1.9.1


