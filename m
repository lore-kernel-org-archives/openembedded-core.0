Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0420AC6FA82
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 15:28:04 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.208.1663860474952401055
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 08:27:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ka6ba0SD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id
 r3-20020a05600c35c300b003b4b5f6c6bdso1583883wmq.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 08:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=xKldejdv+NRqRTl4/TY65EJgWZaTIw4ht815eHsEaSc=;
        b=Ka6ba0SDH2U0Kq+91P88/V7mEtC/7S4z1mBGsje+kNmG0w03yJxEeX8/sYNoAGYNMg
         eGfvi9W97AVYX+U048YkvjB/U4pmh29OfaGiUxdvCEJfK5WdRxCBH9LNpTxH+SJ85xlo
         pKdne0SRaRi2x02s0DaAlqfCBmy1FlZAia0gg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=xKldejdv+NRqRTl4/TY65EJgWZaTIw4ht815eHsEaSc=;
        b=1Y67DLhf8Fg37n1ZtfhdnsKBenJ2GffYRY1K5ulyNz9fl55kmGGL9yZdhT6bMex1J5
         4VRRrAdVG7ktXbCUX2I3kO/AjGtPrdn4HkXnf8x+xOyQRbTCCCMZb1SjatIkcDBi7xrX
         Owmtxzogtwu9Fn6P+DnzCy94ht/AcQTMijUbJ5nwcOd4JXCAlk0N8yXtercK+8cXwVd4
         W3Fi9YfFiM5IXqGBtVr2Tk9wUk3Q+g02fE7h1V4IHHJZX8BhzfE3OcHnoWnNwd5IKihN
         ZFJKC8Nn+TXoyDet/nacApRz5LXH2fXidKMG1ho1pbor30ZGvpnNJr5AGrhZ4HKWAMBo
         Ns/Q==
X-Gm-Message-State: ACrzQf0hZO05Au2v3UMzt/fdUvKEPlrNmGw1o8W3dPQ4mNmlYAWfVjAq
	RsZrFwrypjd8ptUlbG3zcEY37y1kvRHw8g==
X-Google-Smtp-Source: 
 AMsMyM75M1gh/WkirZGJedb24prwk00TZEtI5pej2rHwT2/6LoTQTSnBJzigGW+2FA7zUWImCRQ1EA==
X-Received: by 2002:a05:600c:2142:b0:3b4:92b6:73ba with SMTP id
 v2-20020a05600c214200b003b492b673bamr10183203wml.139.1663860472715;
        Thu, 22 Sep 2022 08:27:52 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6f87:a0ac:e77:378])
        by smtp.gmail.com with ESMTPSA id
 o2-20020a05600c510200b003a540fef440sm6881428wms.1.2022.09.22.08.27.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 08:27:52 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] vim: Upgrade 9.0.453 -> 9.0.541
Date: Thu, 22 Sep 2022 16:27:46 +0100
Message-Id: <20220922152747.1685843-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Sep 2022 15:28:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170984

Includes a fix for CVE-2022-3234.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 70dc2dfecf5..5ff60f84953 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0453"
-SRCREV = "83a19c5fda0556330860899bfb484addf9178cd0"
+PV .= ".0541"
+SRCREV = "ee7c8d999beb847457f768757b1bdcd76391c1f4"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.34.1


