Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web12.28923.1606537500241987787
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2020 20:25:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kW5JAyCD;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id o4so3511529pgj.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2020 20:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=sxbMqYMA+HjWNTPhCepcG/+2u+h9cq0zx4f2q0xSK7M=;
        b=kW5JAyCDYeLUHU5DlC2ESCk40xvexyK0doJkgo03wVqttaFJCmDIx9eR5ZOvFD5ciu
         2zks21gBonJqnfb1zvL0AzXgCoLO7iz2pmIEhjnIWZS/06hOhPMubBha1e9kpJizSdEJ
         IdnkDk3J1pUzDAUN564ypdjDNCPzkv6tG32SPzuVF0N/yMVuhS89TyktMb22Sowk2sZq
         /O3xUqefVtmEIq2c70eEW/1NIHvEepbcMQ0Bbv2pvXIQoO9xjZPKpkAWLkM5dGHeHsgF
         Q6cucJ253RfkUl5s3BKIM7q8ZIlMtJtHF8Hj3azCJ+KvwnysVatsJZFlSje9x2PXJagi
         ihPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sxbMqYMA+HjWNTPhCepcG/+2u+h9cq0zx4f2q0xSK7M=;
        b=LB/qwcyUc7/htCrRS/u+qzN07hS77I31Hw/CHCbu4/eLLZX4vnP7jhlfrEPUR4j3ZW
         mksRnQq4t/G/L0zG6/K3d3BL79tlIatwKTAQf/cZa/Jj7NiLvoH/FO71IxAx/aj9ZRDv
         xMcmpy827Zdg69YBsSNwWOV41dUmc8sAZR30s1xN2KFdptTCbBy4k0NI88zkPamUMEpL
         u8U/GzMt/mFc7b6pXtFIbyNF1JdNzTOwc3nzSfTr6lsewU68RuJItMoeNvofKC7xyvzZ
         NiEidloQSNdIDRn91Dpjy21mwfv/jyyuOIi72mqxW45tH4jZr2V1r3qn6q/tiPyDU1Bf
         LE5Q==
X-Gm-Message-State: AOAM53171AXoSWvGSSXgrPbfopH9aXg/ZojnAwV2vMWTz85h9yIpSZj8
	rup+3sPwGVLQtlP/gZ++pZ6vXe++LvSTtw==
X-Google-Smtp-Source: ABdhPJw0Xlydk1gMn9D3EhXfXvaXQxrs+VflXnRuQO1Xi61cRcugDhm6W8N4gott4XIMbZmr8QQw5g==
X-Received: by 2002:a17:90a:e648:: with SMTP id ep8mr1643673pjb.39.1606537499551;
        Fri, 27 Nov 2020 20:24:59 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:74ec:3128:f635:34a1])
        by smtp.gmail.com with ESMTPSA id b5sm12625076pjg.28.2020.11.27.20.24.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 20:24:59 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/18] python3-setuptools-scm: move from meta-python
Date: Fri, 27 Nov 2020 20:24:21 -0800
Message-Id: <c938a9afdab73063606af6fae312579e9034ed4e.1606536874.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
References: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

The blessed package to manage your versions by scm tags

* Part of the dependency chain for pytest

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../python/python3-setuptools-scm_4.1.2.bb    | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb b/meta/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb
new file mode 100644
index 00000000000..4ebbac6b652
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb
@@ -0,0 +1,21 @@
+SUMMARY = "the blessed package to manage your versions by scm tags"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
+
+SRC_URI[md5sum] = "e6c9fad17c90516d640868eb833d5150"
+SRC_URI[sha256sum] = "a8994582e716ec690f33fec70cca0f85bd23ec974e3f783233e4879090a7faa8"
+
+PYPI_PACKAGE = "setuptools_scm"
+inherit pypi setuptools3
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-debugger \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-py \
+    ${PYTHON_PN}-setuptools \
+"
+RDEPENDS_${PN}_class-native = "\
+    ${PYTHON_PN}-setuptools-native \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.0

