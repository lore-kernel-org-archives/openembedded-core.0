Return-Path: <denys.zagorui@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 022D271AD8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 20:48:50 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id y193so5480131lfd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Mar 2017 12:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=3Jg9dMm9Q8sQ4Go8jeTuUCej6wVUL+ZDpbf+TIdO89Y=;
	b=iHA1hQaDrySseHPQBQmSV96S6oN04j2aVYhOYC7qaK4lQ0sXLnYfYLRTOlksV8rCjS
	NV1ruqJdNye0ugwEyzF/z4LDOjX2b6g8OUCzqVczIWbnMVpiIfGstPkKWWQrKUR/dITQ
	x0tuvcsfSpqjix1MkPR4Ucd1T2Q1X8rV0szMAspO5YXGqBARtzO2/5DELBTss8WrjgLy
	SaXjvOIcNO0bwHkcwiNP8pUYQCd9oJ58+Gskb4Lrrwv0joDnwhUJka978x/Okh1LREjs
	F0Bet/ixlJ6XE7ySqJgIdgXXDJgspDfP6EjkgH1cwf5tdyxldPsK/gAhTATG9UHHnX2b
	id4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3Jg9dMm9Q8sQ4Go8jeTuUCej6wVUL+ZDpbf+TIdO89Y=;
	b=fzgyybaY1sJL7zQsVaUIsXMqpbaPKl/UkhsYCKrGTu0lI7QKt004jG45vEEBFLOg+Y
	JedEsBzjtTE6Rf4Qkhm0lYp4kE08v8TNrR7Ax6ijEj1mdr4ni5U/LyvoAsG58fgK9j92
	Nz9AWFUG+3fc5cbD20mXwMI7Wwzk2aZ+c3I0U3dW6GZSLogvmdzRlhsKRoV1rLX0XpQl
	p9HIZz5pOGNzwLpoZaglCeUrD8RMXM8HMeqZ6h+/jGD4mrJFbQ2/kWbqvDxPVZN894Sj
	SLvQZrVygE6VUgV8JZhO+Djh0GbA7TCEv8CPFhZ7LHELkyLPAic7ocjgjQZxN4/Q9gnp
	oCsA==
X-Gm-Message-State: AMke39kMjbAN0GWfECBYtBfFaMY3L4paeNoAwRSmV6xSE1nfbgQGgrh6UspAGGAMxu8dxw==
X-Received: by 10.25.233.201 with SMTP id j70mr3817839lfk.20.1489092531353;
	Thu, 09 Mar 2017 12:48:51 -0800 (PST)
Received: from kbp1-ldl-f65370.synapse.com ([195.238.92.77])
	by smtp.gmail.com with ESMTPSA id
	q76sm1444775lfb.65.2017.03.09.12.48.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 09 Mar 2017 12:48:50 -0800 (PST)
From: Denys Zagorui <denys.zagorui@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Mar 2017 22:48:38 +0200
Message-Id: <1489092518-25721-1-git-send-email-denys.zagorui@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Denys Zagorui <denys.zagorui@gmail.com>
Subject: [PATCH] gzip: add ptest
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
X-List-Received-Date: Thu, 09 Mar 2017 20:48:51 -0000

tests don't work with 'diff' and 'less' utils from busybox

Signed-off-by: Denys Zagorui <denys.zagorui@gmail.com>
---
 meta/recipes-extended/gzip/files/run-ptest |  6 ++++++
 meta/recipes-extended/gzip/gzip_1.8.bb     | 18 +++++++++++++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/gzip/files/run-ptest

diff --git a/meta/recipes-extended/gzip/files/run-ptest b/meta/recipes-extended/gzip/files/run-ptest
new file mode 100644
index 0000000..cf7c649
--- /dev/null
+++ b/meta/recipes-extended/gzip/files/run-ptest
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+cd src/tests
+
+make check
+
diff --git a/meta/recipes-extended/gzip/gzip_1.8.bb b/meta/recipes-extended/gzip/gzip_1.8.bb
index 11be846..1f8c026 100644
--- a/meta/recipes-extended/gzip/gzip_1.8.bb
+++ b/meta/recipes-extended/gzip/gzip_1.8.bb
@@ -2,7 +2,8 @@ require gzip.inc
 
 LICENSE = "GPLv3+"
 
-SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz \
+	    file://run-ptest"
 SRC_URI_append_class-target = " file://wrong-path-fix.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
@@ -12,6 +13,21 @@ PROVIDES_append_class-native = " gzip-replacement-native"
 
 BBCLASSEXTEND = "native"
 
+inherit ptest 
+
+RDEPENDS_${PN}-ptest = "less diffutils gawk perl"
+
+do_install_ptest() {
+	mkdir -p ${D}${PTEST_PATH}/src/build-aux
+	cp ${S}/build-aux/test-driver ${D}${PTEST_PATH}/src/build-aux/
+	mkdir -p ${D}${PTEST_PATH}/src/tests
+	cp -r ${S}/tests/* ${D}${PTEST_PATH}/src/tests
+	sed -e 's/^abs_srcdir = ..*/abs_srcdir = \.\./'           \
+            -e 's/^srcdir = ..*/srcdir = \./'                     \
+            -e 's/^Makefile: ..*/Makefile: /'                     \
+            ${B}/tests/Makefile > ${D}${PTEST_PATH}/src/tests/Makefile
+}
+
 SRC_URI[md5sum] = "732553152814b22dc35aa0267df5286c"
 SRC_URI[sha256sum] = "1ff7aedb3d66a0d73f442f6261e4b3860df6fd6c94025c2cb31a202c9c60fe0e"
 
-- 
1.9.1


