Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94711C32772
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 14:35:35 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.18813.1661178928311078128
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 07:35:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h4AZlF6N;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id e20so12980580wri.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 07:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=euB48GaSN/v/8NJV0STQtaPZXMMo1c9RWBP5WuwCG9M=;
        b=h4AZlF6Nkj/ALFr0CNAc8mBJo2UINDo39aau2WORl19XlDRqW50tkn3ocrv5mhB2D0
         /WjoNLc9MXd6Ta2nfQxvPdeNQ6YQHU73Y7a2djQ9NajDsEtFcqiaVBjL/2fCnGp4X8mQ
         J/hfD1kNQPC40F5zPOq/ZtKg/ng5A4B4TT03w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=euB48GaSN/v/8NJV0STQtaPZXMMo1c9RWBP5WuwCG9M=;
        b=jejtaEAGM9POF/atJHqfcOYwJveo48oX9+2u4M6oBFOxG8oBUOJGHq+XqH3Eq6UvPd
         zZeduSRESaBUVd4xnHAcfxYP1Dzzp7pGllszv+d0adSYfPd+ha6vfVukpe1BsEE5dpC8
         uOg1OMiCjKIQF9SlZoQCSO3jVRRlJ9U78FVm50s40Ps/awERwrHK7W72GeJQAtcrI5m6
         IIER1eMlAhAC7wSSTCbOipSqeq8m4+/yHwzmMBuxc/8nL3xApotT3VrUuG4peDxSMfeV
         hycJreM6cOyYsbrYgXG4yxc6M8FghucSb+IRcncnxoTZGIpvO2bXxoIiG31P1RIPcMYh
         pUOA==
X-Gm-Message-State: ACgBeo23fXOm0sikE+PDubgvEXm+UfQW0mof3DOQbrU4hrTRHu8GOGlm
	gcIC/UR7Oo6YrHCGYmUKH38lEdGIPXm4lA==
X-Google-Smtp-Source: 
 AA6agR65gwi1Eo+5V/rG4bE4kBjDRrQy8/HSPiBvLPmERYPXDHtv93LRao1HAhg5Ky74cLsQLReFPQ==
X-Received: by 2002:a5d:50d2:0:b0:225:1bd5:5a40 with SMTP id
 f18-20020a5d50d2000000b002251bd55a40mr10293258wrt.606.1661178926211;
        Mon, 22 Aug 2022 07:35:26 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a4a9:e65c:bb6e:14cc])
        by smtp.gmail.com with ESMTPSA id
 p16-20020a05600c1d9000b003a60ff7c082sm18589559wms.15.2022.08.22.07.35.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 07:35:25 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libtirpc: Mark CVE-2021-46828 as resolved
Date: Mon, 22 Aug 2022 15:35:24 +0100
Message-Id: <20220822143524.2755202-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Aug 2022 14:35:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169675

This CVE only applied to pre 1.3.3rc1 and we're on 1.3.3 so we're sorted
but the rc versions make the automated matching fail. Therefore handle
manually.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb b/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb
index bd13f6e95e9..8c6c20733c9 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb
@@ -14,6 +14,9 @@ UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/libtirpc/files/libtirpc/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
 SRC_URI[sha256sum] = "6474e98851d9f6f33871957ddee9714fdcd9d8a5ee9abb5a98d63ea2e60e12f3"
 
+# Was fixed in 1.3.3rc1 so not present in 1.3.3
+CVE_CHECK_IGNORE += "CVE-2021-46828"
+
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-gssapi"
-- 
2.34.1


