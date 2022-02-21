Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F979C433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 14:14:50 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web08.11298.1645452889891008304
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:14:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=NLeMoPDr;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id b8so15362693pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FzKvsR+dExfaJKy98Ql4WNUEvGay+bl6B1n9XGUd+S4=;
        b=NLeMoPDr551kx0Ih1zPZw6gU3aMrK5TKeByGrLXOYHSIEyAAJ61EihugKpz+CDt5JR
         t0P03ebphK3n/iJ8Ik4cYA3hpdy4JwAOaGl95R7HkXl0AJ7OtISxnIkzgw5OK1es7Nla
         uI0iOX6jTqatWTAKwf4HFuwnVf0IH6fZH7KUPweZhZm7VzbpWn6bQeDQMA+8/xuWf7ph
         UaGukkIHEmiBif7knqapGK6yKQCkMobBdj4oP7OG0J3/5paABO+LXMO+vH7mVRTAIWZB
         Rv6dFwW+6JLJdqyFD8N7tz4nbxaFm1usp8DiLrii+pkTCfyMlRQoAwycQJ62Y2l0yAXu
         JjmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FzKvsR+dExfaJKy98Ql4WNUEvGay+bl6B1n9XGUd+S4=;
        b=iqEa1tEbHcZbzUhhefQPy1CA0e9XBFA37M8pWir6R+mbwyD71xnslmsxXSjJ9T+kNg
         isUNf2aIX0qWLGLMkxuiPP9cTYYx6Pp4kvnGFxqrnsx9Dz8+H0ulfEueID5c6P5Z10M3
         EFIoBpsiSuXE16RuVcRXlmcv1xohHYCSWhjyAvS0kSnC6ZFMamphCYpEqgoFF2I/Fb7X
         EIZ3RQ5yUMH/RP9pNzfV89ByG1onFBcn5QDY4yc+hN2fn4b0jSl9zKmkHeXyziEYBaT0
         +Pjs/Nqb5Bz9S4+RJcUIN39U/fWJAQpwY/7q0VYudVo4Qpssw8n6g1bSjBQmUtbb/toq
         bmdA==
X-Gm-Message-State: AOAM532zcwpkEYcczXtd+dvGV1uwgolPe6dc9pZDzq5oNe0a0xYcgZ0U
	6N2IkGLj50b7Nl7/tWOqCN7VXFCpp1I0QIZa
X-Google-Smtp-Source: 
 ABdhPJyFzyP9ajuy5k6TNou+G1l/dvovVdDR9FKbEKYsQr0e9QxBFHPl9FnwgDWtBZhhMa6EicIjpw==
X-Received: by 2002:a17:902:e742:b0:14f:252d:7a65 with SMTP id
 p2-20020a170902e74200b0014f252d7a65mr19156395plf.62.1645452888977;
        Mon, 21 Feb 2022 06:14:48 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 8sm12919235pfl.164.2022.02.21.06.14.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 06:14:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/20] freetype: add missing CVE tag CVE-2020-15999
Date: Mon, 21 Feb 2022 04:14:06 -1000
Message-Id: 
 <26daab8a30661b64d2ee3de030e472da5160b387.1645452535.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645452535.git.steve@sakoman.com>
References: <cover.1645452535.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 14:14:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162036

From: Purushottam Choudhary <purushottamchoudhary29@gmail.com>

Signed-off-by: Purushottam Choudhary <purushottam.choudhary@kpit.com>
Signed-off-by: Purushottam Choudhary <purushottamchoudhary29@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../freetype/0001-sfnt-Fix-heap-buffer-overflow-59308.patch    | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/freetype/freetype/0001-sfnt-Fix-heap-buffer-overflow-59308.patch b/meta/recipes-graphics/freetype/freetype/0001-sfnt-Fix-heap-buffer-overflow-59308.patch
index fa8a29b798..31f9e32dc2 100644
--- a/meta/recipes-graphics/freetype/freetype/0001-sfnt-Fix-heap-buffer-overflow-59308.patch
+++ b/meta/recipes-graphics/freetype/freetype/0001-sfnt-Fix-heap-buffer-overflow-59308.patch
@@ -6,10 +6,13 @@ Subject: [PATCH] [sfnt] Fix heap buffer overflow (#59308).
 This is CVE-2020-15999.
 
 * src/sfnt/pngshim.c (Load_SBit_Png): Test bitmap size earlier.
+CVE: CVE-2020-15999
 
 Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/freetype/freetype2.git/commit/?id=a3bab162b2ae616074c8877a04556932998aeacd]
 
 Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
+Signed-off-by: Purushottam Choudhary <purushottam.choudhary@kpit.com>
+Signed-off-by: Purushottam Choudhary <purushottamchoudhary29@gmail.com>
 ---
  src/sfnt/pngshim.c | 14 +++++++-------
  1 file changed, 7 insertions(+), 7 deletions(-)
-- 
2.25.1


