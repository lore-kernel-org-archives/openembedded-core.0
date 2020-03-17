Return-Path: <domarys.correa@ossystems.com.br>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9756260AE1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 12:45:14 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id d22so17239971qtn.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 05:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=3+h6auDmZpPVZ/L4xwP1juXFsKvHejo20CoGU1s1El8=;
	b=X5QPW+EELmoMJV6x2jVxUsAAgxPnmayL/79D1tNrxAgqfNXTOxR1qaC4pZOBQb1fMM
	oYR+0lxCECUatmBU8klNRfYWCnd9cuh2OZJo8QFHdMfA6BPeKOekIViLVDQHbyQA8iBm
	71up+f+QV22oH/6uP6YSP7F95WxknllJtU/5RRXJrWqq2NS+ix+gAduV2uYOvr/IxF80
	Z+mzayY9/Lsks8GrsyeFs9+LIIhENq1eCpkT9vUii6QWNQBJbDvF1Sg+4NZ9lPzP9jTA
	cgd8wz1dITe6TvldS3m9l6cTfCierc29zLtRBQHARf6V7z2zZRmJ8MTBKh+t1TKo6dMs
	mPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3+h6auDmZpPVZ/L4xwP1juXFsKvHejo20CoGU1s1El8=;
	b=JVv1YcYGcm5Ofiap34o1swKjcwqgsSWX5d2Ml4JFP5WchDQsWL9J7wOgzolFfs3caN
	ZJUYgKy3PtiOKZIGb2Jyt+AjjMufCIFcd/g1RrUYKiNqQb4BjAGwDsSswOgPmEGmdNou
	ZgekstrOnkJaLuHPJm+6ftIeSV/dHVZsCN3S82t24kyiAutK/ztQhnXrBmdGeUws40AO
	Oy1UkYO2m64Uf4FXruVl9GQAQfwR5GzjDKgP9M6sq6+u9PMivClsRXDE1mQdRJ/lwyRK
	LE2PO0XUeczjKKs24CRmfNP5c+wgK3QzzXfRma/hxS2ybe0VWX1m5FWjlHrhrzNEFPVx
	dRtg==
X-Gm-Message-State: ANhLgQ3ZDaMTW1d3p5g5rqwSHZGSheNlnpQ4rKf4KhhLCCtCCVk7UIO4
	ZhdAW1JRiovQXQ7KxTdnIUKO3Va0Wxw=
X-Google-Smtp-Source: ADFU+vsZn/7p1CuRGGDZ+iFOeIWCjBxQKa0/0WdlKHKwwYsC10z/Wnw7HauZVa2ADAXpu210fPoYgw==
X-Received: by 2002:ac8:545a:: with SMTP id d26mr5176634qtq.238.1584449115193; 
	Tue, 17 Mar 2020 05:45:15 -0700 (PDT)
Received: from Monster.lab.ossystems ([181.220.114.167])
	by smtp.gmail.com with ESMTPSA id 18sm1819021qkk.84.2020.03.17.05.45.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Mar 2020 05:45:14 -0700 (PDT)
From: Domarys Correa <domarys.correa@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Mar 2020 09:44:54 -0300
Message-Id: <20200317124454.12732-1-domarys.correa@ossystems.com.br>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] cmake: Update 3.16.1 -> 3.16.5
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
X-List-Received-Date: Tue, 17 Mar 2020 12:45:14 -0000

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
---
 .../cmake/{cmake-native_3.16.1.bb => cmake-native_3.16.5.bb}  | 0
 meta/recipes-devtools/cmake/cmake.inc                         | 4 ++--
 .../cmake/{cmake_3.16.1.bb => cmake_3.16.5.bb}                | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.16.1.bb => cmake-native_3.16.5.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.16.1.bb => cmake_3.16.5.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.16.1.bb b/meta/recipes-devtools/cmake/cmake-native_3.16.5.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.16.1.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.16.5.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 9d14c14b54..09949b566c 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -22,7 +22,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[md5sum] = "142cf11cd9a7c298cf875604cee96434"
-SRC_URI[sha256sum] = "a275b3168fa8626eca4465da7bb159ff07c8c6cb0fb7179be59e12cbdfa725fd"
+SRC_URI[md5sum] = "d86ccaf3d2462b6b5947919abe5b9f15"
+SRC_URI[sha256sum] = "5f760b50b8ecc9c0c37135fae5fbf00a2fef617059aa9d61c1bb91653e5a8bfc"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/cmake/cmake_3.16.1.bb b/meta/recipes-devtools/cmake/cmake_3.16.5.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.16.1.bb
rename to meta/recipes-devtools/cmake/cmake_3.16.5.bb
-- 
2.17.1


