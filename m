Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web12.28921.1606537492015977804
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2020 20:24:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f3nukXS8;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id e8so6164970pfh.2
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2020 20:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FkUJR8WftnCHKbvJpWdQs3dQinOB1Umxnx4TiRReDM4=;
        b=f3nukXS8L+Sb09UjAlzFKpGB5Sbvv7oDzQNCF4y96aJZzBHv2KbvK+yvfL+tmxZKuQ
         6kxgTC427qvsqLeYnKuqwKLatQuD24RovoiAwpWu4s1PKgzwSzDCAHzImTw6xSEQK4go
         hdKKFQWjgAwtknAguaPRAdef8SbOHICdZl71M0JTNeF4Lit1mdsIWOlJg2mcSc2y/xvy
         9N2tPztkNqxbYVhunLbUOJ0z/lD/EDCqYfGPU1pufC7Aayc3VvAAJTe8mqa9UKXXv1tm
         A1F2NAeVltSqb/lfhXbGmHFNm3ukCHw61x8GNwzdXJMZEsPtx6M3+zfcHaCaKnYqatEp
         AOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FkUJR8WftnCHKbvJpWdQs3dQinOB1Umxnx4TiRReDM4=;
        b=adPbfHKBe9zTnZpyWBaN96pd2k2N6KakG5ckt/02RibvY997+6yL25IqPwZLfQhvMN
         IOhbV7wN9yKpG3pV2pS3YCDBz0uw196b4PvloTZxLIUxdmeFyNIRdhGKLPldt5t1+hY4
         yqdb+kxh7/Ux+2C6jy7UnsSlHcH8R1oiNJ1caA9TTqaQXQIJlAek7b7pxNVBDtcpURsy
         mex7ikI+ARp1ctnXnWsUODULMyrjsZt3fHHlnJzmbKfO7MHhyMr84XpV663qKZ9EYNPV
         P2viuYPYwkRLLmP10T9TYMwuMKtuN8QrwOYym+ac6zMnJR+FI6dch7ziQBWu4f7G8Sto
         cm4w==
X-Gm-Message-State: AOAM531xQHNX+MYbxBkpEXjMei4uzXOYunF5/YY1CskmdAi3lsGybZyo
	5TON4MEECMzNsKh6xgfRsucjU+T2etqTXw==
X-Google-Smtp-Source: ABdhPJxK1IySlEAaZIwZTKYQI2k8LVXZYs7eB85UPW1G2VB8cS6TqAIKB0S+r0jvIEoEPOXfTPwjZA==
X-Received: by 2002:a63:1a1d:: with SMTP id a29mr9020225pga.19.1606537491367;
        Fri, 27 Nov 2020 20:24:51 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:74ec:3128:f635:34a1])
        by smtp.gmail.com with ESMTPSA id b5sm12625076pjg.28.2020.11.27.20.24.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 20:24:50 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/18] python3-more-itertools: move from meta-python
Date: Fri, 27 Nov 2020 20:24:17 -0800
Message-Id: <016d83a6502367c6fd29d61a571960afea35b7a1.1606536874.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
References: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

More routines for operating on iterables, beyond itertools

* Part of the dependency chain for pytest

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../python/python3-more-itertools/run-ptest   |  3 +++
 .../python/python3-more-itertools_8.5.0.bb    | 24 +++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-more-itertools/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-more-itertools_8.5.0.bb

diff --git a/meta/recipes-devtools/python/python3-more-itertools/run-ptest b/meta/recipes-devtools/python/python3-more-itertools/run-ptest
new file mode 100644
index 00000000000..3385d68939d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-more-itertools/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta/recipes-devtools/python/python3-more-itertools_8.5.0.bb b/meta/recipes-devtools/python/python3-more-itertools_8.5.0.bb
new file mode 100644
index 00000000000..e924b0f731f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-more-itertools_8.5.0.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "More routines for operating on iterables, beyond itertools"
+HOMEPAGE = "https://github.com/erikrose/more-itertools"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
+
+SRC_URI[md5sum] = "2588b5a7042576b99574779582be9292"
+SRC_URI[sha256sum] = "6f83822ae94818eae2612063a5101a7311e68ae8002005b5e05f03fd74a86a20"
+
+inherit pypi setuptools3 ptest
+
+BBCLASSEXTEND = "native nativesdk"
+
+SRC_URI += " \
+	file://run-ptest \
+"
+
+RDEPENDS_${PN}-ptest += " \
+	${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
-- 
2.25.0

