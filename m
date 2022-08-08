Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE3EC3F6B0
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:39:06 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web09.22251.1659940736104019952
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:38:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p1dsY4Ph;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id e13so10014736edj.12
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xBpa3TV6eUC/KniBvWaxNQ02Ykn73AHmC6rYlKnXvTg=;
        b=p1dsY4PhHeJS4HMyBUn9xh0BcKY8fK5muOoCwYd/WayJJAHShGYv+h4G8GsPni9vhA
         GaTKCn76EuIA9SnZ4YBmMYioLgQuoJnfdLTaBDdzf6seE318J115wTgYjXaHi0Rf44x4
         I85HMkKmJOtQpoyX0QTO0mly7v6KPJH+/IFU7jDIbd+UHOAr26FD9IG7mqkjQMO5uv0R
         Fxf+dfRrMS5BIyGSqwk1YhatexK/yAu/567VWiQVDWlO1Wk4UO7TiYPm6jQOTzeJD3XF
         DDi44EkcS/81LwJq7V+i7/XiVZyPRqF3b2Epht2/KYA2WXf0K+3gYHjDesgu9OvFzrpY
         MkHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xBpa3TV6eUC/KniBvWaxNQ02Ykn73AHmC6rYlKnXvTg=;
        b=SImuRvbynvVIHP3fzUHJ0WzjhziqloIXcV2FBu+60XuAe7Xs3nSjWi1cGbpsadaLrG
         FvdyRAPwizSSxYCNV+JwdRiqBGSBD3btbg/aghk/G6ftscGUD2pxhaupbnXbFBRRRgIi
         Jd/oknFeZTPibZQW1mCSSLraqsNkGOTgSAjRzDufx1MR83uNGp2WA+U9uqoS/qhMKcoL
         uisL+EZyT7xWBBhdZNNX+Q3vNNJd2oSo0hJSyy5/YLhkK4kQYe/zLuvV97pYUu6UhgQv
         7zxiCvo1dku4UWaCr7A+0qDa4yBmwi7h4P/UwM7XgoEejv6u+S9GT3iOn4sDQPXs3iFb
         gXvQ==
X-Gm-Message-State: ACgBeo2LVB6r1d6tWMJDdrB0XSB6ipVNSxq3SH0kEcE23XdJ6/xzg5ET
	HDNJQBf/+egNLmwH7WT4NidSStDpfNg=
X-Google-Smtp-Source: 
 AA6agR4hdRLej9pdjSTKIeht3031nYX2FKgTEczPyqE2jo49nIlRUYJn9pAylduWrquwPZ39MVTyYw==
X-Received: by 2002:a05:6402:520f:b0:43e:5cf1:d1 with SMTP id
 s15-20020a056402520f00b0043e5cf100d1mr16888943edd.22.1659940734657;
        Sun, 07 Aug 2022 23:38:54 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 k22-20020aa7c056000000b0043ce5d4d2c3sm4092644edo.14.2022.08.07.23.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:38:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/45] cmake: update 3.23.2 -> 3.24.0
Date: Mon,  8 Aug 2022 08:38:05 +0200
Message-Id: <20220808063843.3975130-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808063843.3975130-1-alex@linutronix.de>
References: <20220808063843.3975130-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:39:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169021

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../cmake/{cmake-native_3.23.2.bb => cmake-native_3.24.0.bb}  | 0
 meta/recipes-devtools/cmake/cmake.inc                         | 4 ++--
 .../cmake/{cmake_3.23.2.bb => cmake_3.24.0.bb}                | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.23.2.bb => cmake-native_3.24.0.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.23.2.bb => cmake_3.24.0.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.23.2.bb b/meta/recipes-devtools/cmake/cmake-native_3.24.0.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.23.2.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.24.0.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 4a6884e871..d64afffdc1 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -10,7 +10,7 @@ HOMEPAGE = "http://www.cmake.org/"
 BUGTRACKER = "http://public.kitware.com/Bug/my_view_page.php"
 SECTION = "console/utils"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://Copyright.txt;md5=f2102a52df7aa592cf072180e7ebc8c7 \
+LIC_FILES_CHKSUM = "file://Copyright.txt;md5=45025187a129339459b6f1a24f7fac6e \
                     file://Source/cmake.h;beginline=1;endline=2;md5=a5f70e1fef8614734eae0d62b4f5891b \
                     "
 
@@ -21,7 +21,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[sha256sum] = "f316b40053466f9a416adf981efda41b160ca859e97f6a484b447ea299ff26aa"
+SRC_URI[sha256sum] = "c2b61f7cdecb1576cad25f918a8f42b8685d88a832fd4b62b9e0fa32e915a658"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.23.2.bb b/meta/recipes-devtools/cmake/cmake_3.24.0.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.23.2.bb
rename to meta/recipes-devtools/cmake/cmake_3.24.0.bb
-- 
2.30.2


