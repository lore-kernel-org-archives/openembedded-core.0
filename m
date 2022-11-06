Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F5F1C4332F
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 14:17:51 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web08.16530.1667744262098958804
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 06:17:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=SZ603sif;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id g129so8296856pgc.7
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 06:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CeVJxbaNcqlS86QyypG1KXW3HDyxFyoadYaH2Sh8pOg=;
        b=SZ603sifmCCKm2lxL8E5EK/f992y7JVotv0Dw7i5nxznH4NsMXdtIswq+5D6U7IRHy
         Xv3D8bfVqcTEAvOin/FtL6PUNOgrMowPrSyQ3BIRvLHyHhhY9c5V5h9GUpuqvp42imL8
         S9qPvVGBO2yupXRvUjl+MCO/p/tT1ahEnFmUNwnRPGNh6z78C+RLnA7eFuR7F8O7hIIe
         7SKvB+b4p0FKyZI2dEV5OOVznasTGZZVBh8ZyjkDRUdBqOG3fsG/PTqg7sSh2HX88b9o
         7HwLY0cEFamAVtoAS6Mwv41gzRLN51OAsYV+IXQNtuMnoQhbgcpLRawRN5iLh9HzF5Gd
         fsDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CeVJxbaNcqlS86QyypG1KXW3HDyxFyoadYaH2Sh8pOg=;
        b=cCNqjTDzgfTQ6u97Cpu1Af7T7DfK8OH9ynUAD9Nogyofrk/DsnYZNAJnR2w3yZiRDS
         zZIqPCpRVHeRMWFbopwkYTWyKF5nbWKiC5CQrd063or5oDKbc7ttonABPGFlgsyLyemX
         TXWn9w75KKaRuBTVLDAZGnpOAaSMnu28zfoj5KhAF+3SaetqKavRnvoG8JePWAbl8VPM
         bTKnZA2wm9ZxHXYBtVfoka2NOvhhVOf4ZnShm9Fda4VDZQcgnZr2XP/FRIzzrtxRs5Qz
         c+jk/EBL/ixsvwsssTntsokB6MTnROlbIlQ09rZ2WO/fctfv8OUPj6zl5pjtYa0zWzsB
         xz3A==
X-Gm-Message-State: ACrzQf2z2NCzEqGoxjDPeNhoHvB/SHdn/AqbHkF4iXO7orIfMEWGiXqi
	xerWtvCYJsbIKMiGdLRzL2XGSKsTISdm1RYP
X-Google-Smtp-Source: AMsMyM7kdLSv0py1PfnN7KCUomwaxiGIeWfGtjCX/hjYCIe+QPjrTHWf7LYktYshRclhPfRcyxpjPQ==
X-Received: by 2002:a05:6a00:3407:b0:56b:f64b:b385 with SMTP id cn7-20020a056a00340700b0056bf64bb385mr652121pfb.68.1667744260892;
        Sun, 06 Nov 2022 06:17:40 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b0017534ffd491sm3224907pll.163.2022.11.06.06.17.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 06:17:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 05/34] wpebackend-fdo: upgrade 1.12.1 -> 1.14.0
Date: Sun,  6 Nov 2022 04:16:48 -1000
Message-Id: <d650490c7786edde665472a38eb68f6db1f6aa4d.1667744095.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667744095.git.steve@sakoman.com>
References: <cover.1667744095.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 14:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172773

From: wangmy <wangmy@fujitsu.com>

Changelog:
==========
Fixed a crash caused by trying to deallocate already freed graphics buffers in certain situations.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 0db4627fe8c6f8a0080248052dc06419774cba4f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{wpebackend-fdo_1.12.1.bb => wpebackend-fdo_1.14.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{wpebackend-fdo_1.12.1.bb => wpebackend-fdo_1.14.0.bb} (90%)

diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.12.1.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb
similarity index 90%
rename from meta/recipes-sato/webkit/wpebackend-fdo_1.12.1.bb
rename to meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb
index 5f776c13e6..708201043b 100644
--- a/meta/recipes-sato/webkit/wpebackend-fdo_1.12.1.bb
+++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb
@@ -13,7 +13,7 @@ inherit meson features_check pkgconfig
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "45aa833c44ec292f31fa943b01b8cc75e54eb623ad7ba6a66fc2f118fe69e629"
+SRC_URI[sha256sum] = "e75b0cb2c7145448416e8696013d8883f675c66c11ed750e06865efec5809155"
 
 # Especially helps compiling with clang which enable this as error when
 # using c++11
-- 
2.25.1


