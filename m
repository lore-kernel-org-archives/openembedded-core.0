Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 128DFC433FE
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 07:13:39 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.22331.1638602018209621378
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K+xQQZ0g;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id i5so10589207wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AoNTQFyItnWxQKjH0ggBbKtmX/9sQrRP628tABVAAT4=;
        b=K+xQQZ0gcRx0dOn77fG23gahdUz1EjfWqopegC90HAWt/VU9a8EYMacTYbhxd7WKf/
         OTY7g27lpQi5dY4VFJmwrcEDOxaxn17GU0zVe+mlnJpQNHWoItUyO8clw+YjU9WOpjN8
         S6MM60tXseQNnwflsJ+54VzVl/qLMlXTyTXux5mvmlYGiIQOO/DxZ4sHB67GoSSJAyt+
         fpqInWM5ph2HrEdPghmdIatjOYoelZhi8IIogWz+a6DFDyovTnHdN9DdPjsWBuiVNdF8
         zTdhndFNYLw3UwBW/lA6ewR+/4M0zyN5VPAYkPILqA/WJVgfoBPBjJNC/fGL3i88jlaq
         dqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AoNTQFyItnWxQKjH0ggBbKtmX/9sQrRP628tABVAAT4=;
        b=gbKNeRxwJp3Xbv14fBddS97L9VWQlYFC3aAhhVcbJrP2kXeKG5rypCIkZkBfEpfyNu
         2y0WGMTnv3nxRQdx0si2pUc/ZkklS9CUOS+swQE8uSUy7GFsguUNB/QNjfmaqrFRIXYj
         zkkeFrKL2U2NWZXMx1UuvNuPusTyS1D3BAhDXuHEVChawn8gLpRXZKCoARV37eIJXesM
         yi8/rxE4vnaruJq3xMJ7P5u9i1LbeMcu54Ty4vu9vQsizhWxkVB451/CjkB5qrnjzYeQ
         +fKVuMe0NCp8j0cPOrg8lhqnseK2mIUxzl1OE7Cbm87x7v7g6gBTrLqtqWFnvdHDRMW5
         efnA==
X-Gm-Message-State: AOAM5339Ho5ijZSk6poM8Vq79CWktplWcAGdPgOOyUrw8EAtcWkGeAdW
	qpWS6Md9HLVy/uVvF1GZzS7qqSjhLlqu+w==
X-Google-Smtp-Source: 
 ABdhPJwdEwkgleUr7VA4X3sJU3+GfsXZh0GeGEaCHBnTsK+9hlEVqgIpbTEffbh6wl5uLR5L6FoWKQ==
X-Received: by 2002:adf:9e4b:: with SMTP id
 v11mr27755211wre.531.1638602016810;
        Fri, 03 Dec 2021 23:13:36 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 y15sm5837992wry.72.2021.12.03.23.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 23:13:36 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/26] igt-gpu-tools: correct patch status
Date: Sat,  4 Dec 2021 08:13:11 +0100
Message-Id: <20211204071323.2480163-14-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211204071323.2480163-1-alex@linutronix.de>
References: <20211204071323.2480163-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Dec 2021 07:13:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159161

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-lib-meson.build-fix-meson-0.60-compatibility.patch     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-fix-meson-0.60-compatibility.patch b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-fix-meson-0.60-compatibility.patch
index 159425a643..e7c782055b 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-fix-meson-0.60-compatibility.patch
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-fix-meson-0.60-compatibility.patch
@@ -3,7 +3,7 @@ From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 25 Oct 2021 18:18:15 +0200
 Subject: [PATCH] lib/meson.build: fix meson 0.60 compatibility
 
-Upstream-Status: Pending
+Upstream-Status: Backport [https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/963917a3565466832a3b2fc22e9285d34a0bf944]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
 ---
  lib/meson.build | 2 +-
-- 
2.20.1


