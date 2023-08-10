Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DAF6C001B0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:04:57 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.21266.1691683492077455907
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:04:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=J/O1jXJ2;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-686f090310dso952328b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691683491; x=1692288291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=me/CmgYjbcwLZs6morgriqUmbQFALip4/xcCRirrgcE=;
        b=J/O1jXJ21uryrPFtCcqIgQi3FGRPyFqyAUdyZxbij+H4F3Dg7HPnBqUZ35q2huKyXK
         adNkzkqE2pA8KPhF6PzLcYe0lWescVx+ZzHLE6qfowU/CnxmxHzAtUDz3tcU2o6g9k2h
         O97Z4e/rJ7jkKI9TKXpeZ4d1BeDoL5ccPfQ8bE88rVmFCeKGGcWPYfJd3GGmy752y/4A
         Yyy7in2jpJdYJI1uxRU7VKL3+4NKWIA/q0Jrge1S7xwH/+/KTz3w+gEdIBBrhvW2tAVm
         fOEaWPKa+do2Q6C8yLiKdxf/068om8kvHxXLzZ9Pd5ktonJJ7J266MpgDsRBMjsxnJZP
         d+iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683491; x=1692288291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=me/CmgYjbcwLZs6morgriqUmbQFALip4/xcCRirrgcE=;
        b=WHN+QRAwNhwTb6pvdejQVbitaL1DceiQrcg4jXnEBc/NIfuDYOyKzOEIrribZCuCmv
         nSv6I3DJQQhe50R8dlwuVtJoZiIvOsHbVlXmXG5fKv3Q9i6v1pwGBk+IdeLA8iZO2Tdu
         awIqDOOp9HJBTAk2RX++qHmwDweB2j3a2MI1NUR4C3iPXogVyg5LDyJ7kFPJSXfkYUvW
         w68Zof6XC502VLvtojHUK8cE1b9xb81k9Z1JozzkfWNhPdHdc4aWXasOmQxjmt+ZeqdJ
         rMdsso0I6bjGSxMHQGa9xjScM0E1oO2nsBtIxfi+rJTBXPXIaXsKCD6SYc1V1OHkW64x
         eyEQ==
X-Gm-Message-State: AOJu0YwJp3vTZmvt1QcYjxeF4T/EY0kTp6tVxL5pV5k2/x8ELpxI9ZH/
	0MlO9lbwORmIVQDRNNODvTbyI6hl5za8jjy50io=
X-Google-Smtp-Source: AGHT+IEj5hIsxoJO9XZnPsSbLrDsa24NVzmNYCgQ9dRg3Zu2TsBshtzp91eElfq2vcgEbigPwyfgzQ==
X-Received: by 2002:a05:6a20:2590:b0:13f:cd07:2b60 with SMTP id k16-20020a056a20259000b0013fcd072b60mr3876807pzd.1.1691683491169;
        Thu, 10 Aug 2023 09:04:51 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o29-20020a63731d000000b0054fe6bae952sm1715525pgc.4.2023.08.10.09.04.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:04:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 04/37] python3-certifi: upgrade 2022.12.7 -> 2023.7.22
Date: Thu, 10 Aug 2023 06:04:03 -1000
Message-Id: <ec5e5ae6b304dee9b323bd20f3db25152a083398.1691683295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691683295.git.steve@sakoman.com>
References: <cover.1691683295.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:04:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185766

From: Narpat Mali <narpat.mali@windriver.com>

python3-certifi 2023.7.22 contains the CVE-2023-37920 fix.

No changelog provided. Commits:

8fb96ed (tag: 2023.07.22) 2023.07.22
afe7722 Bump actions/setup-python from 4.6.1 to 4.7.0 (#230)
2038739 Bump dessant/lock-threads from 3.0.0 to 4.0.1 (#229)
44df761 Hash pin Actions and enable dependabot (#228)
8b3d7ba (tag: 2023.05.07) 2023.05.07
53da240 ci: Add Python 3.12-dev to the testing (#224)
c2fc3b1 Create a Security Policy (#222)
c211ef4 Set up permissions to github workflows (#218)
2087de5 Don't let deprecation warning fail CI (#219)
e0b9fc5 remove paragraphs about 1024-bit roots from README
9427a5a fix CI
fed4048 get CI passing again
9e9e840 (tag: 2022.12.07) 2022.12.07

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ython3-certifi_2022.12.7.bb => python3-certifi_2023.7.22.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2022.12.7.bb => python3-certifi_2023.7.22.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb b/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-certifi_2022.12.7.bb
rename to meta/recipes-devtools/python/python3-certifi_2023.7.22.bb
index dca3d26811..f63b0b6cb8 100644
--- a/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3c2b7404369c587c3559afb604fce2f2"
 
-SRC_URI[sha256sum] = "35824b4c3a97115964b408844d64aa14db1cc518f6562e8d7261699d1350a9e3"
+SRC_URI[sha256sum] = "539cc1d13202e33ca466e88b2807e29f4c13049d6d87031a3c110744495cb082"
 
 inherit pypi setuptools3
 
-- 
2.34.1


