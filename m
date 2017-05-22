Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id CB38D77F6B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 05:01:13 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id 9so70335115pfj.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 May 2017 22:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iD9xd2Q6bUYlxvX5U5OAWM9+X8m/RZF/JUNmo5otjMQ=;
	b=lY0iwT8QfMYC1VbbaYSAoJPqZiCmPHpxZr/XBNUSGnJwxbFE5fJJQmfmtWUMFms3i5
	5mpLXQAz6vasSAiZOcS2wdVUGeKwXaL850ex50tWqJbKVNy0oChAZY5fR2ZX1dHDAJnU
	FGKH+cjvZqBKXBbqAiVPzAgMlnvXmm1K39pMTU/h1ZpWhks4ie4xksLlL7nT0qa9o3EA
	C/H7M0ugh2V2FcgtrFvsnp5oZ3889RNqUw1y7GRc9fK5Mbm+NuEXr367usvq1zvBgC8B
	4QmkkzPxd3YNEBtI3VetnmQSw9q9k0mVXiBBPUViyfxc+YWYp6S5+1gE5YazglwGSvO0
	+3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=iD9xd2Q6bUYlxvX5U5OAWM9+X8m/RZF/JUNmo5otjMQ=;
	b=uLd50jRDDN4mG96pd8PHshNefLPMscBSuMrSLOD5nj4aV6dWL7Wt6KAKCQo2fEvFBe
	WPpnF+FIOoXiaofVd2C5afX0EgI521KTztiHvm3vIkUhLCVtrIIIayw6jLGlSbcTnC+O
	X7MUkOikxC/83ecKznTdUxS/lEE/0jbrh70pJpyHZZiJjISLnGz6jxXsQLfX4b5y8Uhz
	Di8s+fjGa6T1yjNqLl3XP4AodoIS/M2kuNQEqAGrxdhRFOakM5XQj9H7z565se742PUA
	m+CG80E+AM59DO9bnk2PFnKhjAW8F7UjInqwdsyN4w6qYyRcahbDXwK3gziqLAz4d90D
	B5dg==
X-Gm-Message-State: AODbwcBOUm88H64SpuZ9JOeaFxoxE49jXQ9uK14c9Q9Ij1GgptcnAPMS
	M2VKadNslgmz9w==
X-Received: by 10.98.218.72 with SMTP id w8mr23039478pfl.155.1495429274923;
	Sun, 21 May 2017 22:01:14 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::63fb])
	by smtp.gmail.com with ESMTPSA id
	t13sm28839596pfa.126.2017.05.21.22.01.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 May 2017 22:01:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 May 2017 22:00:39 -0700
Message-Id: <20170522050042.42403-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170522050042.42403-1-raj.khem@gmail.com>
References: <20170522050042.42403-1-raj.khem@gmail.com>
Subject: [PATCH 12/15] iproute2: Fix build error due to missing stdint.h> include
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
X-List-Received-Date: Mon, 22 May 2017 05:01:13 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...nclude-stdint.h-explicitly-for-UINT16_MAX.patch | 32 ++++++++++++++++++++++
 .../iproute2/iproute2_4.10.0.bb                    |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-include-stdint.h-explicitly-for-UINT16_MAX.patch

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-include-stdint.h-explicitly-for-UINT16_MAX.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-include-stdint.h-explicitly-for-UINT16_MAX.patch
new file mode 100644
index 0000000000..eb0c0abbab
--- /dev/null
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-include-stdint.h-explicitly-for-UINT16_MAX.patch
@@ -0,0 +1,32 @@
+From 3c885d87befc706bb923933b9819de6fe2de897e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 20 May 2017 14:03:19 -0700
+Subject: [PATCH] include stdint.h explicitly for UINT16_MAX)
+
+Fixes
+| tc_core.c:190:29: error: 'UINT16_MAX' undeclared (first use in this function); did you mean '__INT16_MAX__'?
+|    if ((sz >> s->size_log) > UINT16_MAX) {
+|                              ^~~~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ tc/tc_core.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tc/tc_core.c b/tc/tc_core.c
+index 7bbe0d7..821b741 100644
+--- a/tc/tc_core.c
++++ b/tc/tc_core.c
+@@ -12,6 +12,7 @@
+ 
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <stdint.h>
+ #include <unistd.h>
+ #include <syslog.h>
+ #include <fcntl.h>
+-- 
+2.13.0
+
diff --git a/meta/recipes-connectivity/iproute2/iproute2_4.10.0.bb b/meta/recipes-connectivity/iproute2/iproute2_4.10.0.bb
index a050e8737e..063d467440 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_4.10.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_4.10.0.bb
@@ -4,6 +4,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://configure-cross.patch \
            file://0001-iproute2-de-bash-scripts.patch \
            file://0001-libc-compat.h-add-musl-workaround.patch \
+           file://0001-include-stdint.h-explicitly-for-UINT16_MAX.patch \
           "
 
 SRC_URI[md5sum] = "b94a2b0edefaeac124dc8f5d006931b9"
-- 
2.13.0


