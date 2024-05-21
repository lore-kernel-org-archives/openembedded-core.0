Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 126EBC25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 11:26:34 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.17341.1716290784103408717
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 04:26:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=egxNiM/8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-34f0e55787aso2839826f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 04:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1716290782; x=1716895582; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWqRfXukM3wPXFTSBuM4SEFkg1etnDVU358t7zoeDDQ=;
        b=egxNiM/8LXgtr/0iiqjUooJVbd4zMdmbEsw075ynzri7cCPo70GQWJn5ylGDAay3IQ
         oUZ63+LAX+FKII7XC4UkMSRf3TLa2MGFyp5B6nhKkv1yAhd/iyETyApyOkeS33bpDe84
         QVbEpU+aFiWQN+WR+MXz1vXl8UCq13ewbyqUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716290782; x=1716895582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uWqRfXukM3wPXFTSBuM4SEFkg1etnDVU358t7zoeDDQ=;
        b=g4Of7O26tIInGRnZdIHnwhUjvNG/B6j28Czpp8/zG5vMuUELy7dC+GHSGPxE5rjxcL
         1jVqAGl2/arpK33b133miEBj48aqCLbBukkP1HqbzUdzwIWg4zqs4bUmszGWlcuIjzyR
         0kBxHeMKXHaHPyDpI7QtXW65QGXgPaMPqk98LTKhpXEczp9vwXQJrlNV4AdVLZLAb9mF
         lIFGntsToXJz+5+lbKOrsJFn3vVouF0RnFt1V+IUG/wxehdVN71sDrhxon+Q7u/avF2x
         HRhzJmNGTgnvdrvYykpXfOc1hQiUS8qkRDdUvo4gHrEDVbWgZj3G0eQrB0CO7KGtvoEn
         mZpg==
X-Gm-Message-State: AOJu0YzmejfGXfSmEAycI2QZ21TymNgTpdjtpV+8hjopNBjq1SGczqbE
	WNYp9Ysiu+221IgAuoN/pC2rmZ4C+pox/clc1+5dwbDdMyxJ6OuKyDsuPqEqPM69WgdeY3A0vte
	ljUc=
X-Google-Smtp-Source: AGHT+IGrIMhdKgQArcXRIN+aAFLcMSm0XZDKEfzbm/Zsw6BryqrjT9ewGNruKg3C76PFzj4mrXxh/g==
X-Received: by 2002:adf:ce0b:0:b0:351:d7a0:d48a with SMTP id ffacd0b85a97d-351d7a0d4ebmr10769211f8f.51.1716290782483;
        Tue, 21 May 2024 04:26:22 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1738:232d:aeeb:3bb7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502bbc4b41sm31670646f8f.113.2024.05.21.04.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 04:26:22 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 9/9] vulkan-volk: upgrade to 1.3.283.0
Date: Tue, 21 May 2024 12:26:14 +0100
Message-Id: <20240521112614.1137127-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240521112614.1137127-1-richard.purdie@linuxfoundation.org>
References: <20240521112614.1137127-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 11:26:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199629

From: Tim Orling <tim.orling@konsulko.com>

https://github.com/zeux/volk/compare/vulkan-sdk-1.3.280.0...vulkan-sdk-1.3.283

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{vulkan-volk_1.3.280.0.bb => vulkan-volk_1.3.283.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-volk_1.3.280.0.bb => vulkan-volk_1.3.283.0.bb} (92%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-volk_1.3.280.0.bb b/meta/recipes-graphics/vulkan/vulkan-volk_1.3.283.0.bb
similarity index 92%
rename from meta/recipes-graphics/vulkan/vulkan-volk_1.3.280.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-volk_1.3.283.0.bb
index 2ef12fedf84..5485aa0b0db 100644
--- a/meta/recipes-graphics/vulkan/vulkan-volk_1.3.280.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-volk_1.3.283.0.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=12e6af3a0e2a5e5dbf7796aa82b64626"
 
 SRC_URI = "git://github.com/zeux/volk.git;branch=master;protocol=https"
-SRCREV = "01986ac85fa2e5c70df09aeae9c907e27c5d50b2"
+SRCREV = "3a8068a57417940cf2bf9d837a7bb60d015ca2f1"
 
 S = "${WORKDIR}/git"
 
@@ -27,7 +27,7 @@ inherit cmake features_check pkgconfig
 # These recipes need to be updated in lockstep with each other:
 # glslang, vulkan-headers, vulkan-loader, vulkan-tools,
 # vulkan-validation-layers, spirv-headers, spirv-tools,
-# vulkan-utility-libraries.
+# vulkan-utility-libraries, vulkan-volk.
 # The tags versions should always be sdk-x.y.z, as this is what
 # upstream considers a release.
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
-- 
2.40.1


