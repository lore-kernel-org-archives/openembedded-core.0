Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.28757.1606537504067096941
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2020 20:25:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HfYMego+;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id t3so5765252pgi.11
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2020 20:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0wPvTsa/sw3USu3hQBVQ+QGBQ+jXvEneNXuSL00G6sY=;
        b=HfYMego+m+px81XYfWnip6LQl5nKdrGpmURq3OPshmHkklXuOLw7diUWk3XP3ON6zj
         GRg54DrRP6BCTAwBIUXyMqZb8IRLjLabY7O0fM1d8/cxGLSXOWs1oKgsQqOm5Y2SsIGJ
         cuQ1OgrioPEpYPfS5B5XEajcZQnVyPPAie+2TFiM+aZsYN1PrnnigC+g5Oggspndq++x
         G/mhNfklsuzR2tQKDbFvjiki2Le8NBKrowMiG3Am0wo9o99uLdB/qx65lB08CUUFsAYR
         oMxXJ2xbSTQehZY/BajGBTWCPqu3qGuFOjoffaV3p76ClZdgtYsdecncBeEwrx9qhgMf
         aPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0wPvTsa/sw3USu3hQBVQ+QGBQ+jXvEneNXuSL00G6sY=;
        b=qTz9wMz9HBjpy1TLK/EDnZXVr5B5DrdiKmWFR9yX2o08t0KhQqAJ23KA2fwDzpwnAr
         +pzHkt8Dw9juP41udZYBbqmX8innKjb8UljP1hpLoUoR+8DZS1tS1Kl7CejMbgtn4QXY
         /0ZOIOxjKJzHArnGOvAS4ZKgdXT799RaIFo1Nu77X7q0QLyzf5vVdMDFLNxpF7Av2Ju0
         R5lsPSbSwC0iOECXPcm7cT+WWVoTlZUUKVfJd4wHlH/gK1fURQYssSaJn3inrBhEUxj5
         D6zKTBEQEpbSQfzC1ScD/la4zp7Cd1t2tsrHK9scPtEKvLW33uZOudGpoNyjX0jvif5P
         xLmQ==
X-Gm-Message-State: AOAM533P69S6KuTdID9KMVA6/RFRgQSBYL00Fz89xBkbUIl4iCHJpIlV
	juxx89rE3izGsxBQmnvDpImgO5WiMgqb4w==
X-Google-Smtp-Source: ABdhPJzFpTft6SHz3joevhxhpnZBZir1E5EtkH4TSPDBgn0Rr3DRByHSKNcOPl2jrUkKlB58lZaEhw==
X-Received: by 2002:a63:221a:: with SMTP id i26mr9273929pgi.331.1606537503498;
        Fri, 27 Nov 2020 20:25:03 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:74ec:3128:f635:34a1])
        by smtp.gmail.com with ESMTPSA id b5sm12625076pjg.28.2020.11.27.20.25.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 20:25:02 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/18] python3-wcwidth: move from meta-python
Date: Fri, 27 Nov 2020 20:24:23 -0800
Message-Id: <621cf806813afe2b0ed0154dc08a386b687b31cb.1606536874.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
References: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

Library for bulding powerful interactive command lines in Python

* Part of the dependency chain for pytest

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../python/python3-wcwidth/run-ptest          |  3 +++
 .../python/python3-wcwidth_0.2.5.bb           | 25 +++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-wcwidth/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb

diff --git a/meta/recipes-devtools/python/python3-wcwidth/run-ptest b/meta/recipes-devtools/python/python3-wcwidth/run-ptest
new file mode 100644
index 00000000000..b63c4de0d9a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-wcwidth/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb b/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb
new file mode 100644
index 00000000000..bb4aae2e86b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Library for building powerful interactive command lines in Python"
+DESCRIPTION = "Measures the displayed width of unicode strings in a terminal"
+HOMEPAGE = "https://github.com/jquast/wcwidth"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
+
+SRC_URI[md5sum] = "a07a75f99d316e14838ac760c831ea37"
+SRC_URI[sha256sum] = "c4d647b99872929fdb7bdcaa4fbe7f01413ed3d98077df798530e5b04f116c83"
+
+inherit pypi setuptools3 ptest
+
+SRC_URI += " \
+        file://run-ptest \
+"
+
+RDEPENDS_${PN}-ptest += " \
+       ${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+      install -d ${D}${PTEST_PATH}/tests
+        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.0

