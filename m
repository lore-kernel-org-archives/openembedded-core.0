Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web12.36671.1606592391822586102
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Nov 2020 11:39:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tNGCMdsO;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id t3so6999609pgi.11
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2020 11:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=T6wR3+KBlpthc8Qzbnbidp5k4h/cqeKRRhvpDC3qKz8=;
        b=tNGCMdsO9NcRqUGdwvz4ZKjvCD1/3VXcu0p1ojiwlVaMUWwlNoi18UEZOqPrSXPpwz
         D4j6v30n5TKT52nMHXHwcp07xflkhHY+JmVrXmFjSZWY0ieNLB5Yc59DYemf5HVRGPAd
         mDK/vGBi24VZf1aunWGQRt/zbKxA6FJGg/bDuEGA6eLgUGosQoUEeSYjhsL9bfF7xyCu
         9SvYXcdjgz238opdtWKuq+SdzXT2J39cWkwgcGoC5F6HFin3yF5jpDnzhIKQjsVqRvrP
         CTIxjhOYkVWx/3hfqOmAWyBYVGJz5idNKPdBZSJNCyrGYXT4aNa+CUKmpnwQ6NNJE4sy
         VD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T6wR3+KBlpthc8Qzbnbidp5k4h/cqeKRRhvpDC3qKz8=;
        b=dmLJFHsmFmUq6Gry43qcAiJhEFILhgabxbHrp4Cn3rvYEebBOrSxPpOdM5iNpvUTN+
         LqX/B6z68WwKosMus5F/lHHF93exJHjPiWked41lM4vrvRdRl0/10Qd9XdNoqlIqLGvY
         xW4bwrzVIFGeTWO13ACGRHvo94sE0/r2nHpuJvUyXl8nhqDL4t+/0OaoW3kAsaNC1lHL
         uD5pzYhzINp61WJnAWSk26XkHD6G8p4yQlvPSO128/ofeUDcVKhAaZeYkg/NADfkBUPK
         rHrsQTWops1lDNHcKn6wP+JirbQ6vZYlm7fl3MNlQVClM/yo3RVr9tCkSVCvKLVdfWGN
         kCWw==
X-Gm-Message-State: AOAM532nm0OSXUmaNNEAj6CvBBHLSlQWV/n2h66p/9edGm7bmfUh7TJJ
	oM3LIV96NG2dSpiohozMUDpyNpOOGJqT9g==
X-Google-Smtp-Source: ABdhPJzPT6+A9QuH08L9WTfDaMl0zj/fKWeaPBz72gZ6uy81gtTDhcxekQtP8xsQl+eg4AHG78ejMA==
X-Received: by 2002:a17:90a:fe88:: with SMTP id co8mr17110044pjb.76.1606592391051;
        Sat, 28 Nov 2020 11:39:51 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:58b6:35be:25dc:8a78])
        by smtp.gmail.com with ESMTPSA id z29sm2629795pgk.88.2020.11.28.11.39.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 11:39:50 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] python3-hypothesis: move from meta-python
Date: Sat, 28 Nov 2020 11:39:34 -0800
Message-Id: <5aa1850cbc714258bd5e74cfdc2a7a4f94d58451.1606584666.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1606584666.git.timothy.t.orling@linux.intel.com>
References: <cover.1606584666.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

A library for property-based testing

* Part of the dependency chain for python3-numpy ptest

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../python/python3-hypothesis_5.41.3.bb            | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-hypothesis_5.41.3.bb

diff --git a/meta/recipes-devtools/python/python3-hypothesis_5.41.3.bb b/meta/recipes-devtools/python/python3-hypothesis_5.41.3.bb
new file mode 100644
index 00000000000..b7bf15c31ed
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-hypothesis_5.41.3.bb
@@ -0,0 +1,14 @@
+SUMMARY = "A library for property-based testing"
+HOMEPAGE = "https://github.com/HypothesisWorks/hypothesis/tree/master/hypothesis-python"
+LICENSE = "MPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4ee62c16ebd0f4f99d906f36b7de8c3c"
+
+PYPI_PACKAGE = "hypothesis"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "6a3471ff74864ab04a0650c75500ef15f2f4a901d49ccbb7cbec668365736688"
+
+RDEPENDS_${PN} += "python3-core"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.0

