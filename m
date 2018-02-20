Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id E450878858
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 13:28:50 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id u6so16263572qtg.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 05:28:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=Fb4IjqeS3xrsxGhpLuF5ZXk5mJb9rPIFSiHTlz6b3Ew=;
	b=YUUZDZqEr9+EYqUSUh2KqI0AseHRRoa/1F8PA1pQr4/t21rm9X/oDY8p/0N0TEyZmX
	zhwdu291bOkZriUG4naq+6a1HisKnqGLq3S/Uf6mARoN3pijfhr+HPDLzWCYL4B4hhWM
	eQzZWenK34NbdNo/3L1E7FdjsOEpLUsk0Pp6eY4RFhnQxmJkWauN6fQMNSEsTOay2pBy
	GQofO2nfgnpsCUj9XTNuThMra2EuTHZbJDbMlmZqDieilFqF0tA1qVBzFCstqlyFBbFJ
	8ep0SQvTvti1xi/wTK4oIw+FaacxAlnqjFQHp7AON2mJfWHE6a8TsBAkkLGEdF+XSg7b
	qjJQ==
X-Gm-Message-State: APf1xPAAOOUH4YTczLUq/nbGKMs8OMTsy6yj26UKTFVyWkjcOHBDIw5m
	bo4F6nXqlg2AxIfvEqjA9ugT+A==
X-Google-Smtp-Source: AH8x225SyCtKHSjUoYMTArPkjCbUaWOhdht0wMgkFH3o4k17MIqJe+ZA3+x030mFrrWD4YRhcnWOUA==
X-Received: by 10.200.50.251 with SMTP id a56mr30174784qtb.13.1519133331504;
	Tue, 20 Feb 2018 05:28:51 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	h29sm10367950qtk.94.2018.02.20.05.28.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 20 Feb 2018 05:28:50 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 20 Feb 2018 10:28:46 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Feb 2018 10:28:08 -0300
Message-Id: <20180220132811.16100-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180220132811.16100-1-otavio@ossystems.com.br>
References: <20180220132811.16100-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 3/6] cmake: Upgrade 3.10.1 -> 3.10.2
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
X-List-Received-Date: Tue, 20 Feb 2018 13:28:51 -0000

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

Changes in v2: None

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
2.16.2


