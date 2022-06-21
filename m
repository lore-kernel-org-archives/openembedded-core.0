Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC82FC433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 07:08:42 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by mx.groups.io with SMTP id smtpd.web12.40482.1655795316375224894
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 00:08:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@zhukoff.net header.s=fm2
 header.b=ZRDp9KJf;
 spf=pass (domain: zhukoff.net, ip: 66.111.4.25, mailfrom: pavel@zhukoff.net)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id AFAC55C01E3;
	Tue, 21 Jun 2022 03:08:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 21 Jun 2022 03:08:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1655795310; x=1655881710; bh=4FOv1/DQlDHhPpt0HIn8YLHDt
	kQuPIp69ARowoOkdB4=; b=ZRDp9KJfV45V6dqm74oOPA4oK4JzUJ+0UAnX45v77
	kOyW1YrFNu0GrZpcHaIoH2jx2vz36DX0cHCPzIVxCrGpjP9AzkbmlYyPkyk7Qe2x
	tDcNCLHyZxKSZtv0yTkiTzA6QJHTFDI54DmZzgXfxX776GPr1Z3xkR+jNJmUXtjE
	ybWium9qD/KoD5dairsR+lapg6N1U0OQWq0Wtk8zd50GjjsYKNJO1Hg+4Z4NKIk/
	ZcRuTl9YU9bLnsPduYVIgHz+aLOp0x+TGIsPpzt0olcbpRGPfKzHGthwxVO06AV6
	kJQ6WyeNkRP5EBZQRnWdZF47MZANas/fydAaLLE6N9HOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1655795310; x=1655881710; bh=4FOv1/DQlDHhPpt0HIn8YLHDtkQuPIp69AR
	owoOkdB4=; b=EsqOIIahon07IUu5uWaq94t6aCRwIR5J8t8WnaNRF/Og21r3DUL
	tZ2IjvSPBOuD4NAqR5a68HiP46bS9OiqYfXgjQQhATiSlw3dD+YUbDVtLgRrDemr
	Kl5PVHy3DP/sSpXXU6fcLWIh6P4cFmjC8b1LP7Q8KN7WEpWwK83veNe7UX899x4s
	aPaSYpc1nQoNA3nGmp8J2EzgpblzxXQ+u1FAeNeSC66L7qERCpszRV3J0MgKK2Q4
	LLpWqU0ALDKvwon+4JKLPZC3RIMMN1giF5EALANutTsii0NXGelRqlqgV22NVvZY
	CuRgIPobPbsthWprOQOlcr8VC9FlGbDz5mA==
X-ME-Sender: <xms:bW6xYg_Lrh5YASBHgAAE38_jP71iygZjPaQTDTEIiNUbjXRG3SLo7w>
    <xme:bW6xYosLppZ1fvdUNKxtjyCqVfUZJqqPEFoipowELR6uoGM9JQ3lecaw4UYXn_hGT
    Q8XIFkgDfdcRDhv-gY>
X-ME-Received: 
 <xmr:bW6xYmAklnjqMfRIzyoVq1z7XKfyya86NMjPTxqJFHxxpjj-ySFm8m6qw-KIgcKqj3SE0JY>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrudefvddgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekre
    dtredttdenucfhrhhomheprfgrvhgvlhcukghhuhhkohhvuceophgrvhgvlhesiihhuhhk
    ohhffhdrnhgvtheqnecuggftrfgrthhtvghrnheptdevteekjeduudehhfdthfethfdvff
    ehlefftdffieelfeduleeiueffvdfftdeinecuffhomhgrihhnpehgihhthhhusgdrtgho
    mhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprg
    hvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:bW6xYgcp_0kuS0MxaJ1z01MUmnUuBlbX2Ey7Y7lD8g77oMUxqU-Kjw>
    <xmx:bW6xYlOGOOH7mt8CowmxAsaJL3j8BnWEDtp81hDy3TlRmpiOKnX0Kw>
    <xmx:bW6xYqlfKv0P_Lxhsuv-Y38rfa0bicylxFehy4gqEGKQl_btE2Iitw>
    <xmx:bm6xYj2uuWaK73c9x_e7soayFXWMMpQTuVqoQPwxzkdq-QlkJzAa2Q>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Jun 2022 03:08:28 -0400 (EDT)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: pavel@zhukoff.net,
	Pavel Zhukov <pavel.zhukov@huawei.com>
