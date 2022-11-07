Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E647C43217
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 15:37:01 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.81.1667835418281376260
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 07:36:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=IIrlryHk;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id d59-20020a17090a6f4100b00213202d77e1so14989248pjk.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 07:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z8yqXtzdE5yTGlC8hb9MoeJ5KFV7L/4vMMamZEuGM6Q=;
        b=IIrlryHkCf5ND0zVsp7OxwL5bxMJQyiwTae9myPcJJhoCL2GkC0JG3xvdP+8dHIdTN
         ZbRTcOUaM7itfXPUoj2udm3DKG15XrTN9p4gjh/pdbY4zxNIZQZ5i0I9TekTpBdOwAB9
         xrBM346aHWrjsnT6uUUIThBuTZ0q5sKG2EOG1onthpy9egnPboUHHI8pcSfGbnmcMeX5
         K1mp1niqOf7WWQ3R5umJnW1Ujkxbff0KGKHKXUWr/P+IDzo1eHecIQFi509DlyZ0wat1
         hMUdcuQbDcuEzEWJ1cQbeg8JUsmGqL3iavbZH7dcZkfNfOAkcAY48do6ItwPX+4Sguhb
         As0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8yqXtzdE5yTGlC8hb9MoeJ5KFV7L/4vMMamZEuGM6Q=;
        b=ptensteiOuCWsQBR+ah1XLCM3sWSckBRBP9QwcfQUEFCnKyn52mOMJ/muk8QjwJTJM
         GhWoDiQ+3H3biMunX/C5PiKA148Zn3ulFw/7dsJ1NSoEMH6QYOAAwW3DaGvsOPUrvG/P
         UEFG1HqLBmj3FEtNrEZuxLwVxNMCAplfMDO0ldTViilGDgjypVos3JeXE80Zw8onGfOP
         JQena8xr5XpGUQNlHqKZyoA+WG/L4n7sCuoeNWJndJXTolYA4TBBxkYfbcIxTp/S61m9
         ny57uSTlxPk8JjwLWhPO9ZgeQUd0Y8SHLPs/d5hxOvM/nG/no6q7V+hFLx08bfsqDNkb
         cD5A==
X-Gm-Message-State: ACrzQf03ZtfMGOhNdxQ5dBecHa5xIAGn5cMzWKwJELGPQ/b3r6sp1ArI
	dDRMxYmRDbXR3sveMOoZqHbyyn+cRRZ8vwmJ
X-Google-Smtp-Source: AMsMyM4KPZhKvDoyQfiYDurM8lATS1eW210+Y320jwu9HdKSLjqwLfQSKN7QE8o39mD2yR6oJtg/pA==
X-Received: by 2002:a17:903:292:b0:186:dae9:c089 with SMTP id j18-20020a170903029200b00186dae9c089mr50251113plr.31.1667835417216;
        Mon, 07 Nov 2022 07:36:57 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id v2-20020aa799c2000000b00561dcfa700asm4628627pfi.107.2022.11.07.07.36.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 07:36:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/25] libical: upgrade 3.0.14 -> 3.0.15
Date: Mon,  7 Nov 2022 05:36:21 -1000
Message-Id: <d0882397cb37ab19543733535c3d01d09c3845a4.1667834972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667834972.git.steve@sakoman.com>
References: <cover.1667834972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 15:37:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172901

From: wangmy <wangmy@fujitsu.com>

Changelog:
=========
 Add missing property parameters into libical-glib
 Fix CMake option USE_32BIT_TIME_T actually uses a 32-bit time_t value
 Fix icaltime_as_timet, which returned incorrect results for years >= 2100, to work properly between years 1902 and 10k.
 Fix x-property comma handling and escaping
 Built-in timezones updated to tzdata2022d (now with a VTIMEZONE for each time zone alias)
 Fix fuzzer issues
 Handle unreachable-code compile warnings with clang
 Ensure all vanew_foo() calls finish with (void*)0 (not 0)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 6092ae3cbe0eaf006db615c6cc3f1692e1cc1df8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libical/{libical_3.0.14.bb => libical_3.0.15.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libical/{libical_3.0.14.bb => libical_3.0.15.bb} (96%)

diff --git a/meta/recipes-support/libical/libical_3.0.14.bb b/meta/recipes-support/libical/libical_3.0.15.bb
similarity index 96%
rename from meta/recipes-support/libical/libical_3.0.14.bb
rename to meta/recipes-support/libical/libical_3.0.15.bb
index 58baf3f32f..f5e9bb9372 100644
--- a/meta/recipes-support/libical/libical_3.0.14.bb
+++ b/meta/recipes-support/libical/libical_3.0.15.bb
@@ -15,7 +15,7 @@ SECTION = "libs"
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
            file://0001-cmake-Do-not-export-CC-into-gir-compiler.patch \
           "
-SRC_URI[sha256sum] = "4284b780356f1dc6a01f16083e7b836e63d3815e27ed0eaaad684712357ccc8f"
+SRC_URI[sha256sum] = "019085ba99936f25546d86cb3e34852e5fe2b5a7d5f1cb4423a0cc42e399f629"
 UPSTREAM_CHECK_URI = "https://github.com/libical/libical/releases"
 
 inherit cmake pkgconfig gobject-introspection vala
-- 
2.25.1


