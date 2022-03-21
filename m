Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1968C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 22:29:47 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.2409.1647901786549434128
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 15:29:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=dbWhK3IW;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d19so16691392pfv.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 15:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=H+xnDsS9e0ODeLLBFwJfJDYvfVh9APmBSrRlfYjPBtI=;
        b=dbWhK3IWpjZF4QrtCI6Pm3XHVHhzxzSc2+6WsYYMwlOqSZye+tE+whz9cdFm4WAQU/
         XQ450OhYysynMcbduS/948+Q3KA4hP9shYQjAhqTD4/6sEYxjqc1zSP87gTx5Xn62PbZ
         iptXinCrHJ+K8+cZLAI93Hl3l4JdHwuscyQ4udtcO8m2TimKFZrsWvMbdg7uwLJVJl3K
         V2HoJguktp5SXI2PdzEzRDwopgdkx33oOg8J3AeXI9qCqtpQnf2QjxsZfG4kCk+w94jj
         ZOLNODM1GehiLNF+63GoaLit685XOI5OrgoCAjDDHSSL5imYIEXmDwe+4nqgYBA+Wuw+
         +rMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H+xnDsS9e0ODeLLBFwJfJDYvfVh9APmBSrRlfYjPBtI=;
        b=b8gi35DgUJdH3Cshye0NOTk4/1OxhCzPhX5ZGJ3UnNj4q//0vdvsSlVSyR9f5rnVJc
         EnmjLnUBEPRVrrWW5JmXCPQR68kjWTG1OkjfDEqbl41Ka2Rrw4gFhPBeJNxxey7DRrvq
         RJ8z4eQIRMHudLwqjaP3ZCr47jgqUZ4SGKrUjFz4SM2gZbBEvxpJU5mZdloKs/zLWLLA
         RHxA5KrlV+tJSCbE7W7IwyqoAA5Ofn8/BgvZiAWhz72DFYSzwaw8c/kDxuJIc5CAuK3S
         BzCbrk7l5UxNxZ9d14zqj5s9TB1nrqZrC2IMHLRJGWChh9IpBx15hcI2fUxQzWCUc/R+
         L0lA==
X-Gm-Message-State: AOAM533UHYYxeTHFuwZJ3m/BkKejh0MRgNe7nkY9qxSNzuJ7opgVUTCH
	93+6959Q8/M3E8RjHkgr1pSMnGME/a6U2ybgtL0=
X-Google-Smtp-Source: 
 ABdhPJym+5oHlIJmZ4gBrMfO9u5itMKqGL2zFd31uDttkGI4qZjhu+weBf+W5KF26X8eEpsNAeKBXA==
X-Received: by 2002:a05:6a00:22d2:b0:4fa:9d26:bc5d with SMTP id
 f18-20020a056a0022d200b004fa9d26bc5dmr7965353pfj.79.1647901785539;
        Mon, 21 Mar 2022 15:29:45 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 k13-20020aa7820d000000b004fa72a52040sm12352649pfi.172.2022.03.21.15.29.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 15:29:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/13] mobile-broadband-provider-info: upgrade
 20201225 -> 20210805
Date: Mon, 21 Mar 2022 12:29:09 -1000
Message-Id: 
 <b60558f44d0145c0d68a78b3eabe483cb016700f.1647901591.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1647901591.git.steve@sakoman.com>
References: <cover.1647901591.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Mar 2022 22:29:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163522

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 93a335993ce592a8ee34fc9a490e327f2775e03f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../mobile-broadband-provider-info_git.bb                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index b4cbc1a76c..4246f4dcbd 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -4,8 +4,8 @@ DESCRIPTION = "Mobile Broadband Service Provider Database stores service provide
 SECTION = "network"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
-SRCREV = "90f3fe28aa25135b7e4a54a7816388913bfd4a2a"
-PV = "20201225"
+SRCREV = "11f2247eccd3c161b8fd9b41143862e9fb81193c"
+PV = "20210805"
 PE = "1"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=master"
-- 
2.25.1


