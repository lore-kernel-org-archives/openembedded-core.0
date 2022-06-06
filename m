Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6628FC433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 14:39:25 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.32779.1654526364252574220
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 07:39:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=MbUmAfcy;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id 187so12858743pfu.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 07:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IpbazTfe3AnuK62z/q1N2/s7sVN0IesTqhl9A2DPwU0=;
        b=MbUmAfcyv5QL1snF6WrzPBPumxIiOz1ibIYb8NxEFTnD/ghVddW/FJ1EYjsMQMV1vg
         7sNAZ8xuQgRwRZBtVeQEPn7rc6ZVT/VO2H2n/VGi+jcr7YuLGsmnBYcUt1SYWu7E5Tza
         r40WZy2cfuM3szTpCCmjJQU5kS+aoSPONZ6WKhHYnBlBBm7Gso2Jb4h+0K1L56Z9EqN5
         5hfs2krgnguo292yBvcdybuadOVCx1wVwnqylJfCL2DjRP5hqw8EZBnBPWzi/mkf4MAj
         xOIHxwDin8z5C6qna3n89HCUfkXWfZLrEax9Ibgs7R2u6mSvpmoH6ak0Yf3cNXs6UbEP
         OKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IpbazTfe3AnuK62z/q1N2/s7sVN0IesTqhl9A2DPwU0=;
        b=N3uQaKLaoiQ623Dk0GmHDukTK5t5KwaCtvyFiEXuT3g4eSTL/sVLXmbBsLy2ucxyYM
         bGj24mEkGMfo3sRKDuDZ45/7QJ8WNpJJaa/8Lq/+lhgsy+M/aDDFEagx3bG6IT8zBIRW
         Qu7A/fh5w1Ad1Qy7FJZDkz0XFQLpDtcZmyFaTDx2eWps18GtQcUxgvnjeUyqV4R3rpwp
         slFPBvQgW2I4I/NL2ov6W1wxByQVPmPvqftdZbkbMMvG6miPsTro10Hzlo4G8F/piHbQ
         lBAya9TmhCm3WYJAge6LhutWFfAlFwluX7OAfwdZz5pVEkIzkGk6K6giCry2M++iCekR
         rhuA==
X-Gm-Message-State: AOAM532jQtK3O8kqDokHav32mXS4FMEdmn09/80Yva6186zxwCUtOHwy
	Rk0EHBUPmqObSXNznh4Zfxg5P8Js/3iUP31v
X-Google-Smtp-Source: 
 ABdhPJxSK72IPDEYjLe4hPiFgfvl3DGWAmOA2lsJg+dDTutzp2ZdjT6qsGkMe2kn9T1NcNOUYvIz1Q==
X-Received: by 2002:a63:524a:0:b0:3fc:7f18:685d with SMTP id
 s10-20020a63524a000000b003fc7f18685dmr21699467pgl.387.1654526363225;
        Mon, 06 Jun 2022 07:39:23 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a5-20020a1709027d8500b0015ea3a491a1sm10544112plm.191.2022.06.06.07.39.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 07:39:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/13] lzo: Add further info to a patch and mark
 as Inactive-Upstream
Date: Mon,  6 Jun 2022 04:38:31 -1000
Message-Id: 
 <27815774c983f7c2c849513efe087a6d77eaf443.1654526060.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654526060.git.steve@sakoman.com>
References: <cover.1654526060.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 14:39:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166646

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Add some further info to the patch based on upstream changes. Given the last release
in 2017 and glaring issues on at least armv5, it does raise the question on whether
we should drop this. There are probably better compression tools now.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 241309c6dec364445093fa5973cc8998431cbed9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-Use-memcpy-instead-of-reinventing-it.patch    | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/lzo/lzo/0001-Use-memcpy-instead-of-reinventing-it.patch b/meta/recipes-support/lzo/lzo/0001-Use-memcpy-instead-of-reinventing-it.patch
index db3a70e803..a0d2502d24 100644
--- a/meta/recipes-support/lzo/lzo/0001-Use-memcpy-instead-of-reinventing-it.patch
+++ b/meta/recipes-support/lzo/lzo/0001-Use-memcpy-instead-of-reinventing-it.patch
@@ -10,7 +10,15 @@ Change suggested by Julian Taylor.
 
 Bug-Debian: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=757037
 
-Upstream-Status: Pending
+RP: Patch is still in debian as of 20220524 in a revised form:
+https://sources.debian.org/patches/lzo2/2.10-2/
+https://sources.debian.org/patches/lzo2/2.10-2/0001-Conditionally-replace-reinvention-of-memcpy-with-cal.patch/
+It was submitted in 2015, no reply to an email from RP in 2022 either.
+
+We likely need this in OE to prevent against unaligned accesses
+on systems such as armv5.
+
+Upstream-Status: Inactive-Upstream
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
 ---
  minilzo/minilzo.c | 14 ++++++++++++++
-- 
2.25.1


