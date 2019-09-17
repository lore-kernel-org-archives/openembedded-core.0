Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 63FA57F8C2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 05:36:06 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id x10so1360426pgi.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 22:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=I8O4i+BfSGc9VjuvACWNWQsTZNpmrOEoKlnm9O/uykE=;
	b=k922cZppsNd1RhC/QaUesON7LxJUBBcDN46qY5+J1zHtd0ebjYrHBnoml4S8JFPXrz
	DVWRwWJtbWsZD8yuMKaKp45Cez8vt4efcwAe27BjxZSYzG079IGujXXRqa3NT+tyjuz4
	2nVgga49x1PxXsTciLqbj3Y5r/4QeXQSzkeerkt7JejHi1uvoBSiIjBeVKxmZ8lz60OL
	xfDuC6m263ZF7/ic/CHZyFhlHZ5s1n55funMrlcQw5m7/2Td3GZat3acJydj9yFQ853W
	QZKVkJsv88YTI47GmFJHFjclzMd0Wx4xZB1D6kOqVh0ucyzeEL08pBRhrQEw9Hb1W9+H
	R/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=I8O4i+BfSGc9VjuvACWNWQsTZNpmrOEoKlnm9O/uykE=;
	b=hfWEAQEZFhBM0ZY8R8PLP4VDiYiMCe2Hdt+O6OHgW6hGSfV62YHMHgJqgfYZf3PDbf
	kRiJts1klHcyqg+CFMW/KUo62y/LJVtpAU+ucBrCI+Ydnw8ja65rJ+S9gKrijEHU67ir
	lAjqVquazGJsQZ/tUur5jk35ahMIYadrySNVkVNowBrIgW0uIvjSwWVxaZDJ72iqrK6K
	yXO653n0JyvjrNCLlVMVxvHKjL7UUjakQ6mtlY6kAZvp3XQ8IzKiMXD+Wu7dBDarP58D
	TaA3WYbf2XRcGs98RqRxvvZRnxW2V5kN4NUdwsZ1QEYObD/pydHcqAvp0oYYyawo4hvv
	YU+A==
X-Gm-Message-State: APjAAAU2ZnQU5na1U+fNMlmn1klnOLys3IL5/M5AXUYHRZdqoSURapK+
	SKOCLcqqa9eDD8dvjBB2yMPO8A==
X-Google-Smtp-Source: APXvYqw76aOU8Sfj+6k/yD+sghlAQe7aIxhwRbT+V4Um2iIPT5DFwMWJfau6FVMTfjvEgx6xxeSG1g==
X-Received: by 2002:a17:90a:e397:: with SMTP id
	b23mr2995851pjz.140.1568698567270; 
	Mon, 16 Sep 2019 22:36:07 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	z6sm901166pgk.18.2019.09.16.22.36.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 16 Sep 2019 22:36:06 -0700 (PDT)
Date: Tue, 17 Sep 2019 05:35:56 +0000
Message-Id: <20190917053556.19422-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH] cmake: 3.15.2 -> 3.15.3
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
X-List-Received-Date: Tue, 17 Sep 2019 05:36:06 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Update to fix issues with Boost 1.71.0, see pull request:
  https://gitlab.kitware.com/cmake/cmake/merge_requests/3763

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 .../cmake/{cmake-native_3.15.2.bb => cmake-native_3.15.3.bb}          | 0
 meta/recipes-devtools/cmake/cmake.inc                                 | 4 ++--
 meta/recipes-devtools/cmake/{cmake_3.15.2.bb => cmake_3.15.3.bb}      | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.15.2.bb => cmake-native_3.15.3.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.15.2.bb => cmake_3.15.3.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.15.2.bb b/meta/recipes-devtools/cmake/cmake-native_3.15.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.15.2.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.15.3.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 4cbe26ed60..3711f18db6 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -18,7 +18,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[md5sum] = "9ecf167edadb87e2d75cc89fded7aadb"
-SRC_URI[sha256sum] = "539088cb29a68e6d6a8fba5c00951e5e5b1a92c68fa38a83e1ed2f355933f768"
+SRC_URI[md5sum] = "bf69e837eeda3dd4e9f52cffcf546a11"
+SRC_URI[sha256sum] = "13958243a01365b05652fa01b21d40fa834f70a9e30efa69c02604e64f58b8f5"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/cmake/cmake_3.15.2.bb b/meta/recipes-devtools/cmake/cmake_3.15.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.15.2.bb
rename to meta/recipes-devtools/cmake/cmake_3.15.3.bb
---
2.23.0

