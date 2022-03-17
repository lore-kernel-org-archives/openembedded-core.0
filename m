Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8556CC4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 11:57:21 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.9211.1647518240389065082
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ubz2J7is;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id d7so7016879wrb.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Y8jJtiRDmUaCpJ3G3lGCY4DICVI62Z3QiWJz48LbTW8=;
        b=Ubz2J7isEKNQieBtA1IarcR0vMJO4tQ2WeOvOeEzqYxD30cj3hqWevck3HS62yhCjn
         ECd1H0L8z9a/sBu9jyrvrZK8gdetRGHpk3+WlagA+IMhtBXeAM92Fik85z/e8X4FFsMX
         tmHraHKzoc7X3AO65WnGNdfstPasB1lD9iL84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y8jJtiRDmUaCpJ3G3lGCY4DICVI62Z3QiWJz48LbTW8=;
        b=g/A8lhxX57DWQbEjS4igEGSQ7hckepnGuoLDzB6D2s6AxktE2mK7GPs3LBd36GKebq
         VUL98vUAF00tJRbhSBG4O+zJlYeTt312DtXv5p+AE73cAgZZfHtuzrBXaawKbRfG/+yg
         dovzMi8nACUbfYzoL6Mu8aFCkZKQObCa2IRefLLV9b0QCpQspmiV5P55XZvzhzaIo/jP
         KWErwoAW/ytxl3K1UL5ISyulLSWSr3FoLvUcqAroWWneRWTNsvV6tBoVkO2bhVRlIwkZ
         QBOmQxqcngr0eDPdLSGkQv00wHdQ62g3ukgiR8R6Jg0zmwYb28HJS4zy8RIhbsBfKgFg
         iaOQ==
X-Gm-Message-State: AOAM530/Fq8jGcuDba1P1oqCSASV2Fz8iGZ1L7E1UMsY/o4D+XBBNeOi
	ots2T2S33r+4+jj4g3ZLYtrOWltgmdI7nmvT
X-Google-Smtp-Source: 
 ABdhPJzwNvNXkTqftwjr2KK6I8UwhFEBijB2GkVzyvuq41cF1bK0hqkOQHXzWIdFFppdEJgvSsc71g==
X-Received: by 2002:a5d:69c7:0:b0:1f0:61f3:642b with SMTP id
 s7-20020a5d69c7000000b001f061f3642bmr3773828wrw.632.1647518238667;
        Thu, 17 Mar 2022 04:57:18 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:64d8:6f1c:d663:861])
        by smtp.gmail.com with ESMTPSA id
 f22-20020a1cc916000000b00380d3e49e89sm3892315wmb.22.2022.03.17.04.57.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 04:57:17 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/26] python3-babel: Add recipe from meta-oe/meta-python
Date: Thu, 17 Mar 2022 11:56:48 +0000
Message-Id: <20220317115700.993924-15-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
References: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 11:57:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163400

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3-babel_2.9.1.bb             | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-babel_2.9.1.bb

diff --git a/meta/recipes-devtools/python/python3-babel_2.9.1.bb b/meta/recipes-devtools/python/python3-babel_2.9.1.bb
new file mode 100644
index 00000000000..11c8d60105a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-babel_2.9.1.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "A collection of tools for internationalizing Python applications"
+HOMEPAGE = "http://babel.edgewall.org/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=05fb707293a85504aa67afc8ea34d747"
+
+SRC_URI[sha256sum] = "bc0c176f9f6a994582230df350aa6e05ba2ebe4b3ac317eab29d9be5d2768da0"
+
+PYPI_PACKAGE = "Babel"
+
+inherit pypi setuptools3
+
+CLEANBROKEN = "1"
+
+RDEPENDS:${PN} += " \
+    ${PYTHON_PN}-codecs \
+    ${PYTHON_PN}-difflib \
+    ${PYTHON_PN}-distutils \
+    ${PYTHON_PN}-netserver \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-pickle \
+    ${PYTHON_PN}-pytz \
+    ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-threading \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.32.0


