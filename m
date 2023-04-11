Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD062C76196
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 01:01:48 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.3165.1681174906319806416
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 18:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=KbIjs6Hx;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681174904; i=@fujitsu.com;
	bh=71jqZ6zncoYmFODIHYqK3+ttp2z3xWnXIDQuLlSBF1o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=KbIjs6HxJQmr8noDpmPXVakVyWjVzhV2bvF2qX/3pv3zZJ30ts0XC6QzLHXCN5L7T
	 yh2IoBWHHAojB39RB/vWb9ECcVyw6K0O9P0vC7y4B1ym2tG/3yCcP4o62SSPnwBgGA
	 K4WM51PY0DW707DWioGO3Wpq4vuqvccZFqiWT+BAtTGnplpo9XDcVaP6tuwtBuprid
	 Rg5WYWDNQ2VwmbI3du8mVFDpUNc5ZqPWc2ozERhjrbvihO0HgYhi2M8Qr9gxnGidnF
	 tSScjerQiRvIXqi4APA46h/kC3Z5V9l14LbW4AGBlvi+nzA3lX+i55q0O/TWR0H00i
	 r4dhhNLKT+Qmw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8ORqFu+0ST
  FYPJsQYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaPn5Dfmggs8FRN+n2FqYJzB3cXIySEk8JhR
  YuYewy5GLiD7GpPE5tMTGCGcPYwSUxa9YgKpYhOQkrhx/z9bFyMHh4iAnsTVf6IgYWYBFYkXv
  3vYQWxhARuJD9cOMIPYLAKqEl8/zwGzeQWcJBZO7mIBsSUEFCSmPHwPFReUODnzCQvEHAmJgy
  9eMEPUKErMvtwMVV8h0Tj9EBOErSZx9dwm5gmM/LOQtM9C0r6AkWkVo1lxalFZapGuiV5SUWZ
  6RkluYmaOXmKVbqJeaqluXn5RSYauoV5iebFeanGxXnFlbnJOil5easkmRmAophQnpO1gbO37
  q3eIUZKDSUmUd5WcSYoQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd6/i4BygkWp6akVaZk5wLiAS
  Utw8CiJ8HKuAErzFhck5hZnpkOkTjHqcnw4dGUvsxBLXn5eqpQ4rwXIDAGQoozSPLgRsBi9xC
  grJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYN3I90BSezLwSuE2vgI5gAjripAXYESWJCCmpBqb
  0PgPNW4wif0/ICaybk9udqCbXLm5WE5K3JzS8f87889HXw5I4SmyFDsWsfcj+evaltoX+fzJE
  PlS7XjoTKLd0Y1ztl9bZFrXtPzfX+HZVlxS7hl36axHt8S3o1BuedWZqIq5JTSY7T4lZVgZsf
  DIh9IVp++NKbVYHw0NXVRjXu+UKmxt9OmIgs1GrzKPihqPY5LZ4eafM4gY1h1MbZ2c+Pa+YPO
  l70bL4+Xs7arf61VyqW9bN7zv1vdoDoe/mAWLfhL48MVklXLClv6Pbs2ZznOsbNZ2va49oLWl
  if8ga0N+Y4PKq6ZLH33l6LvnspcZHjLdta0kVfrZguk2DukdF2A3/qBWaUskZHFeVWIozEg21
  mIuKEwH0nRLJTAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-732.messagelabs.com!1681174902!478840!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21464 invoked from network); 11 Apr 2023 01:01:43 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Apr 2023 01:01:43 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id B10391001A5
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 02:01:42 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id A32C61001A2
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 02:01:42 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 11 Apr 2023 02:01:41 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH V2] mesa: upgrade 23.0.0 -> 23.0.2
Date: Tue, 11 Apr 2023 09:01:27 +0800
Message-ID: <1681174888-30847-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 01:01:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179903

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mesa/{mesa-gl_23.0.0.bb => mesa-gl_23.0.2.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_23.0.0.bb => mesa_23.0.2.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_23.0.0.bb => mesa-gl_23.0.2.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_23.0.0.bb => mesa_23.0.2.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_23.0.0.bb b/meta/recipes-graphics/mesa/mesa-gl_23.0.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_23.0.0.bb
rename to meta/recipes-graphics/mesa/mesa-gl_23.0.2.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 8f72f25c17..babd10a855 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,7 +19,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            "
 
-SRC_URI[sha256sum] = "01f3cff3763f09e0adabcb8011e4aebc6ad48f6a4dd4bae904fe918707d253e4"
+SRC_URI[sha256sum] = "1b7d3399fc6f16f030361f925d33ebc7600cbf98094582f54775b6a1180529e7"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_23.0.0.bb b/meta/recipes-graphics/mesa/mesa_23.0.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_23.0.0.bb
rename to meta/recipes-graphics/mesa/mesa_23.0.2.bb
-- 
2.34.1


