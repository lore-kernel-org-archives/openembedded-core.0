Return-Path: <scott.branden@broadcom.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7BA9060BC7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 21:34:46 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id fa20so1464801pjb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 13:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=44AEvA5icsaZ+kusEUDbOhmbnwZsACPJXl/KvyqB+Ag=;
	b=N9bGaMoO1HJ039exwB2F3nrY1zwlxqQeur/8qGQ1lN5krGnSJvSgBOSIEDQQ0/W4l+
	HuB8JM5gJ/kzCaeFe8Om3s4lcqqMrTegr5UtkAum/KX6U8VVNi9ZSPBJ9ayDyos2BZd9
	yflg7MYlGl9MH8R212EVMddkmV2pTpu1FLkgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=44AEvA5icsaZ+kusEUDbOhmbnwZsACPJXl/KvyqB+Ag=;
	b=AjAREH6PM+oVsuq0Q7XAWyfCpx9lOb2/BLN8jGncKWV1V4rmG59ajcUDbWXoZp+wcK
	uHKevn+UR7jxGkHXqZ9h+umiLmSq4l+jzpEtI8uEy4NK6z4E7JDbsQSJ/EmsavE72JH7
	ZZQhyhMVyUA4xoZht7p/zvop0hsUzQWmfyt/PSLMxIFM2qkgkniblijNL/LVTYfPsHrv
	8Sbum898ipqi8QLmJIbQzV2HqS4608BEL2pNuf2E3fLqNXEDDdHuNXQnE93O2joGMv0f
	qw/z66BW6sDsDmwEd4btxmWgtpu7rZ0y6HxDWKgaWdFZqUHO1At5It+6W5edI1UKHFF/
	DRZw==
X-Gm-Message-State: APjAAAX5RjTtCDtaf/6gehsX9F2cPA2dW83O/NEOZEfkAi9KOZmrJ7Pr
	qsEkzfsMxIahZHWtrQ1VXU0ssNjbnTKbygSYcMIUPtb8FhplCTok387nPLuGPEcsoOL1szi/bLm
	x+W0aAL0o5GmVzbJ2zarhF0CmiOCWN1EjsCcUQnr5qTzfJREUyt7M0Nwe6Uex3M1a9cCcICt/eS
	nnRXckqEtLpopFQCNwdWJZSMVI
X-Google-Smtp-Source: APXvYqxf0zI9fI2ntGKLocDyKiDz0rxo0iWyBYzsZOPTgDHPvZBihZ+oBlfa7Bw+94YA/EYr7quuGQ==
X-Received: by 2002:a17:902:74cc:: with SMTP id
	f12mr412281plt.192.1581111287206; 
	Fri, 07 Feb 2020 13:34:47 -0800 (PST)
Received: from lbrmn-lnxub113.broadcom.net ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id
	w18sm4057717pfq.167.2020.02.07.13.34.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 07 Feb 2020 13:34:46 -0800 (PST)
From: Scott Branden <scott.branden@broadcom.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Feb 2020 13:34:40 -0800
Message-Id: <20200207213440.10462-1-scott.branden@broadcom.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] x265: add x265 recipe
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
X-List-Received-Date: Fri, 07 Feb 2020 21:34:47 -0000

Add x265 recipe from latest revision of stable branch.

Signed-off-by: Scott Branden <scott.branden@broadcom.com>
---
 meta/recipes-multimedia/x265/x265_git.bb | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta/recipes-multimedia/x265/x265_git.bb

diff --git a/meta/recipes-multimedia/x265/x265_git.bb b/meta/recipes-multimedia/x265/x265_git.bb
new file mode 100644
index 0000000000..7c230e2b1e
--- /dev/null
+++ b/meta/recipes-multimedia/x265/x265_git.bb
@@ -0,0 +1,21 @@
+SUMMARY = "H.265/HEVC video encoder"
+DESCRIPTION = "A free software library and application for encoding video streams into the H.265/HEVC format."
+HOMEPAGE = "http://www.videolan.org/developers/x265.html"
+
+LICENSE = "GPLv2"
+LICENSE_FLAGS = "commercial"
+LIC_FILES_CHKSUM = "file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091"
+
+DEPENDS = "nasm-native"
+DEPENDS = "gnutls zlib libpcre"
+
+SRC_URI = "git://github.com/videolan/x265;branch=stable \
+          "
+
+SRCREV = "4ef6b67fd46e1584e52a11a264812edcaef02526"
+
+S = "${WORKDIR}/git/source"
+
+inherit lib_package pkgconfig cmake
+
+AS[unexport] = "1"
-- 
2.17.1


