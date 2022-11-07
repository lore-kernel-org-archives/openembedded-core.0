Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C12AC4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 15:37:01 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web09.90.1667835420438006584
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 07:37:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=P/nB2aCT;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id k22so10973374pfd.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 07:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ut66b9RUxj5z2cdSxJLpenFBqj9vLiKfQC167Xc0vVc=;
        b=P/nB2aCTGx/Hq7b2ZFdELVZSeWUFclaKYLIh1Mrn/3ip9GeFB3OPU3Cf31eUR8s2XA
         ZDja9GlvwxVdZAJ79gdCvnHdBM5MPxZ/8s3WJAZ7R5MgpmDSdrTPYOzEbrSepvkESrKU
         IY5y2/YFomXOuxXkuvL0D6wP4aYPB97yGJoq1Nb9GrZD/xaqdY4PG/XWLxvV0LMEfKLe
         UBNqRrRfRq5Y3PLqTFge2LkjlUvlO0g+tu6o0IspKPic4VLHmv0KzYLBgdR6d5hEB5sB
         PoF8akV9xazuoHoJDoHURxJQNcyHephVrbjSQhAJdNAiqkhjwTle8AWSA0PV3waP8ozz
         sg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ut66b9RUxj5z2cdSxJLpenFBqj9vLiKfQC167Xc0vVc=;
        b=ED5L/E2a29uG3I2JWWwLRIYurTYKEyZ/xuz23KoqEi0dL2UC8eMUImW75J/7QfIKoJ
         h3PP7yKfc+zX1RjADaXeOMwV7cf9OoGjuC1XRvxTfdt7iyzeLaoSrZXyjBvs9Ohs4ENW
         7pzaf7fLDNaEsGEIoHP6UU5damI80Ga/SZn37TZJMiecTEkh9YtTYpP9E8wrdyfZCEgX
         mJRsSXjnULJ+nMcFGzR37cSYQroNZ127rYI1b358KyG1lh/MVzHqv0tqV+Kv2OuEy++l
         VCz1lAtbBo6uwvdF7z62wdO7LtWL8QURThlnv16hG9Lj0+WzkATa8FC7h/sVuZ3t4NDX
         RawQ==
X-Gm-Message-State: ACrzQf04KNpzIagkfnnl4Z69QNTaCB1Bak6FOKcotnsQXxVii2762Ep0
	80cwln5rwreNnjM6atR+ZLGqF5oXeH6JkrEJ
X-Google-Smtp-Source: AMsMyM7rFXQYXCrJiyeL+aEE/leWxdUksKIsKffEL/LOzJKsmaka/gzu3Pm8O3Gn7mt/kKfCek7qug==
X-Received: by 2002:a63:2f45:0:b0:457:dc63:68b4 with SMTP id v66-20020a632f45000000b00457dc6368b4mr43583134pgv.228.1667835419191;
        Mon, 07 Nov 2022 07:36:59 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id v2-20020aa799c2000000b00561dcfa700asm4628627pfi.107.2022.11.07.07.36.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 07:36:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/25] numactl: upgrade 2.0.14 -> 2.0.15
Date: Mon,  7 Nov 2022 05:36:22 -1000
Message-Id: <c275a87794027b03fde68ee11fa2f5eddbf3c344.1667834972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667834972.git.steve@sakoman.com>
References: <cover.1667834972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 15:37:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172902

From: Richard Purdie <richard.purdie@linuxfoundation.org>

v2.0.15 changes

Various bug fixes and cleanups
Supported multiple preferred nodes
This release didn't include a release tarball. Furthermore, it had issues such as #135, #136 and #138 that got fixed in the follow up release. Please try to use v2.0.16 instead.
License checksum change from a typo fix.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8829fe6ee093acc6fb990f9ca6cad67c2c7549d5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/numactl/numactl_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/numactl/numactl_git.bb b/meta/recipes-support/numactl/numactl_git.bb
index 93547ea239..712cf0203f 100644
--- a/meta/recipes-support/numactl/numactl_git.bb
+++ b/meta/recipes-support/numactl/numactl_git.bb
@@ -8,10 +8,10 @@ SECTION = "apps"
 
 inherit autotools-brokensep ptest
 
-LIC_FILES_CHKSUM = "file://README.md;beginline=19;endline=32;md5=f8ff2391624f28e481299f3f677b21bb"
+LIC_FILES_CHKSUM = "file://README.md;beginline=19;endline=32;md5=9f34c3af4ed6f3f5df0da5f3c0835a43"
 
-SRCREV = "dd6de072c92c892a86e18c0fd0dfa1ba57a9a05d"
-PV = "2.0.14"
+SRCREV = "01a39cb4edc0dd0f4151b7ad11e0c56d2e612a02"
+PV = "2.0.15"
 
 SRC_URI = "git://github.com/numactl/numactl;branch=master;protocol=https \
            file://Fix-the-test-output-format.patch \
-- 
2.25.1


