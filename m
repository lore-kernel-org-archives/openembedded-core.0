Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2337AC433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 09:27:04 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web09.4178.1667381213989049034
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Nov 2022 02:26:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fiyGf2Tj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id fn7-20020a05600c688700b003b4fb113b86so854098wmb.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 02:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xnWVEnRyJ8sGgEfGkxovOSxCMTnTn8h/MZrHprX3nS0=;
        b=fiyGf2TjqJ1LgD9Rd0pcsS2uCmnN2IzAHyjLEfJz0nzGb2YHRmAKhOKszxzeypKBx/
         N/REgKSggRpJBLD7cWHAwQ1XRqow7/iXEfAe+5Mx79PFetr7AGuYF3jmMLkPNm0bXzH9
         P0NRqK1kjN01cNatxwxx9JNmPrezNWMQpCYl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xnWVEnRyJ8sGgEfGkxovOSxCMTnTn8h/MZrHprX3nS0=;
        b=MpTD9uqhsvh64GXENwTxQC2z6C+TO1ekHAJP1ZWccbL0ogNsRkS0nUMjJP2iRueLDU
         YosXak50nuDw2CNMgTc4mGzJ7MHwNguUVjMc0osZgxcfHwjwf8+GNO9X+DKI5dPyzKzP
         3o1CfDfPKw36Dv1mx2CObbuXZ+6EL3sbYYPKXneDDjWTenTrxnPuVB55LXnn0mXeryVa
         W0u+HYt+uFleQM2GU+7rtl7Z28W/XqzPmKheboj9LPvAFO5VBObxwacgNTWRjizZE1tF
         MpCa086kNETLqpGa0sVOqqUlaNbq+HVbUDPMGuoVLBLll5oK11DBRtsfyVqcj5to3QLf
         1pTQ==
X-Gm-Message-State: ACrzQf0rtc1uF0MbPYAi8R19SDH9xTd0060pcplfAaRXSze8yqiXMR0l
	REszTISgiiWVQuitbqtPI9peJC01MciEHg==
X-Google-Smtp-Source: AMsMyM7hc6G8ow9A+vapXa2vopEElw/avMYczICGAXcqNc8WXMkxKYyEEuwoRrNzBV1o9LfJKChhXg==
X-Received: by 2002:a05:600c:5563:b0:3cf:857e:18c0 with SMTP id ja3-20020a05600c556300b003cf857e18c0mr1725490wmb.24.1667381211758;
        Wed, 02 Nov 2022 02:26:51 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b8b1:19d6:e9d8:a61a])
        by smtp.gmail.com with ESMTPSA id p16-20020adff210000000b0022ac672654dsm12371431wro.58.2022.11.02.02.26.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 02:26:51 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] patchelf: upgrade 0.15.0 -> 0.16.1
Date: Wed,  2 Nov 2022 09:26:48 +0000
Message-Id: <20221102092649.631136-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 09:27:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172577

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../patchelf/{patchelf_0.15.0.bb => patchelf_0.16.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/patchelf/{patchelf_0.15.0.bb => patchelf_0.16.1.bb} (90%)

diff --git a/meta/recipes-devtools/patchelf/patchelf_0.15.0.bb b/meta/recipes-devtools/patchelf/patchelf_0.16.1.bb
similarity index 90%
rename from meta/recipes-devtools/patchelf/patchelf_0.15.0.bb
rename to meta/recipes-devtools/patchelf/patchelf_0.16.1.bb
index e07775f5740..8ce9e995207 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.15.0.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.16.1.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-3.0-only"
 
 SRC_URI = "git://github.com/NixOS/patchelf;protocol=https;branch=master \
            "
-SRCREV = "49008002562355b0e35075cbc1c42c645ff04e28"
+SRCREV = "438d23e29c73beb8f16e04efe2a91daa6819ef34"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


