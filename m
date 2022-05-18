Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5FB1C433F5
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 02:31:02 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web12.332.1652841056998896429
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 19:30:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=jDsJi7D7;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d22so480787plr.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 19:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qrVyXfsid++Mc/hudyLyC4ZlJYp7+djblauWvioeQXw=;
        b=jDsJi7D7nLPaNep3c51MC0QRGYepswfcEACcUPy4TY4HwZxvVp3EJduRmO3hbwvYAu
         gkWtP5qd9j30PBNSsD93Plkvp6fXvB3K9eJDkHhsrkcph9erupZKE7WIjbMYDiTwb6uc
         GegQXVRFk64Ei7bOstJ0G2QLYvrGj7vM4wnsoST2NMJv1Y7l44q2+n7faN5hy1T3IjHU
         SLp1JFblyaF0xhXL+6VaTxrYb/fCFeq36zOZrDVcGZ2/FTeSvc7IMyFvE5PL6n6nX0sc
         PM1gmgGMRx7WSpU3IZpEellSrrcbgDiBiEi3x/pxAOMUmS+bXOH7bH3ZZmlKecG6CRzS
         MiHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qrVyXfsid++Mc/hudyLyC4ZlJYp7+djblauWvioeQXw=;
        b=peGFcBCDUArJv0nxC2u4De/Ev/O/zPi0i3KjR70tUxeUKu4yIxSMRK5LUOmfRwEkTe
         jf4grHPixFiBfOwo8h7MSUMOxvHRsNCkHd1Ifz4tOe0AA6B9zpYLsTYkTjI7WHydL5NN
         Vq6SSdSokMDy+rFX1hXIqw1JtgfRTzOfcJq+Q7WD/sdNfi74Is0d61qKhyCL3c6i8NBK
         O1doUhtXiwe3PbeLv3zd3HEHC21hx1lSz4RCivwkbckWR/9QybANxXdkBWB3VF5k309C
         g+YI9xDTud1SRv9MxvTWPuG+pCtLzE4UVsWUndzFTMQQMFdPHrZ5u9vNv3OhKxYet4qw
         Z4Kw==
X-Gm-Message-State: AOAM532tDvrfb7aLyLg1IayxRPS93ZDZSk8bulhlXwrqHZ9ep0f/45hi
	pcALNx0JpBfT5W7rcWOgkyfiJHSud4mTd8TJ
X-Google-Smtp-Source: 
 ABdhPJxLw30JiervTbVZG2PiQ6dUWM9ZknFhg45NdNH/S61HMYaCVTr0g3jY45pzyx2uQApe1g5pAA==
X-Received: by 2002:a17:902:e3d4:b0:161:888e:e707 with SMTP id
 r20-20020a170902e3d400b00161888ee707mr11169489ple.118.1652841055794;
        Tue, 17 May 2022 19:30:55 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p25-20020a62b819000000b00512ead539casm438926pfe.113.2022.05.17.19.30.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 19:30:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/9] vim: Upgrade 8.2.4681 -> 8.2.4912
Date: Tue, 17 May 2022 16:30:29 -1000
Message-Id: 
 <c7d43000ce137e1f9302b4b6cec149adb1435f47.1652840866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652840866.git.steve@sakoman.com>
References: <cover.1652840866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 02:31:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165783

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Includes fixes for CVE-2022-1381, CVE-2022-1420.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 77d745bd49c979de987c75fd7a3af116e99db82b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 5f01fc3bca..4b8f4d1dfb 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -21,8 +21,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://racefix.patch \
            "
 
-PV .= ".4681"
-SRCREV = "15f74fab653a784548d5d966644926b47ba2cfa7"
+PV .= ".4912"
+SRCREV = "a7583c42cd6b64fd276a5d7bb0db5ce7bfafa730"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.25.1