Subject: [PATCH v2 1/2] systemd: Add missed sys/file.h includes for musl
Date: Tue, 21 Jun 2022 09:07:58 +0200
Message-Id: <20220621070758.30888-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 07:08:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167130

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
---
 .../0001-Add-sys-file.h-for-LOCK_.patch       | 78 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_251.2.bb    |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Add-sys-file.h-for-LOCK_.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-Add-sys-file.h-for-LOCK_.patch b/meta/recipes-core/systemd/systemd/0001-Add-sys-file.h-for-LOCK_.patch
new file mode 100644
index 0000000000..a3e148ec3b
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-Add-sys-file.h-for-LOCK_.patch
@@ -0,0 +1,78 @@
+From c193380a08f5adea1fd514e0a20abd1d7b50d08c Mon Sep 17 00:00:00 2001
+From: Pavel Zhukov <pavel.zhukov@huawei.com>
+Date: Mon, 20 Jun 2022 11:24:52 +0200
+Subject: [PATCH] Add sys/file.h for LOCK_
+
+Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/23790]
+
+Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
+
+---
+ src/core/namespace.c       | 1 +
+ src/dissect/dissect.c      | 1 +
+ src/shared/dissect-image.c | 2 ++
+ src/sysext/sysext.c        | 1 +
+ src/test/test-loop-block.c | 1 +
+ 5 files changed, 6 insertions(+)
+
+diff --git a/src/core/namespace.c b/src/core/namespace.c
+index 926aa96174..39f9e21c93 100644
+--- a/src/core/namespace.c
++++ b/src/core/namespace.c
+@@ -7,6 +7,7 @@
+ #include <sys/mount.h>
+ #include <unistd.h>
+ #include <linux/fs.h>
++#include <sys/file.h>
+ 
+ #include "alloc-util.h"
+ #include "base-filesystem.h"
+diff --git a/src/dissect/dissect.c b/src/dissect/dissect.c
+index bd94a755db..a0d2a6f287 100644
+--- a/src/dissect/dissect.c
++++ b/src/dissect/dissect.c
+@@ -6,6 +6,7 @@
+ #include <stdio.h>
+ #include <sys/ioctl.h>
+ #include <sys/mount.h>
++#include <sys/file.h>
+ 
+ #include "architecture.h"
+ #include "chase-symlinks.h"
+diff --git a/src/shared/dissect-image.c b/src/shared/dissect-image.c
+index 1ab88839aa..a9e3fe4b44 100644
+--- a/src/shared/dissect-image.c
++++ b/src/shared/dissect-image.c
+@@ -4,6 +4,8 @@
+ #include <valgrind/memcheck.h>
+ #endif
+ 
++#include <sys/file.h>
++
+ #include <linux/blkpg.h>
+ #include <linux/dm-ioctl.h>
+ #include <linux/loop.h>
+diff --git a/src/sysext/sysext.c b/src/sysext/sysext.c
+index 364af195e0..85686c0fab 100644
+--- a/src/sysext/sysext.c
++++ b/src/sysext/sysext.c
+@@ -5,6 +5,7 @@
+ #include <linux/loop.h>
+ #include <sys/mount.h>
+ #include <unistd.h>
++#include <sys/file.h>
+ 
+ #include "capability-util.h"
+ #include "chase-symlinks.h"
+diff --git a/src/test/test-loop-block.c b/src/test/test-loop-block.c
+index d1793222f0..6886c4cd31 100644
+--- a/src/test/test-loop-block.c
++++ b/src/test/test-loop-block.c
+@@ -3,6 +3,7 @@
+ #include <fcntl.h>
+ #include <linux/loop.h>
+ #include <pthread.h>
++#include <sys/file.h>
+ 
+ #include "alloc-util.h"
+ #include "dissect-image.h"
diff --git a/meta/recipes-core/systemd/systemd_251.2.bb b/meta/recipes-core/systemd/systemd_251.2.bb
index 8370bec0ca..a8ffb19ef9 100644
--- a/meta/recipes-core/systemd/systemd_251.2.bb
+++ b/meta/recipes-core/systemd/systemd_251.2.bb
@@ -51,6 +51,7 @@ SRC_URI_MUSL = "\
                file://0001-pass-correct-parameters-to-getdents64.patch \
                file://0002-Add-sys-stat.h-for-S_IFDIR.patch \
                file://0001-Adjust-for-musl-headers.patch \
+               file://0001-Add-sys-file.h-for-LOCK_.patch \
                "
 
 PAM_PLUGINS = " \
-- 
2.35.1


