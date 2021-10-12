Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C549C433F5
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 02:09:14 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web12.8090.1634004553472628928
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 19:09:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cAlaNct7;
 spf=pass (domain: gmail.com, ip: 209.85.215.175,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id s75so12428145pgs.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 19:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xp8zmMG6KsZmTMq6+uwSS2Sd7/xQmMvNRLj2KKUeO3A=;
        b=cAlaNct7cueY9thTNYu0a65z00QA74pv4AhFmebEuKoDDzh4+zM/WynJfmh8ceyimO
         q7w+qn2yZpYxkGn2yw2zTCwW+zmgpxZeK+YaG/Vks45eLN6Xbot5OW2ZFaxFgCouw9OV
         daq3rnW4KOnsK09QvmUxsLoUWN8p4Vc7hrVW6+AsqUCSxUMEsYOkNmflc5yE9DpOo/aI
         B3He7wo1tFnn8YaJV/1PuXzFinuQr2AiDIdcTm1Ema8cP1HKK3OzTvHByN+1C/ikZSP5
         cRskGi6AzCiEdmHSEcqm0r82IDb7gipi3UUdWXmiXuR/6tF6YOufPbqg6sEZ6W037FHo
         edLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xp8zmMG6KsZmTMq6+uwSS2Sd7/xQmMvNRLj2KKUeO3A=;
        b=6Ml+7wgzAXJULyhMP2KUWTqov97qrPOsWfiqZd+2ayfVEinMTcs+eLX+sa1hrNgYfB
         SMdIXW8S9RoHxVlKI+r+EdkGb89uEBpCHNf+pf2pP9YXE/fu1rRAAuBxRmnNfzIeN3Su
         tDV9vmjQA/YU2I6pm61lM1LtjGodVHGGzFE5HjQpf+6oMUdwtbiC/QywZlgOqb9cZB86
         OJHomD9JpoZSgR3ZeyIGqpPyEQs3mfS/mYignG8Poz6ErYUHonf5Q/FakH5bKIWyTlrS
         mCJ8Xkam0/RgfoP0GHPTgBT+WzQLiCMOazC2dN3HqWMc/zuJslfHKEU+IvDRqO9nfpci
         lGCw==
X-Gm-Message-State: AOAM532TRRtONcapkbOZkfvK0mz2LJQnTy04BpsS8vbeAJQav+St6gvQ
	pl2KBsqqtaHhIVu0SPIqD6fNrMsdF8/BRw==
X-Google-Smtp-Source: 
 ABdhPJx2cETrWbrG8gU7fKxRhfOOk7t3svBIdk3G1iKOzI/g0hzSGg9k2XBviNVcdmQKIWsHo1kkQA==
X-Received: by 2002:a62:7904:0:b0:44c:ca08:1956 with SMTP id
 u4-20020a627904000000b0044cca081956mr26683996pfc.47.1634004552864;
        Mon, 11 Oct 2021 19:09:12 -0700 (PDT)
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:1830::17e1])
        by smtp.gmail.com with ESMTPSA id
 l207sm8949601pfd.199.2021.10.11.19.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 19:09:12 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH 6/7] at-spi2-core: upgrade 2.40.3 -> 2.42.0
Date: Tue, 12 Oct 2021 02:08:53 +0000
Message-Id: <20211012020854.2073998-6-timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211012020854.2073998-1-timothy.t.orling@intel.com>
References: <20211012020854.2073998-1-timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Oct 2021 02:09:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156857

What's new in at-spi2-core 2.42.0:
* Set X root property when Xwayland starts on demand.
* Several dbus introspection fixes.

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 .../atk/{at-spi2-core_2.40.3.bb => at-spi2-core_2.42.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.40.3.bb => at-spi2-core_2.42.0.bb} (94%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.40.3.bb b/meta/recipes-support/atk/at-spi2-core_2.42.0.bb
similarity index 94%
rename from meta/recipes-support/atk/at-spi2-core_2.40.3.bb
rename to meta/recipes-support/atk/at-spi2-core_2.42.0.bb
index 427ea7c1650..7e870e728e3 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.40.3.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.42.0.bb
@@ -11,7 +11,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "e49837c2ad30d71e1f29ca8e0968a54b95030272f7ff40b89b48968653f37a5c"
+SRC_URI[sha256sum] = "4b5da10e94fa3c6195f95222438f63a0234b99ef9df772c7640e82baeaa6e386"
 
 X11DEPENDS = "virtual/libx11 libxi libxtst"
 
-- 
2.30.2


