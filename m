Return-Path: <offougajoris@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 88A2279A4B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2018 07:54:48 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id l26-v6so502718wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2018 00:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=HpLNNeX1esc/GuLgZR4LFNeSkaTrNvNXzdl4bRLtoeE=;
	b=DlAA9nFRBhPEz1lz62FdZ+f2TTnhIrBb22iHDnD4XaIjaHnkWKaRkuzAyXVFVHswsf
	NOPKizoPpv1w7hADQFxIJah+zN1Opxnp7QvMxwRRmPo+M5B6BArQO8T9CNF7sACWOuex
	A+hPkLORBO0RFNKaXU/w0Jhtf2M3MKZz+rWYjz3BQ4tyE9ipAwke4+/w0UgX/lWdNXmX
	Oq1+yvdydx89nSZe66wG46SydPm+5P1O4Xg8qTD00ioFiHesuKYSse3dc3FnCUeutsgZ
	ck8t8RJyGm1EqTS7shngJBT7EEJoHvtVCHIYb+RnWifHt+Iszi+XNC4ypGCFefPonGhd
	ahMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HpLNNeX1esc/GuLgZR4LFNeSkaTrNvNXzdl4bRLtoeE=;
	b=nbpOBI9AUMAvFOw5DPZQp9aPFeWYtK5rDPwzrHZnkVEGAGeU0/FgZvmpgc5bTJxSBI
	V+7+pJKy1sHeUE4mIDT279O2vidbLrxtiGrnNx/4szw5Q1+YzZ/4xJpRMgnC02vrvG7Y
	+jjg8b4i8dEkHbv+yjpUU1+k+RVqlNRp/+JtOC0wT6UT1GFy9/P5rOtjWI2H3Gm/mfS/
	qTYDCl+YCFCcCSVv0MvA9RB6fO2qNtM+m5zx9tE2y9BEVqNDWVdt6QfKVPqmcH3fItq6
	hDJfZ7x1uMeFtMQitNRoHd/R6DFKF7wg1F02AJFziWSxdLtOPPaUrTLiEUNZEdnajLR/
	vchw==
X-Gm-Message-State: AGRZ1gJt49HO2V9cS7P06ND8kS+MCEgSHrzNwZmcF8+oWcgrEXDfiy/8
	JNkb4EnNmfcdS2nAb/bAbFA4etu9u+Y=
X-Google-Smtp-Source: AJdET5eyYE7nzDzf0k8oCRihLno84cfdhqAi7oWUGO5Pi5sjg1pQNEktA5jYgWe1XpFfDMr06sCNMw==
X-Received: by 2002:a1c:578c:: with SMTP id
	l134-v6mr4688382wmb.135.1540540488877; 
	Fri, 26 Oct 2018 00:54:48 -0700 (PDT)
Received: from N2x0WU.auvence.co ([92.103.174.138])
	by smtp.gmail.com with ESMTPSA id
	c9-v6sm1189732wrh.50.2018.10.26.00.54.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Oct 2018 00:54:48 -0700 (PDT)
From: Joris Offouga <offougajoris@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Oct 2018 09:54:35 +0200
Message-Id: <1540540475-16854-1-git-send-email-offougajoris@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCHV2] Add recipes for django rest framework
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
X-List-Received-Date: Fri, 26 Oct 2018 07:54:48 -0000

For create a database with django

Signed-off-by: Joris Offouga <offougajoris@gmail.com>
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


