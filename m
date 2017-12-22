Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id CB0BE71D97
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Dec 2017 16:14:22 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id i40so36838461qti.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Dec 2017 08:14:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=P4PyQRyakmhHfw/XfLud0j7CstL3OneghB2YJftWrro=;
	b=bNr8yuchEH20wa5surRR7Y3zJo+O5q7ZyaJ/EKveB58l2KsmJsi65Di0yoZ16Za8UF
	0l0EOTR0M14QxCgey9rLWqdXDyV8Yk4lT2DgA1xVfjbnV2hrrLs1D5jM3vx0LU++Here
	uces7yL+y6TUwsqNBqnP/8TbTmm5lQojPAwcwCx+H1+iY1t3rdRDZmbXxl/5qsuPPZLB
	jmkMuNwZSFKHdA9+5Om1HKdoRYHymFAjS7ZMcmj8TQo73hPpULYwEb5nWx6S+2e5afBb
	p06RycYt6EJDf/BWfa+tH0Ldb2/cixIbAX8nlCE7YIzvdaI2cLCdn3ZlzACBrtlaQJxi
	nr8Q==
X-Gm-Message-State: AKGB3mJmxGeb+YxqCQ8/nUbPYmzjH9gaoQv/BQBQXy6XLpnNj80GIXfs
	1V6Tp3CjtXxeHuoeLuNsoxyN5TC+
X-Google-Smtp-Source: ACJfBosKVm+U8VIrICOGGjNaD9XW6UPwOMLIbHChq0oJ8HJnvanGTsB3DuPwE+Dx47r574VKhMXwHg==
X-Received: by 10.200.40.189 with SMTP id i58mr21111841qti.128.1513959263580; 
	Fri, 22 Dec 2017 08:14:23 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id g9sm14568701qtg.2.2017.12.22.08.14.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Dec 2017 08:14:23 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Dec 2017 11:14:11 -0500
Message-Id: <1513959251-12557-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Cc: Derek Straka <derek@asterius.io>
Subject: [PATCH] python3-git: update to 2.1.8
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
X-List-Received-Date: Fri, 22 Dec 2017 16:14:23 -0000

python3-git was updated to the latest stable version

Tested on qemux86-64 using core-image-minimal

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta/recipes-devtools/python/python-git.inc                           | 4 ++--
 .../python/{python3-git_2.1.7.bb => python3-git_2.1.8.bb}             | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-git_2.1.7.bb => python3-git_2.1.8.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-git.inc b/meta/recipes-devtools/python/python-git.inc
index 7b0707e..bef08eb 100644
--- a/meta/recipes-devtools/python/python-git.inc
+++ b/meta/recipes-devtools/python/python-git.inc
@@ -12,8 +12,8 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi
 
-SRC_URI[md5sum] = "a63fdd2a650694ea23e268fd0c952034"
-SRC_URI[sha256sum] = "13c7cd99c2bf277fc99accfc25148752fa90e7cc6c6d08a3f01d229dacb461d9"
+SRC_URI[md5sum] = "7a94ee1b923fb772a2a0c6649430a17c"
+SRC_URI[sha256sum] = "ad61bc25deadb535b047684d06f3654c001d9415e1971e51c9c20f5b510076e9"
 
 DEPENDS = "${PYTHON_PN}-gitdb"
 
diff --git a/meta/recipes-devtools/python/python3-git_2.1.7.bb b/meta/recipes-devtools/python/python3-git_2.1.8.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-git_2.1.7.bb
rename to meta/recipes-devtools/python/python3-git_2.1.8.bb
-- 
2.7.4


