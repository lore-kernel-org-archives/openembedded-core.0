Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87FFCC00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 14:48:08 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web12.64.1659106080315624173
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:48:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=y0Pp5myx;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id bh13so4201837pgb.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5lkXrO5GU2qNxDEQReAJuuAQXxvf9XQKKdwIlJfBqtg=;
        b=y0Pp5myxzpeU/A+SSgdfikPmxMtuP3MlKpLQeZ869oGGYBMzyicflzaqpvwL+E6ZwM
         KpbZJkA1ogL3UOZ0kNKwVleaSn7O0q97bWFhpYLC+gCJ/8fbcFbOx7GeFkKXiB6MQ9T8
         ng73lRcP7e8iw5nSLT+jwKrkEIP8YOPU4jbshRqeDnBBiE2YBDE8iQR7W/7YvVTu5fpr
         pyNXNY2f8jKaueH/S3T0sM9x5RANDNNW4tt86aW6/kKaucc3S9QT4c54iHcyySE2Ldtl
         BSSwEVW2D1eLE/I2tCzwSK9UIWHBOu0R4iqDOInKoYdqp307FGGVVtR1aPSF067BAF1L
         f+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5lkXrO5GU2qNxDEQReAJuuAQXxvf9XQKKdwIlJfBqtg=;
        b=WOa7utThUBFdv97AOwj1c5CsSU5Qa0xEF9Snp7vUCJn27/AL5HCORcrMECzlsKSZ6E
         TaXvjLnEIEgAi67PTwlLg87jS3yGESo9vYcYyJesy3HxdAsyoxFpYCRtN8LJ9pJB1UTZ
         WRPmi+yFpvsZDwcx2ZZjlL6/bRYtYqN5ZgNm0vNrfoc+h4M2FuPP+/PDz73C1whDAKtj
         zgHU1GEz8c3JoxOVJTPS88KtuLtxsKXFtCI7zxG4llrHAWefDgAcmwqUO17I3Yn/LTzi
         UV06ZQksyYVqIKSjla/xpK1eMSFr5c0BCUex7NxLqKg8x8SnWorVhGPv9MtXoijVR86E
         EtJw==
X-Gm-Message-State: ACgBeo2UD7BxNViAXk9iJOHl/RwZBYI+I7bHCdlPEe7IbYfTwNNFXToJ
	o+6ao+Ef6xU1B2bgvvbcTZZ3TEuLDUEmtGVL
X-Google-Smtp-Source: 
 AA6agR5/uzSjNkkul18OVtvAD/E4IdhSRnJuVz0jJDQqqlQftrmOKkXoQCwUnG6pXXnAwb/rXYdO2Q==
X-Received: by 2002:a05:6a00:c86:b0:52c:e9ef:c790 with SMTP id
 a6-20020a056a000c8600b0052ce9efc790mr695065pfv.50.1659106083489;
        Fri, 29 Jul 2022 07:48:03 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x24-20020aa79418000000b00528c6c7bf37sm2958782pfo.129.2022.07.29.07.48.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 07:48:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/29] xwayland: upgrade 22.1.1 -> 22.1.2
Date: Fri, 29 Jul 2022 04:46:34 -1000
Message-Id: 
 <d626b8cc6483bd92229d8a0807eebef0e361fd26.1659105705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659105705.git.steve@sakoman.com>
References: <cover.1659105705.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 14:48:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168653

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Changes:

Olivier Fourdan (3):
      randr: Add "RANDR Emulation" property
      xwayland/output: Set the "RANDR Emulation" property
      xwayland: Fix invalid pointer access in drm_lease_device_handle_released.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0fd8934f51080313f54326b634593d11385b3338)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/{xwayland_22.1.1.bb => xwayland_22.1.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_22.1.1.bb => xwayland_22.1.2.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.2.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_22.1.1.bb
rename to meta/recipes-graphics/xwayland/xwayland_22.1.2.bb
index b512b9932d..8c52613109 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.2.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "f5d0e0ba37e19bb87c62f61da5970bd204939f2120620964bed4cc8495baa657"
+SRC_URI[sha256sum] = "743c4d56cfc0818755e2281d625d51860b41a473c641e179649a4f41776d1fca"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.25.1


