Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web08.28888.1606537501953996205
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2020 20:25:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cLqq3WcN;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id s63so5770577pgc.8
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2020 20:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=M7S8vSDdlcb4fMGJO5sOdAi9hY2gLNDUzpUAb51vkew=;
        b=cLqq3WcNV4fiP5G99ts1+qtgW2xbgi3sYgdNYckRfBUQigEdRuqcEqljCpVeKgjKef
         JhAlyIXbE9l5upKi9V64SdAgjEIU2FaVraKwor8sYDLcFiRs238pb3uufbSmBbBbwR3S
         tm2eU/ZggpOfcLiQXxNkh8qFqP5nMTXpTsr2xeD13ea64AHkpAXQdEU+HkKRNFzA+5gv
         QtX7mnu4IInL9Eij8nmSS5kW+z41HQ9yQQe19h9tuLi+3G+kWS/1X7c11SQABwLqjxHf
         czADCQ1350CQMtbanAY/VRVWE+5XQ79eE0EfMw9XYUIF/6sXYxrusfzX5uWK6IystGBi
         ydxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M7S8vSDdlcb4fMGJO5sOdAi9hY2gLNDUzpUAb51vkew=;
        b=GqqFzJS59KtShavKpvovZdd3wQbDinw5pphEaCBV8N4/+i+/BiBSUIr5MbJq8UN8wC
         HtL5wOXwJ2vaRj3SVQo/5MrqNDATVC7cy5ni2PrZoOlaMEEsyYBZM06JgoBUkOnsRWGM
         dhQql8+BPgYoTGd0RnlMFTz5iKk8cx+JtevQRYzAXTUDJu0+SelXnemvsN8f39vztZYZ
         5y8rdir5WNeTWzPRKuXe9+K3Vfui+MC+QmL5LEj+8qacKhGsvH84yX240m+Mf69GxgUY
         mA+wQCagzaMf48phWwwz7hy78x/JyNihohlpyMT/jRSYWo5XlS/f0nWcrSIk5Jbhdf3m
         uJ6w==
X-Gm-Message-State: AOAM531tGOgLTI0VLUpaez7pl5b7wxaBky3xhdt4XX8oE1rOR/D25+mb
	MfKy3gkHBR06XH1EZOYSHHDZgKCRBF7VsQ==
X-Google-Smtp-Source: ABdhPJyfXJIL7ibFRnyOJ2oD4DZsfykizgOqzI2tX/2iVy2ATjWfZ1e5QS3LePzm96bSPlKOCscunw==
X-Received: by 2002:a63:ea54:: with SMTP id l20mr9126599pgk.237.1606537501321;
        Fri, 27 Nov 2020 20:25:01 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:74ec:3128:f635:34a1])
        by smtp.gmail.com with ESMTPSA id b5sm12625076pjg.28.2020.11.27.20.25.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 20:25:00 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/18] python3-packaging: move from meta-python
Date: Fri, 27 Nov 2020 20:24:22 -0800
Message-Id: <85af2283fe950bf51f35291772bed5df96dda6f0.1606536874.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
References: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

Core utilities for Python packages

* Part of the dependency chain for pytest

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../python/python3-packaging_20.4.bb               | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-packaging_20.4.bb

diff --git a/meta/recipes-devtools/python/python3-packaging_20.4.bb b/meta/recipes-devtools/python/python3-packaging_20.4.bb
new file mode 100644
index 00000000000..c75707e69c7
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-packaging_20.4.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Core utilities for Python packages"
+HOMEPAGE = "https://github.com/pypa/packaging"
+LICENSE = "Apache-2.0 & BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
+
+SRC_URI[md5sum] = "3208229da731c5d8e29d4d8941e75005"
+SRC_URI[sha256sum] = "4357f74f47b9c12db93624a82154e9b120fa8293699949152b22065d556079f8"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native"
+
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+RDEPENDS_${PN} += "${PYTHON_PN}-six ${PYTHON_PN}-pyparsing"
-- 
2.25.0

