Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id A38BC782C6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 14:59:19 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id f127so14504662pgc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 07:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yVA4fmEBY2xIKz9AOeWa32aPIVHxXFY9y8YH4kDzy60=;
	b=txpTfQx/YsIJdC2Xosmqlmh8geEoR8kloOJn+3kfP5R1PDRzR96RbleNG0yY2/ztYB
	wtUQlf5aMKFJe/wBcTZs7RCrL737AhKke0dmbJv92nhmVmlZnwqw7c92nEoclwUBAoVX
	4QueUGCBguhjUhDtlFlRuTNVZqVOlJ/5Zm+iyKf0i2Ye+LUuGKFVhrKcdGAKUbSQXtys
	+YnsFXe+8TnaX2Fj3GJHzYUgcH+GVOVtv9/s9O3xwU/j94qrqTGS9HQFtjqXqWKWXiyM
	DdBTpnbcvBEk2qM9qsBH9QyqW/CSgxWrDb6HubpHr/wNfWjXMQl24PrOZxG3yjl79Tmp
	0CMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yVA4fmEBY2xIKz9AOeWa32aPIVHxXFY9y8YH4kDzy60=;
	b=nBnPS+jVJ+jaINks5FyZ5xg83t//1/a9lx7pEo033h1CJD0rdJC85UXMUAobcjMz5t
	oA9ur6lZFbu6YuZ4K4uGFSoigG8+bZfzJuUZpjhu18BCdgWs9FlfzjKyjsJIYngPZs+C
	VkCdxLcF3XsTVvzPqDKaVpM9kdFa1ntRsE17tnklrcymkzaVNPAQllUWJ5xdfg/eiVU5
	OLmUinqvbmagBJn5aVsyHnjF1BgukHgg4JQYhnHnhxB5sbxoSiA+YXo4+XOBwrWU/jPe
	aiZDtyGz7oPU5nTFj/XfW0fRBb5SDap9X1GK3mizMHO0HkslEX7GNc9D0DlyiNO6u9SA
	KdSQ==
X-Gm-Message-State: AODbwcDg+4FNZCMkmhiYCWRIluVWFbFgMPk72qOU4MYFomhDaOlUiwKJ
	E9S6KWCad4FBIC38
X-Received: by 10.99.119.130 with SMTP id s124mr46814265pgc.33.1497279560580; 
	Mon, 12 Jun 2017 07:59:20 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::264a])
	by smtp.gmail.com with ESMTPSA id
	i17sm20554732pgn.60.2017.06.12.07.59.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Jun 2017 07:59:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Jun 2017 07:59:04 -0700
Message-Id: <9b48a0208d92b5c6ba013f5b43218777b2349c2c.1497279306.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <cover.1497279306.git.raj.khem@gmail.com>
References: <cover.1497279306.git.raj.khem@gmail.com>
Subject: [PATCH 4/7] libnsl2: Include stdint.h
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
X-List-Received-Date: Mon, 12 Jun 2017 14:59:19 -0000

uintptr_t is defined in stdint.h

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Include-stdint.h-for-uintptr_t-definition.patch | 27 ++++++++++++++++++++++
 meta/recipes-extended/libnsl/libnsl2_git.bb        |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-extended/libnsl/libnsl2/0001-nis_call.c-Include-stdint.h-for-uintptr_t-definition.patch

diff --git a/meta/recipes-extended/libnsl/libnsl2/0001-nis_call.c-Include-stdint.h-for-uintptr_t-definition.patch b/meta/recipes-extended/libnsl/libnsl2/0001-nis_call.c-Include-stdint.h-for-uintptr_t-definition.patch
new file mode 100644
index 0000000000..e9ae517107
--- /dev/null
+++ b/meta/recipes-extended/libnsl/libnsl2/0001-nis_call.c-Include-stdint.h-for-uintptr_t-definition.patch
@@ -0,0 +1,27 @@
+From d71cbeb3b76e54778a4d5eec6d387cce653537ca Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 9 Jun 2017 09:49:35 -0700
+Subject: [PATCH] nis_call.c: Include stdint.h for uintptr_t definition
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/nisplus/nis_call.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/nisplus/nis_call.c b/src/nisplus/nis_call.c
+index 1a2b90c..1dc982d 100644
+--- a/src/nisplus/nis_call.c
++++ b/src/nisplus/nis_call.c
+@@ -23,6 +23,7 @@
+ #include <errno.h>
+ #include <fcntl.h>
+ #include <string.h>
++#include <stdint.h>
+ #include <libintl.h>
+ #include <rpc/rpc.h>
+ #include <rpc/auth.h>
+-- 
+2.13.1
+
diff --git a/meta/recipes-extended/libnsl/libnsl2_git.bb b/meta/recipes-extended/libnsl/libnsl2_git.bb
index 1698f69edb..18e37a1ac9 100644
--- a/meta/recipes-extended/libnsl/libnsl2_git.bb
+++ b/meta/recipes-extended/libnsl/libnsl2_git.bb
@@ -18,6 +18,7 @@ SRCREV = "dfa2f313524aff9243c4d8ce1bace73786478356"
 SRC_URI = "git://github.com/thkukuk/libnsl \
            file://0001-include-sys-cdefs.h-explicitly.patch \
            file://0002-Define-glibc-specific-macros.patch \
+           file://0001-nis_call.c-Include-stdint.h-for-uintptr_t-definition.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.13.1


