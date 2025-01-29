Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8460AC02190
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 16:26:17 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web11.16587.1738167974746854490
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 08:26:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g1ZXqvjH;
 spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: danismostlikely@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-844df397754so179280839f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 08:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738167973; x=1738772773; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1cgNiqcWLwgQTMp80mxNLJWL8N2xOC+lwBf/WI6CpC0=;
        b=g1ZXqvjHdzTM4gBlFh53V+VfRmOsHEEVLJnLkTL+F9krdKAhK/ALJwmwnoEe0+5HyW
         f/EHmI+Xv23xf3w4gKTuVG+TdLXo29oN3rBW9SRuy6nLc3GO/y4FvVxsAm9HpsbjmID+
         ecDjnZlzvPBFti0Zy/2/2Y5WFTUW7XC0sqhLvGLCzjUw8U2GiMAJ4xagLmlLyYaxjWTn
         0ZIcWqK/+a3E/Kj4oqCs9HtU/HqDGeQkBJ1tQZOyMhgIuWgLxWKbOmaVoRHI0rY9ANL7
         myIVfKXtXvVcut9JET78SppstZMokJAP1M3TW6cDp/q4xW07RGqVHi/x9fB5IdDHfwTb
         tvig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738167973; x=1738772773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1cgNiqcWLwgQTMp80mxNLJWL8N2xOC+lwBf/WI6CpC0=;
        b=ALteGXUNMYyAbi1zBh4tvYjwfY/1OIKm7+Ide+q18Mm/zV51i9fSdl4YQruXkTmau1
         qvvjMJi4Jv0quZFmsl1uJ7KYMeXSzTKUvnI56JYGz2pCeetTt5CNh2XBOYLuHgm2M+th
         jNwNts+7e5AbPq4TvZZ46ljtrMl5jgseLu6IXQcf4eaRUtPxRuB9vcUy2RL7MljrWY7A
         pH1rZAj/d9JoYEgrKZHEFLBVDPNFYXN6MhK+US+YfIXiiQOMvwdBYCIBQ/9p2Czbj+QF
         +s7yxZqb7vsDnMbKs3tCLMk0kpu0uWpglPw4jzfJy4VS+46N5l2Kv+oDHZgYm+pLrhDX
         vgtw==
X-Gm-Message-State: AOJu0Yyg39OiAj/JPgkbrbhdsOivUXKAGGfcrKjCywghVt2WbF68eELR
	C2mD3S5oYWYHHvjZE6y3YtnyUMKiJi2ixetahOzvb9iYmUWm0sKCmWktKg==
X-Gm-Gg: ASbGnctJOllU58Q0hOk6qZNnSrKof8zIfQPlcjD1KZpYXhapjLF/3/mV+bHB25gJjtV
	X5J6Jn4rfMLNTBhGxx6FzTzna4SWdelcUm0jFULhf8UOOpNkvuePeR/yyuvBl1eoR4zFaVEvagZ
	dXcj39XGnNTI5X8eb1KhcFg0kbpWmH22RHDqe6/pOzWxvhiAWfNL85oMeyMevv3VIrCmbKVv6AP
	FG6tqQ1vwJIxnaphc2zNV39Nxh3F9YCXQb51MRUcE1vcQuAr3+THDsq0vhJtNM2etWFIj0wlOHM
	gQk2Y3IBj792F/2hInr1ndnn/LbaU3LOzHdgn/eBol90bxcE
X-Google-Smtp-Source: AGHT+IFhSTal2mfRUm55Z/GSW/tklMrM1id7b6zRS94eBvuwFTAgM19OKIJNNyAqrYKfZ/tBm6suXg==
X-Received: by 2002:a05:6602:2c93:b0:843:ec8d:be00 with SMTP id ca18e2360f4ac-85427e03db0mr327042339f.13.1738167973599;
        Wed, 29 Jan 2025 08:26:13 -0800 (PST)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec1da03a85sm3802522173.12.2025.01.29.08.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 08:26:13 -0800 (PST)
From: Daniel McGregor <danismostlikely@gmail.com>
X-Google-Original-From: Daniel McGregor <daniel.mcgregor@vecima.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH v2] util-linux-libuuid: use util-linux's CVE_PRODUCT value
Date: Wed, 29 Jan 2025 10:26:10 -0600
Message-ID: <20250129162610.35102-1-daniel.mcgregor@vecima.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <181F354F7FEC52AE.31881@lists.openembedded.org>
References: <181F354F7FEC52AE.31881@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 16:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210391

util-linux and util-linux-libuuid should use the same CVE_PRODUCT
since they're the same product. They're just split off for package
dependency reasons.  Prior to this patch the libuuid recipe gave the
wrong CVE_PRODUCT value, causing some CVE check tools to fail on it.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 56162ab1479..580ff488e42 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -43,3 +43,5 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            "
 
 SRC_URI[sha256sum] = "d78b37a66f5922d70edf3bdfb01a6b33d34ed3c3cafd6628203b2a2b67c8e8b3"
+
+CVE_PRODUCT = "util-linux"
-- 
2.47.0


