Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D73BCC5479D
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 16:44:34 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.22291.1672418666921430113
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 08:44:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=wMeycOvj;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9so5626651pll.9
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 08:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JEBWFfTeivrAW1ZfEG/ZrdwkuQSCzbPSbpg3UCOdp4s=;
        b=wMeycOvj4PipHjMZNu3UqGb9+jdJhfciEt6MjBOSm/Co1EQl7/lnIsT3V3lKye3OAh
         zvUyMkIAaQxBllEVGGvF2h95wDQLt4XklDajUM0zNHjkqha0FBzZm0dCOYI6f2Ce7Ybz
         pYGyq7ZuT5VrMFYsEwTv/8rAwi4tMx5xfWcwxldLLPtM6uXRTidwHPwoo2ETFEGXe/cP
         iFfOVqhNMJYXEoamcU6I3xHxsGsWs7WyH35cAktdQOoWj+qiIM8xiPtRWD9iOzq3HQul
         Rncgi6Rmu3IO0FxX538hyu7ZfoSiRFBgoqX3VHsiwiOxnnvgkR7KtyNZsw0EFsnyuMWB
         XvFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JEBWFfTeivrAW1ZfEG/ZrdwkuQSCzbPSbpg3UCOdp4s=;
        b=MolGVMcW2xXBnqFi3IpWG2Ds4t5a1tZJk32y9mfNXHUeohyHZVPRAfHhMeE2cgnR20
         QnzE/Jq4EoCKm9eXvs4FHAdAGDOSVsBUMhVEddwcd2vzqaZ87Q9Y5FF1fHfno+SUtn+6
         TX+JawVVj9r9EcH+20tuI+YdhudaOXiwqYVbBbmJjaKQG/HfJswTXm7fNGU9yVE0DGmQ
         D40uEqBm4UeUkcBSipkxwnWYw7mTjq6XxgCroVOlxMcXjXsebHc9/BcFlfu1Rk6Zm+S8
         Sfff2nVA7vuZto5o1YzIGAlwKFhHqTe2O5nEemaMBTZOIqlfQiToifX2EKwFh2Mxz8CV
         JSGQ==
X-Gm-Message-State: AFqh2kqcN2y0tiU+CO6C0/JFEFw+yqOTmQWEtvA5LKJuOHcL5ISI0zdt
	TaY8WJoEenIxOHCsmFMXueJiuVE+9ncEeatrLAI=
X-Google-Smtp-Source: AMrXdXumtEqZNYXCIjiRnAeybdh+CLW+jFJrRispDtfDYbPGfBGdNi4iE3wx0nhcwjHziT0ZjJb2KA==
X-Received: by 2002:a05:6a21:6da7:b0:a3:22f3:27ca with SMTP id wl39-20020a056a216da700b000a322f327camr51158794pzb.56.1672418665980;
        Fri, 30 Dec 2022 08:44:25 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id a79-20020a621a52000000b00581ad007a9fsm4413200pfa.153.2022.12.30.08.44.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 08:44:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 04/22] libpng: upgrade 1.6.38 -> 1.6.39
Date: Fri, 30 Dec 2022 06:43:54 -1000
Message-Id: <110ecbb4726f236fba49f9bbfe9c629d45253d0d.1672418540.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672418540.git.steve@sakoman.com>
References: <cover.1672418540.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 16:44:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175145

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
*  Changed the error handler of oversized chunks (i.e. larger than
   PNG_USER_CHUNK_MALLOC_MAX) from png_chunk_error to png_benign_error.
*  Fixed a buffer overflow error in contrib/tools/pngfix.
*  Fixed a memory leak (CVE-2019-6129) in contrib/tools/pngcp.
*  Disabled the ARM Neon optimizations by default in the CMake file,
   following the default behavior of the configure script.
*  Allowed configure.ac to work with the trunk version of autoconf.
*  Removed the support for "install" targets from the legacy makefiles;
   removed the obsolete makefile.cegcc.
*  Cleaned up the code and updated the internal documentation.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 19799cb50a00561b318cba1c8c20737f20e4a47f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libpng/{libpng_1.6.38.bb => libpng_1.6.39.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.38.bb => libpng_1.6.39.bb} (93%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.38.bb b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
similarity index 93%
rename from meta/recipes-multimedia/libpng/libpng_1.6.38.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.39.bb
index dc627203ef..d9dcf379e9 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.38.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
@@ -11,7 +11,7 @@ DEPENDS = "zlib"
 LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "b3683e8b8111ebf6f1ac004ebb6b0c975cd310ec469d98364388e9cedbfa68be"
+SRC_URI[sha256sum] = "1f4696ce70b4ee5f85f1e1623dc1229b210029fa4b7aee573df3e2ba7b036937"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/older-releases/"
 
-- 
2.25.1


