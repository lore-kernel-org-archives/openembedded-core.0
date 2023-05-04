Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0338FC77B78
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 02:51:14 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.40878.1683168665978482466
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 19:51:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=aIDIn4NN;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-63b50a02bffso20152b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 19:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683168665; x=1685760665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SLMNQnvua9M5Z8IHtHrhwIUJTtpVtw+Cqi0a0n/LArs=;
        b=aIDIn4NNnvskhP7zCJUAt/BkoLQgPjgGrfQyV95cxgjgws3DIDieNXmzk3PUGVzAs8
         zbPgtl2IxSTiDO5ytVWyNAHbZ4cIqBa5/q4yOEOxgYN8Z98bliExFHwbeGCVa9cUcpyk
         8YKcQRske9kTe2Nyen1KQ9EGDVxers958em9+S2N5bJ+dc9n8NqWDtTH1pJrjczLS7tl
         1VqzKEaK7R/vn2g7MFWtGctReBxs9ENe4XiNNfpDzlYYP2pfaQ/ELP3GIXq0ySewWIIN
         dN3W7aVHBe9jWR2zo7h8jKessL6jzjIMpF4C6XfQxvWUbtiRAzf8RtnlbbBpdfUv8LnL
         ncyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683168665; x=1685760665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SLMNQnvua9M5Z8IHtHrhwIUJTtpVtw+Cqi0a0n/LArs=;
        b=i+5OXIQyCyFw+Dt2P5YTUANBV+00lgfiCX2eFTQTfWAMweIx6y13EY+4FuLkiqhF+i
         XybZ5hQyjki53rBAMq6icwzWfx06LosYXm0svY+vNNwPqsgzOzzE+IKlV+XRivHJUbE4
         4o3WgWVlVgk1Mi5ANcZFfxlZfveFffDkwKHeplLj11+0SzXlDVG0gtZf78v/DEPYpSBY
         Dei1Xti6JDHPITJgqb0Bwh/T0AbutK2JklrsWRcDrQY3p4lcPeYTF5Jyq7A9XbDs3BsN
         QXJ8y7COUtnZMYrQATLc6anpjpfd1hECLSXOfkdETCQV0GA1j3Pem3IHwWzJY8FsiUgv
         gibQ==
X-Gm-Message-State: AC+VfDxmfMlOGz3ip+Z9DRJkSWdzwWgA5P4wCAtH+NNWqUhlnThYSKPr
	lxHn8qAQicm6MZBRFBsvNA2zpRNh6nKMTw==
X-Google-Smtp-Source: ACHHUZ4/b7kJlObgi/at2qy3JKIdZjdyR2nOPEM62qhBnckJfjWdraliegvDgzvpEKCR2gQgYp+MzQ==
X-Received: by 2002:a05:6a00:10c3:b0:63b:5496:7afa with SMTP id d3-20020a056a0010c300b0063b54967afamr834073pfu.11.1683168665014;
        Wed, 03 May 2023 19:51:05 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::ade2])
        by smtp.gmail.com with ESMTPSA id 188-20020a6219c5000000b00640e01dfba0sm18040526pfz.175.2023.05.03.19.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 19:51:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] cmake: Upgrade to 3.26.3
Date: Wed,  3 May 2023 19:51:02 -0700
Message-Id: <20230504025102.1658227-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 02:51:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180844

License-Update: Copyright year changed from 2022 -> 2023

- Copyright 2000-2022 Kitware, Inc. and Contributors
+ Copyright 2000-2023 Kitware, Inc. and Contributors

Call bootstrap directly without wrapping it with configure
since all it does it find the sourcedir

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../cmake/{cmake-native_3.25.2.bb => cmake-native_3.26.3.bb}  | 2 +-
 meta/recipes-devtools/cmake/cmake.inc                         | 4 ++--
 .../cmake/{cmake_3.25.2.bb => cmake_3.26.3.bb}                | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.25.2.bb => cmake-native_3.26.3.bb} (98%)
 rename meta/recipes-devtools/cmake/{cmake_3.25.2.bb => cmake_3.26.3.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.25.2.bb b/meta/recipes-devtools/cmake/cmake-native_3.26.3.bb
similarity index 98%
rename from meta/recipes-devtools/cmake/cmake-native_3.25.2.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.26.3.bb
index c150aef5ef..2177aa81a4 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.25.2.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.26.3.bb
@@ -38,7 +38,7 @@ CMAKE_EXTRACONF = "\
 "
 
 do_configure () {
-	${S}/configure --verbose --prefix=${prefix} \
+	${S}/bootstrap --verbose --prefix=${prefix} \
 		${@oe.utils.parallel_make_argument(d, '--parallel=%d')} \
 		${@bb.utils.contains('CCACHE', 'ccache ', '--enable-ccache', '', d)} \
 		-- ${CMAKE_EXTRACONF}
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index b7e674c4c4..2b6554690b 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -10,7 +10,7 @@ HOMEPAGE = "http://www.cmake.org/"
 BUGTRACKER = "http://public.kitware.com/Bug/my_view_page.php"
 SECTION = "console/utils"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://Copyright.txt;md5=09069e0fffe4e5eaf6dde04c3b1932e5 \
+LIC_FILES_CHKSUM = "file://Copyright.txt;md5=9d3d12c5f3b4c1f83650adcc65b59c06 \
                     file://Source/cmake.h;beginline=1;endline=2;md5=a5f70e1fef8614734eae0d62b4f5891b \
                     "
 
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
 "
 
-SRC_URI[sha256sum] = "c026f22cb931dd532f648f087d587f07a1843c6e66a3dfca4fb0ea21944ed33c"
+SRC_URI[sha256sum] = "bbd8d39217509d163cb544a40d6428ac666ddc83e22905d3e52c925781f0f659"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.25.2.bb b/meta/recipes-devtools/cmake/cmake_3.26.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.25.2.bb
rename to meta/recipes-devtools/cmake/cmake_3.26.3.bb
-- 
2.40.1


