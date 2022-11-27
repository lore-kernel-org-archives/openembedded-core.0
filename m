Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4308FC352A1
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 13:56:03 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.92043.1669557354101781715
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 05:55:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=XmEUaMXv;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id e7-20020a17090a77c700b00216928a3917so11583255pjs.4
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NVxMFME/9IwUsocw7bXfyymdESkvPBtcsXLx8PuWBMk=;
        b=XmEUaMXveZa6d3AZNZfhVCTm0oUsD71eO3Bu9Jp9eyVexaBfln+WyfMoOiADWL8WrI
         TzQO0hVCaGYGUeWKL32iKMAkdUfeRdx1ERwFVALZKM+dS+oYSStX6ij1aUWqTUA8D6zl
         sdLSDMIkDLu96+z8yR1a+tXXygxM7ZvFdhQXbJdN4GBUCVg2rkSLA2xqWirWRb85xTA1
         kPHojflNp+QH470THbALTaXQSTXcPWFVbgbeVE5DsuY6YpKrBfED6inDSutTxxWNdURe
         35Et/Suz6iimFtWuFGqsWiGy6yZ+y/4TdSYysLGWmsa/3J08M/z3AaFHlvm5QdZmOP6E
         tYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NVxMFME/9IwUsocw7bXfyymdESkvPBtcsXLx8PuWBMk=;
        b=RDzJENdXeZ4Rv1SC0tKJU1MhzSXWN8T0rLNY/WGBG7G3Yqy8Et3GPwdwi3mT2MOcZk
         vyw4TGQubnKErmgEZA8eWbtd2WgHZAzcpr8JjCk/5aQ9BW5RZv16dDrxoGkNsmMTumLi
         aoHRU7PAkjjUqoH48qgwvIF82yRRqPg/zcMlnlCrT5MLVYFyjd+cMxSV9iZmmtkXMNI0
         9uKR/J7qXX8QE3gFTy/zsCLGULhS8OnNFHiO+qrt3LrbWpifMysiIueI1H200aZHzzqf
         wvbptVcc80tAMSRHzLkyqbXSGkWZjljTopA1ufWA32/DmXUZ37OiGm/Za3G0jZNhF4em
         1Fpw==
X-Gm-Message-State: ANoB5pmAJewdzB1eI+ApzCa0U28FF8HzR6MUfYu9k2nYt/iHzAbaK4MZ
	I0ZMbqI3Y/tQNYh6lwgWzuGiAUeXUl/x/WtE3Qg=
X-Google-Smtp-Source: AA0mqf7rHmZqpFkKDZl7EfoPxIVRfIkfOdz9I7OWiftMD9GZi435KoXY/7O82Tfvyfmh85WPnRxdZg==
X-Received: by 2002:a17:903:1342:b0:186:90a7:6b75 with SMTP id jl2-20020a170903134200b0018690a76b75mr29132576plb.23.1669557353049;
        Sun, 27 Nov 2022 05:55:53 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902d48f00b001868bf6a7b8sm6910544plg.146.2022.11.27.05.55.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 05:55:52 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/31] mtd-utils: upgrade 2.1.4 -> 2.1.5
Date: Sun, 27 Nov 2022 03:54:58 -1000
Message-Id: <7f2503ef132634431b28207c51b3fd18de076eb9.1669557026.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669557026.git.steve@sakoman.com>
References: <cover.1669557026.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 13:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173857

From: Alexander Kanavin <alex.kanavin@gmail.com>

Raw short log since the 2.1.4 release:

Alex Henrie (1):
       mkfs.jffs2: fix spelling of --compression-mode parameter in help text

Andrew Mellor (1):
       ubinfo: Fix --vol_id return code for absent volume id

Christophe Kerello (1):
       nandflipbits: fix corrupted oob

David Oberhollenzer (1):
       Release mtd-utils-2.1.5

Enrico Jorns (1):
       libmtd: do not ignore non-zero eraseblock size when MTD_NO_ERASE is set

Frederic Germain (2):
       .gitignore: add new ubiscan utility
       Fix warning about unaligned pointer in jffs2reader

Khem Raj (1):
       tests: Remove unused linux/fs.h header from includes

Michael Walle (1):
       mtd-utils: flash_otp_dump make offset optional

Mike Frysinger (1):
       fix test bashism

Rafał Miłecki (1):
       nandwrite: warn about writing 0xff blocks

Sascha Hauer (1):
       mtd-utils: nanddump: fix writing big images on 32bit machines

liaohua (1):
       nor-utils: fix memory leak

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit a3289c988764e5b864873b4adc7656c101a5b9c0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/mtd/mtd-utils_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index 3318277477..6a4f7b0688 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -11,9 +11,9 @@ inherit autotools pkgconfig update-alternatives
 DEPENDS = "zlib e2fsprogs util-linux"
 RDEPENDS:mtd-utils-tests += "bash"
 
-PV = "2.1.4"
+PV = "2.1.5"
 
-SRCREV = "c7f1bfa44a84d02061787e2f6093df5cc40b9f5c"
+SRCREV = "3f3b4cc6c3120107e7aaa21c6415772a255ac49c"
 SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master \
            file://add-exclusion-to-mkfs-jffs2-git-2.patch \
            "
-- 
2.25.1


