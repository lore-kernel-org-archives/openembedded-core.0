Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.32.1619208245875008566
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 13:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gZNhltB7;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id g16so8896467plq.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 13:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gJnCYKxEztdu37lM3u0YvbCY+oOklFnqfNamFp6ax9M=;
        b=gZNhltB773lAFoQltclI9N9uBhKRvMOY1IJRWKtrvYP39KCeAe4LhFYpeyh1ZW2iZt
         O+t4Y7Vn2QoMnvz/FAeg4fwnkxu1v30jESe0csafzk0Aj0gOYvxV/+KuTQXzT9uJLlzU
         M+pDhyhIPOnImyPEQmk+WLGXh9TCp2nCNBx3NiPYqogdJL2LU4/HbIi5ci125brgSTWX
         QsF8p8hNuuVYEOszvQCPwpuOwcD078Gyu4OhOBRnSyHwnhXfNOHGHimlV76Z1ukYZDz9
         88xpKog13wg2JcHj8G8C+8+4fY4p/Gh3Q+P1wcpZisZ5B+W6VZxxJh5ZXDtfLPVm1Ddo
         9s6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gJnCYKxEztdu37lM3u0YvbCY+oOklFnqfNamFp6ax9M=;
        b=iiN/qukeGxAM8+1ciSwT09g0V0F+ZqD7SIOm2WKmulXO/kOOpkfreU+s4XjtQYW1Sv
         leXr0Nilr+1Q1LYyKAuazB8WHnBZp3wa7co/8qaaUQl6rLXvFiEjHtX4IJNvUfAhd7yL
         U9/+wn0FXzdPoJefPzdmri9QsuYMcaoOIilT88B6W4dRgvd5wHIxNWzgKXIb5Hh8fL+S
         FUnM4nZM2amik3CGsBEn9Jgnk2tUGAXr78lC5hx9kkej6ukL6OtVQ5IJvte9yUnIko2q
         pnxXZtbUUl+eKsQJVunwRjQ616/uLBoJ5R8+mQtlRL99jsR2274arHMzc75JN2cgv9H7
         mjOw==
X-Gm-Message-State: AOAM530OUJACzrHOopyxhrx/F9M187sA7iWckFq0ckLsXjcAO2g58ag0
	Rwi+Z8TEFJFzl1a7wmmxawLCkKq78tv+fg==
X-Google-Smtp-Source: ABdhPJz1puIa6f/mku0UXEMX1vahYNNSqNRpxFc7TGAla2vlLEVSCRWQP0LWoG+JaD+kEeZxe9XlpQ==
X-Received: by 2002:a17:902:f254:b029:eb:6a57:9d11 with SMTP id j20-20020a170902f254b02900eb6a579d11mr5359679plc.81.1619208245122;
        Fri, 23 Apr 2021 13:04:05 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id d132sm5201282pfd.136.2021.04.23.13.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 13:04:04 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH 3/4] python3-pyyaml: Add recipe
Date: Fri, 23 Apr 2021 13:03:59 -0700
Message-Id: <20210423200400.1108673-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423200400.1108673-1-raj.khem@gmail.com>
References: <20210423200400.1108673-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is migrated from meta-python

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/conf/distro/include/maintainers.inc       |  1 +
 .../python/python3-pyyaml_5.4.1.bb             | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyyaml_5.4.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 3ef62e54dd..db13382ce1 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -614,6 +614,7 @@ RECIPE_MAINTAINER_pn-python3-pbr = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
 RECIPE_MAINTAINER_pn-python3-pip = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
 RECIPE_MAINTAINER_pn-python3-pluggy = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-py = "Tim Orling <timothy.t.orling@linux.intel.com>"
+RECIPE_MAINTAINER_pn-python3-pyyaml = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-pycairo = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
 RECIPE_MAINTAINER_pn-python3-pyelftools = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-pygments = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
diff --git a/meta/recipes-devtools/python/python3-pyyaml_5.4.1.bb b/meta/recipes-devtools/python/python3-pyyaml_5.4.1.bb
new file mode 100644
index 0000000000..c3025fdc66
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyyaml_5.4.1.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Python support for YAML"
+DEPENDS += "libyaml ${PYTHON_PN}-cython-native"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6d8242660a8371add5fe547adf083079"
+
+PYPI_PACKAGE = "PyYAML"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "607774cbba28732bfa802b54baa7484215f530991055bb562efbed5b2f20a45e"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-netclient \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.31.1

