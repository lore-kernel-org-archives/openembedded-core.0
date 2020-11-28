Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.28874.1606537505694087795
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2020 20:25:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CtLypAhi;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id w16so5767849pga.9
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2020 20:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mDeX7B8rsm7/oPLN7s0cVGZPuGfYYef32dlIWeCkwyw=;
        b=CtLypAhiNucf9Fk2GVyM91eTiL/NZ5VwJfRnReTSCwnpLj+oG3QBPJrmwdSjCslidV
         5rmlmoU303nhPVH3pyZb4X7PCzEMGgBvD2Zh2mp0Q4A1Zmlv+UKpJ2fIBtYHuAuRmk3a
         IHRYUPKzez3f5HxlNKedsUo9H1KwUkz5i8VuUkffGyGbRzzWjCvjGvf+jB6PAIoypjgL
         p2A+IslSrLTXMG9tfV7vg5cLfuFkz6uyrUm45hNZoqng40EeNGW9g9XTyt2NSvxK5lYi
         iFpukOmZm/ap5pvqNKdl1RdQs4L5U+dhR8FlkfUwJFVZ5JDcNpUJbTUjCaDcdq9bt2Ti
         U+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mDeX7B8rsm7/oPLN7s0cVGZPuGfYYef32dlIWeCkwyw=;
        b=HD3lbHAMNG2ZS9Vk1pkVbIZc/tJ/DMBR/wPapOxNHzHo4Ew9EmCN7PxiD01lN/iRvr
         eSx8k/IYxMNlA2r19YZPU5pl+JMDtPsDfSBP8pyoQuSlsoHH95d2Vlr5i+5j7HVoRWEP
         +kDwblqBgpESMM8mdzcDN+LhDdUnhbO8RTxeSM7/Q2opsooPiR2XcZJfzosFOhvoytfZ
         VNR3Lkn/3j3n6O2fsgfCVrOl1WeeUlGfEt52ykf6xMabVPmzQMVB1sM0a7nxFHYcgLNK
         rqTiOBOxqpeDriW5wYPIqWoeLa+MN7j8yZHauZnuSh7nSVMkzq58BMVbF67O8HllbcK+
         dFXg==
X-Gm-Message-State: AOAM530F+dtcXqi+rb6flMTqdl7X0jC7VtQbNLtmA6NQtJjiF0St+sHE
	ny+QA+Z+HlQFyRKQiUkqE/xqvhGQdciVvw==
X-Google-Smtp-Source: ABdhPJxV5MG+N9xX0E9p4teq7qEP1+1nuPBwWWja+hVvXHzPX26dYbXZKFEU/rRaRx3Hk3/C+lXOgQ==
X-Received: by 2002:a17:90a:348b:: with SMTP id p11mr13736889pjb.161.1606537505090;
        Fri, 27 Nov 2020 20:25:05 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:74ec:3128:f635:34a1])
        by smtp.gmail.com with ESMTPSA id b5sm12625076pjg.28.2020.11.27.20.25.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 20:25:04 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/18] python3-zipp: move from meta-python
Date: Fri, 27 Nov 2020 20:24:24 -0800
Message-Id: <b4a7a5019e0a147c7422b502fc751f0398b2c25a.1606536874.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
References: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

Backport of pathlib-compatible object wrapper for zip files

* Part of the dependency chain for pytest

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../python/python3-zipp_3.4.0.bb              | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-zipp_3.4.0.bb

diff --git a/meta/recipes-devtools/python/python3-zipp_3.4.0.bb b/meta/recipes-devtools/python/python3-zipp_3.4.0.bb
new file mode 100644
index 00000000000..97523e8e7c8
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-zipp_3.4.0.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Backport of pathlib-compatible object wrapper for zip files"
+HOMEPAGE = "https://github.com/jaraco/zipp"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
+
+SRC_URI[md5sum] = "ae81f228995578b840d76d1b7d87fede"
+SRC_URI[sha256sum] = "ed5eee1974372595f9e416cc7bbeeb12335201d8081ca8a0743c954d4446e5cb"
+
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+
+inherit pypi setuptools3
+
+DEPENDS += "${PYTHON_PN}-toml-native"
+
+RDEPENDS_${PN} += "${PYTHON_PN}-compression \
+                   ${PYTHON_PN}-math \
+                   ${PYTHON_PN}-more-itertools"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.0

