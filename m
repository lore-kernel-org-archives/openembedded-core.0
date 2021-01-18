Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web09.3343.1611009527604502558
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 14:38:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=L2H8VkPE;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 30so11806757pgr.6
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Jan 2021 14:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=aQCvaCx7aR4EPy7ziaxGTQVQk3PHqPgmjEESBesQgoM=;
        b=L2H8VkPEIVBZMI1o8atrhvt8frUK0IuEy/KvePpVL6E4ZSpQaE8Z7/t+USeJZwwlaj
         hA3lx60b/MaMZbnYbyKaa9CCjJXWOqiJ3ZWsKoyhaEqcWlszBGGM1UEHMaM/yU1zhpmQ
         l5PdIUzcT3FAWrgcmZh2FvL1AZxiK1wCBWa1kQU2/wU3m1pDMr3diy6jhWWUCWSQR8EX
         //o5kjEH4BCQQ1XQYeYRkEBNAjviEuvkjHsQHEo2JaeQyM8CqrsIjodm0x3TyCTo4Yji
         3Ho34Mg35xl1mpXr1K9nXPfSXdLqEJGpGdP5cVEX7YHS5mySJf8GEaacwGpy2QWKcNZ5
         409w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=aQCvaCx7aR4EPy7ziaxGTQVQk3PHqPgmjEESBesQgoM=;
        b=M9+1PqQ2urGMvs1XGtZmNTqPoGfNwMxYehNATJ5K1nZ7Ou6AlIrmRlghHjHYH2iPCE
         7pk/Fwwl1Zbgrpl9qx0pKjs9USgL6v0ajQZ04eyqaXOJwpDWcLH3xlhd0FusnPjknWn4
         62MZQypZ2E3hPSpQS5ZlFtUS01OkQHtdsbALW8o1i4VzV83oO9yKN49Ud89vxTxsxMrI
         SWBSHWkjRVhlbYZu80YOmkSdkrvC3OvY3IiOs7Tgqa98HvoRmUyZiNxJe8UvLg82W599
         M6A02xadljjjlYn+fnTd7l6UuR7xzIJjlAAxZaaJ0nrVKJvdkxs62wns6mMfEM7eDS7Z
         SJBg==
X-Gm-Message-State: AOAM5316yRLelrxL3MmWoZUTqtdRmTQ6CBE5d8DJjbnrFKsS/FqfbAPj
	rOcaPpC27IshS0RaPYzAZVHfeH0kWWC6puUtQJw=
X-Google-Smtp-Source: ABdhPJzmtzv2tm3Fl8uZZfsIIOpu5YV9KhdwXFSTbky/7Ata8wXGydUjARF2qhyw7OQxcOi39u9dDw==
X-Received: by 2002:a62:ce0a:0:b029:1b9:66e6:9bff with SMTP id y10-20020a62ce0a0000b02901b966e69bffmr878704pfg.16.1611009526612;
        Mon, 18 Jan 2021 14:38:46 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.150])
        by smtp.gmail.com with ESMTPSA id a12sm16835556pgq.5.2021.01.18.14.38.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 14:38:45 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/19] ppp: Whitelist CVE-2020-15704
Date: Mon, 18 Jan 2021 12:36:27 -1000
Message-Id: <c2efba0ae49ba8cbb04b58931e7e0a7495aa2c46.1611009050.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1611009050.git.steve@sakoman.com>
References: <cover.1611009050.git.steve@sakoman.com>

From: Robert Joslyn <robert.joslyn@redrectangle.org>

This CVE only applies to the load_ppp_generic_if_needed patch applied by
Ubuntu. This patch is not used by OpenEmbedded, so the CVE does not
apply.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
index 60c56dd0bd..76c1cc62a7 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
@@ -42,6 +42,10 @@ SRC_URI_append_libc-musl = "\
 SRC_URI[md5sum] = "78818f40e6d33a1d1de68a1551f6595a"
 SRC_URI[sha256sum] = "02e0a3dd3e4799e33103f70ec7df75348c8540966ee7c948e4ed8a42bbccfb30"
 
+# This CVE is specific to a patch applied by Ubuntu that is not used by
+# OpenEmbedded.
+CVE_CHECK_WHITELIST += "CVE-2020-15704"
+
 inherit autotools-brokensep systemd
 
 TARGET_CC_ARCH += " ${LDFLAGS}"
-- 
2.17.1

