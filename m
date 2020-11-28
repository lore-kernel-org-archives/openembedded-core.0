Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.28867.1606537486502256501
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2020 20:24:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EQ7/B3YK;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id 131so6139860pfb.9
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2020 20:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hyLy8dwUhjyw2hzdYju5l+hLjDodWtGVfGxiXJvwhqE=;
        b=EQ7/B3YKlmMh/UEW+OHF1xWZWDkyaqRbTuUqOr1zcuGHlRrXodbGauGsPUQiWWW8yq
         QHfkAsrZ46CW+yynBl/AsJn6YztlNY3ud8eF8y7unkDWUxL1wgaJq0BYjYlroOHHQamh
         YhKn4uTJ//OA3R7lD6wzIvw2li4cgx7ka139rjjX7xwkgxf4VwGTh8P0uRQMcMLpz4d6
         5rQtxi7mIK5zu+4M7Ebzc2j1FdFc1y9frnaumgYoYdVvVf3E/1B9oaP5zTaEf86V/lI8
         jfdlefuf79L95pMVzBBd5dQICvMgxRyfHxFBdJvASbMjKSD2IthHPbqTQa2TPlO83QjX
         tbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hyLy8dwUhjyw2hzdYju5l+hLjDodWtGVfGxiXJvwhqE=;
        b=iZhIkvZk9eWJ/I12t7VhJR8mnqki52G2omO50+WmzrnQNeg6g92SbDwFEAf93h70JB
         z86fzeB6vgK8QBe5KTjuJ4w884/7ikOngRVDhfCJRyL8tBoQZxGltBy7a9Du0qlOsZBI
         EBxoC2PDyJB0qzZEB/417/Gi71kAybafm2dwD4jUF0LyZmcqokyxyX8RuM3ww0r8JQsT
         +bLX1QWzJDMPfKqDtn8k+/knwNB8ko1OczrcJYw3cXDWZifUD/7QEAknb/kE1p6sAXn8
         9EFseGweAKjAkYcarKcu8G4vDBZsDKcXkouXdsPMAltQK7NpJeaiLQNHdUUwWe0Gn/Zn
         IylA==
X-Gm-Message-State: AOAM5306+jZkko6ezay+QzxoOoiCPmIz31lzbHli6RIypfTOlVLJQyfL
	gjqPiFLiZYk7V1dBs8MRUZlBaHgnMOqiog==
X-Google-Smtp-Source: ABdhPJxdKzDDAzCuzX1JEjHbZ5n/qvQqajEcOynDncgftShuChv1vINxDP1BRV++nWPDfcVUmEch+w==
X-Received: by 2002:a62:1686:0:b029:197:5d15:2733 with SMTP id 128-20020a6216860000b02901975d152733mr9832570pfw.81.1606537485541;
        Fri, 27 Nov 2020 20:24:45 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:74ec:3128:f635:34a1])
        by smtp.gmail.com with ESMTPSA id b5sm12625076pjg.28.2020.11.27.20.24.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 20:24:45 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/18] python3-atomicwrites: move from meta-python
Date: Fri, 27 Nov 2020 20:24:14 -0800
Message-Id: <6aa81ff75f180b0ea5ac709021d3239b8b2debe7.1606536874.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
References: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

Powerful Python library for atomic file writes

* Part of the dependency chain for python3-pytest

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../python/python3-atomicwrites/run-ptest     |  3 +++
 .../python/python3-atomicwrites_1.4.0.bb      | 25 +++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-atomicwrites/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb

diff --git a/meta/recipes-devtools/python/python3-atomicwrites/run-ptest b/meta/recipes-devtools/python/python3-atomicwrites/run-ptest
new file mode 100644
index 00000000000..b63c4de0d9a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-atomicwrites/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb b/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb
new file mode 100644
index 00000000000..7edd41030fb
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "Powerful Python library for atomic file writes"
+HOMEPAGE = "https://github.com/untitaker/python-atomicwrites"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=91cc36cfafeefb7863673bcfcb1d4da4"
+
+SRC_URI[md5sum] = "b5cc15c8f9f180a48665f9aacf91d817"
+SRC_URI[sha256sum] = "ae70396ad1a434f9c7046fd2dd196fc04b12f9e91ffb859164193be8b6168a7a"
+
+inherit pypi setuptools3 ptest
+
+SRC_URI += " \
+	file://run-ptest \
+"
+
+RDEPENDS_${PN}-ptest += " \
+	${PYTHON_PN}-pytest \
+	${PYTHON_PN}-unixadmin \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+RDEPENDS_${PN} = "${PYTHON_PN}-misc"
-- 
2.25.0

