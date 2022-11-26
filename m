Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C753C4708A
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 14:15:46 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.70833.1669472139860172956
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 06:15:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=kMt6WqAI;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id ci10so5798753pjb.1
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 06:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hyam3taRRxDG/UD55FWBrmSDXQLf2ImuBz0vCkxRKtc=;
        b=kMt6WqAIFK4jrBNN83boX4p6kErxOqZPEswsanLkdLYL3BfJ0C8qQGlRFKJoRqRGRZ
         eQXqqYQugsUDoCiO1bFfxZCegNspsgD28gTILOtxF5Kjm1Mnbl32ICFdpzPv92SQmH0y
         3yL+f48NgV4xKjn8eFLUrx3RczEhRBTeAc9JfIz6b+0p9nRIgHKPr8YSMS+qDLnnpyFB
         DctuVx7txnni5cyuBFbxjey2w/aW/WAoh8UJthdt6CbRdWJc846Ir+CydzPjc2BHHqZD
         kFXSJdCCPmmOeKAg/PiLCTMTqREOOL27tcDk948tG+cgzlP7Cv8CEGMc2Z2Mh8ESKmn0
         Oxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hyam3taRRxDG/UD55FWBrmSDXQLf2ImuBz0vCkxRKtc=;
        b=Iu04m1xwlOQg0+DhKMoMTSR2zdX4ttsg3lPPLXn0/2mrcSgZRPyqjdWt+0c2RY3rga
         1KfmTvb/stBvWDQCMfE9Tjn+jzBIiHpWjVAWZ5JDUMc/sEBzzW98R7IYyioRA6ZcTET2
         R2KI5GqzlKQv5Z2ZVkBZKXcnNy0336VpmpayIbSmmc/HpCD7cERo+DbzBOxJsoxGf3VW
         05EXPooMy98W2JmjCIzM4ng32IJbH1QSBiCfjj7hqXixaXtyZSsYhHxXf6hC2ChG8C1b
         0dnpX/5gA64cYBlJ0FA5S+VV1L7uuttduqZhAVzcevDUj6IpTrkThLDp5APx+LzzWcM2
         cAaA==
X-Gm-Message-State: ANoB5pktKKGeAYVJy9cXqbfRZ9vcQa+ChDLxoKbAED07tDAW07kvvxNG
	/J5agKCEfCjWvt9ELD82aMEY27CgbTBxgdJFSpQ=
X-Google-Smtp-Source: AA0mqf5RsAo5OTG2hblDlPvlqa0CV23G+EAfmlkB75FGPL2+DOPJQr7IckThEMZ6o2CzjHRRjX9+BA==
X-Received: by 2002:a17:90a:7e8a:b0:217:f784:689a with SMTP id j10-20020a17090a7e8a00b00217f784689amr46398651pjl.0.1669472138872;
        Sat, 26 Nov 2022 06:15:38 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001895f7c8a71sm4649177plb.97.2022.11.26.06.15.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 06:15:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 15/37] libepoxy: convert to git
Date: Sat, 26 Nov 2022 04:14:19 -1000
Message-Id: <03fbef225e8d78578cf727cec8aeb434e20cb5d7.1669471990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669471990.git.steve@sakoman.com>
References: <cover.1669471990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 14:15:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173808

From: Alexander Kanavin <alex.kanavin@gmail.com>

Latest version doesn't come with stable tarballs.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 4b6eed2bb323a3c7390ca3ad426afe27e9072bf0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb
index 1210f73a86..b3b26b57fe 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb
@@ -9,11 +9,11 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
 
-SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.xz \
+SRC_URI = "git://github.com/anholt/libepoxy;branch=master;protocol=https \
            file://0001-dispatch_common.h-define-also-EGL_NO_X11.patch \
            "
-SRC_URI[sha256sum] = "d168a19a6edfdd9977fef1308ccf516079856a4275cf876de688fb7927e365e4"
-GITHUB_BASE_URI = "https://github.com/anholt/libepoxy/releases"
+SRCREV = "ecfa8e0f083084181d36966fa084aca9a6c97d53"
+S = "${WORKDIR}/git"
 
 inherit meson pkgconfig features_check github-releases
 
-- 
2.25.1


