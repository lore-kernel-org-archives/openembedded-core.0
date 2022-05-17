Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52486C433FE
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 18:25:47 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.1145.1652811939641928620
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=LZZgpBzJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id g184so13626pgc.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OtJetR9WIuGO0ceEC19WX0eKuNpTz6tIqVaPud/M5Zg=;
        b=LZZgpBzJpnHO1efUISAzRu3ps+Og1bqDep2NtXc4m2VOR7Go+tG1YjzsKN/McdPlWx
         +yyTec1BLhxyTuFum2OfJ5p2SS3ChILpjb/DjUGE/t0ji0tRLQTnRnyCJuSArVtEvvDD
         YVNKgPw0T7r7NV06bs35T3Xc+VVxiLLtDTd8UxMikogMYBTosQHeClHHOr2+vz4GM/DJ
         4LOuAgVPQq3XwhyW53Y/zAPiT65G2dcQhV6IBzN/1CfS5ASdYcHo5j3mgHFKYPdNa8Q3
         XM5xCyDKumtMbgEPyRUdqOj/1fpODmo4J8PVM7wrda8cvQMB8ErXkMLGCByxFeSo5OYR
         06KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OtJetR9WIuGO0ceEC19WX0eKuNpTz6tIqVaPud/M5Zg=;
        b=xFXmINk623utBroDDg38PsJDV7VcC/p4fWzLb350eR9yAQtEgK9wt6HPymwYZde6Yv
         SJCuBQNFtrjKln3UoXtblv20EkpyNmqEHwPzhjtpe+/s7PmPz5yFCfr9RPC831SRSV9E
         qLUycEcoPORUgKdu++ajxb8WUj6blZ/hSyBUbJX2q92kNoc6zcI4RAw1NdFDyVLJ4pEv
         UvJT/ALkF+qM6kFEIkz7gaYyirxfJf01PdGOaJSgonDvlaHg+2Idbdw58hAWnXSggqb/
         U2ZBcYD1Ysrx5beu64DLPSw+quXfGQTUynsiN7BNVFTZ4XhKPOT9tC9hkUD6S8jq2nQZ
         TiIQ==
X-Gm-Message-State: AOAM531kEZHNuTi0pmodDo+uBrAO0g+toRQciJK5Q/bBWG2qMMa8OqPZ
	rwNbLvrNdG04wyMYLVuseg7KW9gpO+NPxZzG
X-Google-Smtp-Source: 
 ABdhPJxj0TbOk6CfOMVClFYnVNcvJCzfDlik5WbQxqrmboiqWnEqgToLv1kxezN+jRDWcZiKR1MDBA==
X-Received: by 2002:a63:2002:0:b0:3c6:ae77:1869 with SMTP id
 g2-20020a632002000000b003c6ae771869mr19827195pgg.71.1652811938463;
        Tue, 17 May 2022 11:25:38 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f9-20020a170902684900b0015e8d4eb1d1sm9408188pln.27.2022.05.17.11.25.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 11:25:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 25/31] e2fsprogs: update upstream status
Date: Tue, 17 May 2022 08:24:11 -1000
Message-Id: 
 <9f2d85b383daeca5bbed601e4ff9ff01a8c3403f.1652811454.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652811454.git.steve@sakoman.com>
References: <cover.1652811454.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 18:25:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165770

From: Aryaman Gupta <aryaman.gupta@windriver.com>

Status updated but using the existing patch since it is functionally identical.

Signed-off-by: Aryaman Gupta <aryaman.gupta@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit aab854a94e73e5035eb82fe1aafe970aaa296a54)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs/extents.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/extents.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/extents.patch
index ffaecc622a..2c09bb276d 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/extents.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/extents.patch
@@ -1,5 +1,5 @@
 CVE: CVE-2022-1304
-Upstream-Status: Submitted [https://lore.kernel.org/linux-ext4/20220421173148.20193-1-lczerner@redhat.com/]
+Upstream-Status: Backport [ ab51d587bb9b229b1fade1afd02e1574c1ba5c76 ]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 
 From 347084c9c1ad20f47dae16f5a3dcd8628d5fc7b0 Mon Sep 17 00:00:00 2001
-- 
2.25.1


