Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F13F6C4167B
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:38:25 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.16008.1672594702150299471
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:38:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=eWGQMZXL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id jn22so27112111plb.13
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JEBWFfTeivrAW1ZfEG/ZrdwkuQSCzbPSbpg3UCOdp4s=;
        b=eWGQMZXLHi6HrMzlA/b2vYimTyxNDnhNVNfliDMjZa+Rm4DVdfZvsQkWMsHLe4AzXf
         jFmSwsP8zgg9JKwGv7q8Iq4KahLiuePoA8ae/ONExE1VQVLF47RToiulKko9ks8b6DNA
         aGWlU78cCRJhhaIq2n3VxB8LFdIaUXhvdaljqi8JYcGP+IxFWcTk6dm+i6THvAsYEhnR
         b728RGXLKBTAUWJw1l6QiFS2vopGothCEEgDEyxMv3a1SK8AFVkoZr5jv0smy7ECq/wQ
         kGu+XdzHoYisHR4ajah53lwwXGyNxKxmSZQr6s1VhsQOFyTxX7wsSDVk8tJJMVB2OEnI
         UK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JEBWFfTeivrAW1ZfEG/ZrdwkuQSCzbPSbpg3UCOdp4s=;
        b=rEvvIbrfKSzhWXsASJLLBKlwF0pztUxJ/Nx2OA3SjVc9prKvRo+pUTmv1Gspvt5NaM
         P3dJAyrTRqQAXDzIK84P9jY2dWwHlE2vE5CYRN6QVBsib3hNATaJaBCuPPro5U9YQK6O
         sCkrqXW2+aNF0TsRgiELUQ6ZH/NOCo5fLhxJ+pKn+Vv4uzaHoEKC8rFzh2QHH2VQsYqS
         4Gq/jLf82sRHfW2niW3ZF5wcN4vV0d818bhm34oSL0gk+eS+NxRpmPY8M0MrzmwMQa3o
         1dSfQPndWl/ICF1Pb4bjJIQD7iikaNi82kBQNeNNn6LEcLE4bBbteon1vBbqSqUbOxf8
         QowA==
X-Gm-Message-State: AFqh2krR0ue4KeCmxvbaIEJAyQ3hyoq65CwFnXHJiRB4RFEzpa8yH68W
	v6w/HW0bnHToZ+rjBYrAnnhUVXtpiEFP/4362lw=
X-Google-Smtp-Source: AMrXdXssZE3K32Zsv/28u+lqGUBMRzomHvoDSoMYdXuU2Po6h43dkbQYYBO5Ft4524Jta5BdIeD4kw==
X-Received: by 2002:a05:6a20:4995:b0:aa:7eab:25a5 with SMTP id fs21-20020a056a20499500b000aa7eab25a5mr43478342pzb.34.1672594701145;
        Sun, 01 Jan 2023 09:38:21 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id v63-20020a626142000000b005828071bf7asm102299pfb.22.2023.01.01.09.38.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:38:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/29] libpng: upgrade 1.6.38 -> 1.6.39
Date: Sun,  1 Jan 2023 07:37:34 -1000
Message-Id: <ac69131a167254c64a0985645eb2ab24e244945b.1672594521.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594521.git.steve@sakoman.com>
References: <cover.1672594521.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:38:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175200

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


