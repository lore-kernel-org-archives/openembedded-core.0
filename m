Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 47DF676F58
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 08:56:25 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so92552026pac.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Nov 2015 00:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=W1EizmgrWHzLi+V8M2eytfQwBIb6eHDG7nqvGyi3ENA=;
	b=uhnPQ1hUjREjbI39InPmGxkXA0P+lyszhC/JFCh1lQgArhUQ8j9Pxk8AihyZggO6Xk
	lTRncLpq49qulrlpQDoWP1a/CexOuwWQkLRHAdLJFOkfE7fzdEAohyV5Uf0Pv2aEfrrk
	wnUmWL61WKD7xeJWzWM2Ch77wz61MT2eWkFfc1bgSRMzKuZEWiWc7diPkE3Z/dyCb6lB
	gV5oOyfahyCepb119OATsKduzMTFCUOTQPcHJXZBxkJqc6PO01jByKAq9LdsbI0+7HcJ
	d/QvWcpWUFsX3DDG7yoGDUTnI4R16Bvcuy3XigCr/SnxAZiQbdGjFaqIEUcx2qKgfg0w
	wrew==
X-Received: by 10.68.172.228 with SMTP id bf4mr16181022pbc.169.1446800186097; 
	Fri, 06 Nov 2015 00:56:26 -0800 (PST)
Received: from e6520.gateway.sonic.net
	(173-228-90-44.dsl.dynamic.fusionbroadband.com. [173.228.90.44])
	by smtp.gmail.com with ESMTPSA id
	rn7sm12611411pab.23.2015.11.06.00.56.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 Nov 2015 00:56:24 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Nov 2015 00:56:18 -0800
Message-Id: <1446800178-7223-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] cmake: update 3.3.1 -> 3.3.2
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
X-List-Received-Date: Fri, 06 Nov 2015 08:56:28 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../cmake/{cmake-native_3.3.1.bb => cmake-native_3.3.2.bb}          | 0
 meta/recipes-devtools/cmake/cmake.inc                               | 6 +++---
 meta/recipes-devtools/cmake/{cmake_3.3.1.bb => cmake_3.3.2.bb}      | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.3.1.bb => cmake-native_3.3.2.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.3.1.bb => cmake_3.3.2.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.3.1.bb b/meta/recipes-devtools/cmake/cmake-native_3.3.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.3.1.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.3.2.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 57e93ac..c912bcc 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -11,13 +11,13 @@ LIC_FILES_CHKSUM = "file://Copyright.txt;md5=3ba5a6c34481652ce573e5c4e1d707e4 \
 
 CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV',1).split('.')[0:2])}"
 
-SRC_URI = "http://www.cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
+SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://support-oe-qt4-tools-names.patch \
            file://qt4-fail-silent.patch \
            "
 
-SRC_URI[md5sum] = "52638576f4e1e621fed6c3410d3a1b12"
-SRC_URI[sha256sum] = "cd65022c6a0707f1c7112f99e9c981677fdd5518f7ddfa0f778d4cee7113e3d6"
+SRC_URI[md5sum] = "5febbd11bcaac854a27eebaf4a124be2"
+SRC_URI[sha256sum] = "e75a178d6ebf182b048ebfe6e0657c49f0dc109779170bad7ffcb17463f2fc22"
 
 inherit autotools
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.3.1.bb b/meta/recipes-devtools/cmake/cmake_3.3.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.3.1.bb
rename to meta/recipes-devtools/cmake/cmake_3.3.2.bb
-- 
1.9.1


