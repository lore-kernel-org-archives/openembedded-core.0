Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D5FCCA479
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 22:00:11 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.731.1657231203162167088
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 15:00:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=59vtZNht;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 145so20774117pga.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 15:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NnOMENZIQnPYYZ6Q88S8NgQaoknDWrM/vVjCFH/HZEw=;
        b=59vtZNhtn99ImuwKGhJWkMHF54liDOsZ2B2ylLxDGRapyO/wwaNsSpeSM0l5VeNyJ+
         oRNFtDOycYxB0HAUk08gdoJwfsZiPElsTJ161ipJ30T/mf3iG+o2C/1zF1Bh32O8c+rZ
         ogb0mybT5t1IIheVKwwqefLngKNKSX7zCpBrQn5lQcg9iOzpnu1mFdtzZw2/YW+RLcsi
         f0CCyjNco3091gjnFWpUHz/X/tNqrTblyWV7NJPdRB7yHuApaG3Uf2d6XelzSP5rAD62
         Pz2ObyMLHOW9yXg90prUhlGHea5aerxy3qGLQQb519qNzAzK6UrZIc1LAZWtX02MPWDM
         m9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NnOMENZIQnPYYZ6Q88S8NgQaoknDWrM/vVjCFH/HZEw=;
        b=VausaeFEUuw4D3bsgaUU7yrTWXNlKXOGm6Uxfc7IS4UoJbaAkms150Kt5vSFVNyKWL
         1C/WUvbs3FkgYZeWnmna5InNVRqwAkCmLgnccYPYQhn4g2J7qG7RfpxszsDsRoHEmZcf
         TfE8rl40x0LP3koEDcEHTlsHeNZpXKqUuIiMH2I7VTmaK17RwVbYTyTVMOdNbXY2CxeW
         WSnKtcF6J4iSkN6pO/sarO8oLsO0HuO1P31EasDKMg4WKYubtz9qgOJTR60ivU8lqA8f
         8rkYT20Ki0kALm3y3YjLufHZK6yi+1Lt9pDcygJW7xz0A4NY7Ln6ihQMVKl3ZFdw6QKu
         YHmg==
X-Gm-Message-State: AJIora/S5zykuuciFUZ1IxK11Vi7SXjc1P13SBllVQZ6MhwYQJW22N3x
	/OvEGyE5s2HmLa3ejdWO4/ZfHYgNZdhnQ/HA
X-Google-Smtp-Source: 
 AGRyM1ujAcMl7r2dIxxFQbZpi69m4ZJ1zXQ5fXL8p0IVGnoBIzux6TdZ0Yxq8MLshkXj1jNW00PhdA==
X-Received: by 2002:a63:ff4c:0:b0:412:b100:786b with SMTP id
 s12-20020a63ff4c000000b00412b100786bmr189096pgk.537.1657231202176;
        Thu, 07 Jul 2022 15:00:02 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 j1-20020a17090a31c100b001ef79eb5033sm56840pjf.11.2022.07.07.15.00.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 15:00:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/14] vim: 8.2.5083 -> 9.0.0005
Date: Thu,  7 Jul 2022 11:59:26 -1000
Message-Id: 
 <cc245b75ebd8dfc4925a21e3ff08d841fef77635.1657231055.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657231055.git.steve@sakoman.com>
References: <cover.1657231055.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 22:00:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167802

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The license checksum changed due to a major version change in the referenced file.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 89f34d8aa4f4572d048dbb732ca4c83d443157fb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../vim/{vim-tiny_8.2.bb => vim-tiny_9.0.bb}                | 0
 meta/recipes-support/vim/vim.inc                            | 6 +++---
 meta/recipes-support/vim/{vim_8.2.bb => vim_9.0.bb}         | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/vim/{vim-tiny_8.2.bb => vim-tiny_9.0.bb} (100%)
 rename meta/recipes-support/vim/{vim_8.2.bb => vim_9.0.bb} (100%)

diff --git a/meta/recipes-support/vim/vim-tiny_8.2.bb b/meta/recipes-support/vim/vim-tiny_9.0.bb
similarity index 100%
rename from meta/recipes-support/vim/vim-tiny_8.2.bb
rename to meta/recipes-support/vim/vim-tiny_9.0.bb
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 31a1b57be8..84c2eed4c8 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -11,7 +11,7 @@ RSUGGESTS_${PN} = "diffutils"
 
 LICENSE = "vim"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6b30ea4fa660c483b619924bc709ef99 \
-                    file://runtime/doc/uganda.txt;md5=daf48235bb824c77fe8ae88d5f575f74"
+                    file://runtime/doc/uganda.txt;md5=001ef779f422a0e9106d428c84495b4d"
 
 SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://disable_acl_header_check.patch \
@@ -21,8 +21,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://racefix.patch \
            "
 
-PV .= ".5083"
-SRCREV = "db77c49401145d76441fbb3d22a1d7d987681c13"
+PV .= ".0005"
+SRCREV = "040674129f3382822eeb7b590380efa5228124a8"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
diff --git a/meta/recipes-support/vim/vim_8.2.bb b/meta/recipes-support/vim/vim_9.0.bb
similarity index 100%
rename from meta/recipes-support/vim/vim_8.2.bb
rename to meta/recipes-support/vim/vim_9.0.bb
-- 
2.25.1


