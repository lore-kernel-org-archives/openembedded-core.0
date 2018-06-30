Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 593E16FF7F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jun 2018 09:27:15 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id b129-v6so6280471qke.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jun 2018 02:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7kS0X3FejdeI9NK1kn1kz8m/w8t0xJme1vK2Ku8CXcw=;
	b=oEh/cbHdIX6eYJU5HG2xraaWQGUvcIuBjQ8P2sQZ/KwZx46Ai4VTV7Ww2+F4q2WAvR
	ozNoFmrjLGdvxSMgxOR8+xneUczYb2ZqwRP2/YpDm/tUlD3ce5CtaIQbmI7SDegyMFQ/
	SqJm52w1TNgjcnO6ao7Mn6G1oIKhc7ob26QYTYQxlziO2jny9uTtuGgxutOKZvniYT9U
	Tgx9xDvs9giY/QRBbmKdhMBQeLZ6kbisbnGPrPPb+019jRQHH8GJsEUJrmkFd6GZXFkd
	2MlIRMqdOSPhVvEfry5ZXb39PHrBiE8bDRvFXJGSw07CG6SpFenUtvyrFTwOVibGr27a
	0WQg==
X-Gm-Message-State: APt69E3N+W8WwNOG2xvrsv7HmMz0AZkTa5LUSy1CS+JAHSAU7owaumpv
	LMtls7v1DtaPWDwF4dAmE1TPQ1Un
X-Google-Smtp-Source: AAOMgpePMyw2nB94CF4YX//5OkyPAS3DhBFgz2u7eaZpYRhGK1E8W8leMt3Ek9EbWJjeGekrHJEPMQ==
X-Received: by 2002:a37:9f4c:: with SMTP id
	i73-v6mr15615527qke.136.1530350835787; 
	Sat, 30 Jun 2018 02:27:15 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-100-33-240-84.nycmny.fios.verizon.net. [100.33.240.84])
	by smtp.gmail.com with ESMTPSA id
	f4-v6sm7351852qti.83.2018.06.30.02.27.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 30 Jun 2018 02:27:15 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Sat, 30 Jun 2018 05:27:03 -0400
Message-Id: <1530350823-15237-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python3-git: update to 2.1.10
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
X-List-Received-Date: Sat, 30 Jun 2018 09:27:15 -0000

python3-git was updated to the latest stable version

Tested on qemux86-64 using core-image-minimal

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta/recipes-devtools/python/python-git.inc                           | 4 ++--
 .../python/{python3-git_2.1.8.bb => python3-git_2.1.10.bb}            | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-git_2.1.8.bb => python3-git_2.1.10.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-git.inc b/meta/recipes-devtools/python/python-git.inc
index 8d37693..5a4d8ff 100644
--- a/meta/recipes-devtools/python/python-git.inc
+++ b/meta/recipes-devtools/python/python-git.inc
@@ -12,8 +12,8 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi
 
-SRC_URI[md5sum] = "7a94ee1b923fb772a2a0c6649430a17c"
-SRC_URI[sha256sum] = "ad61bc25deadb535b047684d06f3654c001d9415e1971e51c9c20f5b510076e9"
+SRC_URI[md5sum] = "e0c773be32ba9cb57a1d703b590f6d3f"
+SRC_URI[sha256sum] = "b60b045cf64a321e5b620debb49890099fa6c7be6dfb7fb249027e5d34227301"
 
 DEPENDS = "${PYTHON_PN}-gitdb"
 
diff --git a/meta/recipes-devtools/python/python3-git_2.1.8.bb b/meta/recipes-devtools/python/python3-git_2.1.10.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-git_2.1.8.bb
rename to meta/recipes-devtools/python/python3-git_2.1.10.bb
-- 
2.7.4


