Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web09.29015.1606537496269212134
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2020 20:24:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=srcbpvvY;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id b63so6131968pfg.12
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2020 20:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=XS8cQm+Kjm5vMbPbnwJhvUUbZjPr6R/TfYSObqyGnFM=;
        b=srcbpvvYQTXWPYq66kCjbOpG2bGMHd60ESfiS79aLP6yE2YxFFudKWs8uNlFAsi+Eb
         C5Ds9Q28Wtw3/Hpc0RCjOLoricW3KV+PUTp67XbB66kSa/maiimcDc7e+yOR0n2r845u
         TrhQP1EI1KPcdIM66RfAkDvn207seWQ5A7dSEneFjzLThMcrO8edG2PeKR40iE/zG+QX
         CDqLvUVPrBkNydUETT3VyUKG981MOh4y9MHgBwXqDCZtZDvXkY3XgbVQj6SDQ926+sgQ
         KT471/33fKWBcWUBzWHauLUuO49iMiNV/2GtWGqG3bueh34ZqmykC4xNzJvkP529hOtC
         bYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XS8cQm+Kjm5vMbPbnwJhvUUbZjPr6R/TfYSObqyGnFM=;
        b=bV8ZGiOZN4rwwvp4p00VQnQMdLmcuGk0CZN0ct2ckLiBCDFrk+TgRoVAdHK6Z3p2VI
         lpApdBY8feD02w/qW5csbPNH8Vxt7OuaqQTb4AHFtDUifvqDdRQQyLgo1+168YX01uFP
         JNvSFs3dNntrWi5MJp3spjG3g3SFnxuWjNKgRzCmR94WV5swY79Cc7+mFgm7ZFB+rB/0
         ld2Ylgx32fLBg8an/O4iZ36PQV2MWh7jLvsGharFHcxb4UjY/6jdm3NvOa6yJMf5X/Jw
         YCspsddu83lYKr6KEhY4yLZqUUjxAg4to99IbZ+9dKTqd8xyxLqhvWEfPK67xY/NpgWc
         RhJA==
X-Gm-Message-State: AOAM533wb2+Swu9tUjwiAkWTpdNabkT+r9SPNaJKz+9kenrNP+b3HrmC
	v35YZMpMrBvlR8XWnuRoXY9LeTg9ed568A==
X-Google-Smtp-Source: ABdhPJzHFRA+FV/nl/7IvSLjj1MmDfROYFu9UbY36RggK2A7xcoWRT119XP+gybT1Mk2iKDz6Ma9Vw==
X-Received: by 2002:a17:90a:af83:: with SMTP id w3mr14295228pjq.173.1606537495611;
        Fri, 27 Nov 2020 20:24:55 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:74ec:3128:f635:34a1])
        by smtp.gmail.com with ESMTPSA id b5sm12625076pjg.28.2020.11.27.20.24.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 20:24:55 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/18] python3-toml: move from meta-python
Date: Fri, 27 Nov 2020 20:24:19 -0800
Message-Id: <9602d7c191ff5a7cff555bf1a2debd93ae8e27e0.1606536874.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
References: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

Python Library for Tom's Obvious, Minimimal Language

* Part of the dependency chain for pytest

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../python/python3-toml_0.10.2.bb                 | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-toml_0.10.2.bb

diff --git a/meta/recipes-devtools/python/python3-toml_0.10.2.bb b/meta/recipes-devtools/python/python3-toml_0.10.2.bb
new file mode 100644
index 00000000000..b46eba6fd13
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-toml_0.10.2.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Python Library for Tom's Obvious, Minimal Language"
+HOMEPAGE = "https://github.com/uiri/toml"
+LICENSE = "MIT"
+SECTION = "devel/python"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=16c77b2b1050d2f03cb9c2ed0edaf4f0"
+
+SRC_URI[sha256sum] = "b3bda1d108d5dd99f4a20d24d9c348e91c4db7ab1b749200bded2f839ccbe68f"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-misc \
+"
-- 
2.25.0

