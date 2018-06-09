Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f41.google.com (mail-pg0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id EB79978816
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jun 2018 20:00:48 +0000 (UTC)
Received: by mail-pg0-f41.google.com with SMTP id c10-v6so2262936pgu.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jun 2018 13:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=WPoRqtIPccpZ7OLjr0wDeDzdB4McxtEGnSwzvkCZGOY=;
	b=pz4UaOizWhNV32R2Q5eMLJf08pgm0CcOk87zpvHT6oSRZzQltqPRSpATLTzVv5yBFS
	rTqwBPBjy1GeHVEwKPpR7A7ERChdu1WZUMoXzwErAQrkRaA/onIgecl6JhVvOAAbeqYc
	dF/hEyix1E22bhB7l297/KZkiSrP9BZAEdMGO2aZ/BR7FlKAPmnibtcnCeUowp2mPzx9
	279q6T6QBogJV4O9hCccSZBKdh6HR3ZvXJBy4z76V9THSI+VqSX9P8lqVieXsg7Rop9p
	J3FT4SOryCWhgoqrF9AtbcueXX2wkJa76Ftcxw0PJG7Tn6LzZ4s3n/NJJD1sUWiQMw5H
	d/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=WPoRqtIPccpZ7OLjr0wDeDzdB4McxtEGnSwzvkCZGOY=;
	b=k/4nbUuEyATRwRa8P7Xr6/FsITwxtLD+SyuHptObaUjvXTONrWJik0KYmgduGpLvLS
	7yzUNRVWnuUxcKKMl9Fp4cQlM9Jh6L4B8QowP+kYGviCNJI/uFGJsY06yeH/iNIZk7hq
	75uf2EgODHa9iXwdBAHvcvEw0Phu3cxByKc/A87WsXE/k7TG7mwGnnStK6NXwJcGyYe0
	pgBDtxcyzc+0D0r3VC9uYrI3sY5Xw8xQyj4oMVep3iEv21IRCvPJj5pEBfwvuVRCXRSA
	PAIsyJqTWfaEQlqTxzFAqWSuN1LerSOkPjNTRGw1Lm30rnTsOKXGeXqCFrANzxcSqgJy
	M6eQ==
X-Gm-Message-State: APt69E25YwG2Xa8uNM6I0PMd8IQwSY9zPMVqolLxplm36E4rUBB+wLhE
	DKucGx+fKK76lPqV2h4xWzo=
X-Google-Smtp-Source: ADUXVKJ+6e1Uu02RPYrx39zE8rWMZO0hsL8RNAtq9mUn6SPn6P4/0mwdKSNLLFks/rt+HbBozCkTPA==
X-Received: by 2002:aa7:8254:: with SMTP id
	e20-v6mr11366417pfn.140.1528574450170; 
	Sat, 09 Jun 2018 13:00:50 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:34b1:53bf:ee45:2976])
	by smtp.gmail.com with ESMTPSA id
	68-v6sm102469622pfk.46.2018.06.09.13.00.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 09 Jun 2018 13:00:49 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Sat,  9 Jun 2018 13:00:46 -0700
Message-Id: <1528574447-21755-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1528574447-21755-1-git-send-email-akuster808@gmail.com>
References: <1528574447-21755-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 1/2] selftest: add cmake test
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
X-List-Received-Date: Sat, 09 Jun 2018 20:00:49 -0000

This came out of Yocto bug 12762. We need to ensure cmake will support
various packages in core as they update.

Test case provided by Dennis Menschel <menschel-d@posteo.de>, thanks

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-test/cmake/cmake-boost-version-test.bb | 20 ++++++++++++++++++
 .../recipes-test/cmake/files/CMakeLists.txt        | 24 ++++++++++++++++++++++
 .../recipes-test/cmake/files/helloworld.cpp        |  7 +++++++
 3 files changed, 51 insertions(+)
 create mode 100644 meta-selftest/recipes-test/cmake/cmake-boost-version-test.bb
 create mode 100644 meta-selftest/recipes-test/cmake/files/CMakeLists.txt
 create mode 100644 meta-selftest/recipes-test/cmake/files/helloworld.cpp

diff --git a/meta-selftest/recipes-test/cmake/cmake-boost-version-test.bb b/meta-selftest/recipes-test/cmake/cmake-boost-version-test.bb
new file mode 100644
index 0000000..7bfd6ef
--- /dev/null
+++ b/meta-selftest/recipes-test/cmake/cmake-boost-version-test.bb
@@ -0,0 +1,20 @@
+#
+# This file was derived from the 'Hello World!' example recipe in the
+# Yocto Project Development Manual.
+#
+
+SUMMARY = "Simple helloworld application"
+SECTION = "examples"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+DEPENDS = "boost"
+
+SRC_URI = " \
+    file://helloworld.cpp \
+    file://CMakeLists.txt \
+"
+
+S = "${WORKDIR}"
+
+inherit cmake
diff --git a/meta-selftest/recipes-test/cmake/files/CMakeLists.txt b/meta-selftest/recipes-test/cmake/files/CMakeLists.txt
new file mode 100644
index 0000000..2dc2c3f
--- /dev/null
+++ b/meta-selftest/recipes-test/cmake/files/CMakeLists.txt
@@ -0,0 +1,24 @@
+cmake_minimum_required(VERSION 3.8)
+
+project(example)
+
+find_package(Boost 1.60 REQUIRED
+    COMPONENTS
+        unit_test_framework
+)
+
+add_executable(example
+    helloworld.cpp
+)
+
+target_link_libraries(example
+    PRIVATE
+        Boost::unit_test_framework
+)
+
+install(
+    TARGETS
+        example
+    DESTINATION
+        bin
+)
diff --git a/meta-selftest/recipes-test/cmake/files/helloworld.cpp b/meta-selftest/recipes-test/cmake/files/helloworld.cpp
new file mode 100644
index 0000000..81ef9b9
--- /dev/null
+++ b/meta-selftest/recipes-test/cmake/files/helloworld.cpp
@@ -0,0 +1,7 @@
+#include <iostream>
+
+int main(int argc, char *argv[])
+{
+    std::cout << "Hello World!" << std::endl;
+    return 0;
+}
-- 
2.7.4


