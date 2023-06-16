Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01842EB64DA
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 14:37:59 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.284.1686926274681301770
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 07:37:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=tWuEAtwi;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1b52fd56b7aso4420235ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 07:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686926274; x=1689518274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yB6I1TJs+4oVZBJW+uU415GurIr4rMUvW5j6aUwXhV4=;
        b=tWuEAtwi2yhOzSqF0F96wkwXeRI0GHvCPGCRkWWcg+ASFwvTqTux7yk1mpC7NQfcRt
         SM/8QaPOIcG93126Kff6cZPSx99XY3KRP7JnsHrNDGQt/h5enbsA9HQeaXBR9fOdtJQH
         Aacqr+EmbV1DOKsm2rlY/9SO9NM+n5RDyQ/LWY/62N6OOj1z7OehewqEUDPftrsy0ksu
         gspfXEprXBkssFeBHJbqqQgxLmwnnu3nG/3K//G+HkI9dSImgLFABwWhe5tX/1llweMM
         xhnpUhkR7hcUZ2ZrhlarQPFMqVpErrTy5VQSTISFsKVWuNqFyr8D5DoeWDbfI3ClLKEE
         kZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686926274; x=1689518274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yB6I1TJs+4oVZBJW+uU415GurIr4rMUvW5j6aUwXhV4=;
        b=atpxqlqH90/SG8hnp4T7qV+2EJFn2kP6R43HoIWnGtExur55WHZD02ssLceZDjq3Fq
         frXOpLizm+g5Mysw/x/43Hp+4cod2inQ88qnrSO/lKEgdfKaZZwfoXZ8lM0P2WIersln
         yePBnOKGnwC/Lq29pGVnVWyE8cDKh3MRKbtuBi6MCowGPOZHOOXhewgbhbAfo6O8MSBO
         rm+caAxY1nYNfq1PjOE4C+TMlMGOJM+2M5vRcpQ9b1iMcbuVFNhNJ+2W3s75ARB3AixR
         lWYqNqHcf/Rk7DhY29jDn68kBzLTz2SQPZe4blZVy33q37fiTDetcEUOCNDUSXhnx5lQ
         Vy8g==
X-Gm-Message-State: AC+VfDxGFQKPLVpVqIHlqwutU9FHsxKt6U0PHfki3qTF2zJaVkYzwpPZ
	TmIKaGir4qsqu1etANCPOGXoYvay4rTBh/9QW1M=
X-Google-Smtp-Source: ACHHUZ4wE0U7+SHU33ar3NR1VUHTnesibdkW+2ECovs+EbUAyEdUSRxMzZlHSHZj+0FwsUpx/M3yjA==
X-Received: by 2002:a17:902:e808:b0:1b0:5e97:ee2c with SMTP id u8-20020a170902e80800b001b05e97ee2cmr2202498plg.11.1686926273817;
        Fri, 16 Jun 2023 07:37:53 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k21-20020a170902761500b001b03f208323sm15865547pll.64.2023.06.16.07.37.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 07:37:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 19/24] maintainers.inc: unassign Pascal Bach from cmake entry
Date: Fri, 16 Jun 2023 04:37:10 -1000
Message-Id: <f59753d5cf5b895ce080dc831894cda6c6d2d1d0.1686925952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686925952.git.steve@sakoman.com>
References: <cover.1686925952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 14:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183040

From: Alexander Kanavin <alex.kanavin@gmail.com>

This was confirmed via private email.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c30e9f1972a3e1d4099f39fd6d0dfb37acb73ce1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 733d40ce58..098bd96c28 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -93,8 +93,8 @@ RECIPE_MAINTAINER:pn-cantarell-fonts = "Alexander Kanavin <alex.kanavin@gmail.co
 RECIPE_MAINTAINER:pn-ccache = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-cdrtools-native = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-chrpath = "Yi Zhao <yi.zhao@windriver.com>"
-RECIPE_MAINTAINER:pn-cmake = "Pascal Bach <pascal.bach@siemens.com>"
-RECIPE_MAINTAINER:pn-cmake-native = "Pascal Bach <pascal.bach@siemens.com>"
+RECIPE_MAINTAINER:pn-cmake = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-cmake-native = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-connman = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER:pn-connman-conf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-connman-gnome = "Ross Burton <ross.burton@arm.com>"
-- 
2.34.1


