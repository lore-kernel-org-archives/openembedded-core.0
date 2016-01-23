Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id E301977054
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 23:10:19 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id o11so7625168qge.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 15:10:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=ThyMAnw41PjK9Uyk+xYZHK0mEI/Mm9TuWjFiWcCDfKs=;
	b=amFAh6Qg0TxFc5VHVRJ6pYapvwrq38iDQH4dhf0ugwt3UzBcz2zwSYEr80Mg06XSuj
	1YLh3CAqlXHuEdqZd0Ifc+QR9OYE2eZHvX4i63TnrSFxzuMBi68AORdSu1HuQkzwrXPb
	rsC/1GJRjKRKB+zVeTnSWrz+Fa7ORTtFa0b1TAdqL/76SvJbgfIKA9JK6XS2HqY86u4Z
	OVGl1/na85fW0C4CjBcIVkCWJ8aLxF/ZtUcbVe8RZVGqbABWy/4zhkU/XZ8hD2cvH9bG
	yZvCjhXbry09VhFzpVk3jvIJdT1kxSzzvwuh9Mz6XMtKSy784R8W+690s1V49PMGPp+q
	p4oQ==
X-Gm-Message-State: AG10YOTiGbj6czazQ97myxIqMZkwYZF2LJkglPgESwH5qb3zTmLbz1E6/HvF/GVn1CLTfg==
X-Received: by 10.141.0.4 with SMTP id b4mr13487406qhd.23.1453590620080;
	Sat, 23 Jan 2016 15:10:20 -0800 (PST)
Received: from build-slave.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id 67sm5769501qht.14.2016.01.23.15.10.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 Jan 2016 15:10:19 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Jan 2016 18:10:01 -0500
Message-Id: <9126b4b2d5fbe537c762f601b772aa5decd8e21a.1453589999.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
Subject: [meta-python][PATCH 04/13] python-cython: update to 0.23.4
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
X-List-Received-Date: Sat, 23 Jan 2016 23:10:22 -0000

---
 meta-python/recipes-devtools/python/python-cython.inc      | 14 +++++++-------
 .../{python-cython_0.23.1.bb => python-cython_0.23.4.bb}   |  0
 .../{python3-cython_0.23.1.bb => python3-cython_0.23.4.bb} |  0
 3 files changed, 7 insertions(+), 7 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cython_0.23.1.bb => python-cython_0.23.4.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cython_0.23.1.bb => python3-cython_0.23.4.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cython.inc b/meta-python/recipes-devtools/python/python-cython.inc
index 6c8b084..781027f 100644
--- a/meta-python/recipes-devtools/python/python-cython.inc
+++ b/meta-python/recipes-devtools/python/python-cython.inc
@@ -1,17 +1,15 @@
 DESCRIPTION = "Cython is a language specially designed for writing Python extension modules. \
 It's designed to bridge the gap between the nice, high-level, easy-to-use world of Python \
 and the messy, low-level world of C."
-SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
-SRCNAME = "Cython"
-BBCLASSEXTEND = "native"
 
-SRC_URI = "http://www.cython.org/release/${SRCNAME}-${PV}.tar.gz"
-S = "${WORKDIR}/${SRCNAME}-${PV}"
+PYPI_PACKAGE = "Cython"
+
+SRC_URI[md5sum] = "157df1f69bcec6b56fd97e0f2e057f6e"
+SRC_URI[sha256sum] = "fec42fecee35d6cc02887f1eef4e4952c97402ed2800bfe41bbd9ed1a0730d8e"
 
-SRC_URI[md5sum] = "db3c5b365e1c3f71c7cd90e96473a3ab"
-SRC_URI[sha256sum] = "bdfd12d6a2a2e34b9a1bbc1af5a772cabdeedc3851703d249a52dcda8378018a"
+inherit pypi
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-netserver \
@@ -19,3 +17,5 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-shell \
 "
 RDEPENDS_${PN}_class-native = ""
+
+BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python-cython_0.23.1.bb b/meta-python/recipes-devtools/python/python-cython_0.23.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cython_0.23.1.bb
rename to meta-python/recipes-devtools/python/python-cython_0.23.4.bb
diff --git a/meta-python/recipes-devtools/python/python3-cython_0.23.1.bb b/meta-python/recipes-devtools/python/python3-cython_0.23.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cython_0.23.1.bb
rename to meta-python/recipes-devtools/python/python3-cython_0.23.4.bb
-- 
1.9.1


