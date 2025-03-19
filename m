Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D90DC36000
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:28 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.2916.1742372181264101403
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eU62G3xW;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-225fbdfc17dso62538615ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372180; x=1742976980; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8le/Z1ps8+P5NGFWEipToC9oMxO784khj5mFtyqm+8=;
        b=eU62G3xWPTLSyKFS1bvlc3tZSA1u51WFhdFzcn1aweU8hRQfsSLtmoCDKTWcZ0Tgqy
         zfAFuxbjDh6HBrqdSpZIPONJ8b8IeyaWBXh60ByrlroCJJw7Ylvy4D6zThq4LHMhtvHy
         AoCsQ1i9gVr6Tl0YGxKuXKIG6pywm2+Kec6Z9nPQdW5UM29y0fTun1xlGGiQxhAYgTU1
         +CcYr6OSec/6vbm4fueVYbcfy1uuDf8mqBGW/seE8f7XWceuc/zb0O05evAOFPCONitY
         Rpsa5NbikR9l9Cjd4YvPKUOvio2gPTFsxlIDvCagRr8OZDvpz1jhnCd6z0nDGu0mzf8u
         927A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372180; x=1742976980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b8le/Z1ps8+P5NGFWEipToC9oMxO784khj5mFtyqm+8=;
        b=Qq4V8z1+szP7ReAzl3Jneyzpl4qc6LLQlP9Dg9sYPSPEO6sySORLWh26sz2EGCfiLk
         YYo1gFsB+xzT0fqPWL6oBH6Z3UNEhLBnLfKWZHXH4iIpP8nwKEmsP/EeK/OfbHStl34k
         EFoVypV/emWSZYH9s21fpR9dC3sJpai7a4piEfg1ZXhRYgHxlT5IzaMqshl2fObCrwTT
         tOEFjYk+eLpl1y7mX18IL99lopekay+D9tWDgz/nw4mE6W662H/3koYP0bKyticdM9P4
         p3TVe8ED7ZNdPLWctzObkStoNFMSzlO/oW3amsqJ+Jp2737Ovt7a9No32cVCk1pIADS8
         TZfg==
X-Gm-Message-State: AOJu0Yy0UchkCPUwD7MvAtsdGCg18VLS4pAIiu3d45RHnhypZRO5U54y
	IK1+mbtu9WhHaGqkp62iW6PlSOWT17+pEuNy4348+3ibj5lJYNSl5+FV6OQ/
X-Gm-Gg: ASbGnctKwTSTkxk8sFQLQ0S4yEiLuGfBwlEPw4cjonOvH22D691bFe6ACT1nhpAlHlx
	8Xch+cPztZGMjJ5Dsuhr/tvMeLBUPdDvU7z71W7v1SSyVyjzvRCiuSMGgm4OPduJ/CZz3SJRmf0
	Fg36OP9F4F+NHhjUDt80pxiLryhFu0aOZKwiRwYrjETR2nW86Su9oUXP6NkUYfc9hpvf0zwbydl
	Nj9yV/W25Ev5c3XFHd1WXe+i1gFwzfccLmaZQP/r0cE+6b3bQ8TEgSME6GUO80GdNAwozjymDIp
	ms0XOK34SLVftMIwaFQBMPgtnAQgtOl6+9wB
X-Google-Smtp-Source: AGHT+IGECfFvu7kYkq9/6lQZOSnJcZkmZEh2cUNUB4Yz0aAW+kCdZRmmmglE/yhCT5zO11UkdX2CeA==
X-Received: by 2002:a05:6a20:7f9f:b0:1f5:7eb5:72c7 with SMTP id adf61e73a8af0-1fbece408fdmr3443778637.29.1742372180429;
        Wed, 19 Mar 2025 01:16:20 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 08/27] bash: Stick to C17 std
Date: Wed, 19 Mar 2025 01:15:36 -0700
Message-ID: <20250319081610.3536475-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213274

GCC 15 defaults to C23 and bash is not yet ready for that
so keep using C17 like GCC 14 for now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/bash/bash_5.2.37.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/bash/bash_5.2.37.bb b/meta/recipes-extended/bash/bash_5.2.37.bb
index 20c51ecdbc9..9f02ea17b5b 100644
--- a/meta/recipes-extended/bash/bash_5.2.37.bb
+++ b/meta/recipes-extended/bash/bash_5.2.37.bb
@@ -20,4 +20,6 @@ SRC_URI[tarball.sha256sum] = "9599b22ecd1d5787ad7d3b7bf0c59f312b3396d1e281175dd1
 DEBUG_OPTIMIZATION:append:armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 DEBUG_OPTIMIZATION:append:armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 
+CFLAGS += "-std=gnu17"
+
 BBCLASSEXTEND = "nativesdk"

