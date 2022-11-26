Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2214AC47089
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 14:15:46 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.70831.1669472129956938808
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 06:15:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=o/RizmfB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id y10so6310659plp.3
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 06:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oCSj/yDkw7A12CBvmzEb/yK28Bs8d1p8Kp25iGCGCDE=;
        b=o/RizmfBP639p7zfPk6OWMpZjcTOEMebSWz/X8bx5eQaY1jk/8hUYiZQE4qOaUg2yl
         UBUvsNCsdsnUBu34f4oiU12b00dVcgvvfF2a7BkzmPVR06rihaeYiSvft2T896EaGJfR
         OFud4VApTXi4lgjVLu46TFAiJzG1RELkgnoFKxMeAJQCqI1HL5aCxANuz21AC6fLoBSe
         17eqJWEhZKzUJtdFLfAkQcKL8zKo5S71JUKSdhI7p8cacqgaC5S9XILtBxqCJQjHKJFw
         +r73LQR8BLtlZlQEYmgzGsidsuukBTvPqZnoUBBECYU0yVvKW0hrstNnB0k6UahfypCM
         BWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCSj/yDkw7A12CBvmzEb/yK28Bs8d1p8Kp25iGCGCDE=;
        b=Fr7oNGGXlcNiSCc67CmrBYNM7XkiGuEAIIqs4fkubh58uxHxRV5hkz+EexXCTT+O/M
         9eXdGRDI5LKdh+3Cc14+F6BiGkq9t131cpeh0U0Q+2f4xC0kWprDC6xKDkbJRzasnteS
         0u7Z5pYEfaMhwdqDhTCGEzGA5CLjsaOLHNTq1BsB6h06lbpjnvXkdYS7FqW45+BbMtk4
         o5IohyebUgNzxph6ygnSkotmI/0kHwp8zrPwhE3CordWq2fTwGhSdgKd8gRBKGJpaRRP
         MJnyStJ7zTBys3q4TkhjVMRG/1KNzW4UZOsHcXsKUuVFdrArRJP5kS4uekqWY7xy+lb6
         OwLw==
X-Gm-Message-State: ANoB5plRLAC/3AS/WCOIpt2XkhSSJD5rSrkf/BTTuB87lxre00EMXnyG
	j1qLa684ABTQ8Jt8NPz76B7EQmh39sN92XiiIB0=
X-Google-Smtp-Source: AA0mqf7ZvMVQ7eJcUqFkmCc+rnXNdOoPnI87DNLo85QhLb6e+8lpfYNnfQn8kBhny2vNDmR6XRWZ6w==
X-Received: by 2002:a17:902:82c7:b0:189:736a:5e69 with SMTP id u7-20020a17090282c700b00189736a5e69mr3918531plz.37.1669472136995;
        Sat, 26 Nov 2022 06:15:36 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001895f7c8a71sm4649177plb.97.2022.11.26.06.15.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 06:15:36 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 14/37] sysstat: upgrade 12.6.0 -> 12.6.1
Date: Sat, 26 Nov 2022 04:14:18 -1000
Message-Id: <6634f0d752f9f9885a05acc2f0c26c13657060e6.1669471990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669471990.git.steve@sakoman.com>
References: <cover.1669471990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 14:15:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173807

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Fix possible overflow in sa_common.c (GHSL-2022-074).
* sa_conv.c: Make size of statistics structures from older sysstat
  versions immutable.
* Declare sadc dependency on libsyscom.a.
* Fix gcc v11.2 warnings.
* Various cosmetic fixes.
* sar: Remove `-I int_list` from man-page and help.
* Consolidate systemctl commands in README file.
* Remove whitespace characters at the end of lines.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit d86ef26a76dcadf696a02389ec9156fb95516cce)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sysstat/{sysstat_12.6.0.bb => sysstat_12.6.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysstat/{sysstat_12.6.0.bb => sysstat_12.6.1.bb} (65%)

diff --git a/meta/recipes-extended/sysstat/sysstat_12.6.0.bb b/meta/recipes-extended/sysstat/sysstat_12.6.1.bb
similarity index 65%
rename from meta/recipes-extended/sysstat/sysstat_12.6.0.bb
rename to meta/recipes-extended/sysstat/sysstat_12.6.1.bb
index 273c5c1815..6df7bdbb83 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.6.0.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.6.1.bb
@@ -4,4 +4,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
 SRC_URI += "file://0001-configure.in-remove-check-for-chkconfig.patch"
 
-SRC_URI[sha256sum] = "699fd948836d77f9ad0541fd5dcf75cd2505f9da4ec14df669286ad047c23d97"
+SRC_URI[sha256sum] = "18ff5a4e149e2568e43385637f72437fe6bafcc1322a93d13d1981e9464a0342"
-- 
2.25.1


