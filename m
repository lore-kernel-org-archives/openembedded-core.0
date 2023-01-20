Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A10C05027
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:11:49 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.82047.1674238270372454591
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:11:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=7a7UTbTU;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id 200so4582694pfx.7
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2WcwEuDcVSRp0+ES+TOGsCdoM9W2pwo69wqOnORfv+0=;
        b=7a7UTbTULLi6sMA3uDEsh9QJjWDnzqYNz+8yrHIZpRX9xCbVDGyiBxcykI4GwaEEV9
         LdNvEemBjpTLiSruynjWVBYT/2yG22yfFDHBI/e6HbZdzf0tYUZ41qNzxmpxoDMlSj22
         HwvwwpbW3eYdcrGzEoEVvpKknoSSQlGWk0WlVWj6tQlkQgrd0Yvzai5nzuH2OVBz7vHV
         1be5Qc/bOFi4naLMx4mHeAriAn05mNNEvWfoVXKxDF3fgSXoDe5YRFKhoufdCqlPNSFw
         JmlGQ9vqfG66LNzwD5p+5fIr6Q9F30Y3cAOOCgQjsMpA4VnC4r5wA8DK/57CUH2/bDuX
         eZ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2WcwEuDcVSRp0+ES+TOGsCdoM9W2pwo69wqOnORfv+0=;
        b=mzvZYy1AVJSmmrA0lsCqmCGFHljegPkf2bGsVDUQRXJQEwiyEgAykJyHy47PK252op
         rNDuvHkjZVeupzz8BgjdpPbUgpnlLsQAloXhW/LVM5X2AWg2G/W1JHrWncNVRjKf0auY
         jIFVn6zeiJnceqtlVU2tJrtViw7v+VmPr7ZP56nHnt9dxZQeYnIQ2r4JCflcePYhD9nl
         8Wcg7EyPqHxkve/wUN5XuXXqx1Dri8up6XjvAI2xRXvznv+c9pUWlGDx0e8XHM+vOEAU
         VmNnxfUV0Quq9dcW9ARR543+WdfCeeduxz0kUlJyx2OMj2U2vwkj336XopXQEwmbaXG+
         xwpA==
X-Gm-Message-State: AFqh2kp4NbOnrzI1Xzev3cXaqbQVeUH5GI1ePDANQc32sn/N3oxOrzpE
	cWG3Q7EY7Ut1MiH0MAACk1DbOBZ4WCI3RZUkWno=
X-Google-Smtp-Source: AMrXdXvdw5MOYBMPYSJH0UtjcWyGictcpVsjGVyz7iV75nkJgjUM/MX+QekwIOkTndneR28sx0Vrxw==
X-Received: by 2002:aa7:8a0e:0:b0:58d:9850:d55f with SMTP id m14-20020aa78a0e000000b0058d9850d55fmr15831510pfa.21.1674238299329;
        Fri, 20 Jan 2023 10:11:39 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i128-20020a626d86000000b0058db8f8bce8sm8990396pfc.166.2023.01.20.10.11.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:11:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 19/41] vim: upgrade 9.0.0947 -> 9.0.1211
Date: Fri, 20 Jan 2023 08:10:36 -1000
Message-Id: <c011af837b968d0c5219b0cf0dbca33e4d6a6ba3.1674238148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674238148.git.steve@sakoman.com>
References: <cover.1674238148.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:11:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176226

From: Randy MacLeod <randy.macleod@windriver.com>

Includes fixes for:
   https://nvd.nist.gov/vuln/detail/CVE-2023-0049
   https://nvd.nist.gov/vuln/detail/CVE-2023-0051
   https://nvd.nist.gov/vuln/detail/CVE-2023-0054
   https://nvd.nist.gov/vuln/detail/CVE-2023-0288

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1c51068c78d12ee02789a6dbecf5e7e91d141af5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index d86841efaa..9bc6881fce 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0947"
-SRCREV = "cc762a48d42b579fb7bdec2c614636b830342dd5"
+PV .= ".1211"
+SRCREV = "f7d1c6e1884c76680980571f1cf15e0928d247b5"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.25.1


