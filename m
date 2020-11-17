Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web09.15976.1605653675065694505
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 14:54:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QHDlFFhr;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id t18so11116808plo.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 14:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6ZeK/GVoJ4OmKFH5bB6vBP0my5ffr6QXg0mnHpysZIY=;
        b=QHDlFFhrROX3LWkiuxZ4LzNZDWlLpWLRLXVGPlUaoN3Zvcb6BysOUZEEsqv2GQOd8B
         EDcL8mUXrsKGgCDTAaUd+bTpnCXyTLVwvwtoH8cBu65WQ73zCnnbJmv6lEmuFg6vnwNL
         RGpj+z0YKp+DtL5j8qxup7TF1QS3nFhHcv87H6c+INGuF3Sd2BPLHVyk+fvUH+E7EcGl
         G7Am71yNhLkULqQpp1F1MxkMK10zm8T77h1kgnP6RQFP5hEfhf20tN2I6WjLi6ERHCaM
         pkxl7KVZP4tbO/qrx/H4//7RVx146rtN93Lp2ZvkWWmYaS7vpmDipGtyb3SQXkCuIWXL
         CQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6ZeK/GVoJ4OmKFH5bB6vBP0my5ffr6QXg0mnHpysZIY=;
        b=q/Dv3R6KOR/OqApWsur/XSera35KqpfAynRbtFWlazEQfPI4MYivJei0Kafi+UL2Li
         docGyuiMKiEg/gKDwgx/dmd56Z5zem6r9A9bKbUaKR+hSGv27ytsbP27GBBJ1umCmVay
         yfYL3eenJ6BfF2q7jKpI5Qijw0YSwFu4dGY0pyLWhxGbe7xz+RzkptzGb35GjO6k7e22
         cbzkHryXW5pErRFVAFyew9DeYFDTty36Qo3ovOzITYLZPsyPBPVDXonTO67EikR1q3D3
         2h1st1dEYBE/m2UM3E9n2yvfZUEVrIIVBt+ByZ+KZHR4Amu/Wb+T1KzGvLqs3xJjZWyc
         PgJw==
X-Gm-Message-State: AOAM530+CGpQEA7hOUWYJXHeFqAm4Q2IUiWKcvAm2E3xUXPxEUgPP/Qb
	sGExoUf1sL5BRRLSJfJGTIh4EBqXRC9zEw==
X-Google-Smtp-Source: ABdhPJyqDGN+KSmo4VccKcbJ1qwjNLQlIMDGSk5cmQLaCIkMb50U8TWWYGuzFeAT0EDuSSkH9IZWxw==
X-Received: by 2002:a17:90a:6392:: with SMTP id f18mr1177082pjj.143.1605653674258;
        Tue, 17 Nov 2020 14:54:34 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4611])
        by smtp.gmail.com with ESMTPSA id w127sm22349579pfc.172.2020.11.17.14.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 14:54:33 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/4] python-numpy: Add ptest
Date: Tue, 17 Nov 2020 14:54:28 -0800
Message-Id: <20201117225428.877691-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201117225428.877691-1-raj.khem@gmail.com>
References: <20201117225428.877691-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since 1.15, numpy have replaced nose with pytest testing framework
it additionally needs hypothesis and sortedcontainers modules

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python-numpy/files/run-ptest         | 5 +++++
 meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb | 7 +++++--
 2 files changed, 10 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/python-numpy/files/run-ptest

diff --git a/meta/recipes-devtools/python-numpy/files/run-ptest b/meta/recipes-devtools/python-numpy/files/run-ptest
new file mode 100644
index 0000000000..9a1c72aeb1
--- /dev/null
+++ b/meta/recipes-devtools/python-numpy/files/run-ptest
@@ -0,0 +1,5 @@
+#!/usr/bin/env python3
+
+import numpy
+numpy.test(label='full', verbose=2)
+
diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
index 7ff057b781..08130821c8 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
@@ -8,6 +8,7 @@ SRCNAME = "numpy"
 SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
            file://0001-numpy-core-Define-RISCV-32-support.patch \
+           file://run-ptest \
 "
 SRC_URI[sha256sum] = "fe836a685d6838dbb3f603caef01183ea98e88febf4ce956a2ea484a75378413"  
 
@@ -16,7 +17,7 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
 
 DEPENDS += "python3-cython-native"
 
-inherit setuptools3
+inherit ptest setuptools3
 
 S = "${WORKDIR}/numpy-${PV}"
 
@@ -30,7 +31,6 @@ RDEPENDS_${PN} = "${PYTHON_PN}-unittest \
                   ${PYTHON_PN}-pprint \
                   ${PYTHON_PN}-pickle \
                   ${PYTHON_PN}-shell \
-                  ${PYTHON_PN}-nose \
                   ${PYTHON_PN}-doctest \
                   ${PYTHON_PN}-datetime \
                   ${PYTHON_PN}-distutils \
@@ -39,6 +39,9 @@ RDEPENDS_${PN} = "${PYTHON_PN}-unittest \
                   ${PYTHON_PN}-netclient \
                   ${PYTHON_PN}-numbers \
                   ${PYTHON_PN}-pydoc \
+                  ${PYTHON_PN}-pytest \
+                  ${PYTHON_PN}-hypothesis \
+                  ${PYTHON_PN}-sortedcontainers \
                   ${PYTHON_PN}-pkgutil \
                   ${PYTHON_PN}-email \
                   ${PYTHON_PN}-compression \
-- 
2.29.2

