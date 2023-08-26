Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF035C83F15
	for <webhook@archiver.kernel.org>; Sat, 26 Aug 2023 15:39:36 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.10501.1693064369847197674
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Aug 2023 08:39:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=leeTNVlP;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-68a42d06d02so1364867b3a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 08:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1693064369; x=1693669169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VN0B+rdYNDi0ywUdnhNJcwtyhNyv4eHgN2BX1DvVRyc=;
        b=leeTNVlPuRw8kuFRrTlpEoHfK/yKUce6WeAKkBiPPASLfqYkpfxgON4wz/t1bCVxAz
         EFhnZgbdEASr/3odhhCf+LWmnP4ecS0LfO567kMCdBL7VSr5SqGUQdqXvtFwDqqsHmbO
         GiH2vP6VdNGK4HyD2p6Q8UxV/q2miOlCXYxQ8aTVpsB5soIiUInOy9e1W3lVzHD942pn
         hmjqNaHoScCSCeLhb7Tp/7MS1PcgdEKH5DdJBCqco5T5loQP+B5wYLHEUWIslv8DPvWI
         fjwi68+Zyxm+Uuw8GR8OfOH4fQ1WEWSjC26tg3y80/Y5PprH31Qws0w9WebpnHAU9ODw
         0t6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693064369; x=1693669169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VN0B+rdYNDi0ywUdnhNJcwtyhNyv4eHgN2BX1DvVRyc=;
        b=HH/SxhiZ3rkg9jvMUe8XK+P4QXt2bLcwQXb3ArbgvJO+rZh1YHQ0W48UB/8XigNTgT
         PYE/4Jnhs1+1sIOdsPL6ZLnByPzvZ9RU6KWCpQjkx+jnfoReI3A50wIhIfiPSR/lA+XQ
         s2yxAETOzBvBhWj3PPPqyzpqKWrGeyiRPa+BRqrhnTIMu9oqBq4TBU6cb3eMvOFofMAa
         8qUZ6sOKxxKK4AK8i51K88w5KlHLUJP22+vshTZwHaqraR+O5TbEOwQVsRWNNgHez/3Q
         ZE2vh68KOQIOIriWtfXZ/eNqUN6QwOvv3oHya8EsoAXLYJtvizApoAAA9GmeqSA/+4sd
         yOUw==
X-Gm-Message-State: AOJu0YwMbJXbIcfqOGy2QNvHZOd18DfoV8qHtSt0P5CcU4JPMT5cPmZp
	NwX5dSMx0PZK48WTL8gS0m7z+LvxX2wix2/W7Sw=
X-Google-Smtp-Source: AGHT+IERQrhRdRrECTxArY7zBoX4YBEsDxMUmUIywrF34HzlVrmclFXCqRy2kQ8+rqA7HZaTVc2K+Q==
X-Received: by 2002:a05:6a00:cc9:b0:68a:3e68:f887 with SMTP id b9-20020a056a000cc900b0068a3e68f887mr18753788pfv.29.1693064368990;
        Sat, 26 Aug 2023 08:39:28 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g25-20020aa78759000000b006732786b5f1sm3422430pfo.213.2023.08.26.08.39.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 08:39:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 18/20] scripts/create-pull-request: update URLs to git repositories
Date: Sat, 26 Aug 2023 05:38:49 -1000
Message-Id: <ec2bed2e82eb65b3278a6740b54973b78fe236c8.1693064194.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693064194.git.steve@sakoman.com>
References: <cover.1693064194.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 15:39:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186762

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Also remove the git.pokylinux.org URL, no longer used.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 47b88d143c2fc61ce0e03b7eb3a9dbcffadbf5b1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/create-pull-request | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 2f91a355b0..885105fab3 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -149,13 +149,10 @@ fi
 WEB_URL=""
 case "$REMOTE_URL" in
 	*git.yoctoproject.org*)
-		WEB_URL="http://git.yoctoproject.org/cgit.cgi/$REMOTE_REPO/log/?h=$BRANCH"
-		;;
-	*git.pokylinux.org*)
-		WEB_URL="http://git.pokylinux.org/cgit.cgi/$REMOTE_REPO/log/?h=$BRANCH"
+		WEB_URL="https://git.yoctoproject.org/$REMOTE_REPO/log/?h=$BRANCH"
 		;;
 	*git.openembedded.org*)
-		WEB_URL="http://cgit.openembedded.org/$REMOTE_REPO/log/?h=$BRANCH"
+		WEB_URL="https://git.openembedded.org/$REMOTE_REPO/log/?h=$BRANCH"
 		;;
 	*github.com*)
 		WEB_URL="https://github.com/$REMOTE_REPO/tree/$BRANCH"
-- 
2.34.1


