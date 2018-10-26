Return-Path: <offougajoris@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0890060069
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2018 07:45:00 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id t10-v6so255010wrn.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2018 00:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=MDShImA0zMckNg800AWJ+W2kU8DH8PTaEQNNH/5OQvU=;
	b=OkpfMY0/LwO408yLWBwV71Ayjmyrqrx3crF2WjSs9poGoFBLssZ+O4DCWomue3AnoK
	tHcTuu8GJPsxXLN0LPksbt+BDXKCwGkezvvBtlK9DmKMF5lkHyYXa8UlxeoZpJH/es+z
	3Nkw+bVFBKPjyNF8C6uZEUsnZRKmFzZoxQDzRXSwpNyFgYECLZkWct0WdkicRLNd1pzn
	6c5kEBS6uRG//6Drbrnq8S8GfMsg7IoqTw/hTgvsvlFd3KjdQ80zAGsN5h9vIaEbAZrN
	fYx+XegeBzLg2NVkxt3+bXhhSWDbsGCPUZDGKZ5SyIcrR3Obm00rgooLi8sDxsdeTbXP
	yp+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MDShImA0zMckNg800AWJ+W2kU8DH8PTaEQNNH/5OQvU=;
	b=r3lAjUI4MrJ0XEHpDJJfso2pMy0VPkA8Faaei1aA68T+rqTnpRFkcweaF3j8A7RomY
	Im94I9+OEQZ7q7rfDej3w4u4h3KR0mXTLah/GIOUSe0HG6wQcDF5c10vB6ncP0kERq9t
	I2GbtMaUd99T5BJo5oEqAJELqCLd1sM3gVefsb/RMg/XySa5opbru61pzdJW6rFLcjZ8
	Dq8NfHyljdyCXxufLelBReBmN1Y3HaWdnd9PxoHqs7Ei9slD6SJvIKIle+u6hrq5ZAkf
	oGY0+ipBcnwNzCtcALDivnlLQBdsjQWfA883JDo6C3fxKYu5IJWncSWOKKcXka4OVlgt
	yQfg==
X-Gm-Message-State: AGRZ1gLd+fACy1Ng2+2tHn8jMh9beFIfYwcvC/fXvA+3939gsJLlC+Tm
	OVvJYHKR7AVqkqZQVreTDdtHssHRsMI=
X-Google-Smtp-Source: AJdET5dBRHPmVA59njdhVb8gqFBOQSbKs269sibLga3mAvsvaOfwPFlzWDoewo1CnQPyCZTk3oHcXg==
X-Received: by 2002:adf:a706:: with SMTP id c6-v6mr5071055wrd.56.1540539901373;
	Fri, 26 Oct 2018 00:45:01 -0700 (PDT)
Received: from N2x0WU.auvence.co ([92.103.174.138])
	by smtp.gmail.com with ESMTPSA id
	l125-v6sm5298273wmb.1.2018.10.26.00.45.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Oct 2018 00:45:00 -0700 (PDT)
From: Joris Offouga <offougajoris@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Oct 2018 09:44:52 +0200
Message-Id: <1540539892-14352-1-git-send-email-offougajoris@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] Signed-off-by: Joris Offouga <offougajoris@gmail.com>
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
X-List-Received-Date: Fri, 26 Oct 2018 07:45:01 -0000

Add recipes for django rest framework

For create a database with django
---
 .../python/python-djangorestframework.inc                | 16 ++++++++++++++++
 .../python/python-djangorestframework_3.9.0.bb           |  2 ++
 .../python/python3-djangorestframework_3.9.0.bb          |  2 ++
 3 files changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-djangorestframework.inc
 create mode 100644 meta-python/recipes-devtools/python/python-djangorestframework_3.9.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-djangorestframework_3.9.0.bb

diff --git a/meta-python/recipes-devtools/python/python-djangorestframework.inc b/meta-python/recipes-devtools/python/python-djangorestframework.inc
new file mode 100644
index 0000000..8551a83
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-djangorestframework.inc
@@ -0,0 +1,16 @@
+SUMMARY =  "djangorestframework"
+DESCRIPTION = "pip3 install djangorestframework"
+HOMEPAGE = "https://pypi.python.org/pypi/djangorestframework"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7879a5a716147a784f7e524c9cf103c1"
+
+SRC_URI[md5sum] = "0d481bf8dbb87bb927b46798edc1a9bd"
+SRC_URI[sha256sum] = "607865b0bb1598b153793892101d881466bd5a991de12bd6229abb18b1c86136"
+PYPI_PACKAGE = "djangorestframework"
+
+inherit pypi
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-django \
+"
\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python-djangorestframework_3.9.0.bb b/meta-python/recipes-devtools/python/python-djangorestframework_3.9.0.bb
new file mode 100644
index 0000000..540d12d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-djangorestframework_3.9.0.bb
@@ -0,0 +1,2 @@
+require python-djangorestframework.inc
+inherit setuptools
\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python3-djangorestframework_3.9.0.bb b/meta-python/recipes-devtools/python/python3-djangorestframework_3.9.0.bb
new file mode 100644
index 0000000..9ed6d17
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-djangorestframework_3.9.0.bb
@@ -0,0 +1,2 @@
+require python-djangorestframework.inc
+inherit setuptools3
\ No newline at end of file
-- 
2.7.4


