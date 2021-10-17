Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D7D6C433EF
	for <webhook@archiver.kernel.org>; Sun, 17 Oct 2021 01:41:47 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web08.18287.1634434906545659878
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Oct 2021 18:41:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=i+axboKo;
 spf=pass (domain: gmail.com, ip: 209.85.214.177,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id g5so8883331plg.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Oct 2021 18:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+SA5Q2MBDxMucabvEuZytJPL5JL2js5Zqf4FNcny5qU=;
        b=i+axboKodnjn98JcDTI0teiO+gGBPRHmGQtHBVQEPTlywClxy96Vn7xNhjzvPuo4CA
         YoX6cbHmGVfotmGzY6AZknikWO0hNmpJTVZxuHbOH0Jw0CYoFQ+sOS1LId1LH8AokK4f
         IYcWbU1oAq0VGHggsT/IRg2aIgVkA+gvH2PLAKSSw8J2zLEZ/6qSgPQonYKiJ8F797Tk
         fFVJ8TUJB9x2c50PsRqcQWrAZuB6XRLH9zzKO3G8BGuGC6h1KQsDJhAec+AbS8NqS382
         cn3mCLtzhmJA7v7Fovn0Y7qQ9R22mRJAMbUjfbOlROEz0tFqitCKK2eIVKZQuUksjCxh
         OdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+SA5Q2MBDxMucabvEuZytJPL5JL2js5Zqf4FNcny5qU=;
        b=CIpCEv4XfwybaYz4x8oco+XXS3PGU1nlQvm1VWcKkX6qJqUADoELdAOMeCbjv7tZST
         xZzJILahkRmEvq3jB3mrmCpj7jNmIcT0/52U0LLBtgL6ag1EFECzOrXCg+Iy2sC0II8i
         0MhLCp3DG//6jABby1RsIg9zF19AT93nH/K3+B5ayWsH4nnbpiC0vfcduKvEQ6kvdXGY
         bKhxoprmQSpKeWndSwtPcml8qIqj7PlQ6qTTKTbWhwEkzFaJ9NcQ2Dslh35bGtiASUJj
         dCt9PaM5BSFW2piDri/mblk21wkSbzn0X2sW7ideKGCJUDRUXVmekyZtxML5Q2LKb5sB
         Tvjg==
X-Gm-Message-State: AOAM531pKsgpjlG/w4CG73zS0Lgqys2Gzi9RKTiHLOQa0coarg4bkDBq
	OFdoSGeHzAutBAiizP7MmDsG9WyuBqM=
X-Google-Smtp-Source: 
 ABdhPJzqueyuxuEVnW0PMH3Ih43mc/qGQBdI6sZBcXwfAPtscYzUV9QGYVan7x1u7e1usQcDKSgpQg==
X-Received: by 2002:a17:902:c410:b0:13e:cfac:45ad with SMTP id
 k16-20020a170902c41000b0013ecfac45admr19773811plk.68.1634434905596;
        Sat, 16 Oct 2021 18:41:45 -0700 (PDT)
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:1830::17e1])
        by smtp.gmail.com with ESMTPSA id
 gf23sm9227891pjb.26.2021.10.16.18.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 18:41:45 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH 3/3] python3-setuptools-scm: upgrade 6.0.1 -> 6.3.2
Date: Sun, 17 Oct 2021 01:41:21 +0000
Message-Id: <20211017014121.414803-3-timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211017014121.414803-1-timothy.t.orling@intel.com>
References: <20211017014121.414803-1-timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Oct 2021 01:41:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157023

RDEPENDS on python3-tomli instead of python3-toml

Cleanup RDEPENDS (common vs. class-target)

For changes, see:
https://github.com/pypa/setuptools_scm/blob/main/CHANGELOG.rst#632

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 ..._6.0.1.bb => python3-setuptools-scm_6.3.2.bb} | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools-scm_6.0.1.bb => python3-setuptools-scm_6.3.2.bb} (73%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_6.0.1.bb b/meta/recipes-devtools/python/python3-setuptools-scm_6.3.2.bb
similarity index 73%
rename from meta/recipes-devtools/python/python3-setuptools-scm_6.0.1.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_6.3.2.bb
index afbed17a2d..bc594d9620 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_6.0.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_6.3.2.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "setuptools_scm handles managing your Python package versions in S
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[sha256sum] = "d1925a69cb07e9b29416a275b9fadb009a23c148ace905b2fb220649a6c18e92"
+SRC_URI[sha256sum] = "a49aa8081eeb3514eb9728fa5040f2eaa962d6c6f4ec9c32f6c1fba88f88a0f2"
 
 PYPI_PACKAGE = "setuptools_scm"
 inherit pypi setuptools3
@@ -12,15 +12,15 @@ inherit pypi setuptools3
 UPSTREAM_CHECK_REGEX = "setuptools_scm-(?P<pver>.*)\.tar"
 
 RDEPENDS:${PN} = "\
-    ${PYTHON_PN}-debugger \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-py \
+    ${PYTHON_PN}-packaging \
+    ${PYTHON_PN}-pyparsing \
     ${PYTHON_PN}-setuptools \
-    ${PYTHON_PN}-toml \
+    ${PYTHON_PN}-tomli \
 "
-RDEPENDS:${PN}:class-native = "\
-    ${PYTHON_PN}-setuptools-native \
-    ${PYTHON_PN}-toml-native \
+
+RDEPENDS:${PN}:append:class-target = " \
+    ${PYTHON_PN}-debugger \
+    ${PYTHON_PN}-json \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


