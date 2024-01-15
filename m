Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C6B2C4707B
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 13:43:16 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.80271.1705326195735223044
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 05:43:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZePtkpB8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40e7e2e04f0so4779965e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 05:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1705326194; x=1705930994; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jdroJRvJyDE9+mlwN3JbPiTcATSvKAaMUVcpibeZvh0=;
        b=ZePtkpB8e7LUBEqB9mpQBO8954/lB2H49dQbgQGvt3xTbNe+zOQY2QIIUld9oYcpG6
         LdVjWNgMKNf1LHOvQ0swH4qUKl9TwGBc97gmejSDYWG6iUP9Db01mXxWCR/cTD6FHewm
         /fxRuYjZIyFln7mGSSzlPdEptqAJ4XCCuWieA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705326194; x=1705930994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jdroJRvJyDE9+mlwN3JbPiTcATSvKAaMUVcpibeZvh0=;
        b=bnvk3qo757Wxcnq8eL0H/qsZW65ByhuKL0PgEe4FNtn95sOaNmd6vHOG15RVGpvv2p
         UQOAvA/nuviRB3SIp0pzBaI5kFEFFptHpjqFYWUgojL9vpxFSB9qzSUmPp5xQ05UpXze
         BXg0NhAZ1iYipNXwWHyKu8cqViZAcwrC3DWFfDM5j2B8vPZYraq+DUuOpgDioucrEFkX
         bjIrUVLe1Q97cDTFjjpxXxVWLDgev5sB5L4uBC9+OENjX6rQmqU2LlhbujDavfTyXEOJ
         DcwVn9LWrxGh6R1xcIH3PH+gHlxH85yK4COaRvIO+a7kApmfgHjjlL+QsZ4Ue1RgVXnM
         vTow==
X-Gm-Message-State: AOJu0YxCvAOwaHB1x989oLhv0Z3BzxnkOC20+m1IBpaD9PLWavk8xGci
	7EUwr92ZOStkT3JDd0fTMYcStiAM9Cc2x8D++clezg89Baw=
X-Google-Smtp-Source: AGHT+IFOCqsxDZSebms8ubNU0hCAFqKhaqXE4Ra7lsMPpI9J0pabn2VGJChK9uzSozkptUde89MQkw==
X-Received: by 2002:a05:600c:4d0e:b0:40e:465f:7fb4 with SMTP id u14-20020a05600c4d0e00b0040e465f7fb4mr2953175wmp.29.1705326193790;
        Mon, 15 Jan 2024 05:43:13 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:72a4:a6e5:bd33:85bd])
        by smtp.gmail.com with ESMTPSA id p31-20020a05600c1d9f00b0040e6ea6d2d0sm176562wms.24.2024.01.15.05.43.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 05:43:13 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libtool: Update patch to mark as backport
Date: Mon, 15 Jan 2024 13:43:12 +0000
Message-Id: <20240115134312.3764657-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 13:43:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193673

The patch merged upstream, mark as such.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...2-libtool.m4-For-reproducibility-stop-encoding-hostnam.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/libtool/libtool/0012-libtool.m4-For-reproducibility-stop-encoding-hostnam.patch b/meta/recipes-devtools/libtool/libtool/0012-libtool.m4-For-reproducibility-stop-encoding-hostnam.patch
index c750303d430..b0f771c9bbc 100644
--- a/meta/recipes-devtools/libtool/libtool/0012-libtool.m4-For-reproducibility-stop-encoding-hostnam.patch
+++ b/meta/recipes-devtools/libtool/libtool/0012-libtool.m4-For-reproducibility-stop-encoding-hostnam.patch
@@ -10,7 +10,7 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 https://sources.debian.org/data/main/libt/libtool/2.4.6-10/debian/patches/
         no_hostname.patch
 
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00011.html]
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/libtool.git/commit/?id=bd826173c4c9c3fa8d77d92785754897cb4bfd89]
 
 diff --git a/m4/libtool.m4 b/m4/libtool.m4
 index 022c1292..1a8a2998 100644
-- 
2.39.2


