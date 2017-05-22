Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2654977F6B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 05:01:18 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id e193so70358389pfh.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 May 2017 22:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=m+LAqVQp8kxx2WsJwhcTdUjXPFALK2CoNkfJRo9pSfU=;
	b=hABkE3UFEYmdoOAtP14zEUtunSQdEhrRNdunKCvyMKnxw1zlG+NKt4ZgIkA2DKKsEx
	9LlJTVbpDF6pjzI8xdB/t79spECuM9r+9qnvwzGxvFwNz/GykcneK0ou9FUN+1tOzJps
	fgTpR1eE/b5DBIqlBlVtzQVg1CAWBd6IF2O/bHmlKufF05HExxpdojktYekhy7f2FT4q
	QpZgpLUO2Iozj/Msk70iOpf52D0/SfovGMrFyR4sJhmJuDKAOB6hcto3PUiSj9o/W/7i
	SE7OnRAyhxvNIf3xP1cktmKGHUgOXyHRVYIu2Hg4CwR4ELfX1yFueXzNyLZLOPxcQAk+
	0DEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=m+LAqVQp8kxx2WsJwhcTdUjXPFALK2CoNkfJRo9pSfU=;
	b=DkdJYQjATRms9E5kBFPNnY1QLviSZwYZSEMmdF3WpPiyQIJy8H9pxpn1522bWVfTIE
	El0pOPoAQLBc+7HGv/0uJzRfQOOypp45oks+O3N/YY80bwdOUCOQHBNm4JK0R70ogs7C
	KT0EQEK9yOBknxz0ccl+WUjoW8qy4cJYYBmqJoovhD39MaPtb9k8YY0unKSfwa8r7w74
	x/l3Xz57sn1UJmwycbNHM+72AR+xYXnlBy3hycvqraPEm1adr9sSIOK67fmRV8fP6x2T
	XGWfypQGiBK1/UuxSqMvYI/RyjuC7Z84o3qmYPVd9f+6IQf/yPzqHF+nepAtVJJ+HEkT
	phLQ==
X-Gm-Message-State: AODbwcA/6mnHw5JcnA7qqlB5E46R/ORwqsUoJcj5mHia0hX6Fb15Hvcr
	A7TF3wRw5dspHQ==
X-Received: by 10.98.133.145 with SMTP id m17mr23515666pfk.164.1495429279700; 
	Sun, 21 May 2017 22:01:19 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::63fb])
	by smtp.gmail.com with ESMTPSA id
	t13sm28839596pfa.126.2017.05.21.22.01.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 May 2017 22:01:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 May 2017 22:00:42 -0700
Message-Id: <20170522050042.42403-15-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170522050042.42403-1-raj.khem@gmail.com>
References: <20170522050042.42403-1-raj.khem@gmail.com>
Subject: [PATCH 15/15] nspr: Fix build error due to missing stdint.h> include
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
X-List-Received-Date: Mon, 22 May 2017 05:01:18 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...int.h-for-SSIZE_MAX-and-SIZE_MAX-definiti.patch | 30 ++++++++++++++++++++++
 meta/recipes-support/nspr/nspr_4.14.bb             |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-support/nspr/nspr/0001-include-stdint.h-for-SSIZE_MAX-and-SIZE_MAX-definiti.patch

diff --git a/meta/recipes-support/nspr/nspr/0001-include-stdint.h-for-SSIZE_MAX-and-SIZE_MAX-definiti.patch b/meta/recipes-support/nspr/nspr/0001-include-stdint.h-for-SSIZE_MAX-and-SIZE_MAX-definiti.patch
new file mode 100644
index 0000000000..b3bdd8e08d
--- /dev/null
+++ b/meta/recipes-support/nspr/nspr/0001-include-stdint.h-for-SSIZE_MAX-and-SIZE_MAX-definiti.patch
@@ -0,0 +1,30 @@
+From f7551ec58e2f0a892295e0c2a650083101e12c54 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 20 May 2017 13:24:26 -0700
+Subject: [PATCH] include stdint.h for SSIZE_MAX and SIZE_MAX definitions
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ pr/tests/prfz.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/pr/tests/prfz.c b/pr/tests/prfz.c
+index 0c5a432..9c17590 100644
+--- a/pr/tests/prfz.c
++++ b/pr/tests/prfz.c
+@@ -10,7 +10,9 @@
+ #include <sys/types.h>
+ #include <limits.h>
+ #include <string.h>
+-
++#ifdef XP_UNIX
++#include <stdint.h>
++#endif
+ int
+ main(int argc, char **argv)
+ {
+-- 
+2.13.0
+
diff --git a/meta/recipes-support/nspr/nspr_4.14.bb b/meta/recipes-support/nspr/nspr_4.14.bb
index f5ce91c754..6b47820c06 100644
--- a/meta/recipes-support/nspr/nspr_4.14.bb
+++ b/meta/recipes-support/nspr/nspr_4.14.bb
@@ -10,6 +10,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz
            file://fix-build-on-x86_64.patch \
            file://remove-srcdir-from-configure-in.patch \
            file://0002-Add-nios2-support.patch \
+           file://0001-include-stdint.h-for-SSIZE_MAX-and-SIZE_MAX-definiti.patch \
            file://nspr.pc.in \
 "
 
-- 
2.13.0


