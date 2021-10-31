Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35A2AC433EF
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 16:58:54 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web09.33246.1635699533185258867
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=nLyweobB;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id e65so15060397pgc.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=H+ZG6uR+O5mpmrzOzK3nssZLICkTnJKB6B1Jk1LBd30=;
        b=nLyweobB7qqek682ZgdpJIzKqKdVEA+KUc00NTACWvpVVHTiDiMpTEKF/bWxDurPDT
         FRFmt4PmpfdfRZYIM53v5PQsZOFgX4lSwoXX68jFhpd2QJmt/IPhVAkzlpPzpZu5jZaz
         cM2UdP8IQ0GLJiLBmBc/fVbpbPOdArjEFI87GmENBV7qYUH9km28Gi0/R26kyDWe7xwo
         vo7wvG4QjjV80/+7Gh2717kaWj6OpwDNdXMxzro1rPZG3rkryQW+/UDziFUWNKMZfK0X
         nwJLg67h7tYwKv+dXztbW5krOwGT79LauClESHJJyNKQ5MnXHm5lKDayXQzzN+4GwxXU
         K8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H+ZG6uR+O5mpmrzOzK3nssZLICkTnJKB6B1Jk1LBd30=;
        b=AOgNbW8fmwHNp2hwOem6f1NWIl/v3j/amRXTLuOSrB71RyuBj74tchSwdxxWfPDUMg
         M8Q/QqMrxCvJYfGJ0SUIBAlwFbsx9BAULj5UHy+7LxzizZfm/LFfbjIOh2kXSb2LHiQR
         22z+UOMzPMNL829DXUOYQBTLhWPGQ5DB2olWiwl/LCXnURHOsvbLo0PEUHJwl1ImE9Gn
         6fycO0mh1So6N3FU5SGwCQh5eToL76HJepwePeEMTwruww45GNTRV4yKneVAbw/6284O
         4Sf1NkSO6p+bcKebp75a6C/xlDQvxBGyW7APweZOvJzJGqg4uhCKSX4XXR/LaRG5cDsv
         kTMw==
X-Gm-Message-State: AOAM530UcfGVwC8I/RbcPbad6wZm3Eyp9+KSThc/p5LTG34f0YfksRLS
	k4tEC1f4zmOFrrzpmqbaz7HDun6tRWkHQb5yxC0=
X-Google-Smtp-Source: 
 ABdhPJw2aO0dwrdZ3+t8vn2xUIX72uqUnxkgBuU04tL0wGcSMy/dV7aaaMGHVo6/l18Qo3yr1EIrJw==
X-Received: by 2002:a05:6a00:1413:b0:47d:2415:a021 with SMTP id
 l19-20020a056a00141300b0047d2415a021mr23668609pfu.43.1635699532193;
        Sun, 31 Oct 2021 09:58:52 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s21sm13476617pfk.175.2021.10.31.09.58.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 09:58:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 25/29] wireless-regdb: upgrade 2021.04.21 ->
 2021.07.14
Date: Sun, 31 Oct 2021 06:57:44 -1000
Message-Id: 
 <15606d0f48f01f95deb5d1fd6db1f3bd25973f23.1635699172.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635699172.git.steve@sakoman.com>
References: <cover.1635699172.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Oct 2021 16:58:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157683

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7f4d11e8da6bb79232535c42ad41798a56162ac7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ireless-regdb_2021.04.21.bb => wireless-regdb_2021.07.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2021.04.21.bb => wireless-regdb_2021.07.14.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.04.21.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.07.14.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.04.21.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.07.14.bb
index f79c0b29ea..40b4d563f0 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.04.21.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.07.14.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "9e4c02b2a9710df4dbdb327c39612e8cbbae6495987afeddaebab28c1ea3d8fa"
+SRC_URI[sha256sum] = "2e2dd216a5f1a310b849774af63e6309d94c2207c34771a534c47ae18b162742"
 
 inherit bin_package allarch
 
-- 
2.25.1


