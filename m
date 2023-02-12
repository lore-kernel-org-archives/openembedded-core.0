Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B35DFC64ED6
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 21:11:07 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.20819.1676236259860303775
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 13:10:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=g3yp0l+4;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id mg23so3587662pjb.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 13:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A8Nw+q0U125JrLIZKMFeGqakva17ZqZN8HT+PT1xrps=;
        b=g3yp0l+4F0OVMiQyhZWf6bLFyjB/AYlcIo1ZldGt4+2nPf/J3QzSn08LCnS9cCfEDu
         c67rElNMSmzxM6R7ILh+olPtwDZ2Pl7kVv7n6SNmcGyJuXgX+DKLCXQUmkmW3WyQLsDK
         aTxHQ7/D+SvXFg4cTxxvnU0KNG7WDLslSQZP/hsRXCeBdYRf/Xr/JdJdUCqQh/giDx/q
         1dIHcisB8G6cyD6xHTjAsiP38sJfrNV447YMKM80UER6luBnqk8qbACBhskXmJz9xbqv
         9HMbvBubL5J/iU1iHY53Px394CNklm3/eKAWW/BaQvcm8Fr3TBNEu/sjOlfpedUqFCbb
         6qIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A8Nw+q0U125JrLIZKMFeGqakva17ZqZN8HT+PT1xrps=;
        b=uC20hQSmY85Nh3BS1AxdleSs5RsTYFWj3NKXCucIgP7fzqlzvMjbMhq8rgbTQrYio5
         1N13l+1OKUX7xCr2sWxIafhkCxjle2olMkPkO8sXXssqCbf4gx8v06iIF4tfRL5t+dj5
         vyQRHrQ4t4EnapsmubyRy+bDVUe0+sHIEMCt96b8e0mHwPt9lsD7ALPlzMxRON8mqgYC
         wu+NodsXP5b95FLflJ/WVQCra4iwujlXw8AcVGD0dW0w8muIAYRd6BUQ+s/4zV5xZqsi
         oCZMcPtSWGND3QnEI+y7xq4FEyGPsfVpdnxXtPVWyKWNgBo0aXWyYtSnWJ7kvlSwPzfe
         zKMQ==
X-Gm-Message-State: AO0yUKXGuk5vlNRdvtQb9UuA/Fw1CU8mB0WDjYiMl/WzlSuDTlA+dU1q
	Vkbcr+eFT6IL3fx4FgKOGkuXRhBiUK+bfaJ2MXo=
X-Google-Smtp-Source: AK7set9Yhm7h7lRfwUmkfM5LbpJNJmWT3cqjQI+ySqYwFwg7h9AHsk85SY6ah5fRcsSHhDPy4UGJIw==
X-Received: by 2002:a17:903:110e:b0:199:10d2:b9da with SMTP id n14-20020a170903110e00b0019910d2b9damr27352473plh.58.1676236258907;
        Sun, 12 Feb 2023 13:10:58 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d23-20020a170902b71700b001933b4b1a49sm5675482pls.183.2023.02.12.13.10.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 13:10:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/27] git: ignore CVE-2022-41953
Date: Sun, 12 Feb 2023 11:10:20 -1000
Message-Id: <72438f0a54296a12cfd770c5c67b1e038f019dee.1676236110.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676236110.git.steve@sakoman.com>
References: <cover.1676236110.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 21:11:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177048

From: Ross Burton <ross.burton@arm.com>

This is specific to Git-for-Windows.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c8849af809e0213d43e18e5d01067eeeb61b330d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/git/git_2.35.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/git/git_2.35.6.bb b/meta/recipes-devtools/git/git_2.35.6.bb
index 016b743ece..0bb4a6a021 100644
--- a/meta/recipes-devtools/git/git_2.35.6.bb
+++ b/meta/recipes-devtools/git/git_2.35.6.bb
@@ -31,6 +31,8 @@ CVE_PRODUCT = "git-scm:git"
 # in mirrored git repos. Most OE users wouldn't build the docs and
 # we don't see this as a major issue for our general users/usecases.
 CVE_CHECK_IGNORE += "CVE-2022-24975"
+# This is specific to Git-for-Windows
+CVE_CHECK_IGNORE += "CVE-2022-41953"
 
 PACKAGECONFIG ??= "expat curl"
 PACKAGECONFIG[cvsserver] = ""
-- 
2.34.1


