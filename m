Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C44C7EE30
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 17:02:56 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.69601.1677430971096314501
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 09:02:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=jhqI2bpI;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id y11so264295plg.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 09:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PfTMj45keV43866JrwdJFHzFpagnu9oQm63+2JVeIX0=;
        b=jhqI2bpI3ChWH8riHXY5IV11PN98yLeSN5Qdo3lYWDc5oEgwbNhGKSYjzmYUibmuJs
         pN+7E9WQhlTPKE5nExQQEwS5NsrsUb9WDgT2bZXWweNM56mqazsViaoUN8BNIhk3H/09
         te0ns5QeX3TI3Yk3g9RQAni6tfQIFO1kj237z5qVXliu42qg2tOEgdB9aU+v+kYjGhYj
         OyZ/VZ2bz7Lkl5nE9ufH1JGe2o8F1at8yDlylgrRuxpFMfZoWtYCsUJR8XsK5/cU1Owh
         EnCnkxTME2aH2PEml9OpNvOxwNiAj8FbG5114VNIjD76hUnOpTgzwe96Oawq1efGbcdy
         jn3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PfTMj45keV43866JrwdJFHzFpagnu9oQm63+2JVeIX0=;
        b=4+26/4hXG2PLEkniMUKH62wkvmi0M9pbwdniTr/Ff6q0OI1bfEGoXPy7gZ/O4+61Z/
         0k4m4Dhtk8/9iCQM0GDTmxQU32tgJv6P56bf2+BKl4tk8Xij97qi19s32dL2yWKwuE5/
         HdmdyTPp1Jefzyd19zUoTsI0K8ZBvNH06lxah9ZQtACI+oPNAlyQ+qYyBGZnyVHjsSNg
         uCnx1Eqg6PovwNRPdwVka4vBpKT9az7Xhe1N4O/U+QFWUDF48cmELggo13Vi8GC4hMbP
         tvg9Mmb1jgijIeVUoTUwf4nlQKjAvHDIGoGgsYc0PlgGEDa6FXBdVRajXNEHOSW0gYQb
         uyvg==
X-Gm-Message-State: AO0yUKWnqfrxX+yKTucXZx5Hr15M3bYkRVoBjF8wbYXecw7THypjENBA
	XpVRrS0C40Velr7sey5xnWrMHqq6T/qHVJ1yJ+c=
X-Google-Smtp-Source: AK7set9TKZl0+3Un8gKj126cbxivGHpiGt1+563xUAr510uJ7NGyfWbSG/5lUMsvdKELh1gXaYt6aw==
X-Received: by 2002:a17:90a:19d6:b0:234:67ef:304b with SMTP id 22-20020a17090a19d600b0023467ef304bmr23435953pjj.37.1677430970121;
        Sun, 26 Feb 2023 09:02:50 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id s25-20020a63af59000000b004f1cb6ffe81sm2500856pgo.64.2023.02.26.09.02.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 09:02:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 11/28] wireless-regdb: upgrade 2022.08.12 -> 2023.02.13
Date: Sun, 26 Feb 2023 07:02:07 -1000
Message-Id: <187b3a810cd52c7031df7985ef2285cc1dfa89ea.1677430770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677430770.git.steve@sakoman.com>
References: <cover.1677430770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 17:02:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177749

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit a8e8ea1b4b100b6f0ba5ca9441a8f3f1ac31fbfd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ireless-regdb_2022.08.12.bb => wireless-regdb_2023.02.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2022.08.12.bb => wireless-regdb_2023.02.13.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.08.12.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.02.13.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.08.12.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.02.13.bb
index 357e79d7e1..ce60154f1e 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.08.12.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.02.13.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "59c8f7d17966db71b27f90e735ee8f5b42ca3527694a8c5e6e9b56bd379c3b84"
+SRC_URI[sha256sum] = "fe81e8a8694dc4753a45087a1c4c7e1b48dee5a59f5f796ce374ea550f0b2e73"
 
 inherit bin_package allarch
 
-- 
2.34.1


