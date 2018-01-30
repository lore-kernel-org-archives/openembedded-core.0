Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id CCF9578869
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 03:05:05 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id k201so8386803qke.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 19:05:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zoowTZ0Lsvyye7Uudm6ibYd6FPJpd4oWW/KrKNNpXNA=;
	b=Or+p8WxGdA8oJ8uPFSp3TIu5WUNcxQCTowUHNyQ8JfAmLur+9nnIGNgRvzn8y7nmEf
	KT3gYpdia7jNZt1MwJEuwKmXw7SocBu4YD26f7LxvBgQLZupZJfIFX8TYAPnMP1e5VS9
	0yYbTFMgWggVlKfMuWFOYI0PpML58Zdim5W+PN97bAfQnxwL/BBYh8KwkT0dUWjHS3aR
	jaWgSvHpKwCFpJY4KlupQrT9sZl7589hbD2IL7wx+rraWkxXW2n/s8W7vAPpeab7FqS1
	PhR55vmb+El2Q/NNzClzOVKlJzsT0TuL2y+yiSclETiysajNhbpUP42jJowAi8Kn/oob
	P8dw==
X-Gm-Message-State: AKwxytcsrECc0DgtQtQ9xBT73j7QFeBgg+6AeIqlpp+xLwfBrS2t3Z09
	GkbZ2IbPGBHf7mK4yD+f3ZHKP18e
X-Google-Smtp-Source: AH8x225RCXKeE73gXb68qBfYpDcQixV2p4DfpFW2T6OWl4zT8315DW164+bcWcEK3alCi9UO++fAXg==
X-Received: by 10.55.158.5 with SMTP id h5mr38410764qke.284.1517281506531;
	Mon, 29 Jan 2018 19:05:06 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	c12sm9635948qka.17.2018.01.29.19.05.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 Jan 2018 19:05:06 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jan 2018 22:04:40 -0500
Message-Id: <1517281480-10598-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1517281480-10598-1-git-send-email-derek@asterius.io>
References: <1517281480-10598-1-git-send-email-derek@asterius.io>
Subject: [PATCH 2/2] python2-manifest: update the manifest file for python 2.7.14
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
X-List-Received-Date: Tue, 30 Jan 2018 03:05:05 -0000

The manifest file was not regenerated when the package was updated.

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta/recipes-devtools/python/python/python2-manifest.json | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python/python2-manifest.json b/meta/recipes-devtools/python/python/python2-manifest.json
index 03d4bbd..723e513 100644
--- a/meta/recipes-devtools/python/python/python2-manifest.json
+++ b/meta/recipes-devtools/python/python/python2-manifest.json
@@ -680,6 +680,7 @@
             "${libdir}/python2.7/cgi.py"
         ],
         "rdepends": [
+            "compression",
             "contextlib",
             "core",
             "crypt",
@@ -692,7 +693,8 @@
             "shell",
             "textutils",
             "threading",
-            "unixadmin"
+            "unixadmin",
+            "zlib"
         ],
         "summary": "Python Internet Protocol servers"
     },
@@ -838,9 +840,11 @@
             "${libdir}/python2.7/shutil.py"
         ],
         "rdepends": [
+            "compression",
             "core",
             "io",
-            "unixadmin"
+            "unixadmin",
+            "zlib"
         ],
         "summary": "Python shell-like functionality"
     },
-- 
2.7.4


