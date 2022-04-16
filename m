Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C6C0C63706
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:59 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web12.21694.1650136514243805715
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 12:15:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=PCgOS53z;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id y13so59127plg.2
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 12:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2BOIuEjbvcjy8I90jMraZMPy/7K9YY/mP2p85t77rOg=;
        b=PCgOS53zlmNwlEnhfAMhKkxo/1daMXqovnKQvlKeIIRUWsKJxoVvMil1fW5UODRYlp
         U8oG9YxkUtGDyVOm+k/6MXPL2JoixLLuM9o7Lqo7NgmKOZcPkifdI/6z1i8qHeX6ie67
         eh299kl2SvUCqBCFK6XpUhoUyXjMHVSzSg+rhRAmtJvSCu3AfSBckfr172PgLGHVxfTA
         gQ4v/fzRPoRRRbM2hja1vRQ/r69fD3zwf5VccvstZfMJdQndVJj828HLq+6C1Ud1iTkq
         F2m20uYzwZP9t9tGqEasgFQAN/nvT2o0DE7J2cE49FqHaaGMsAR4LaETu3SPFxzmLY3u
         irVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2BOIuEjbvcjy8I90jMraZMPy/7K9YY/mP2p85t77rOg=;
        b=tXU8t45+QisO5rgTcJoYmU8GF26no4qO/Eh5fQsoWNrhoC6qHY6MXu9mUvm+0Ebs/9
         QvwONui0WB7HCQeokJkaqT6i/y5SFZku2XgSz0uXPXNCaUQC1N8jxWWOB2uQW/G2iiDE
         OAqknVueH+WYL8D+833NuCHrgiUAR/SR/q+rOGF7Nclfrtv5xtuM9t7dcHusI3up4jFk
         sMZ5+f9llEv6STZGq4D+W1PcS7s0rk6YPTEvDC8GHQCqRZHv3Cux5aVSHN0+cKSFMl1o
         Vji218B7ia0TtGjK4jiN1C3TVbDj4j18Csq/+EUfEYLgDJmpJos6ieggFTlD8M5eWfI6
         5lww==
X-Gm-Message-State: AOAM532E2NpV90LkLIv7oU6wo6i5q2+6wLkKFQLiEuualSqPSI9Iy+me
	Efujh1aKR1djkwWZ0HxVvo40Ca5bIPNB9FOPrJA=
X-Google-Smtp-Source: 
 ABdhPJx1ppKouXz7Nf9gGbI5E7JIIPbXiI0QZnywub+qyfmzFeqgWiThUh9EvZ6q8syFpgboPrrjwg==
X-Received: by 2002:a17:902:a714:b0:154:6dfe:bba9 with SMTP id
 w20-20020a170902a71400b001546dfebba9mr4536451plq.124.1650136513270;
        Sat, 16 Apr 2022 12:15:13 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h2-20020a62b402000000b0050a62e582e5sm430004pfn.37.2022.04.16.12.15.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Apr 2022 12:15:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/11] libxshmfence: Correct LICENSE to HPND
Date: Sat, 16 Apr 2022 09:14:29 -1000
Message-Id: 
 <2919306cee24c79b8523a2108326db970c37f83a.1650131192.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650131192.git.steve@sakoman.com>
References: <cover.1650131192.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164557

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The license in this code is listed as MIT and whilst it is compatible with and
usable as MIT, it actually looks like HPND. Clarify the license field accordingly.

(From OE-Core master rev: 922b645f443c33060a8990d32e6b7b62ea5497c3)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb | 2 +-
 meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb b/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
index 0cd0494da8..fd113b5ec5 100644
--- a/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
+++ b/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "Test recipe for recipeutils.patch_recipe()"
 
 require recipeutils-test.inc
 
-LICENSE = "Proprietary"
+LICENSE = "HPND"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/somefile;md5=d41d8cd98f00b204e9800998ecf8427e"
 DEPENDS += "zlib"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
index cc45696530..38cab99bbe 100644
--- a/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
@@ -6,7 +6,7 @@ using file descriptor passing."
 
 require xorg-lib-common.inc
 
-LICENSE = "MIT-style"
+LICENSE = "HPND"
 LIC_FILES_CHKSUM = "file://COPYING;md5=47e508ca280fde97906eacb77892c3ac"
 
 DEPENDS += "virtual/libx11"
-- 
2.25.1


