Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 890A2C47422
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 01:17:21 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.5743.1706145435275478532
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jan 2024 17:17:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A8oLH2mv;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-78329cb6742so390480285a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 17:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706145434; x=1706750234; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFITaoNCPCOhUbId5PhNy//GAAAUgJzzbJPzqNrJeC8=;
        b=A8oLH2mvrJdI9gSVcEWEsjubV1Gc7+VG0Oa6LDbMJcU1kTGXx35u4iMXr8qsDAOeCH
         aVh5cwIX36GSBT50hb4COsX1rXaUkPt4XVAu7H0lwUEIN+eml8QVfz8t4kR9OyLEcIHu
         cTM9FLEkqdRbcA+eXap2JDoM/KTUeehZnFtS0apQHPhv7PSvu39wP6h0PNkvjgoA1Nt/
         4C5qVGT+5QyDtOYNFF6LyC7zHVDxt07L1NCbun9/bXgvg6KL9r+sdhUyw0G+/ZGw4B8J
         1TP7yY61RysKQ0IHrpLnZgHQw9yLSccyVQI6r1l5p3OmtGLmAfk4s6YUHsaUa1qIJUfI
         tsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706145434; x=1706750234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AFITaoNCPCOhUbId5PhNy//GAAAUgJzzbJPzqNrJeC8=;
        b=tdxopJdxHBIdlYg/fMREFFo4zxW/5azPzdtPYZQUSP2SUZTNUuIVE5949jB7nHYG6z
         n4P58V+4BAi4/hWIHzGkj4TT0g+62RggojfLegm9MbFeyAiXr/fuAh9Qrlib5V09Wa55
         GrxA9MROjfBg5iiN15LXYiWwE6OKXEzdbvMhlxld3RRP5VzpUodrHAw5sceqKsCuR6ee
         +7XurpFGkKKIATjmHKrWijvQUGgpwVTm62QsUSraDy16ae/WOus7OljEml2XvIK9XBX3
         reyuZCIn0i2quLJoCvjDLmizldVCzbPY1IlHMX7AZrkmDy63mpReTgWmD+XQaAErVG12
         ZMRg==
X-Gm-Message-State: AOJu0YxznVIANCX0mwhAERJ1H1yrVwVhjsxtrEhTq8oVrf9RsYb2eEht
	4tfC3DKiJT+kcqAowRtf3NCq+xPWGIrBICOwuiLduoIOMPr/h1Aw8VeD2va1+hsS/A==
X-Google-Smtp-Source: AGHT+IEl14y8ZRRF2rrPvX6EP8aeERdKy3bUi7XslKXpy+QJkXUdSoYSHdp07gszvQy5kGPNsWMxAg==
X-Received: by 2002:a37:de07:0:b0:783:23ce:db32 with SMTP id h7-20020a37de07000000b0078323cedb32mr231282qkj.56.1706145434210;
        Wed, 24 Jan 2024 17:17:14 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id u1-20020a05620a084100b007834318c7absm4581049qku.79.2024.01.24.17.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 17:17:13 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-yocto-dev: update to v6.8
Date: Wed, 24 Jan 2024 20:17:10 -0500
Message-Id: <20240125011710.1724977-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240125011710.1724977-1-bruce.ashfield@gmail.com>
References: <20240125011710.1724977-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 01:17:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194304

From: Bruce Ashfield <bruce.ashfield@gmail.com>

-rc1 is available, so we bump our -dev kernel to track.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index a85f85e4c3..c91aa073e8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -14,7 +14,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # provide this .inc to set specific revisions
 include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 
-KBRANCH = "v6.7/standard/base"
+KBRANCH = "v6.8/standard/base"
 KMETA = "kernel-meta"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine;protocol=https \
@@ -28,7 +28,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "6.7"
+LINUX_VERSION ?= "6.8"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


