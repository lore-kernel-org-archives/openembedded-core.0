Return-Path: <mathieu.dubois-briand@hyprua.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF80C4708E
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 14:26:31 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.16472.1670423183413536822
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Dec 2022 06:26:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hyprua-org.20210112.gappssmtp.com header.s=20210112 header.b=Qv5ALPBT;
 spf=none, err=SPF record not found (domain: hyprua.org, ip: 209.85.128.48, mailfrom: mathieu.dubois-briand@hyprua.org)
Received: by mail-wm1-f48.google.com with SMTP id j5-20020a05600c410500b003cfa9c0ea76so1177526wmi.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 06:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hyprua-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zTqEUCEw6Eh2WaPM1MftDNmmS3I4v6qnHkvQsh9Mhcw=;
        b=Qv5ALPBTfdtHC2bsCFJiTwkj2OpWIhV/KipS+bErGKwzbYVeAy83Tsok8I302QC29M
         0qL/I907O/VDCqKaVSn9UZ6i55yFZtpbXlo/9nh5uJcQYmHfyp4vMBh7+zYQanncodor
         zHUUDtRJcuPPTGgcp9zhBC+SrLwydky+mpDrbwXSVTKgxBwD/+qYRldKy5yDpKhGSOgI
         safF14918E3rVMGqMzXK6Ixg0SoNa+pGQyO6mN2B+99Bpzi7laOQpbgGsUamNkQF0DBC
         sNE+Vt7ZnT/lM0yTbrrFyFxo+BgoF/WkisMx9JfM02o4FVQIHEgnDHlNHy/XueQS4oZ3
         bBxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zTqEUCEw6Eh2WaPM1MftDNmmS3I4v6qnHkvQsh9Mhcw=;
        b=Onke9EA4/F5nXr5iyvwTN/FGyRimdINp6UJdsode8rsEpxW5dfVeMelx2WXwGE8Yao
         emuJFqDj4lIKCCFJUQFsgnuWopICCFCauLUJIEV3woUd3Sqyhko606fI5tw7Y8R9ofAq
         47/L3sFoSrCrSLDxV2eB6/6p7/2jJO80HAcbKMKvM0sXi72yCPFPT+IUX3eaqcV8nJOs
         1FD+7ZvfMigmx1oqoNiY3wdpiA1FGoRBQShbnpVSBe8uc7S8QoTl/iCeL06IM1956HTg
         h0NDrAm0W+tOr3WRLxQeE2knb6vNnPCUyRdGZ34dQ+G5cLX8ga3mUIGBbrt1PnFEpsEp
         LeKQ==
X-Gm-Message-State: ANoB5plbEuj6uLHX/G8TOvcnI8rx7yo8L2AF+gNaVXANiVBevn6HVuOA
	wLzoN+lo9S6T/Crh3psq56wNprupsPXYZRhU
X-Google-Smtp-Source: AA0mqf7qwaLclkO/czG8ypui4ErsHFnp0WDlB3FjecRg1GYQXj5uNZPIi+V40qrAOgT6yWG8Uh8WVQ==
X-Received: by 2002:a05:600c:1c87:b0:3cf:ae53:9193 with SMTP id k7-20020a05600c1c8700b003cfae539193mr723347wms.39.1670423181314;
        Wed, 07 Dec 2022 06:26:21 -0800 (PST)
Received: from WIPC21110265.. ([2a01:e0a:a66:3180:c091:5ea2:164e:f210])
        by smtp.gmail.com with ESMTPSA id j4-20020a05600c410400b003cfbbd54178sm6689385wmi.2.2022.12.07.06.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 06:26:20 -0800 (PST)
From: Mathieu Dubois-Briand <mathieu.dubois-briand@hyprua.org>
X-Google-Original-From: Mathieu Dubois-Briand <mbriand@witekio.com>
To: openembedded-core@lists.openembedded.org
Cc: trini@konsulko.com,
	Mathieu Dubois-Briand <mbriand@witekio.com>
Subject: [dunfell][PATCH] vim: update 9.0.820 -> 9.0.1025
Date: Wed,  7 Dec 2022 15:26:01 +0100
Message-Id: <20221207142601.1138495-1-mbriand@witekio.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 14:26:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174356

Includes fixes for CVE-2022-4141 and CVE-2022-4292.

Signed-off-by: Mathieu Dubois-Briand <mbriand@witekio.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 262c97bf0f00..de979d01c587 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0820"
-SRCREV = "03d6e6f42b0deeb02d52c8a48c14abe431370c1c"
+PV .= ".1025"
+SRCREV = "3fc84dc2c7efecd7c14ce341cd777475058936fd"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.34.1


