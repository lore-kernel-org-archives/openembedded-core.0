Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id 69DC77FCFD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 17:52:33 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id m13so93656pjb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=JnZz4EeJoLt3IYabQz9WMAJMw16v0gyHQWk0SQyW88Y=;
	b=ISrutmSrmg04wNd7rSj4GUTPnb2ZQ2Sn3URUsqBCwK5l0tNXcvgmya71xYIptXCVOx
	MsEVk8uT3bB31j83hNRctdUHo4IlsdeBNg8UHJlRoQ3l+axirXFLN3ZS+azK8UlqpAkK
	cIpRdqz2oiGVDp+pOJ9PYzAvZwbAuKHdlt+WOCezIRo9Grzmg0QqtwTJxLNLTUs4B9I6
	cyej7VSMg/XH92dX1bcLU3bSkRjwSJDxZTAKr8/OMGFGIfbyNFzwBdpOPRTVg6tw/nZc
	gBY/Wccu+xxogNcmGuPusdolJevYTOXtM5JzYDq5BnwOlYG+zVUvBSpvxOt/rktNGtWA
	liZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JnZz4EeJoLt3IYabQz9WMAJMw16v0gyHQWk0SQyW88Y=;
	b=jOK9WxbZNFGhhQVyxv1gQrZ7CuqRxVwRojhzv7kX7nbhYCK0ZTPdSebeBxpms5IFFO
	6Yzl0Y1SgfPdfN/irWTzu0R48Rd0Ao+3wxJLVDK5cIZiHeExbf4zHt3f3yRlsvjuLzVv
	dyt5HRhp0Tw5hm8A8FNnLBH8mLVUNff08q+VYy8wMN0cQEFmngmxQF39+8hA6HzKecCs
	z2VJ/k5vE2lh6ETl1+7azD3v2zYaUPUqkKcUI2ATjXyW9lqo7ZBj1EmKAFMCbgeKfipf
	92+Ukepuu+/0OIuILOXAl/7sqg88X+UqUW9ZFGb037KCBwlk6afe7aLgG27CuwtXHj2r
	oUqQ==
X-Gm-Message-State: APjAAAW7A/fl0tC4TGdhxxdxOs4EDhwQd0s9WBjm7A3iEBkX09HOG142
	yYmTaoKppmvnfOjlFbcUWfKWNd4/9l4=
X-Google-Smtp-Source: APXvYqxgDwNQev7CEysVZ0YSdsDHR0AG/YrrMaXXz+UYcfbY9cqbqzKQn7km/R7KjBci/WbZEMQVGw==
X-Received: by 2002:a17:902:59c9:: with SMTP id
	d9mr918410plj.184.1579542754175; 
	Mon, 20 Jan 2020 09:52:34 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	68sm38159422pge.14.2020.01.20.09.52.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 09:52:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2020 09:52:28 -0800
Message-Id: <5e4e403bcde3f063d42a082b9865f293ce4fa6ba.1579542573.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1579542573.git.raj.khem@gmail.com>
References: <cover.1579542573.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] tcp-wrappers: Remove redundant forward declarations
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
X-List-Received-Date: Mon, 20 Jan 2020 17:52:33 -0000
Content-Transfer-Encoding: 8bit

fgets is already in stdio.h, and it can confuse the compilers when using
fortified headers, therefore remove the declarations

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-Remove-fgets-extern-declaration.patch | 43 +++++++++++++++++++
 .../tcp-wrappers/tcp-wrappers_7.6.bb          |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Remove-fgets-extern-declaration.patch

diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Remove-fgets-extern-declaration.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Remove-fgets-extern-declaration.patch
new file mode 100644
index 0000000000..88c8d9cae7
--- /dev/null
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Remove-fgets-extern-declaration.patch
@@ -0,0 +1,43 @@
+From 24d10919b4bc5e37a2d80b274d2cd2ee77b03549 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 13 Jan 2020 14:25:47 -0800
+Subject: [PATCH] Remove fgets() extern declaration
+
+These sources already include <stdio.h> which should bring the correct
+declaration
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ hosts_access.c | 1 -
+ misc.c         | 2 --
+ 2 files changed, 3 deletions(-)
+
+diff --git a/hosts_access.c b/hosts_access.c
+index 329b35e..0133e5e 100644
+--- a/hosts_access.c
++++ b/hosts_access.c
+@@ -44,7 +44,6 @@ static char sccsid[] = "@(#) hosts_access.c 1.21 97/02/12 02:13:22";
+ #include <netdb.h>
+ #endif
+ 
+-extern char *fgets();
+ extern int errno;
+ 
+ #ifndef	INADDR_NONE
+diff --git a/misc.c b/misc.c
+index 74ca319..9a5e73a 100644
+--- a/misc.c
++++ b/misc.c
+@@ -18,8 +18,6 @@ static char sccsic[] = "@(#) misc.c 1.2 96/02/11 17:01:29";
+ 
+ #include "tcpd.h"
+ 
+-extern char *fgets();
+-
+ #ifndef	INADDR_NONE
+ #define	INADDR_NONE	(-1)		/* XXX should be 0xffffffff */
+ #endif
+-- 
+2.24.1
+
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
index bd0c84c242..e903b9db14 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -49,6 +49,7 @@ SRC_URI = "http://ftp.porcupine.org/pub/security/tcp_wrappers_${PV}.tar.gz \
            file://0001-Fix-build-with-clang.patch \
            file://fix_warnings.patch \
            file://fix_warnings2.patch \
+           file://0001-Remove-fgets-extern-declaration.patch \
            "
 
 SRC_URI[md5sum] = "e6fa25f71226d090f34de3f6b122fb5a"
-- 
2.25.0


