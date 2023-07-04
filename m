Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 961C8EB64D9
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 15:29:59 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.61468.1688484590775670243
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 08:29:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=fN7OzN8N;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1b7f2239bfdso45156805ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 08:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688484590; x=1691076590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DW7Wu7mxAK+eXexbz9GTusNt/WCsgIZSbqYMWzY1VWE=;
        b=fN7OzN8NnJWbMbZmLuEF+ER3UVKmOWU99vC2tNbExu6K3ATpiZNNWC5SCfcEzCf/fR
         efrATDdIsF6NaikaONMoSnea+MkU+i7p+iGFp5RaDZ+AHjfos6Hyp6fCQJfREjvJ2XPI
         e6IdpqkgbYB7y+rVik/+ew2oGKhXOdseJBTCqKa3eaqGSCvuPtQbx3a9wkPxFWxPUOiC
         3FDn8GbGhITV3XIvhLytm98DG/1PL9n0uRnYNLVlt2FOTwoxF7ITRJaCcm9iqzrwGHrK
         REMXi5Rqtcak6UNRMM1/+a7YBZoKfHIoWM0pgrq6Jt+ml2AjU64KBNe/V28TsRlcOt7w
         mM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688484590; x=1691076590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DW7Wu7mxAK+eXexbz9GTusNt/WCsgIZSbqYMWzY1VWE=;
        b=ZHWMD0VYOmorq3tTKL3KIScRbxdsTUpl9gJaIgDsWIz7Ezjrw8CaIa5HHZ9ynsMRGT
         PEuvQ7jMoeAS9pPBEG8LQZKkVisZQq4KjQS0ZVgsYfkthTJATjx0b9cpbGdhcm+x4GB9
         Sve9akW6v7MYj3GNhwjgGdmonfAnYTjRR0qrrTQ0TPY3OTl/v0mROxwQXRbFpW09Js5q
         7+25N7FX8x2bLFAMENNRsX8G/VWDfYd2MNfgsCUeiGlw/FsucM+VlUkLFaX2mRPT4GjN
         QCsknYoTUkT+hVddlLKdO2Vtqd0tWLF1coGzVcFKVKV6O99/U21oKdQBKJvbWWebiaB0
         JvHg==
X-Gm-Message-State: ABy/qLYMbZfI94QZ+ZSKyGCgPGsm59dIxdM9G7S2tS9Aco9ETEfLvdpL
	ejC4ppaGPi3cEA3cbpMWHbD2G2gcypgu6BD5CTp7rA==
X-Google-Smtp-Source: APBJJlHEbVqh5vln+3vOuyj7Nkt+JNN8aWihoDuOXAv4EpfsAQswW8bO8L4SDWq7qEB4SIFP7SPfFA==
X-Received: by 2002:a17:903:248:b0:1b6:9b38:6004 with SMTP id j8-20020a170903024800b001b69b386004mr15560710plh.22.1688484589868;
        Tue, 04 Jul 2023 08:29:49 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id y22-20020a1709029b9600b001ac40488620sm17332041plp.92.2023.07.04.08.29.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:29:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 05/30] linux-firmware: upgrade 20230404 -> 20230515
Date: Tue,  4 Jul 2023 05:29:07 -1000
Message-Id: <0903f615b89c8aecf660d1cbd8161e6ba0b354bc.1688484463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688484463.git.steve@sakoman.com>
References: <cover.1688484463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 15:29:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183840

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: additional firmwares

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 64603f602d00999220fe5bafeed996ddcb56d36b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20230404.bb => linux-firmware_20230515.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230404.bb => linux-firmware_20230515.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230404.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20230404.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb
index 7412c022ba..3470131294 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230404.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb
@@ -134,7 +134,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "0782deea054d4b1b7f10c92c3a245da4"
+WHENCE_CHKSUM  = "a0997fc7a9af4e46d96529d6ef13b58a"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -212,7 +212,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "c3f9ad2bb5311cce2490f37a8052f836703d6936aabd840246b6576f1f71f607"
+SRC_URI[sha256sum] = "8b1acfa16f1ee94732a6acb50d9d6c835cf53af11068bd89ed207bbe04a1e951"
 
 inherit allarch
 
-- 
2.34.1


