Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.348.1587835717198155602
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 10:28:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E5OeLa2Z;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id d15so13797189wrx.3
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2020 10:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W5MBmz5qzlfur7AJkpt2XT/IdMc3vB1ikPJFz612Mgc=;
        b=E5OeLa2ZabyPsGAF+0Qd7OSCiADyDymGPPaX0JUDx8LVRgedPT9oXoxOVY8lJH90T2
         4Qe5uEubG+v5RP4H07vHV5nY1Z8Rh1wmBCNi5TheikgMPyDpqi49gZtQbsRjJtemNCdI
         2Wep+J1gB2wRBA+fXb9OLgtjZ9buGjDi5FPNRBSh/AW9A9br1PmiYHfuUynr+f0syzay
         s9viceDYRA17pvaUrYNDN2+WfrlW7Mo7A4QQPR4C5ZDjy+3P2ByS8uukdCLQVqPiGVkR
         z4bUD8508jkZNGoOdAvdNR7SjFZh9epeVZXLL59J5eZh9s7RU0UY5NnQ7zPa/8Qiaqsb
         SvGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W5MBmz5qzlfur7AJkpt2XT/IdMc3vB1ikPJFz612Mgc=;
        b=qXMFAwSJ5mdYG6SJn3OwhIm0za53szBL9/TVT2u3sZsawUp7bXATvD37Tb4vrOAeLM
         vIR+Lhy7qpHkgChwpEqMoUutTRpv+j9fAnfNqgIyIvRs8J1ZNYHzxgaVu3pRVSOfdLmW
         50z3aJgolq9gf+T+sOaVmyroiLMECiJ9Yn3rMK43cI90zM1IMjw+i7A58xl8E2H50HjR
         lT9hUBYHKJZI0t+BGN2EzFD3zQi962Pk4BCCTfh0V6mka/pppiAfd41ZY1hF1oHKiWh7
         ShJdP21Emz5jXfNYVCEnfr22ISq2S/JGSzIKFyVvgWzLh+i5O9v6JbSY8/IQ8NAw2C1h
         qswg==
X-Gm-Message-State: AGi0PubzKSls/ee/rf04BCtIzUounlkUjQG7zFW+H3ptyJ9aGkKX3QuO
	kA3luSXVkyaNNCGaPU5ST2RIkGsU
X-Google-Smtp-Source: APiQypLWrDzpNqspnM70w/agcGHk4RJiMjGZnPFaF3ZDZa+PrdBQg1QxDwdF15/qHtnhexM3dAmcbg==
X-Received: by 2002:adf:fa03:: with SMTP id m3mr18013254wrr.68.1587835715570;
        Sat, 25 Apr 2020 10:28:35 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id g25sm7751253wmh.24.2020.04.25.10.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 10:28:35 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 10/15] python3-pyparsing: add from meta-oe
Date: Sat, 25 Apr 2020 19:28:09 +0200
Message-Id: <20200425172814.27370-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200425172814.27370-1-alex.kanavin@gmail.com>
References: <20200425172814.27370-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is needed for python3-cython, which is needed by new python3-numpy.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../python/python-pyparsing.inc               | 22 +++++++++++++++++++
 .../python/python3-pyparsing_2.4.6.bb         |  2 ++
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-pyparsing.inc
 create mode 100644 meta/recipes-devtools/python/python3-pyparsing_2.4.6.bb

diff --git a/meta/recipes-devtools/python/python-pyparsing.inc b/meta/recipes-devtools/python/python-pyparsing.inc
new file mode 100644
index 0000000000..a768c97fce
--- /dev/null
+++ b/meta/recipes-devtools/python/python-pyparsing.inc
@@ -0,0 +1,22 @@
+SUMMARY = "Python parsing module"
+HOMEPAGE = "http://pyparsing.wikispaces.com/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1"
+
+SRC_URI[md5sum] = "29733ea8cbee0291aad121c69c6e51a1"
+SRC_URI[sha256sum] = "4c830582a84fb022400b85429791bc551f1f4871c33f23e44f353119e92f969f"
+UPSTREAM_CHECK_REGEX = "pyparsing-(?P<pver>.*)\.tar"
+
+inherit pypi
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-debugger \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-pprint \
+    ${PYTHON_PN}-stringold \
+    ${PYTHON_PN}-threading \
+"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-pyparsing_2.4.6.bb b/meta/recipes-devtools/python/python3-pyparsing_2.4.6.bb
new file mode 100644
index 0000000000..0805fee3e2
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyparsing_2.4.6.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-pyparsing.inc
-- 
2.26.1

