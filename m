Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id A043F74743
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 12:29:20 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id 93-v6so4753552qks.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 05:29:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dUqIQGiUeTBu3wq2nP1GS6Hw3PuWAzpk4aFPgnYyr3c=;
	b=VCxXcNtIUcaSnK8baOt+qgZvfOzvDQo4SKHLpNrQQ4AXvdVquyN5fgBkx+PPrrm++f
	9IEDAarHIVzctPquOO7ixDsJdsD5kDbkeRZqIBbXAJYQRVjPt6QL/m17KsECC0Pu3MG4
	4LF9xVmxzttex+nQ09shY9XRz9aqZgIVioBbm8e9xdWW7MkLndIu1g3t0PrwsZ8SsClX
	cxIx+op+0aXGPA85i0fHXcw1z3DfcIAG5cGM4Cd/t2yPSmHvHdgjwCizEUDvaU7PkgOT
	gqVtZqbQ7vRX+d+YMzRIQRIE7KT5z5Rx6w8mLeB9FmLT8wg/W0sOYI8D5AHY3QHUFjJC
	Plbw==
X-Gm-Message-State: AOUpUlHzknhFQwIVYvsp+/r9eh9bjlQwlVQC0yiCuDLeRLaZpM5wloey
	ecebrRTYI4pMw2lJXXe9HFYNcka2
X-Google-Smtp-Source: ANB0VdZd0dBdtT/fFocLmVpcnhEXVdQ95ap7DMFE49pvBumL8vBJiGBkCPeT6p1tHsDM1TW58qsCWQ==
X-Received: by 2002:a37:1968:: with SMTP id
	k101-v6mr2992359qkh.270.1534508961142; 
	Fri, 17 Aug 2018 05:29:21 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	w39-v6sm1302644qtk.74.2018.08.17.05.29.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Aug 2018 05:29:20 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2018 08:29:14 -0400
Message-Id: <1534508954-13165-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python3-git: update to version 2.1.11
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
X-List-Received-Date: Fri, 17 Aug 2018 12:29:20 -0000

Update to the latest stable release

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta/recipes-devtools/python/python-git.inc                           | 4 ++--
 .../python/{python3-git_2.1.10.bb => python3-git_2.1.11.bb}           | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-git_2.1.10.bb => python3-git_2.1.11.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-git.inc b/meta/recipes-devtools/python/python-git.inc
index 5a4d8ff..7ccf168 100644
--- a/meta/recipes-devtools/python/python-git.inc
+++ b/meta/recipes-devtools/python/python-git.inc
@@ -12,8 +12,8 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi
 
-SRC_URI[md5sum] = "e0c773be32ba9cb57a1d703b590f6d3f"
-SRC_URI[sha256sum] = "b60b045cf64a321e5b620debb49890099fa6c7be6dfb7fb249027e5d34227301"
+SRC_URI[md5sum] = "cee43a39a1468084d49d1c49fb675204"
+SRC_URI[sha256sum] = "8237dc5bfd6f1366abeee5624111b9d6879393d84745a507de0fda86043b65a8"
 
 DEPENDS = "${PYTHON_PN}-gitdb"
 
diff --git a/meta/recipes-devtools/python/python3-git_2.1.10.bb b/meta/recipes-devtools/python/python3-git_2.1.11.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-git_2.1.10.bb
rename to meta/recipes-devtools/python/python3-git_2.1.11.bb
-- 
2.7.4


