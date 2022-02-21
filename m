Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D254C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 19:35:03 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.3375.1645472102064356482
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 11:35:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=UhWM/YHq;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id u16so9732461pfg.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 11:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7aLUvD6otq4W/jcWGDvCvbefywS7HBpwT/BAk6pUbUE=;
        b=UhWM/YHqWtRDAP1MwbgkUCBv8FqnluikNNQfxwrWw4lTPZsCVmwqdsBnLVdDrkfxAM
         /BcKHTiKkbd8xnBtUqJIEjwCrmnKRH8wYS9W4OD65H1+ZPoma68Piyp6kWBegy9xHhEi
         Mei098qy5bVtvKEOtBp9TVWe8Kvy8tObwpkuCF9Iwr90eSumjzwG8z70KlpHllr1yi8B
         WC7jqmKz4hAEiei++W23EMS8bcMQKNr4Y+6H5oUDRvIycJa2zWnJoJ4DA9c5EHkw0MKr
         KdX2MDT0JWRny6WuL9v7T/pIKaDEC6mZi13SV2vn4H9eoCCwqbv4y1ibu9SY3r2ygRS/
         1uRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7aLUvD6otq4W/jcWGDvCvbefywS7HBpwT/BAk6pUbUE=;
        b=mH/3iH6cyEM5z5rkkuc0rtURfap8YRNKmLEf2lAg9JcufKhIwUChVNeuF+OnQAYVa6
         KJLeD2ljucMctP5x+2V4DDLZDGvdbJHfHsWbBG0k6gGhNPZA7yTzRbLrc/ujYl5H/L+t
         fIpoNFioyM5OUNcvocPVLBwbqi7Jl69uamCPhSZNL1aQTM2uWFyQwfDcztEFTDvVpbDu
         E2E9fQUppUIcdLDM/ZUgfCGg6Sekbs9EhMyyKT9UPuf4x8zbjrHoFgnK4SApWN5+v2et
         0DyUbCGf+SlBfpRFLoI5l3exAnDjYnjp2iUAXG9U7z35+8IYhHgQOoXMhRlWYGGbOy4W
         DxLA==
X-Gm-Message-State: AOAM533osT5kQcT6R/7VXHa989v+LLHFqIoZTOmvW/LLF+TmDHicLtXn
	Byd28NGmpL2hOan3SqZtDHcPp4brjzdJwo3s
X-Google-Smtp-Source: 
 ABdhPJwX+p3u76CaHNGeAr/bgKjQ8nA7mM7Ol366pooejGyNUgoDLeaLv33lUH3b7zWhcjldfEA7cg==
X-Received: by 2002:a05:6a00:1744:b0:4c4:4bd:dc17 with SMTP id
 j4-20020a056a00174400b004c404bddc17mr21347334pfc.57.1645472101042;
        Mon, 21 Feb 2022 11:35:01 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s2sm14286657pfk.3.2022.02.21.11.34.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 11:35:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/8] vim: upgrade to patch 4269
Date: Mon, 21 Feb 2022 09:34:27 -1000
Message-Id: 
 <e23cc56c6b8bd9cfb86803a1e1160a0b768cb286.1645465376.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645465376.git.steve@sakoman.com>
References: <cover.1645465376.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 19:35:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162073

From: Ross Burton <ross@burtonini.com>

Upgrade to the latest patch release to fix the following CVEs:

- CVE-2022-0261
- CVE-2022-0318
- CVE-2022-0319

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 96442e681c3acd82b09e3becd78e902709945f1f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 3f9bd6f012..3d0d83caeb 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://racefix.patch \
            "
 
-PV .= ".4118"
-SRCREV = "0023f82a76cf43a12b41e71f97a2e860d0444e1b"
+PV .= ".4269"
+SRCREV = "48a604845e33399893d6bf293e71bcd2a412800d"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.25.1


