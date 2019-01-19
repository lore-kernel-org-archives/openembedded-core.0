Return-Path: <shantanu@senic.com>
Received: from mail-yw1-f41.google.com (mail-yw1-f41.google.com
	[209.85.161.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3CC1E60107
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2019 12:26:34 +0000 (UTC)
Received: by mail-yw1-f41.google.com with SMTP id i73so6323878ywg.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2019 04:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=senic-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=1C2+CyDD6mRDM0IJ8jN3QbboQkbQ2Fy5tC4UuR5htbk=;
	b=k5whE8vEd0sMRoqISiRlRskFXZ/pJkvuOBVX0fjqwB1eQ7ohNO89/FjmsdVVIfyCd4
	QbVv/CHU7IFCKXR5BoHuiGdGJkpJPr7MotgNdLZzP4juY2DMHE3whyqAKxCmXx/9381c
	T/4wLX+ZmJzBctx3zS8o7j90qBlNNf9Ks0bvWsH19EHU6S8CBCTwCIqYyo7uKJHCTJ+L
	BSh2Av7cD+4hKRAp5T+CtBJUMePJEwo9pX5dp916P1Q6YrBdf2OqMdqmqrz1mb2WRtJg
	VPCckNhnlORzwYYr157W3zdRXVvw5q4QPhbjlTg0/bJ7Tu9OIvpHYavuTKO+F7raz2cy
	TzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1C2+CyDD6mRDM0IJ8jN3QbboQkbQ2Fy5tC4UuR5htbk=;
	b=dLXvosph5Y44VSOri4AuW0qqwLIZVrG7K+iuQLqWr5SZWYLMKFynCPa5tCQsCHy9iD
	tNjziev456DX+KlaKtohfYl0jczOA1soasPIu8X5foanacqhElMsypn7EKIvtCPF5Fox
	gknhVR8lkMQhODL3AnbfxBAMmiAaPOkSmKIO1PabgcT9HEdF/DicnSXCuLeAdL53mqvl
	hVm0H6wme/clBsFxph3k5UuzgXwbq+KuCWwqNAb6eNnnYQE/HtAIsiH32KeING0wuFfH
	Q/vFWFczQ0XCrPRyIisrm7KpES2JUlqVwrHMLY4yxBOyd+TH1D8J94dveplZPr2wRX4Z
	qI9w==
X-Gm-Message-State: AJcUukfA8c528nQOxFiDANyba/pFkI8M8VpgLdfKPQSDi7qtJMH0VGKz
	zCf6IVQezKqnboKiSPhqxCwJOD+G7D4=
X-Google-Smtp-Source: ALg8bN4d+r8fG6xW01Im6Fu0E4Vi2i4rXYZQD04NQ8800ZDgt8vl+PF38IZpud94YGev9LniB3tblw==
X-Received: by 2002:a81:5b82:: with SMTP id
	p124mr21744144ywb.153.1547900794787; 
	Sat, 19 Jan 2019 04:26:34 -0800 (PST)
Received: from localhost.localdomain ([117.241.130.152])
	by smtp.gmail.com with ESMTPSA id
	q185sm3112889ywe.87.2019.01.19.04.26.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Jan 2019 04:26:34 -0800 (PST)
From: Shantanu <shantanu@senic.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Jan 2019 17:56:18 +0530
Message-Id: <20190119122618.5173-1-shantanu@senic.com>
X-Mailer: git-send-email 2.17.1
Cc: Shantanu <shantanu@senic.com>
Subject: [meta-oe][PATCH] Add recipe for python bindings of Berkeley DB
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
X-List-Received-Date: Sat, 19 Jan 2019 12:26:34 -0000

Signed-off-by: Shantanu <shantanu@senic.com>
---
 .../python/python3-bsddb3_6.2.6.bb            | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.bb

diff --git a/meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.bb b/meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.bb
new file mode 100644
index 000000000..0cb10fbab
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "pybsddb is the Python binding for the Oracle Berkeley DB"
+HOMEPAGE = "https://www.jcea.es/programacion/pybsddb.htm"
+SECTION = "devel/python"
+LICENSE = "AGPL-3.0"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/AGPL-3.0;md5=73f1eb20517c55bf9493b7dd6e480788"
+SRC_URI[md5sum] = "ebb7554bbe1a518abbe742753a617577"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "bsddb3"
+
+DEPENDS = "db \
+  python3-core \
+"
+
+DISTUTILS_BUILD_ARGS = "--berkeley-db=${STAGING_DIR_HOST}/usr"
+DISTUTILS_INSTALL_ARGS = "--berkeley-db=${STAGING_DIR_HOST}/usr"
+
+RDEPENDS_${PN} = "db"
-- 
2.17.1


