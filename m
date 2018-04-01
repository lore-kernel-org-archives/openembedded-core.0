Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id DE3C3746BB
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Apr 2018 19:50:47 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id o205so13407125qke.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Apr 2018 12:50:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=lPA0xkgYnu57ZTvZMO/5P2jrkbJCLLdwedbJ05JN1Eo=;
	b=Xnvy80fDhKOayVUxE/DNp/2oyUFVgsPOCKF6gwQsaR2K+6xsRmXxxeYC29LnzAdVNJ
	NNq9SHxv0TIzzGr/lRkwVUbh3w+etdqOhm4f+7kp7aAd5jdkMq/hYiE3WmrfGxxjsOam
	bSbSOUqi20/9G1IIIns9B8wvicN4p3Y96eBRcFHWQNBz2zNpb3v+tIcKJYxNYw8HLh0m
	ZRHT3Zc9DD3oeD3EYWGzqpqQAARlVbZ1vMK68T6vyOmei5TZQsTFqMOVN5mRq/SVRIVH
	IEQOL3xSNQHwuSG7TBZiMcahvfh4v3+D01F63cUmBjnYv6ZiB2hvDtcbMic2v3dBmwoi
	qSwQ==
X-Gm-Message-State: ALQs6tDX9Fj3ttv02DYFceHI3hL1NpVWnug37hymCA1c2q3F6UFPkreK
	fU5Pwz54Z2cT3pMWW2tPrh5NaA==
X-Google-Smtp-Source: AIpwx4/inxZcuC/nrYn8CD6yk3JYS0Ke2mYNr69tz/+NT9cHQSSELSIJdsg3py9/xdwXboL5ivL6Yg==
X-Received: by 10.233.222.131 with SMTP id s125mr9548770qkf.131.1522612248129; 
	Sun, 01 Apr 2018 12:50:48 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	n129sm5696197qke.42.2018.04.01.12.50.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 01 Apr 2018 12:50:47 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Sun, 01 Apr 2018 16:50:41 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sun,  1 Apr 2018 16:50:37 -0300
Message-Id: <20180401195037.6495-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [RESEND PATCH] cmake: upgrade 3.10.2 -> 3.10.3
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
X-List-Received-Date: Sun, 01 Apr 2018 19:50:48 -0000

,----[ Changes in 3.10.3 ]
| Brad King (1):
|       CMake 3.10.3
|
| Craig Scott (1):
|       GoogleTest: Rename TIMEOUT parameter to avoid clash
|
| Sebastian Holtermann (1):
|       Autogen: Fix for the empty source file crash in 3.10.2
|
| Tianhao Chai (1):
|       ccmake: fix status line buffer overflow on very wide terminals
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../cmake/{cmake-native_3.10.2.bb => cmake-native_3.10.3.bb}          | 0
 meta/recipes-devtools/cmake/cmake.inc                                 | 4 ++--
 meta/recipes-devtools/cmake/{cmake_3.10.2.bb => cmake_3.10.3.bb}      | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.10.2.bb => cmake-native_3.10.3.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.10.2.bb => cmake_3.10.3.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.10.2.bb b/meta/recipes-devtools/cmake/cmake-native_3.10.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.10.2.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.10.3.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 4eaca755971..9357079df4e 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -18,7 +18,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://cmake-Prevent-the-detection-of-Qt5.patch \
            "
 
-SRC_URI[md5sum] = "732808e17fc14dc8cee50d51518c34eb"
-SRC_URI[sha256sum] = "80d0faad4ab56de07aa21a7fc692c88c4ce6156d42b0579c6962004a70a3218b"
+SRC_URI[md5sum] = "1c38c67295ca696aeafd8c059d748b38"
+SRC_URI[sha256sum] = "0c3a1dcf0be03e40cf4f341dda79c96ffb6c35ae35f2f911845b72dab3559cf8"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/cmake/cmake_3.10.2.bb b/meta/recipes-devtools/cmake/cmake_3.10.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.10.2.bb
rename to meta/recipes-devtools/cmake/cmake_3.10.3.bb
-- 
2.16.3


