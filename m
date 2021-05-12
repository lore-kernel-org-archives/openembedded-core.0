Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web09.8164.1620831478694211144
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 07:57:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=dLtVbQ70;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.52, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f52.google.com with SMTP id d25-20020a0568300459b02902f886f7dd43so7364861otc.6
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 07:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZpO6oN36Zo4CJzzM2XCqxpuUSi+xuX0lbsHd9Qjjj2c=;
        b=dLtVbQ70+YPsQ4FPZEICaJcAVPhA7anozueXk+Blqk/C/+m1gSxa97mGw/x78+0lI3
         dxLABITwOlLY/Y6ADl2UsePhXhE+pD6eB2C4DVTBr1JRXTwr7FZk1XBCJsrO4C/d5jTN
         HvTC3wWoTcO/l+j/qlgJEKE3X8q9x1JUHJtptycbXlkOVOkiyw/Uwtm0bYZsiLds/A4P
         UHcgatHt+PazX/lteltGDffllc/WO1iasUa0w4w/cQF5+66ejgH/81TWM8Z2JAPr/CY+
         tyyiePk+X1AdEz2TsLRekdwmnvRCmNPT7mtB8OEuYv3cGyzwB/vGvXzgzaiRhbKW8TVp
         XhIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZpO6oN36Zo4CJzzM2XCqxpuUSi+xuX0lbsHd9Qjjj2c=;
        b=rUub6MXVRE7bVtc1EtXhygRlnHlIQveKRQwAmmF5WHNSCd0bWxbidi4r6YOwKlWCJ+
         3y4Uk4a/MimN3IpxdLZXn9RYUHecdA3g7lXlFibLVe0yV3mkDBpuqh8q3CxHElLKPuAD
         IDmx+HPEeyYKd8lT+oX4krrGZH6dx9iGmTqeJWfVx6PkLV06yfXpPX3tcNs8EMJGqqE+
         lLnhU/QFFScFOAs4w+tMR1kSvZZdD7vyrtcOVvcdHOlMUH51+SKSoJjNC+lW5tJqMKC+
         MrUSq9E418C0x0YwdSxnoeAJbsx5tPzbCxhvRjNkKtU9/oZYASFRZ2GE2Dz76625Og19
         Ebew==
X-Gm-Message-State: AOAM531tpSZkiyk79GyQTdHT/GIHn4wLXByfGyuTuvbpvVDoYD+QnqsL
	vZPR/0dayHwYRTZSbGKCd/pLdopCFFeBJ2FFK+Y=
X-Google-Smtp-Source: ABdhPJyeYE/es8R4HDuKh8ySs5kR1adbLilR6DD3uMdymC93sUsLFXmB7xGYjXNBgiDCeD5pSSOH9Q==
X-Received: by 2002:a05:6830:22cc:: with SMTP id q12mr10985390otc.145.1620831477627;
        Wed, 12 May 2021 07:57:57 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id 21sm1678otg.4.2021.05.12.07.57.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 07:57:57 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/22] python3-jinja2: 2.11.2 -> 2.11.3
Date: Wed, 12 May 2021 04:56:43 -1000
Message-Id: <d56c83784260f6307bfb2674197a3a9f8e7593c2.1620831171.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620831171.git.steve@sakoman.com>
References: <cover.1620831171.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

updates include fix for CVE-2020-28493

changelog:
https://jinja.palletsprojects.com/en/2.11.x/changelog/#version-2-11-3

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{python3-jinja2_2.11.2.bb => python3-jinja2_2.11.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jinja2_2.11.2.bb => python3-jinja2_2.11.3.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-jinja2_2.11.2.bb b/meta/recipes-devtools/python/python3-jinja2_2.11.3.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-jinja2_2.11.2.bb
rename to meta/recipes-devtools/python/python3-jinja2_2.11.3.bb
index 45167d52a2..dbdf563f87 100644
--- a/meta/recipes-devtools/python/python3-jinja2_2.11.2.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_2.11.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/Jinja/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "89aab215427ef59c34ad58735269eb58b1a5808103067f7bb9d5836c651b3bb0"
+SRC_URI[sha256sum] = "a6d58433de0ae800347cab1fa3043cebbabe8baa9d29e668f1c768cb87a333c6"
 
 PYPI_PACKAGE = "Jinja2"
 
-- 
2.25.1

