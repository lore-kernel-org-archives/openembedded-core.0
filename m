Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA83D116F5
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 12:15:50 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20100.1764591341615105276
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Dec 2025 04:15:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W8/8zOG0;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42b3b0d76fcso2614445f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 04:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764591340; x=1765196140; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ythmEeOAqUPCFgU5Z7zTDqAzHQUDVDVC9fyKjfiV5FY=;
        b=W8/8zOG08CEvcn9G4uMkmgC0Cz5M1JbV4g5TdqW9XnYzIj5ncUdILUSZh1VWZwty3L
         0/4MSnRYvExWfJXeKHJQXh1Tpt0TDS3/TmG74UxBL9FA/09rv2jN+gcsIWQMW9U3efNa
         WCYhJyrfGNApr+wCi7MwxuUZNFpoRGh8D6qkXREdou9puhonJyJfqjvjeWzH0MZoJGsA
         EPAskfZeADRfY9lcfllxblEZi7aGXuo2zwoYZZduoKZwB0apf6EMnMWj8pSgH6JMfpVT
         HgNTMfDTRj+KZHYyQOKwYwb0fXHHlhKGB0JXG1v27jX71iprAAmq/+EmByZcaxP3jDFn
         oX5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764591340; x=1765196140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ythmEeOAqUPCFgU5Z7zTDqAzHQUDVDVC9fyKjfiV5FY=;
        b=Cd2xeL+plQD/dTRKn9cjRVGgkOh8qV7iyq7zdhWaFwOMvV1ibzCm0dF1P32h9C8WiR
         uL0a5seGhIDyqYBnndHBJuc3onmMFX2Hj42k5+6X1rtmshGUMnbWzyw4/XEoBHGxr159
         nHAdnEwqJZ7DFZ+dicwLgjXAkBYU/bOnArIT5me57rhhY7WkIvqMAzawx/ekv0t+6hSN
         xfYKxGrT/JyKDfhNr3DAdaPIPs9ez3sqphXrmb767vbqgYmaevQFFT9Wy8hJyBV17n8O
         SgyM+q5Hf5O2WaJu//58XC11b69GExCfEr168QAwsj0nX+LTDbEEjb0J7r+CwkOyHQPX
         /fiA==
X-Gm-Message-State: AOJu0YyTMvq918B2Py3XAQTtntUgI7FVgmMrK/AYrmdMXMcdHuxW8QwK
	0L/Dap1tnrBO8AfXEWZxoBaEZ4ONXOveh9aVhRLiQorqMkPNSUc32yJD9ABN0g==
X-Gm-Gg: ASbGncu3MS/qEI+fw8BKq+NjhZBckzFbznEIN4PCAag58C4g3jBEOKATZkSkWAGOVmH
	PITn3mlrq+DiqwCZCEkdoTIKTpKGwxfhz4AjEmLE2/RRnSgf2wRT+advbaK88aQmLBDU2k4PNgt
	VOXonxl4ajWFa/OFqz+hpN0pRSRiX+u9ALvvYDHtlOcV6CPfE882jNgocggZRl1HA67u30gI3sg
	xs0gCxA4OmM+j28vMwOWNzj0mKW8MyxSxQERq3ylnQoRS6MPimAEg0gGyWG1ZJ4m4/4WFY55Eve
	QRVgRPpI5pahabPUSxMuzH+59QdViaBgdVOnDavAVnUkqyygJwusro9YMQ+t73GE4ixKr9S2MLu
	FSaA0bk+O0ELkZno9sCVj9vfSRaO21iYcFA5MNMOnUurdZycK8nVG3O7h6zXg2BvSbw3+w+fDUP
	DuvUd8P4e1
X-Google-Smtp-Source: AGHT+IGljKJcyisEUA13Vjj1MCiDkaH7vpTCm5d4jWi+U9OEdfRXG+vyCVztbXggdsjbONx32N6BRw==
X-Received: by 2002:a05:6000:208a:b0:42b:3bd2:b2f8 with SMTP id ffacd0b85a97d-42cc1d3543dmr39575710f8f.46.1764591339744;
        Mon, 01 Dec 2025 04:15:39 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca9aea3sm25333180f8f.35.2025.12.01.04.15.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 04:15:39 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] utfcpp: upgrade 4.0.6 -> 4.0.8
Date: Mon,  1 Dec 2025 13:15:37 +0100
Message-ID: <20251201121538.2293818-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 12:15:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227123

License-update: the project removed the submodules, and included
the necessary files in the main repository. The license itself hasn't
chaged, however it seems that it was indicated incorrectly in the recipe
previously: the main application is BSL-1.0, but the additional header
is under MIT, and not BSD.

Selection from the shortlog:
- fix compile warning
- Get rid of submodules and add ftest.h to tests directry
- tidy code
- Compile time checks for size of UTF-16 code units

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/conf/distro/include/maintainers.inc    |  2 +-
 meta/recipes-support/utfcpp/utfcpp_4.0.6.bb | 14 --------------
 meta/recipes-support/utfcpp/utfcpp_4.0.8.bb | 15 +++++++++++++++
 3 files changed, 16 insertions(+), 15 deletions(-)
 delete mode 100644 meta/recipes-support/utfcpp/utfcpp_4.0.6.bb
 create mode 100644 meta/recipes-support/utfcpp/utfcpp_4.0.8.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 9f4e5e2df8..bc58b2312b 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -854,7 +854,7 @@ RECIPE_MAINTAINER:pn-usbutils = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-util-linux = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-util-linux-libuuid = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-util-macros = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-utfcpp = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-utfcpp = "Gyorgy Sarvari <skandigraun@gmail.com>"
 RECIPE_MAINTAINER:pn-v86d = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-vala = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-valgrind = "Mingli Yu <mingli.yu@windriver.com>"
diff --git a/meta/recipes-support/utfcpp/utfcpp_4.0.6.bb b/meta/recipes-support/utfcpp/utfcpp_4.0.6.bb
deleted file mode 100644
index 344f270158..0000000000
--- a/meta/recipes-support/utfcpp/utfcpp_4.0.6.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = " UTF-8 with C++ in a Portable Way"
-HOMEPAGE = "https://github.com/nemtrif/utfcpp"
-
-LICENSE = "BSL-1.0 & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c \
-                    file://extern/ftest/LICENSE;md5=d33c6488d3b003723a5f17ac984db030"
-
-SRC_URI = "gitsm://github.com/nemtrif/utfcpp;protocol=https;branch=master"
-
-SRCREV = "b26a5f718f4f370af1852a0d5c6ae8fa031ba7d0"
-
-inherit cmake
-
-FILES:${PN}-dev += "${datadir}/utf8cpp/cmake"
diff --git a/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb b/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb
new file mode 100644
index 0000000000..7f6eb367f1
--- /dev/null
+++ b/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb
@@ -0,0 +1,15 @@
+SUMMARY = " UTF-8 with C++ in a Portable Way"
+HOMEPAGE = "https://github.com/nemtrif/utfcpp"
+
+LICENSE = "BSL-1.0 & MIT"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c \
+                    file://tests/ftest.h;endline=25;md5=d33c6488d3b003723a5f17ac984db030"
+
+SRC_URI = "git://github.com/nemtrif/utfcpp;protocol=https;branch=master;tag=v${PV}"
+
+SRCREV = "f9319195dfddf369f68f18e7c0039b3f351797fd"
+
+inherit cmake
+
+FILES:${PN}-dev += "${datadir}/utf8cpp/cmake"

