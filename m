Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A58EBC43217
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 14:17:41 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web12.16488.1667744259933134771
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 06:17:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ho07efYr;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id k5so8344487pjo.5
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 06:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z3xp8+l70A/a3WZ5eERG2ezEEM30psHBcU5Xcm3gbUM=;
        b=ho07efYrqNZpcU/5JtX+uFmIO160sk/OTtFo/Tshn/njkh7WNJpN4n5UW2IDivCg/D
         1u4KMNIJV14xDAAgqbkugAc6LbPQHGsys1BVwSjFbuC+DDeWQvtnKd/lEmqmB01DJzSn
         ckRU65xc0EoGmnxf6NyFDW+8o6dX5uf7Zi3y5sIoOzcaGO3nzky41ws3dv6CieK0S9EZ
         4Hi2wobaoYECyXnMpg7bnvZJwgVEp8apYaD6zjCNxqsQ/ySc6YsHnmiZXY/L2iJaJMfB
         4tYj46zmggk1abu461vVL82OZwWNgXb4HjFalOVOxi2A8Loz05JjqxtKzxk2CrfXMF/K
         QLTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z3xp8+l70A/a3WZ5eERG2ezEEM30psHBcU5Xcm3gbUM=;
        b=rLmEMlqkAPVnpGgpCwyZtR7TkxMQvErW2bUOdT/RacEHnHRxbwOqSg0xPlEtRovaDn
         SbAqtJeTCE7lQtus4L3KWIUGxLKMxQ2Nzy/asatmEGr/YqYAhBz3Oo38XDy2RAwXLUZE
         dCM9AII9hCk2FQgkwWUNaTaoV0bbUVDKQb5NM4RFmgSQ264lIPLp8XuZEthgS8450e6q
         oeOJsYnIFVzJc8iD9yoHNOGMxq2Zg5Flg17BKLLVhNGwU/BIO9zCaySlIKGG+ivPK6gM
         lGFsGqpdEX8H1dhdeeDVeoEEeTVXizipQLt2AEG4avGxWPeDFkgbUNsN1hqhH2OE1c2d
         G9gw==
X-Gm-Message-State: ACrzQf2C/Iw0Z7maNViiQaJ0Hh5UScSmbQ+eS/2ebTzl9CczZjEfDXcq
	MRrHnzEYMLqlRAQ9axmnzNrQhQWQb+AYDPTj
X-Google-Smtp-Source: AMsMyM48rlCq2yjkvf0mmkqeNMZ3ZUsIJU4mwdn76fpaoobfXYTqcxaW1FlG+9cCkU0oZ9aUJjz9vg==
X-Received: by 2002:a17:903:24e:b0:179:b755:b82f with SMTP id j14-20020a170903024e00b00179b755b82fmr44265599plh.34.1667744258952;
        Sun, 06 Nov 2022 06:17:38 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b0017534ffd491sm3224907pll.163.2022.11.06.06.17.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 06:17:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 04/34] numactl: upgrade 2.0.15 -> 2.0.16
Date: Sun,  6 Nov 2022 04:16:47 -1000
Message-Id: <5ab90209ef18876285bd62468e9cec7a9a80608d.1667744095.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667744095.git.steve@sakoman.com>
References: <cover.1667744095.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 14:17:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172772

From: wangmy <wangmy@fujitsu.com>

Commits
5a99c6d: Revert "numademo: fix error on 32bit system" (Andi Kleen)
04da3af: fix the memory leak of numa_preferred api (luochenglcs) #139
86edd38: when preferred_many is not supported, fall back to preferred will (luochenglcs) #137
413a93f: add cut-release github workflow (#142) (LUCIANO FURTADO) #142
10285f1: Release numactl 2.0.16 (Filipe Brandenburger)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 6d9ed8d4b13c2d87dae482bbadef039de050bc9d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/numactl/numactl_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/numactl/numactl_git.bb b/meta/recipes-support/numactl/numactl_git.bb
index 712cf0203f..23be0a3b4f 100644
--- a/meta/recipes-support/numactl/numactl_git.bb
+++ b/meta/recipes-support/numactl/numactl_git.bb
@@ -10,8 +10,8 @@ inherit autotools-brokensep ptest
 
 LIC_FILES_CHKSUM = "file://README.md;beginline=19;endline=32;md5=9f34c3af4ed6f3f5df0da5f3c0835a43"
 
-SRCREV = "01a39cb4edc0dd0f4151b7ad11e0c56d2e612a02"
-PV = "2.0.15"
+SRCREV = "10285f1a1bad49306839b2c463936460b604e3ea"
+PV = "2.0.16"
 
 SRC_URI = "git://github.com/numactl/numactl;branch=master;protocol=https \
            file://Fix-the-test-output-format.patch \
-- 
2.25.1


