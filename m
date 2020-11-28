Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web10.28761.1606537516232537210
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2020 20:25:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QqMOGP+A;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id t8so6147442pfg.8
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2020 20:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mGri0iMxxzaxJqixJrlYtErFHT2O8xLNHnh6DN33Rpo=;
        b=QqMOGP+AuaLqGPoZ7SJRmk8zotwl+b8zO7+XiR2Y3FQlJCCMZzL61LC/R8Bo8E7iRu
         rCE6/mmW+zpyI55nUiodMDaFgD9EM0mOX0Cb6LCyrQwIladNn2qLoj7NcL4oofOz0A3v
         kd7iSYTH+ZiwFAHK5d6s5sFaIPphx46PRr1P2bzqwfug3UmbPqupWIv01BqjTLz8f4+Y
         KsIxBnpVy2LKkcLaYoZ+8/eBvLODdGV+ZjeCSvXGrq87ETw0yyWA8OKLMzBX3IPDhW5z
         Sj3TMvdwVpGYEQrU2euS0mE2mSTU1RcAv+jhI9oAO+TXBVfDvld7vcgeFOZq2flbIOxp
         Q3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mGri0iMxxzaxJqixJrlYtErFHT2O8xLNHnh6DN33Rpo=;
        b=PWIkph2ozPylJc0aCE7UFQcuSt4o+vp33QcZRamkS7xRxbnEQc87CLEJaASKkV8dUm
         WkyUtLlsJn/dMU6CzZNkhqI3TuRDqgpcGG8f/qepLYPkF8Pi/88srSsgWo+iM94ketaT
         TlzcM0GET9JLnU+KW0mwGowtaGATmP8QyPxb/QG2/SqET3B6JZ3Jkaz/LnxsZ8p0kmsj
         QGvOpsAR9frVbVVYF1gHG6I55WTdAKE9Dj+fBFrJVxwpbcwjcjgtouRjkVbR3pdkPhgb
         4SgB+CKgvS8v9lnMnfBtAlfQeUPZ7cjt379dOvwTOA3vZNAQLactFQSksiWAOHb5l6HF
         nu8Q==
X-Gm-Message-State: AOAM530W/chLjpzsAzofHum9V/hRoljKWELZMw0pKM1WzoqXXUut7Nwm
	0etdyt7RbjnspNVf7b9IcWrIcbVIS83Ing==
X-Google-Smtp-Source: ABdhPJyRieVqOsM6PyP+6E+ISJqDpstvyyyRe9ZrgxoFKxQXAUbTm8WRL+ualIyrcY0KK2E43XG3Sg==
X-Received: by 2002:a63:cd0f:: with SMTP id i15mr9296183pgg.46.1606537515640;
        Fri, 27 Nov 2020 20:25:15 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:74ec:3128:f635:34a1])
        by smtp.gmail.com with ESMTPSA id b5sm12625076pjg.28.2020.11.27.20.25.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 20:25:15 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 17/18] python3-importlib-metadata: upgrade 2.0.0 to 3.1.0
Date: Fri, 27 Nov 2020 20:24:30 -0800
Message-Id: <87d8b0ef8acfbf953176808063a2a3dbdb55255a.1606536874.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
References: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

Upstream release notes:
"
v3.1.0

  Merge with 2.1.0.

v2.1.0

  #253: When querying for package metadata, the lookup now honors
  package normalization rules.

v3.0.0

  Require Python 3.6 or later.
"

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 ...etadata_2.0.0.bb => python3-importlib-metadata_3.1.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_2.0.0.bb => python3-importlib-metadata_3.1.0.bb} (64%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_2.0.0.bb b/meta/recipes-devtools/python/python3-importlib-metadata_3.1.0.bb
similarity index 64%
rename from meta/recipes-devtools/python/python3-importlib-metadata_2.0.0.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_3.1.0.bb
index 325a41c22e1..d89621bedd6 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_3.1.0.bb
@@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e88ae122f3925d8bde8319060f2ddb8e"
 
 inherit pypi setuptools3
 
-SRC_URI = "https://files.pythonhosted.org/packages/56/1f/74c3e29389d34feea2d62ba3de1169efea2566eb22e9546d379756860525/importlib_metadata-2.0.0.tar.gz"
+SRC_URI = "https://files.pythonhosted.org/packages/7d/d4/dbc58eed92be61bae65a7d80a7604d35bf6ded3e3c53c14f2d45b4a28831/importlib_metadata-3.1.0.tar.gz"
+SRC_URI[sha256sum] = "d9b8a46a0885337627a6430db287176970fff18ad421becec1d64cfc763c2099"
+
 S = "${WORKDIR}/importlib_metadata-${PV}"
-SRC_URI[md5sum] = "3dd91821c930a3c3633e99a7025aa9c2"
-SRC_URI[sha256sum] = "77a540690e24b0305878c37ffd421785a6f7e53c8b5720d211b211de8d0e95da"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 RDEPENDS_${PN} += "${PYTHON_PN}-zipp ${PYTHON_PN}-pathlib2"
-- 
2.25.0

