Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5ADC433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 14:22:27 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web09.6457.1655130139404235173
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 07:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=uI7MyeR5;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id o17so5227361pla.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 07:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2LuJr7NY4Vs4MbGP26ySwWYwd1OzcxApyjhXZkrslxw=;
        b=uI7MyeR5TvS5Q/6j38ECX+1U4OoKD06Py8LbijKuLN7NIirO+DJHfdAy0XmIFkCbNO
         rYRfdp1BFWj/BkSsU0tNEosGqJY2PZRqRf7kmo+CPIG3vK947ucJJTVR8SvxaxSqE11V
         IsQodGm16/cDRTcZofhChZyv6v7oUNcgWJS5lhxIf4OWT8N9pachJK401GXqN1txX72I
         4ep1VStoRcNCPUKm71i9OYElwmwAvrj9ZQ1j/W9GO1KeKG8wyxrU+D8+FihIVD215V4i
         yncuAVH4ffK+0kb/D57NxjJGfUAJlyN6OX+L+U4rz/J/K+cd/Oj3Cqyvwiz0BInvqGdA
         jLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2LuJr7NY4Vs4MbGP26ySwWYwd1OzcxApyjhXZkrslxw=;
        b=Q3P+QA1w5BWzdzCZE/jLtBaPaP8m7JBG14r+UA6usmjRqeGta2s2EmdZWmr1NYTMX6
         bPxzDhUu5blNeVZTyjD2QENe5L10ig/eyx2Z3xzwjC5kFz1cVPzx2BjA2NKrXtsYIdmh
         LHCpzwDCs1n4ChCwkC8afrJ91byM4ROrKrKB5zLUmVWibjVpRFrwIwkuGbF9XXons4Yz
         1uQj4mPb2bDtgCqsTULAE8ODnW81Egetkj79XZO5WPwBU+Y1Z7Vx9oTdkowlEdY2jYZZ
         lTTtKUQZ/wU1zVMjkzTGkwT4XJXLIc7nYHwJOkcHaV9UGjVY/bNpKmc2CDqRpHj6WZZf
         4OlQ==
X-Gm-Message-State: AOAM531mvvnsIBPeTH59x5J0b9rFb3LyPrd0PnV22o1CV1YjbB6Kp1M/
	hOtZG+T/WSuBbBwk0t0OcXYJc0DL8VrEhm+v
X-Google-Smtp-Source: 
 ABdhPJwv5sv/LXiyiP29vC35Keznu8DnX1zxcM94QVe2kO1UA/3/chnHdNg/yJppcsIDUzGgMnUszQ==
X-Received: by 2002:a17:90b:17d2:b0:1e2:c0a2:80fb with SMTP id
 me18-20020a17090b17d200b001e2c0a280fbmr16605542pjb.67.1655130138333;
        Mon, 13 Jun 2022 07:22:18 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 iz19-20020a170902ef9300b001636c0b98a7sm5159401plb.226.2022.06.13.07.22.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 07:22:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/20] iso-codes: upgrade 4.9.0 -> 4.10.0
Date: Mon, 13 Jun 2022 04:21:38 -1000
Message-Id: 
 <c4114d9bfbdb3be7815d15b98edd666e62056ddc.1655129917.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655129917.git.steve@sakoman.com>
References: <cover.1655129917.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 14:22:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166851

From: wangmy <wangmy@fujitsu.com>

Changelog:
==========
Added
--------
Update ISO 639-2 codes to include Montenegrin (cnr) added in 2017.
Update ISO 4217. Fixes #24
ISO 639-3: New translation for Friulian
ISO 639-5: New translations for Esperanto, Hindi, Russian
ISO 4217: New translation for Esperanto

Changed
--------
Translation updates for ISO 3166-1
Translation updates for ISO 3166-2
Translation updates for ISO 3166-3
Translation updates for ISO 639-2
Translation updates for ISO 639-3
Translation updates for ISO 639-5
Translation updates for ISO 4217
Translation updates for ISO 15924

Fixed
--------
ISO 3166-2: Add parent codes for GB. Fixes #36
ISO 3166-2: Fix subdivision names for Finland. Fixes #37

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit eb771fa7740f9749d26a4d3f74a926eb1e564ee5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../iso-codes/{iso-codes_4.9.0.bb => iso-codes_4.10.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/iso-codes/{iso-codes_4.9.0.bb => iso-codes_4.10.0.bb} (94%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_4.9.0.bb b/meta/recipes-support/iso-codes/iso-codes_4.10.0.bb
similarity index 94%
rename from meta/recipes-support/iso-codes/iso-codes_4.9.0.bb
rename to meta/recipes-support/iso-codes/iso-codes_4.10.0.bb
index f51edf09a4..857fe463ef 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.9.0.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.10.0.bb
@@ -9,7 +9,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=https;branch=main;"
-SRCREV = "35ae2024024eb8e6603d3034dbbc406594f3874c"
+SRCREV = "9a6c24ee40e737ab34273c1af13a8dabcae888dd"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
-- 
2.25.1


