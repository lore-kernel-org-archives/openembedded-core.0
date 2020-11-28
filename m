Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web08.28887.1606537494099617713
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2020 20:24:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OQTeTfNj;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id q10so6178616pfn.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2020 20:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=s/JJTrx8n1vwwz7Pr8iSMrJG2pPU/xR6Gdp3CfnUQHQ=;
        b=OQTeTfNjr5NOqh/0drNATS/7E42IIJIAloMNEJY1z1Pi1A/zhY+7kVkx6/9TvlsY61
         pgq+UQ6Q2QR5uIDBbMUEAOecJNuArKSMBqYTa3iBc9ENFKS+2P2u4mWtu5DWCHRq29Pq
         qzIwcDcDYv2pLPK3Z+uU1PwbfV0UB/EDDDSKSK3I7d7HBuQK3o2xgh9Lx0Q3TFEgEEI8
         SaR/W1YKfg9VVbfSSsXI8l4XnxAOmERSQguU5oPeDBeJD792JXxxBcwfevPrFpZo0Ft1
         ABVAgq/8TQ+QicKGGRP3oFVysUGNCLob0qrYciLSSCjGuzQ3IMhw/Z7KcnUa6nhWkEbS
         ecrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s/JJTrx8n1vwwz7Pr8iSMrJG2pPU/xR6Gdp3CfnUQHQ=;
        b=nKOABectQo2XJoqeH2ZBNNB95W7w38DLL4zFqUY+XyYShu3gPSsokoHAu14477f/BH
         tL8OJx7Va3jzOCrDwR3nPj+lST8rlucwc47L5MMry2GlEH9OjevlihvRgB25xOIiOxpJ
         FxNKiJsSrAhyReAJGg9enRklQenz7Rbho+mmzzmw8+4Qlb5oy4b2P3DJ4bXuH4wSz9Ti
         cMrLOcYrcu4RKg7OkuiS5vQwWxVZFyC6oWnBWTTovpVxXPWZmKTVNXRd/DM663SOGWbv
         8rYcGeHcbVgo5aqTulvVTP0DyKcQhkro0RmVVDofcjO951RBJThFjZKDVMLdlmO/DYHF
         roAQ==
X-Gm-Message-State: AOAM5303tpdfvOHRoJg7Mk5MIiUkmbCJ/mIV/g3pOaXs79SRP4gkCxUj
	WJuL4Wl+pBgaP8JAG/ZfMREpCDL/1AkKQA==
X-Google-Smtp-Source: ABdhPJwXZGwsRWzY8f+wGrTEtAwUumGIa95fuK2A0xDNSKcgLZOWMgbDBtTGmpXZ5meSpZ+5bSAsKg==
X-Received: by 2002:a17:90a:b114:: with SMTP id z20mr13869855pjq.14.1606537493506;
        Fri, 27 Nov 2020 20:24:53 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:74ec:3128:f635:34a1])
        by smtp.gmail.com with ESMTPSA id b5sm12625076pjg.28.2020.11.27.20.24.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 20:24:53 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/18] python3-pathlib2: move from meta-python
Date: Fri, 27 Nov 2020 20:24:18 -0800
Message-Id: <919562bd4a5d7ac1161ffce1b20c22f3010c052a.1606536874.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
References: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

Object-oriented filesystem paths

* Part of the dependency chain for pytest

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../python/python3-pathlib2_2.3.5.bb                | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb

diff --git a/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb b/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb
new file mode 100644
index 00000000000..a022701ad0f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Object-oriented filesystem paths"
+HOMEPAGE = "https://github.com/mcmtroffaes/pathlib2"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=042856c23a3e903b33bf361ea1cbe29a"
+
+SRC_URI[md5sum] = "f2bd0a363eb0f8fa0556f35c1d9e66fb"
+SRC_URI[sha256sum] = "6cd9a47b597b37cc57de1c05e56fb1a1c9cc9fab04fe78c29acd090418529868"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "${PYTHON_PN}-six ${PYTHON_PN}-ctypes"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.0

