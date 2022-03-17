Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87D0EC433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 11:57:08 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.9209.1647518227616838529
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Xa+jP6hI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id h16so2408133wmd.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gXEHNViIF7zjCe400p/zPq1SpzGHq2zPOU16UwlwQ44=;
        b=Xa+jP6hIpZy3TUodo0ZvYTM49mU6IHv+83PBFRyDduXbF70QtbP9tvr/WD9zB3vPwG
         j9A5/tdffcr4Apwh9IjUPeQiFjgeshIcgPPXMFNaekWp/mIZIz/SrRyzytOhG5ufMUfy
         JW4GND3aa2/fCqbzMqQ1GgAFkHCaM+vw60WiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gXEHNViIF7zjCe400p/zPq1SpzGHq2zPOU16UwlwQ44=;
        b=Ki/4rh6yTBdYz/PJpGkH8hSSH4TrVT4Zr683rJGXC/Hpcel3inmd5kCbvt6/91PQiq
         SNJVxhQ5hyClhcVIhWmhENufyZ0RR7y4YVjXXghGIXYMVjMNq9Cpq9yer0pM6JdB3880
         PyTvBeXalm1RzI69rVu8X0sI6sIggOAOvck58jqnE8XSJa66vQzEty/sH8iy7A53HhkM
         EoCwVIOtvGRtW/PXWCEfKPSbeeKJrZzCbZok++Z08eGeZCNm9wYMg3RZSdH2ws5ZOb3h
         xtWeH2H2tuPHypwDywkKQP6SbA+Iq32eXPY8rpfeq0B5Q9GuxSPQ3jR1MPQbsftWqsLm
         o3CA==
X-Gm-Message-State: AOAM5322BqsF+U9pzgsxKxdyZfzUY6o+67OzGQMfTGg0uWpaqWBXDCRj
	LK6WXkQ9MyR+Bt2LE67jA2fRV1EsXmCsZRkx
X-Google-Smtp-Source: 
 ABdhPJyvzvz+NanKTwc7bG7PD2MCe5US4kPSQ2MDKc5Dtc4eLQ1DNYCQtM/x+lvHLtLj14RhEGmTYg==
X-Received: by 2002:a1c:e916:0:b0:37c:f44f:573 with SMTP id
 q22-20020a1ce916000000b0037cf44f0573mr11247512wmc.179.1647518225838;
        Thu, 17 Mar 2022 04:57:05 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:64d8:6f1c:d663:861])
        by smtp.gmail.com with ESMTPSA id
 f22-20020a1cc916000000b00380d3e49e89sm3892315wmb.22.2022.03.17.04.57.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 04:57:05 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/26] python3-pyasn1: Add from meta-oe/meta-python
Date: Thu, 17 Mar 2022 11:56:39 +0000
Message-Id: <20220317115700.993924-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
References: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 11:57:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163391

---
 .../recipes-devtools/python/python-pyasn1.inc | 31 +++++++++++++++++++
 .../python/python3-pyasn1/run-ptest           |  3 ++
 .../python/python3-pyasn1_0.4.8.bb            |  2 ++
 3 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-pyasn1.inc
 create mode 100644 meta/recipes-devtools/python/python3-pyasn1/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb

diff --git a/meta/recipes-devtools/python/python-pyasn1.inc b/meta/recipes-devtools/python/python-pyasn1.inc
new file mode 100644
index 00000000000..6cbed0fcd57
--- /dev/null
+++ b/meta/recipes-devtools/python/python-pyasn1.inc
@@ -0,0 +1,31 @@
+SUMMARY = "Python library implementing ASN.1 types."
+HOMEPAGE = "http://pyasn1.sourceforge.net/"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=a14482d15c2249de3b6f0e8a47e021fd"
+
+SRC_URI[md5sum] = "dffae4ff9f997a83324b3f33fe62be54"
+SRC_URI[sha256sum] = "aef77c9fb94a3ac588e87841208bdec464471d9871bd5050a287cc9a475cd0ba"
+
+RDEPENDS:${PN}:class-target += " \
+    ${PYTHON_PN}-codecs \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-math \
+    ${PYTHON_PN}-shell \
+"
+
+BBCLASSEXTEND = "native nativesdk"
+
+inherit ptest
+
+SRC_URI += " \
+	file://run-ptest \
+"
+
+RDEPENDS:${PN}-ptest += " \
+	${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
diff --git a/meta/recipes-devtools/python/python3-pyasn1/run-ptest b/meta/recipes-devtools/python/python3-pyasn1/run-ptest
new file mode 100644
index 00000000000..b63c4de0d9a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyasn1/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb b/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb
new file mode 100644
index 00000000000..a5e2a713626
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-pyasn1.inc
-- 
2.32.0


