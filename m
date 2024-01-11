Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77CFCC47DA2
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 16:27:52 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.15736.1704990471934125528
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jan 2024 08:27:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=L6thd2gH;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-28c7e30c83fso3675187a91.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 08:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1704990471; x=1705595271; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ZWQ8mnsD11dkLSeSDcx+X9mwyryfFW9LAaI914Cs1M=;
        b=L6thd2gHKrwCD0Nf/dVEvqQVt0nvuctBX9KZpNRiHPbS/cQMGNyOcRIkKBGNEKcMLx
         q6E/JWwh47eXct5/5p/K+4rz17eZciA0L4FmE2dtFi70/BM4lky+z+7GlOTGmTefBUP8
         kpMfIPZEG3siDejY/0pqds5sEBwQ/imOrHue9ozLxjq/QoDvaeJQESzx7NnJmI9D00J9
         vYNBVqhiShZcfGOxnvow4/KDLaCpkeTME+Y88rDqoldravdlk3oHLQJqSb+wNMaeozLP
         kAKaNDbdOQ1aOdhDxdbL6/KXxNi6y18xxKJ1O5/MAgLpTjIlnbUCF70LIbp0mi/qhSHk
         +ydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704990471; x=1705595271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ZWQ8mnsD11dkLSeSDcx+X9mwyryfFW9LAaI914Cs1M=;
        b=PSPR/fG5BgGKxU7uheT1+wYxTT53mJFoM6jVNBWFYHuQk856BBa/WJXQT3NsZe2TfO
         9CoLJw84lIyMYsAEshrhnQ56aKgNpQPeudff+Qa+K2+tnZU3nV01zkdSkyvSShcFcl7m
         YqgN3vE8Rwcb84Q8ySv4Q0V2ZupDEHI7VFTbKSttSzLooWIg5aHMxR8dxN0fMmw7NwSn
         An5hI7bhG7gfpQj4LJOR0xnh68R9dj59QED4nUVzT9ojVtnBISxvxjkN7DApjV79Xm8Z
         VSJ920PFxRSKQBebpHUiIhfgfXlA8EHgmpJhbF+QwZPIDylpjqMHuHXDHCB2MjxV6y3X
         3mVg==
X-Gm-Message-State: AOJu0YxJfsZLswj5N3EFUf1q3oFhEbM0HlN0OzPsXoCHOr7lO4OYkSDl
	rVLHYTk3q+o9Y5soBBzjaIe61eduuf6tHfsn7d1xzz4P1olwyw==
X-Google-Smtp-Source: AGHT+IFE8yY8daQcl4VPkobUkzu1NkEENkIbja0pgHn8bSCJh99DUM5rRzPU/ucvjaKI3xO/464FAg==
X-Received: by 2002:a17:90a:fd0a:b0:28c:891a:48f8 with SMTP id cv10-20020a17090afd0a00b0028c891a48f8mr31908pjb.17.1704990471079;
        Thu, 11 Jan 2024 08:27:51 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a6-20020a170902ee8600b001d04d730687sm1347577pld.103.2024.01.11.08.27.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 08:27:50 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 11/12] zstd: fix LICENSE statement
Date: Thu, 11 Jan 2024 06:27:24 -1000
Message-Id: <6c9a5fefeaa9225c193a0445bae869e6844bf34d.1704990330.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1704990330.git.steve@sakoman.com>
References: <cover.1704990330.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 16:27:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193559

From: Massimiliano Minella <massimiliano.minella@se.com>

zstd is dual-licensed under BSD _OR_ GPLv2. License wording in the
README for v1.5.5 is misleading, but license headers in the code clearly
state that there is a choice between the two licenses.

Signed-off-by: Massimiliano Minella <massimiliano.minella@se.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 40f85de590c188c9c3985e64a83efaf06b0b4fbc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/zstd/zstd_1.5.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/zstd/zstd_1.5.5.bb b/meta/recipes-extended/zstd/zstd_1.5.5.bb
index 5c5fb5e734..2d72af50a4 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.5.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.5.bb
@@ -5,7 +5,7 @@ It's backed by a very fast entropy stage, provided by Huff0 and FSE library."
 HOMEPAGE = "http://www.zstd.net/"
 SECTION = "console/utils"
 
-LICENSE = "BSD-3-Clause & GPL-2.0-only"
+LICENSE = "BSD-3-Clause | GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0822a32f7acdbe013606746641746ee8 \
                     file://COPYING;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0 \
                     "
-- 
2.34.1


