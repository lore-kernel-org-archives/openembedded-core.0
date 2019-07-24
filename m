Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 08DEE7EDF5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 20:20:49 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id v85so32805184lfa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 13:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=imtuFxU1lcsgWLR/rs3tIlAkkAWjBlS6W3/JCXxrKJM=;
	b=HwmxE+rspKCeV5r36pCvUFk9AqgJuffl9mx4d4mcv9lrD8QWpiOnSJP4Z4prliE1ki
	HKNxVFjm1yayUeKtplTTnSRMgZ4dSafAmesp4Gmc8w35q2bQn4Skrt1DtMG35FRs7XdD
	NveCgezfZYyxeHlw0FMrafThHJolbJDZRnABNiFNbJQC52PoC4He/zWV+yaXGaTjsbYn
	uNbwRVBMMNO2nuTbfiK8LR3Vr+z9LOUdCo95fQKYA+fduTKiaBM3FkdcYCE8qyD+xQrm
	a3tsywf0rBGG6JX4s4/fdeIv5Wz2BGF1+yMdY8olbZGSR4POqjrrahpFujFrs/8uvW70
	WFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=imtuFxU1lcsgWLR/rs3tIlAkkAWjBlS6W3/JCXxrKJM=;
	b=ETdi/LFe9wxG0WjJ3Ih9iksD4XHlzlTQmA+HwHuP0RGbKwecxL4xUCr+IrWB3z2FHX
	enCcTQYqcQsnGPMMYhto0BufYV7Vz/dvRJfuY4YVa5WQIdLt4c245aZxF0ZjaDB1zMgd
	laB5Nu4iPkLdj7Vs7C5w9V6GYxSVMSGrC9jp6ZfgV50cUH9c0OKMdz2+Y6lQ77IsJd9h
	uJF3GwqNSVf1n/ouOLgHv4kr+yqRsDzMOYEVGpQpVgblMnLFr8RtbeCLUbzOKTcSl65y
	YKSarWkKISpViTm+At45m24P+cFLq34lh9SCRdbnGcdyI3c5AOtqxLgef35dvZA0bBjV
	F0Tg==
X-Gm-Message-State: APjAAAW9Vjt68WiaVgKXTze/7u7HBWukPWD/yvGmkBZ9SlFFIq0NO3lp
	kaxKiHpPq+xHt+M+lYlQu2TOknJK
X-Google-Smtp-Source: APXvYqxJajU64GLViS5RBYbzAcNbXO0xFkYZni9iCNF7HioR/owvG7QwF4kXeWmmRVMCKNegflVSlw==
X-Received: by 2002:a19:a87:: with SMTP id 129mr37770928lfk.98.1563999649269; 
	Wed, 24 Jul 2019 13:20:49 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	a13sm7207346lfi.57.2019.07.24.13.20.47
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 24 Jul 2019 13:20:48 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2019 22:19:31 +0200
Message-Id: <20190724201931.25486-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2] python3-git: update to 2.1.12
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Jul 2019 20:20:50 -0000

Got rid of python-git since there is no python2 version of the package.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-devtools/python/python3-git_2.1.11.bb       | 2 --
 .../python/{python-git.inc => python3-git_2.1.12.bb}     | 9 +++++----
 2 files changed, 5 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-git_2.1.11.bb
 rename meta/recipes-devtools/python/{python-git.inc => python3-git_2.1.12.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-git_2.1.11.bb b/meta/recipes-devtools/python/python3-git_2.1.11.bb
deleted file mode 100644
index ac320fa56b..0000000000
--- a/meta/recipes-devtools/python/python3-git_2.1.11.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-git.inc
-inherit setuptools3
diff --git a/meta/recipes-devtools/python/python-git.inc b/meta/recipes-devtools/python/python3-git_2.1.12.bb
similarity index 83%
rename from meta/recipes-devtools/python/python-git.inc
rename to meta/recipes-devtools/python/python3-git_2.1.12.bb
index f973e9f42c..380371f783 100644
--- a/meta/recipes-devtools/python/python-git.inc
+++ b/meta/recipes-devtools/python/python3-git_2.1.12.bb
@@ -10,12 +10,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8b8d26c37c1d5a04f9b0186edbebc183"
 
 PYPI_PACKAGE = "GitPython"
 
-inherit pypi
+inherit pypi setuptools3
 
-SRC_URI[md5sum] = "cee43a39a1468084d49d1c49fb675204"
-SRC_URI[sha256sum] = "8237dc5bfd6f1366abeee5624111b9d6879393d84745a507de0fda86043b65a8"
+SRC_URI[md5sum] = "33bfbc89fe616ca22b6336be80d570f4"
+SRC_URI[sha256sum] = "7428f1cc5e72d53e65c3259d5cebc22fb2b07f973c49d95b3c3d26c64890a3c3"
 
-DEPENDS = "${PYTHON_PN}-gitdb"
+DEPENDS += " ${PYTHON_PN}-gitdb"
 
 RDEPENDS_${PN} += " \
                    ${PYTHON_PN}-datetime \
@@ -29,4 +29,5 @@ RDEPENDS_${PN} += " \
                    ${PYTHON_PN}-unixadmin \
                    git \
 "
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


