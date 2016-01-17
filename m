Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id CE6057017D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:36:57 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id 65so142169719pff.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=uCSXC2w8GgJr5Jswl7uXr5GJVJHag1RwjUABHJD6Blg=;
	b=IVD7rZANzBwTN3KV5WnV0tO1JNfk2gt3WsE6QW5+3shV6EOY9MT5UlP3J+EvH3D+zb
	kmcvGa6BvaHl1QKX/P3YYKWzJM7oPppp5EedriK6WWIt49j8fq0EauYQpZ6WIS1kpyBI
	rIO2EauJCCn0/tx3ZZ0dt9EOIRdbKpHWuWFKBkengBabuVI61VWKYSovAXId1Pk4TP12
	cPyIRoaEBt9VdXZNXIrRjutn5LdU+dhvFVHaYj7Duv97VEKa66v/oKcGXTmW6e6R3JYW
	hBLUFcuQN++j9ymMhPnzs4zcwn4FvCg+YCwy5AMa7NZ5+XIM5wUW9sFLlhgQnE93LeWq
	vIjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=uCSXC2w8GgJr5Jswl7uXr5GJVJHag1RwjUABHJD6Blg=;
	b=LOqqRevOjUnR9azLS+lGYRcHzFFoDBucT1YcjOrGY6LEyPwgZGX0CBK/ABSgeQZFnX
	h776TVtsPIuBlo1EFo+AGIUuDFjLh+o20tkEA1HYZDvv/fL1LIqBRrvueFGk8E4riEf/
	26Bp2FbmBSFKii/M3aPWfkqH0zwjz2xjDi8cevt+BZtfSz/0Y4bjlBGRPgy0b7KtRMGT
	IJaNpfNFjA5S44/gHYFS/AA1ZxfrdCM6n74A7FYprLue34pUUOY0zvVm5ZtWEK/Lxari
	t/oUONdHEvttoWh/6LnlfZDYHXHOTJlcMhguY3PeglWGvuQR+zlZUC0A3ysn+x68PzpN
	mmRQ==
X-Gm-Message-State: ALoCoQn0GaT0HU0O6Bml3meEmO4v257nAmznFg+Nd25rvvKnoU5DtKSQYL+/b0PuEH5bDZQrnvQIBuWUeTOLMZl+CSTjRELqlg==
X-Received: by 10.98.73.207 with SMTP id r76mr28615713pfi.118.1453030618600;
	Sun, 17 Jan 2016 03:36:58 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.36.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:36:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:35:35 -0800
Message-Id: <1a1d1bd1323ed3f483865fa309d3a970888fe66d.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 02/73] blktrace: Include <sys/types.h for dev_t
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
X-List-Received-Date: Sun, 17 Jan 2016 11:36:58 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-include-sys-types.h-for-dev_t-definition.patch | 30 ++++++++++++++++++++++
 meta/recipes-kernel/blktrace/blktrace_git.bb       |  4 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/blktrace/blktrace/0001-include-sys-types.h-for-dev_t-definition.patch

diff --git a/meta/recipes-kernel/blktrace/blktrace/0001-include-sys-types.h-for-dev_t-definition.patch b/meta/recipes-kernel/blktrace/blktrace/0001-include-sys-types.h-for-dev_t-definition.patch
new file mode 100644
index 0000000..a4b7157
--- /dev/null
+++ b/meta/recipes-kernel/blktrace/blktrace/0001-include-sys-types.h-for-dev_t-definition.patch
@@ -0,0 +1,30 @@
+From 6b5bbdfaac7f216fe8a02c4cf29e5eb2aee5a409 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 15 Sep 2015 00:01:00 +0000
+Subject: [PATCH] include sys/types.h for dev_t definition
+
+Avoids the build failures when sys/types.h does not get included
+indirectly through other headers.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ blktrace.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/blktrace.h b/blktrace.h
+index 380aec7..944fc08 100644
+--- a/blktrace.h
++++ b/blktrace.h
+@@ -5,6 +5,7 @@
+ #include <limits.h>
+ #include <byteswap.h>
+ #include <endian.h>
++#include <sys/types.h>
+ 
+ #include "blktrace_api.h"
+ #include "rbtree.h"
+-- 
+2.5.2
+
diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb b/meta/recipes-kernel/blktrace/blktrace_git.bb
index 5b0be42..957cb70 100644
--- a/meta/recipes-kernel/blktrace/blktrace_git.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
@@ -9,7 +9,9 @@ SRCREV = "43fc870ce04e963def45dfc0d1ed4ea21ef10d4b"
 PV = "1.1.0+git${SRCPV}"
 
 SRC_URI = "git://git.kernel.dk/blktrace.git \
-           file://ldflags.patch"
+           file://ldflags.patch \
+           file://0001-include-sys-types.h-for-dev_t-definition.patch \
+"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.0


