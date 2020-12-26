Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.19467.1608974881929164837
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:28:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OKIK2gGr;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id cw27so5573557edb.5
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=av9z9ymbJWhLMSjIWJOITqu+Moh4XhwGstW4uia5w54=;
        b=OKIK2gGr+JcAiRAnoJKCc1mDozVoc+VFckn/WO9BMqKs3s7QqD6Ju4Fwk8s9+fVmd4
         wGmu3vlyOeyU5A8dZKsvTxReEVHRjdj+a6O8Ul1ySuZAd2HTEQs9xGoJb5OXvuLTCzCo
         niq96/8UioSLkolQBiJROk07wJnquEi48cLhyeLf/4QxBghDdP2bUuVT9oeCv32pGA8Y
         20iM9MNP+X4hU6/Z0VmjG2O9itUzAUXZqxsRRzNLiUm4r31Fd1xzeEMDDJfKj+gZmoGH
         JS+JVbwe7TvSGU9NoKEk1/cwdZcDGA88u95H8HNtu8zhiN8ypT4YW3812h1tQKYh2ySe
         LOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=av9z9ymbJWhLMSjIWJOITqu+Moh4XhwGstW4uia5w54=;
        b=gAOw+j2DmOZRme7gE3PAVKl7j7iZJ3EvsCrEVMLCFZtSJMi7KoMtPTUTvKQlwnvJft
         Gt09VCpEMMSzx8/N/hbhEZzflHd9+sZQHWRVOeLkpEs/pvxPLu+C+b4Ol3lS8C+nSbiv
         pfo9eMX7ZsYnxptgPdF0vYCCrVq+pjiWcpgaOZVCBGP1GTygqVUHYhIq8ZrBsPKQ0PgM
         +3OQ2vYiy/TWbjyZqwouuAzpsLLPiL7IXGCRbvmfGUeOkwfwi6C+bUVk6CstX1jz1bML
         a0D/oNOEjngoW8PR/7g2OQecU8Os8ijc/sKsqGCT/smMZ9rrKvknajj6YUrj/ECrzaMH
         vXiA==
X-Gm-Message-State: AOAM530/OPYxFu58uccIowiZxw6Zpg3rgJk/e7QfmkndwpbifIx2JuTP
	/hq+VMnk7/LBWsciwPB6fZOPUdzyHiU=
X-Google-Smtp-Source: ABdhPJx0x44OE7MdNKep0WhaiHosw2+CmGAtnqgISnptc/Rky7+Zk5Sb7D0+vBr5bzCfG1obuBU7OA==
X-Received: by 2002:a05:6402:312c:: with SMTP id dd12mr35363640edb.327.1608974880571;
        Sat, 26 Dec 2020 01:28:00 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:28:00 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 23/48] python3-py: upgrade 1.9.0 -> 1.10.0
Date: Sat, 26 Dec 2020 10:27:07 +0100
Message-Id: <20201226092732.52323-23-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../python/{python3-py_1.9.0.bb => python3-py_1.10.0.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-py_1.9.0.bb => python3-py_1.10.0.bb} (72%)

diff --git a/meta/recipes-devtools/python/python3-py_1.9.0.bb b/meta/recipes-devtools/python/python3-py_1.10.0.bb
similarity index 72%
rename from meta/recipes-devtools/python/python3-py_1.9.0.bb
rename to meta/recipes-devtools/python/python3-py_1.10.0.bb
index 794ec2a87e..4e16ad1743 100644
--- a/meta/recipes-devtools/python/python3-py_1.9.0.bb
+++ b/meta/recipes-devtools/python/python3-py_1.10.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "http://py.readthedocs.io/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
 
-SRC_URI[md5sum] = "b80db4e61eef724f49feb4d20b649e62"
-SRC_URI[sha256sum] = "9ca6883ce56b4e8da7e79ac18787889fa5206c79dcc67fb065376cd2fe03f342"
+SRC_URI[sha256sum] = "21b81bda15b66ef5e1a777a21c4dcd9c20ad3efd0b3f817e7a809035269e1bd3"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-- 
2.29.2

