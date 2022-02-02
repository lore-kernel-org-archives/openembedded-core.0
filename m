Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 423ABC4332F
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 18:28:09 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.2243.1643826487887804885
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oAgTKF8N;
 spf=pass (domain: gmail.com, ip: 209.85.218.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id ah7so263843ejc.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NpQ00nsZVkrpMEAU36ZYLtZ31poX9KxmZih7IzWYKzA=;
        b=oAgTKF8N9cRN3LA88U8HoecV3Lec/qDrrVubwjQ5YhDz3u7UZc5g92cWoziLr6hqC3
         jn3ifGkAYYQr9sWlRCUS6UpZF3oWPKC3vvMtCF34B0bzWgWWa7Tk9Bv+OOoN46iG9Q5d
         rN/BvShkxL2l21kl3JuabnnBaZL9Gcn1F+HH+VFe+4bIY4diXU33VnrqGI9FDTpG+rwY
         vCQGFr0OK6+lKm03MR4NG/dF0E8hpwypBo2sPhhXHydpTZEiPK/0H/ZnkOtNRRScVDMG
         E6cpo2YpYj+UKe4YNmh5AL/qrJT8Osk/hwbzlQxEuIBe4sKxMyyAn7s7WaqxVaRfEyzJ
         FsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NpQ00nsZVkrpMEAU36ZYLtZ31poX9KxmZih7IzWYKzA=;
        b=mX/EsIWG28gHfx3QFHeBBxSaKRMXLxo1sFFsQvk64Bz5iVhMurk4OeT+I2rbJMzylJ
         tdMjMRen28xFaFrnEWDxi5gaiLzLrK3w5nmd4pY6+6wCD1e1S/LK7GuPcQVeonjRNwzU
         41xMfG62bzRcmvbgd0CxqLnP1r5GHWfJH6ayvywJNeSc8JZ/L5nRUyhhtMqay2+eVPbY
         K5Lp34H7K51z1N/74+xhahV37nP5pxfvu2a2P95Q7HQvzShVYweTPlDC6BcGtHHWCFKi
         yejnmABBeoEGqy0y71ji63MMYtZeP7VKR0VCOCH7AbixZGnstydbBsiQxLxLjLSr3Eb2
         j+LQ==
X-Gm-Message-State: AOAM532XmTVqlRgVHVGziUrXMOWMVAvCGlkhd5ZiICg86lyHby3BZXMw
	zZSeZVfysDf2fqZiXCuDZh31uAjRLdQ=
X-Google-Smtp-Source: 
 ABdhPJwBxGVYXojFKfl9T55kMTV0WGLRdBw5iY4z5jJW8SRzcPoUx1O47zBQUNnliATgbtNbAVvmcQ==
X-Received: by 2002:a17:907:6d83:: with SMTP id
 sb3mr26701906ejc.21.1643826486191;
        Wed, 02 Feb 2022 10:28:06 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i12sm15644203ejy.43.2022.02.02.10.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 10:28:05 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/33] util-linux: update 2.37.2 -> 2.37.3
Date: Wed,  2 Feb 2022 19:27:30 +0100
Message-Id: <20220202182758.919991-5-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220202182758.919991-1-alex@linutronix.de>
References: <20220202182758.919991-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 18:28:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161230

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...til-linux-libuuid_2.37.2.bb => util-linux-libuuid_2.37.3.bb} | 0
 meta/recipes-core/util-linux/util-linux.inc                     | 2 +-
 .../util-linux/{util-linux_2.37.2.bb => util-linux_2.37.3.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.37.2.bb => util-linux-libuuid_2.37.3.bb} (100%)
 rename meta/recipes-core/util-linux/{util-linux_2.37.2.bb => util-linux_2.37.3.bb} (100%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.37.2.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.37.3.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.37.2.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.37.3.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 1e3cd28801..0309332722 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -37,4 +37,4 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "6a0764c1aae7fb607ef8a6dd2c0f6c47d5e5fd27aa08820abaad9ec14e28e9d9"
+SRC_URI[sha256sum] = "590c592e58cd6bf38519cb467af05ce6a1ab18040e3e3418f24bcfb2f55f9776"
diff --git a/meta/recipes-core/util-linux/util-linux_2.37.2.bb b/meta/recipes-core/util-linux/util-linux_2.37.3.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux_2.37.2.bb
rename to meta/recipes-core/util-linux/util-linux_2.37.3.bb
-- 
2.20.1


