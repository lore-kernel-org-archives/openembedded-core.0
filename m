Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1CC797895B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 14:40:01 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id a20so1180052qtj.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 07:40:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=+7Hegr+O/bgRuwx4J/3GVvIxHuc9Q9JxeSDStJCRLA0=;
	b=Uz6qOtHtU92Q4JN4ZhfL4d+M6xlLj/oXSPY6izXMSUAUYhx3+Lkil1kUAPc4YNErKY
	dM9ZQ0S3y6LVznQsYqt3OX24pSqikUW1EBBTbr14GfazjXXJJ/7hQyZTXXA/LFKI5qJU
	fkVmIi9kwVCcg/NhWq8gSvAw3VE7sHFWMbXk28bkSGdPB1BosRlbGSfUo9OC/tcutZXM
	8HBe9w1gOfVdW1F59Epgq3JFVR9h4blCjvLjxRmF8JRG0o6PGi3fUWZpuKF2qs7GuW9a
	X8xk5ZsAPzpbFGL05dXyD0+n1RV6eFkOXC6x7oghKG91vwc+KydlBZy18BsadsOMRewO
	MpuA==
X-Gm-Message-State: AElRT7HUryNqjM3TwpNLo3hLIUniX8w31qRBcicNX3aticLaQUc4ijQ+
	li1oqZxQu+AvCUM8O2wv63K2iw==
X-Google-Smtp-Source: AG47ELu/KFDN+xCJ8QXr318kC7ggbeWB9jAwyBDV85+Hj6AKB/Pv+lKO8kAec+J5Giu5huBn3oC6Eg==
X-Received: by 10.237.43.3 with SMTP id p3mr18733846qtd.41.1521470402754;
	Mon, 19 Mar 2018 07:40:02 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id c52sm109353qtc.89.2018.03.19.07.40.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 19 Mar 2018 07:40:02 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 19 Mar 2018 11:39:58 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Mar 2018 11:39:49 -0300
Message-Id: <20180319143949.27368-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] cmake: upgrade 3.10.2 -> 3.10.3
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
X-List-Received-Date: Mon, 19 Mar 2018 14:40:02 -0000

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
2.16.2


