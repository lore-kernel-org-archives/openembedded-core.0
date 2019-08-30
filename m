Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 14DF27F43B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 12:50:09 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id e16so6854285wro.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 05:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Ji2KhxS5l19FZ8AW+XDlo5jktcaiqudov/92Sko8yZ8=;
	b=IsiGbCmtwiOUtkgU268ZM4OzKzbxXdMLAWr+qbPJ+dbLEImyj/y3C8+3hCxt8+01w1
	qq91Tnpisx9qSs9GGfkuMLg8u9tWdNgo2aQG9LdLXHm9tWVtY0b7IrYy+IStVsNOwCHe
	0BJ7IMty1hOcBk/hzMYQVxWIcNg4PK4QKw3GnTSCMB5rcOT7JShlk4qSnMEzLC+X46NG
	9EYprzuevQ5pmFbKU/OOcTbVeR+UeDyKGR/Esu0k1zj2VPiY8n9NGD+zd6O+XaSLS+xn
	IZbSc9XRKaFjFYNX3naXp37tYGCrySX1lQGmCH27aa6fhUIbs8ZaiQBDpFM1xPsXzHK8
	n5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Ji2KhxS5l19FZ8AW+XDlo5jktcaiqudov/92Sko8yZ8=;
	b=jDkzBIS+ur9OQ4blej6hpxAyjozEk8Uo8VX0HfWtmivmHY2PBUfI4kyvODADP/+mAZ
	DeBsRcmNiK8peEO6hRv0Yf6t/BxvYk18OkFkL/QfaN0/8+mPEtAkV0gi1juXi6XSCMzm
	8ANWOvu0V2Z5BeOY7ZI39Oy10JNz7dV2whV0m+r8As2KIVe1dV10GVDaUf3PYWW3Nizb
	hXovsarAnJDcvQhLggKEBjNr1jsrLDtGK75x3Da66PINT88vbE/jI3Qy0wqdhAffy3+U
	/t6cWwZcBEsLEIbhcKGdesM4qvYJbIZDwIo6WPN06cMHp34lXRyc1oPoOKeOER/viE+5
	No5A==
X-Gm-Message-State: APjAAAWDhGZVbSKMxIO30v8LOZkXg8aSbIW0wb5ONpIo4ys9b0r4QfmD
	AO1ylhQ+XI4x7m4tomycLDKe5xlO
X-Google-Smtp-Source: APXvYqybAo0e7fmjXE2nnqK4LC0TNnXNAt+pfB3XBAxgkaZx+rzouEbyBl6UqQn7r8nC8HgpDfjv6A==
X-Received: by 2002:adf:e7c4:: with SMTP id e4mr15334207wrn.62.1567169410480; 
	Fri, 30 Aug 2019 05:50:10 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id d1sm6307481wrs.71.2019.08.30.05.50.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Aug 2019 05:50:09 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2019 14:49:51 +0200
Message-Id: <080ed6b417b3a35d8f2e0243bbb552b0f8c311b7.1567169002.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1567169002.git.alex.kanavin@gmail.com>
References: <cover.1567169002.git.alex.kanavin@gmail.com>
Subject: [PATCH 06/13] ca-certificates: use python 3 for builds
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
X-List-Received-Date: Fri, 30 Aug 2019 12:50:10 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-certdata2pem.py-use-python3.patch    | 37 +++++++++++++++++++
 .../ca-certificates_20190110.bb               |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-support/ca-certificates/ca-certificates/0001-certdata2pem.py-use-python3.patch

diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-certdata2pem.py-use-python3.patch b/meta/recipes-support/ca-certificates/ca-certificates/0001-certdata2pem.py-use-python3.patch
new file mode 100644
index 00000000000..aa2c85ff43d
--- /dev/null
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-certdata2pem.py-use-python3.patch
@@ -0,0 +1,37 @@
+From b6d18ca77f131cdcaa10d0eaa9d303399767edf6 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 28 Aug 2019 19:18:14 +0200
+Subject: [PATCH] certdata2pem.py: use python3
+
+Comments in that file imply it is already py3 compatible.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ mozilla/Makefile        | 2 +-
+ mozilla/certdata2pem.py | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/mozilla/Makefile b/mozilla/Makefile
+index 6f46118..f98877c 100644
+--- a/mozilla/Makefile
++++ b/mozilla/Makefile
+@@ -3,7 +3,7 @@
+ #
+ 
+ all:
+-	python certdata2pem.py
++	python3 certdata2pem.py
+ 
+ clean:
+ 	-rm -f *.crt
+diff --git a/mozilla/certdata2pem.py b/mozilla/certdata2pem.py
+index 0b02b2a..7d796f1 100644
+--- a/mozilla/certdata2pem.py
++++ b/mozilla/certdata2pem.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/python3
+ # vim:set et sw=4:
+ #
+ # certdata2pem.py - splits certdata.txt into multiple files
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb b/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb
index 7d87da10bb5..ce3cb217a1b 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb
@@ -23,6 +23,7 @@ SRC_URI = "git://salsa.debian.org/debian/ca-certificates.git;protocol=https \
            file://default-sysroot.patch \
            file://sbindir.patch \
            file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch \
+           file://0001-certdata2pem.py-use-python3.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.17.1


