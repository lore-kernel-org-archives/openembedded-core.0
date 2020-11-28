Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web11.28871.1606537498322457841
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2020 20:24:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Nf/9InDh;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id w6so6175187pfu.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2020 20:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mKYDZw5c1Cvh7mD1uCvTgO8EQj7eU2dHXj7d/hbcsXg=;
        b=Nf/9InDhF/EdxO8KLt5m6Fm0PvkJIUyWedDb4pHcYD7Fu1ptW+RM2UTn8jCSc9ZmfX
         mjIUA79mx78K9lkfAoF3/0XlJKLurNVAmbiN/Loas6MBIGsO1xXmvlbWQKMSoQY7mlm6
         MJbyX+VFKo/LbO99/wVK+A9JuZxFf+gcIK9H2np89Nc0iD1vtKyP1BQcnbH5Biqp5a6+
         u2XXasx8tVOD1jl6P0kwYqgUtFQWokW/v8kwgzuBnqTkfYsevgfumcWD2k3emG32wAmp
         jR68S3vGPUmF+b6qREMyR/wqgsvUTij7L3MOqNQ5eQBHwuLswGyixMcSKTS+3QzC1sgU
         33Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mKYDZw5c1Cvh7mD1uCvTgO8EQj7eU2dHXj7d/hbcsXg=;
        b=PFrkOJAqWCC1rEaMukiiONnSczgrvzh7+1np2c5Gu9W8ZPYYTvQnWlIDokNvuGyvff
         BUt59O7JjcvliyKAu4jIRR/WGmCL9CvWigbY8Z7jgk0jTrUwNaFZvgKAuIERatwoSYPC
         JFeMRH8w+vN4oLrg/hOzaAEqU3UMsaa1Tas5glZ04E+M/W5TQsZ9WnC99RM21OpvXH6z
         5Fu82Nz6E/BAeoA03oxYglasgdO5hI3N433F595fMiimWHJbQ7rOjcEBFJFX1uRPD4YS
         JOE6YFMil8BYdwr+iUvqT4Lzph3A5CFNutVTeQR4b/6AMbxDomM+HbHxab8PIf63PI8W
         V72g==
X-Gm-Message-State: AOAM531EpPpV1PNtAJSCdikQXFR516Hq563vAgBdzKRqV8V8HcNdhdEu
	Yg7guO4XVy9z/kcWEKBUKlfC6FxY54qKkw==
X-Google-Smtp-Source: ABdhPJwdPIHw96+E1LdRizB6s14D7Da2Dz2RL3Mpv1axhxY8WCfQYHIB5tVICx/GvRZfd1xEuTjqBw==
X-Received: by 2002:a17:90a:4593:: with SMTP id v19mr13922580pjg.217.1606537497739;
        Fri, 27 Nov 2020 20:24:57 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:74ec:3128:f635:34a1])
        by smtp.gmail.com with ESMTPSA id b5sm12625076pjg.28.2020.11.27.20.24.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 20:24:57 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/18] python3-py: move from meta-python
Date: Fri, 27 Nov 2020 20:24:20 -0800
Message-Id: <57530cd4d780134ec467671ab6355d20c54d520e.1606536874.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
References: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

Library with cross-pythonpath, ini-parsing, io, code, log facilities

* Part of the dependency chain for pytest

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-devtools/python/python3-py_1.9.0.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-py_1.9.0.bb

diff --git a/meta/recipes-devtools/python/python3-py_1.9.0.bb b/meta/recipes-devtools/python/python3-py_1.9.0.bb
new file mode 100644
index 00000000000..794ec2a87e5
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-py_1.9.0.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Library with cross-python path, ini-parsing, io, code, log facilities"
+HOMEPAGE = "http://py.readthedocs.io/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
+
+SRC_URI[md5sum] = "b80db4e61eef724f49feb4d20b649e62"
+SRC_URI[sha256sum] = "9ca6883ce56b4e8da7e79ac18787889fa5206c79dcc67fb065376cd2fe03f342"
+
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS_${PN} += "${PYTHON_PN}-netclient"
-- 
2.25.0

