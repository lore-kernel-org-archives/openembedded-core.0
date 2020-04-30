Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.4119.1588240724766294862
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 02:58:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=POKix5eM;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id j2so6106300wrs.9
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 02:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RTr/33Ry1SloOexj9h9Y1RJdRyA9KZknIV3qLQsBZLs=;
        b=POKix5eMN0wcDXMWTQCimlN4zN4pUa8Xk0UAN6lDOEg0s98ocRSlaeIICDCMCtX3MC
         6ic7F0ecdY7tpnKVGpXvHEnzYsDPRlp8O3gvNZosbGxZ1kg1AodIbqa8QkJXjPIoSFLi
         pXt4/Pdsnn/W8XhH/AYVdmPToxrgxHPHW80qpxoKyxsbCpEpjsQHQ9Fuc6L4VxNCu+3f
         pVhxZyFMllZOwZSAsITUNUqePZukVYb1/LyxlxFIDKfi14D6s4NppqXuv1fdscYMAtlU
         eIK6yxYCe2ay6j5F45dl6fclA+kCUymN5RGAZi/1dVOfu2Y00bC+TQnJf8xl7rkj494j
         wqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RTr/33Ry1SloOexj9h9Y1RJdRyA9KZknIV3qLQsBZLs=;
        b=GqPwkJ8RYt1tEWkfV+ky7Nr1uJjHRTGMWR0YKnZdwoemX2XhE0sLjtzKxTrQd21qxe
         PfcreO5+jZ8rwUbwbm2mrP5D/jSYWrFIunw+vVpTBtiMd7SWh65DRqT1w4LnBE4H+9Av
         sHY1OSOYN/adHGIbfhThxy7PioXzXiZODVaMDzXsmyXDTZlU1bo87a5WWc4iFrqSV/bE
         0zTEkSW2hnPPpY4PiGBFZSAbV+vx6c+PnCwcqHMpXe8LVRsmJR0ClahzzzY/ttVP9CAO
         2qB4X4lQIM8Y+fwvjPJMB7G+h9tb8cj6R+OOQUvqpscTasFDYX2Pdj5X6WmIayckmWH6
         askQ==
X-Gm-Message-State: AGi0PuZq/8TA7dzAyQseu1WqTC5aRtE1/vcVpwZHeZeoj3pqwNic6XYF
	XGsgCVk4ncZR25u8CQD6SUTT1MN0
X-Google-Smtp-Source: APiQypKy75edFOZ3egD+zpCjlZxfudYeFuFOJLO4i91ojIQIQJrPk7J2Teubscl0dm5znah2GR0Eww==
X-Received: by 2002:adf:f5ce:: with SMTP id k14mr3175416wrp.39.1588240723140;
        Thu, 30 Apr 2020 02:58:43 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id b82sm12380682wmh.1.2020.04.30.02.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 02:58:42 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 15/17] python3-dbusmock: add recipe from meta-oe
Date: Thu, 30 Apr 2020 11:58:13 +0200
Message-Id: <20200430095815.2824-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200430095815.2824-1-alex.kanavin@gmail.com>
References: <20200430095815.2824-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is needed for glib ptests.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc         |  1 +
 .../python/python3-dbusmock_0.19.bb              | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-dbusmock_0.19.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index f7e4dac6f6..340cda3300 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -576,6 +576,7 @@ RECIPE_MAINTAINER_pn-python3 = "Oleksandr Kravchuk <open.source@oleksandr-kravch
 RECIPE_MAINTAINER_pn-python3-async = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-cython = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-dbus = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-dbusmock = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-docutils = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-extras = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-git = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.19.bb b/meta/recipes-devtools/python/python3-dbusmock_0.19.bb
new file mode 100644
index 0000000000..5389e48973
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.19.bb
@@ -0,0 +1,16 @@
+SUMMARY = "With this program/Python library you can easily create mock objects on D-Bus"
+
+LICENSE = "GPL-3.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
+
+SRC_URI[sha256sum] = "497f30eed2fcd5deaa2633b9622e4e99af4bdfba4e972b350ba630bac6fc86c2"
+
+PYPI_PACKAGE = "python-dbusmock"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-dbus \
+    ${PYTHON_PN}-pygobject \
+    ${PYTHON_PN}-xml \
+    "
-- 
2.26.1

