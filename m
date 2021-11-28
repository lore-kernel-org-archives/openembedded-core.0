Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5477C433EF
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 21:58:33 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web12.53145.1638136713074188831
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:58:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=t0QQVcE1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id b11so10465267pld.12
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=nbB/MTrBq0BlgMXVnhPXg+nhNq5/QfLY/D2arSEXF88=;
        b=t0QQVcE1dvVgHalCdcal/ETEmqW/mn829348Rg5Lvv+uX6hZsblhrne3CTtxohJDXI
         mpv8c5GxdOVBQ2apnM90gNc2e5qwdjyUFjYrIHd9NQc0UsDLAzUOYWLGDej0BLr93xS5
         5Ol/FG3bhSwsiPVf1ZNJkzkVoJrXAZ6gTmM8j6Y74Nrr2l5ZhxCR35ZvaEkJRyzJJWYY
         lMN/gCF3KQ0v6dYxffJqbAHjxKBhkhh08kzka5J8NuJoQePIaQdBEplyijdpE4M+bGlk
         8znchcNIai9m/S5oDGvAXzn3gTqTEP4oH16fbnnCHJrjYY5trza3IV9F60vkFkgniESx
         yPaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nbB/MTrBq0BlgMXVnhPXg+nhNq5/QfLY/D2arSEXF88=;
        b=tckmecHI6ovzvPTfDCgb7BCS9w93pxycnYJzZWYRQ4mQlu3B5qWCuwY6jt1K83SkyC
         DXIkE0SsVQ+vqrafg8iELC5Cq78eFkgYMvdb27sKsU8U1rHzwpUE58OK3fcn+Gq02yJO
         c8vfDF9JUmlkQYddVKn5BscJfUAbuElaeCBH8Psvly6Heo3uewaOfTKYUUdsH4EE/82W
         81FVbgTvn8ID/QYQtdxu66CKXRcqmtEW75J0SLDmTXW4lVyjWAlKXiZ7Se+jSMCcHPQF
         rW0b0wYIbKHnuUd3YDqJ5w87C0c0FKH5SmKA9t4Zu+BKbcDhi30mgLorYHh9TIKmmofd
         +UrQ==
X-Gm-Message-State: AOAM5320BliEziykWqyjiWqxHLo8/lyRGErknic6UihzKw3kC46oXdba
	pqlswiRG0ynJirR9oT07RFjmLns7WuaW9N6HZfM=
X-Google-Smtp-Source: 
 ABdhPJw535PETcz9uixgUufs9uCrW7YsJUrRnpOaBwhoyzrh1b/AhFWo49McI+32oSMyMNElK02rAw==
X-Received: by 2002:a17:90b:2252:: with SMTP id
 hk18mr33672705pjb.218.1638136711965;
        Sun, 28 Nov 2021 13:58:31 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.13.58.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:58:31 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/42] python3: upgrade 3.8.11 -> 3.8.12
Date: Sun, 28 Nov 2021 11:57:18 -1000
Message-Id: 
 <ff52cf448c5e26246f8637d0b8957c5c479fa389.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 21:58:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158888

From: Marta Rybczynska <rybczynska@gmail.com>

Release Date: Aug. 30, 2021

This is a security release of Python 3.8

Note: The release you're looking at is Python 3.8.12, a security bugfix release
for the legacy 3.8 series. Python 3.10 is now the latest feature release series
of Python 3. Get the latest release of 3.10.x here.

Security content in this release contains four fixes. There are also four
additional fixes for bugs that might have lead to denial-of-service attacks.
Finally, while we're not providing binary installers anymore, for those users
who produce installers, we upgraded the OpenSSL version used to 1.1.1l.
Take a look at the change log for details.

According to the release calendar specified in PEP 569, Python 3.8 is now in the
"security fixes only" stage of its life cycle: 3.8 branch only accepts security
fixes and releases of those are made irregularly in source-only form until
October 2024. Python 3.8 isn't receiving regular bug fixes anymore, and binary
installers are no longer provided for it. Python 3.8.10 was the last full bugfix
release of Python 3.8 with binary installers.

This release includes a fix for CVE-2021-29921.

References:
https://docs.python.org/release/3.8.12/whatsnew/changelog.html#changelog

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/{python3_3.8.11.bb => python3_3.8.12.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.8.11.bb => python3_3.8.12.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.8.11.bb b/meta/recipes-devtools/python/python3_3.8.12.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.8.11.bb
rename to meta/recipes-devtools/python/python3_3.8.12.bb
index 2a2472b3d0..cfcc91b396 100644
--- a/meta/recipes-devtools/python/python3_3.8.11.bb
+++ b/meta/recipes-devtools/python/python3_3.8.12.bb
@@ -42,8 +42,8 @@ SRC_URI_append_class-native = " \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
 
-SRC_URI[md5sum] = "5840ba601128f48fee4e7c98fbdac65d"
-SRC_URI[sha256sum] = "fb1a1114ebfe9e97199603c6083e20b236a0e007a2c51f29283ffb50c1420fb2"
+SRC_URI[md5sum] = "9dd8f82e586b776383c82e27923f8795"
+SRC_URI[sha256sum] = "b1d3a76420375343b5e8a22fceb1ac65b77193e9ed27146524f0a9db058728ea"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.25.1


