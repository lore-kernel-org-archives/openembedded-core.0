Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59BBEC433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 19:35:06 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web09.3333.1645472105770144918
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 11:35:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=fUpWWkuJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id
 gf13-20020a17090ac7cd00b001bbfb9d760eso116895pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 11:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JfyT9SBl1XnVdm8B5Xw1IBDjQKL1njZfec9yP+Biu8Y=;
        b=fUpWWkuJJo9umJVsWNvHgSBEvxBZKKfANc1GcDmlWixxUWNEdIP0DhwKIxQModV2LZ
         KbswDExd5VLIil5RBJEdSdVclEIsTypziwXtiXt8hDugcvxYE9E452X3ovbIGtvUwlIg
         BOD5hMYZvu24gk6fWeRqQzAAEdJzt05+xEzVMjY7bw3wNFFuEWyvf4QdXbe1Nj8snCZl
         VcroIhXkK+tozO7V2a0eqWkzOxiPcbPxOMRcnCYVFer4EXGby1iBgAwnjnsMuvOASVuD
         0uo7t0USuPghtECZqHI2OMG7q6kmr72uKBfcHYWqXZ/CoPmDfhvCYVjilR0+XNyynxzS
         nIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JfyT9SBl1XnVdm8B5Xw1IBDjQKL1njZfec9yP+Biu8Y=;
        b=VYw29BUKBNTC52mH6o/YOwPndPx6Apf8j4i3LalQ4O/TkEd6uU8F/5HZ8HHS+Imzln
         TO1vdvPX8IarQsU9iUvowGVBE1A9Vu28aoNeirXiiH6WsI/Rl6mF+5dC+7sqyVII/ylg
         dtbKm6gS09rbqu6ZkAJLSUNhb1kBa4h3rIV8VePwIRnGWXXG6IEIKGKEKYSqepP+I7gm
         gls5oPriWFAsRiXN9LBdGbhT1n2zGLqGQjEjNljSSgIKJ4cN9P/aBPGRrBVa1ilc6dIB
         NlHS4InQ+UDCH9MQejm6kDuC+f0UrozlRRghAN8b2Jv5uXpE/7nLdErZJ89FuzzCeVfv
         YJBQ==
X-Gm-Message-State: AOAM532M+IEZvc1G+Bk2/5qjbREiRUcrhaKd3uCnyXYy436Izk9n0MZE
	4tU3y0VJPj+B24/2ZqkUL7+20uCCsj2FWl8M
X-Google-Smtp-Source: 
 ABdhPJwUQxlLXZGk4NImgkJEVzxTkuktl15Brk7yR1UPh+9oMwKhTSWXnMf/mW3EKm4M63a74CAjcQ==
X-Received: by 2002:a17:902:8210:b0:14d:6607:bdc4 with SMTP id
 x16-20020a170902821000b0014d6607bdc4mr20442410pln.165.1645472104723;
        Mon, 21 Feb 2022 11:35:04 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s2sm14286657pfk.3.2022.02.21.11.35.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 11:35:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 8/8] vim: Upgrade 8.2.4314 -> 8.2.4424
Date: Mon, 21 Feb 2022 09:34:29 -1000
Message-Id: 
 <9360b92f98222cb74a93690f53570cd62633c0cf.1645465376.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645465376.git.steve@sakoman.com>
References: <cover.1645465376.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 19:35:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162075

From: Richard Purdie <richard.purdie@linuxfoundation.org>

License file had some grammar fixes.

Includes CVE-2022-0554.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a8d0a4026359c2c8a445dba9456f8a05470293c1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index ff1090bb14..838f7b7a53 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -11,7 +11,7 @@ RSUGGESTS_${PN} = "diffutils"
 
 LICENSE = "vim"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6b30ea4fa660c483b619924bc709ef99 \
-                    file://runtime/doc/uganda.txt;md5=600a38dc53e8931fdfb1238276ee09b0"
+                    file://runtime/doc/uganda.txt;md5=a3f193c20c6faff93c69185d5d070535"
 
 SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://disable_acl_header_check.patch \
@@ -21,8 +21,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://racefix.patch \
            "
 
-PV .= ".4314"
-SRCREV = "8cbf2499179db39a46e700ab04d0b36e22bcc1bb"
+PV .= ".4424"
+SRCREV = "cdf717283ca70b18f20b8a2cefe7957083280c6f"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.25.1


