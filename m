Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 144E378430
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2018 17:11:36 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id f25so453094qkm.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2018 09:11:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=2NsUr0pbFqLOZNqkY/aN8x68x9/MO7TTzJairdXggZc=;
	b=T89GbfuYqx75hj20R+3GnJIgn18jRvLIUEtGerCJATVN+7TEkeuzDhW3D7J/vx2uoN
	r9afbtoYTkna9pzFB0zM2us/Zh1MbU54gS6IhoNAA6xRUWNCtKcwf88CR9w9cFKtCqTA
	JbNoBDSuLXFBFM8s3aK0+90Y5Kv+NUaXmtVJjYFz2vinW/ZrlIytrq5OlOp1FHcJfopM
	227NG2iRLAU39nGWcdxOch/i54Exwm0kYxAQ+a1KAs3RwkFdT3pKtV6/MegKap7QPEuz
	xhUacLhjYacYjZ+1Qf/vrt9jJzGVKYh5G2VEsEZb5LEiMdLX6p2AG0gLTgF8aah1x5mm
	5TAA==
X-Gm-Message-State: APf1xPDt1Jdq64W7U68HXn+TorKIZ3gTlnB92lHX1Tjz5rofCDZ9FeCP
	8u0nShz+jB3AeAaebOwbsJsKPw==
X-Google-Smtp-Source: AH8x227By/HwHcOVvUJYh6Y3MM8V6uVaj7aAzktYS7Wpi4XAlWigB5g0KVXrTUfH0T6da3wdK/0JcA==
X-Received: by 10.55.40.144 with SMTP id o16mr5162302qko.49.1518714697883;
	Thu, 15 Feb 2018 09:11:37 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	c142sm2040402qke.2.2018.02.15.09.11.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 15 Feb 2018 09:11:37 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Thu, 15 Feb 2018 15:11:31 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Feb 2018 15:11:16 -0200
Message-Id: <20180215171116.27911-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180215171116.27911-1-otavio@ossystems.com.br>
References: <20180215171116.27911-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 3/3] cmake: Upgrade 3.10.1 -> 3.10.2
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
X-List-Received-Date: Thu, 15 Feb 2018 17:11:37 -0000

This is a minor stable update to CMake. This includes following
changes:

,----
| c1e087a9d CMake 3.10.2
| d592bfc9f Autogen: Ignore not existing source files in cmMakefile
| d49986b3b KWIML: Backport RISC-V update to CMake 3.10
| 9417a6d32 FindPostgreSQL: Add support for PG10
| 683e9023a Autogen: Fix for problematic nested list separator
| 9b4d31dc7 cmGraphVizWriter: Updated to create and follow dependers for
|           interface targets
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../cmake/{cmake-native_3.10.1.bb => cmake-native_3.10.2.bb}          | 0
 meta/recipes-devtools/cmake/cmake.inc                                 | 4 ++--
 meta/recipes-devtools/cmake/{cmake_3.10.1.bb => cmake_3.10.2.bb}      | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.10.1.bb => cmake-native_3.10.2.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.10.1.bb => cmake_3.10.2.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.10.1.bb b/meta/recipes-devtools/cmake/cmake-native_3.10.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.10.1.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.10.2.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 045cce3fd0c..4eaca755971 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -18,7 +18,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://cmake-Prevent-the-detection-of-Qt5.patch \
            "
 
-SRC_URI[md5sum] = "9a726e5ec69618b172aa4b06d18c3998"
-SRC_URI[sha256sum] = "7be36ee24b0f5928251b644d29f5ff268330a916944ef4a75e23ba01e7573284"
+SRC_URI[md5sum] = "732808e17fc14dc8cee50d51518c34eb"
+SRC_URI[sha256sum] = "80d0faad4ab56de07aa21a7fc692c88c4ce6156d42b0579c6962004a70a3218b"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/cmake/cmake_3.10.1.bb b/meta/recipes-devtools/cmake/cmake_3.10.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.10.1.bb
rename to meta/recipes-devtools/cmake/cmake_3.10.2.bb
-- 
2.16.1


