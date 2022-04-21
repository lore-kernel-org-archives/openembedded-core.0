Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C740AC71127
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:11 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web12.18343.1650524460207543769
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 00:01:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cHuXZLfo;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650524458; i=@fujitsu.com;
	bh=A1l8JOJHIcBN+WC2+BXudFl/O4ZntFGrJ7ujy6G8Z0I=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=cHuXZLfolw0xm6l5wLMeUIcPqVxgUm2agF0ciistm82kWzqTKGO9/gptXC6ZcsoLe
	 DETGnp2htIZL9JiPN38lLHZvNBbriHpQOzsMuIxCyPVcC2oGtjbc8J1pEa1ZHQ6BzQ
	 qJYwfE3rZam0O4We1vAuFqwq/dXChGXH63E0Tat2azsO7Vj/c5qu3CAOlZTOpzoNy4
	 IMjPyGrvWhzntEnsQS3md52ubRfk/B5B5akBhFhI10qcKmodo4wGTtvGnWxHqBInAO
	 wzQtBUKjfJpGiggA3KTrg8w1jwj/qWlJgTeBB8Lqa/DNt6wBg98lQAVu9qpNRIVkBD
	 NoiwYl9CqOMrw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MxSVeTMTH
  JYMosHYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPph3/sBROEK47cT25g/CfQxcjFISTwmFHi
  bf8/NgjnPJPEox2PWSGcA4wSHSuuMXUxcnKwCehKvPixmKWLkYNDREBP4uo/UZCwsIClxMOzx
  5lBbBYBVYkf2x6C2bwCHhJb9rxgBbElBBQkpjx8DxUXlDg58wkLiM0sICFx8MULZpCREgKKEr
  Ony0OUV0i8PnyJGcJWk7h6bhPzBEa+WUi6ZyHpXsDItIrRKqkoMz2jJDcxM0fX0MBA19DQVNd
  A18jQVC+xSjdRL7VUtzy1uETXUC+xvFgvtbhYr7gyNzknRS8vtWQTIzDwUooZru9gnNj3U+8Q
  oyQHk5Io78VfCUlCfEn5KZUZicUZ8UWlOanFhxhlODiUJHh7PwPlBItS01Mr0jJzgFEAk5bg4
  FES4VX+B5TmLS5IzC3OTIdInWLU5di55fJeZiGWvPy8VClxXjGGxCQhAZCijNI8uBGwiLzEKC
  slzMvIwMAgxFOQWpSbWYIq/4pRnINRSZh3z3+gVTyZeSVwm14BHcEEdET1lFiQI0oSEVJSDUw
  FCceWH1k/UyA62unwkesNbCJ3bl71O/fm2b9PwQ4SyS8OpdYp/rB8y2F0sZ6nIOL5fqPLYUHz
  6srL4w3MIx6/mXNK3yhvG+/CDvN/74rUji2aVSW8fXVzwono3BoGj8kCd/bN2S52XvLieoMd7
  J8sjloKTF5x4deabc4OrVHFDrOVuC+VsTTelFn/Uo5Fd8+vXwtN13Dfsk894qHGLLtLwzvcdJ
  10fdTqazt7Mu+3SFzqvlY1mWNt/tGlW0snaUXnsQaapH0+Kn6Id6ae/dPZTa9L15pNnH9K8Fd
  38lzhUmeRegXR/D1HvFvFT9sXzyr9IGnaN3Xloea32/dnJkkcVv4Ra1xRs0rAYe716ENKLMUZ
  iYZazEXFiQBN8oGgQwMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-585.messagelabs.com!1650524457!39172!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 683 invoked from network); 21 Apr 2022 07:00:57 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Apr 2022 07:00:57 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 391D5100478
	for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 08:00:57 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 27E11100471
	for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 08:00:57 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 21 Apr 2022 08:00:46 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] sysvinit: upgrade 3.02 -> 3.03
Date: Thu, 21 Apr 2022 15:00:35 +0800
Message-ID: <1650524435-13155-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164743

0001-Fixed-compile-error-on-GNU-Hurd.patch
removed since it's included in 3.03.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...0001-Fixed-compile-error-on-GNU-Hurd.patch | 28 -------------------
 .../{sysvinit_3.02.bb => sysvinit_3.03.bb}    |  3 +-
 2 files changed, 1 insertion(+), 30 deletions(-)
 delete mode 100644 meta/recipes-core/sysvinit/sysvinit/0001-Fixed-compile-error-on-GNU-Hurd.patch
 rename meta/recipes-core/sysvinit/{sysvinit_3.02.bb => sysvinit_3.03.bb} (96%)

diff --git a/meta/recipes-core/sysvinit/sysvinit/0001-Fixed-compile-error-on-GNU-Hurd.patch b/meta/recipes-core/sysvinit/sysvinit/0001-Fixed-compile-error-on-GNU-Hurd.patch
deleted file mode 100644
index d278a32ec7..0000000000
--- a/meta/recipes-core/sysvinit/sysvinit/0001-Fixed-compile-error-on-GNU-Hurd.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From d595594506e6fd2247f7984c276f822ea626434c Mon Sep 17 00:00:00 2001
-From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
-Date: Thu, 7 Apr 2022 11:57:19 +0900
-Subject: [PATCH] Fixed compile error on GNU Hurd
-
-Fixed compile error on GNU Hurd due to missing MAX_PATH definition.
-
-Upstream-Status: Backport [https://github.com/slicer69/sysvinit/commit/14d8d25269016b26965b428a855dd084cc88994d]
-
-Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
----
- src/bootlogd.h | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/bootlogd.h b/src/bootlogd.h
-index b47bc9d..ba17f0c 100644
---- a/src/bootlogd.h
-+++ b/src/bootlogd.h
-@@ -10,3 +10,6 @@
- #define FALSE 0
- #endif
- 
-+#ifndef PATH_MAX
-+#define PATH_MAX 2048
-+#endif
--- 
-2.25.1
-
diff --git a/meta/recipes-core/sysvinit/sysvinit_3.02.bb b/meta/recipes-core/sysvinit/sysvinit_3.03.bb
similarity index 96%
rename from meta/recipes-core/sysvinit/sysvinit_3.02.bb
rename to meta/recipes-core/sysvinit/sysvinit_3.03.bb
index cfe9d0b597..f6547f237a 100644
--- a/meta/recipes-core/sysvinit/sysvinit_3.02.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_3.03.bb
@@ -20,9 +20,8 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/sysvinit/sysvinit-${PV}.tar.xz \
            file://rcS \
            file://bootlogd.init \
            file://01_bootlogd \
-           file://0001-Fixed-compile-error-on-GNU-Hurd.patch \
            "
-SRC_URI[sha256sum] = "4ca03ffdbefb5a99a60b94a021693686c2b498a08ff8aa4e859821fa7c39a792"
+SRC_URI[sha256sum] = "a80418c80828558da9e29208ebbe22d91903d047fd5babdd3cd0eb1fea32d6f0"
 
 S = "${WORKDIR}/sysvinit-${PV}"
 
-- 
2.25.1


