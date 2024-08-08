Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A765C52D7D
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 02:29:14 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.50969.1723084149547702069
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 19:29:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=y8TXB6bI;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2cb4b6ecb3dso410041a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 19:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1723084149; x=1723688949; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pu9JWkl/RmHM2trwfSwdaCooBhlMhCZfS/8XhD4MsuU=;
        b=y8TXB6bIK+GZh6XPwtGMqZAi8CskaPRDr//RXbEgsKDy2TMZyw1PSNeR8BRcDCjY5p
         lyrGk+eS3ca+BVtlxDyXdirrljIy/7BM05gd4e4IoSXw/W7qOmz7ecZ7F6OonCgiVGu8
         883GV+TxMMaVZUF7fpgaDroWhwV1rEJlfYBDpwfTXPkW2FyjoYAdEwkqtuOy9Y5WEy6s
         dDApx6t59fv9Yw13n/4lNPHiqAybvrERUIALNDWqQohebKMIPoNk4blYWaHtbMQBFEuK
         suy8PP1bSpuh9gOWt1d6WgZCwI7CjNbP0YmnBBFDN8ws005oEGGc51n8cfQT7kkXv3BZ
         Y3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723084149; x=1723688949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pu9JWkl/RmHM2trwfSwdaCooBhlMhCZfS/8XhD4MsuU=;
        b=YAAMwMJYbW2dsF90O6fjW0f2zpQAvFc6sKYRlyYbITXS/1S+L+tAGecz0WPj5xnrBA
         Ee+irh3AIgZDm5+2c0iP9QeBcF//ItcqzjO7THMgtXGUf2Pp3LLmglwyqmXLNTPWSWj7
         uWEdcsBG00rnF4xQWcaApx79Gckzoh5tP4Zq85GQ/HULtkpjBThe2lsEJBhCG2yp2Kp8
         Y3RtsBEhyZCvJDYS6fccQVfmi7ULCnxneyZE1Jyr64ZTqUzIUp33mioGEPOqlNC0QPGw
         S0eITeV3jFcBEmLu4vmWkA7C7CCP25rYVASsDmAIWs2umK1JiObnXdSBI24lpa37MF2A
         +/bg==
X-Gm-Message-State: AOJu0Yz81anu5vFKRbvDazoETyGU/rlj7RZCdTxPsDoWFciyKlDF+00R
	JveUyBZJI85KKA9D2ujM+j4GUrQaAp1cIWrgPu4qpJ0fSPIdRsmvJ6NZ/Hy7ucIYLAXP/wXS8fC
	gbMo=
X-Google-Smtp-Source: AGHT+IGzGtAXMyTTKfJ+lbVFCASeG0ciMlEjVCEfIQ+7tzHleiSvkNzSTxDMeXGKFlVPrZFIfpsz3Q==
X-Received: by 2002:a17:90a:f186:b0:2c9:999d:a22d with SMTP id 98e67ed59e1d1-2d1c345ae00mr513368a91.30.1723084148832;
        Wed, 07 Aug 2024 19:29:08 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1b3b0c796sm2269198a91.33.2024.08.07.19.29.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 19:29:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/10] libpng: update SRC_URI
Date: Wed,  7 Aug 2024 19:28:46 -0700
Message-Id: <aa23e392e379ab7f8cdfc48e1d2d96812f330c74.1723083840.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1723083840.git.steve@sakoman.com>
References: <cover.1723083840.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 02:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203110

From: Changqing Li <changqing.li@windriver.com>

update SRC_URI to fix do_fetch warning:
WARNING: libpng-1.6.42-r0 do_fetch: Failed to fetch URL https://downloads.sourceforge.net/project/libpng/libpng16/libpng-1.6.42.tar.xz, attempting MIRRORS if available

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/libpng/libpng_1.6.42.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
index cadbe957db..673133bb4a 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
@@ -10,7 +10,7 @@ DEPENDS = "zlib"
 
 LIBV = "16"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${BP}.tar.xz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz"
 SRC_URI[sha256sum] = "c919dbc11f4c03b05aba3f8884d8eb7adfe3572ad228af972bb60057bdb48450"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
-- 
2.34.1


