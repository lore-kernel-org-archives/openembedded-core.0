Return-Path: <raj.khem@gmail.com>
Received: from mail-ot0-f194.google.com (mail-ot0-f194.google.com
	[74.125.82.194])
	by mail.openembedded.org (Postfix) with ESMTP id 334D37722B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 18:00:25 +0000 (UTC)
Received: by mail-ot0-f194.google.com with SMTP id f9so12722355otd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 10:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=m0RvyGWPHvwJM/Ftlkj5ML6jvxrIddvuUuUaoF2cEvQ=;
	b=VESRWIvsszSsN6wkhP6hnqoAEheS0CpCNkynvUZ9ZsP+Z0I2sTN/wl7DfuSGKv3tdp
	UcytoIZCjIAZPPTua+GisD/003wc8WHHfoodrQsDToXgU9Xe7ffijnfVIMpFstZQ1BcR
	ZcuxM+ytJBuc2sSBym/w2qs3KQSwuS+zx8C3ArjA8J1g/lMecGDlJAM35hivYwkgyJDj
	lQQPvuy66UWc++QIy+JS76Wpu3H3CbcLjKvGYxpquJ4jA17JWzpreWiz6A9iCrd2cCmn
	BkF2+AjtgImRszqMb+r1cwk2woS5uh/ZXx6EQe1gT3J8ZszUjB8SSEgfEyUGWWY05gUN
	Miaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=m0RvyGWPHvwJM/Ftlkj5ML6jvxrIddvuUuUaoF2cEvQ=;
	b=FnLMK/Dx0MxhNYrS2FJB44Rvy4Kzh0JyzHS3efI3wMVT8gm7RbEx4yN1btDlZ7tDdR
	9qN26/UHGH5QAGSnqgMwEvpzHNTtjf2/QaRudxzm+HaxNp5YZMzH6o4yoLi3FN4XzLvC
	Q6z98Nznkjt2AHOtXSRe4ecBqqJWGPDi4lTU+hcAaWx/pPR9g91dHqQ9bvoyP7AK0ZQc
	BktCqV3RkzF8KMjIUiZ2LxZh37WECtj7gLPSRZZfXrqGa3kgA22QCadgukY+fApLBQVo
	vARogp1CddbcCqIvGy06fjLYyv3cQulE8KowxFsT653b2WulQCyfoNNRZphDplpKJ+o/
	FdCA==
X-Gm-Message-State: AMke39nug5nykzth9srQdUD9Yd5TlAssDs3yKD/qFL+mLDF+2jN3i/BdnOb2dISDnHhj0w==
X-Received: by 10.98.66.82 with SMTP id p79mr27372345pfa.10.1487008825912;
	Mon, 13 Feb 2017 10:00:25 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	s21sm15995127pgg.65.2017.02.13.10.00.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Feb 2017 10:00:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Feb 2017 10:00:12 -0800
Message-Id: <20170213180012.14077-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <20170213180012.14077-1-raj.khem@gmail.com>
References: <20170213180012.14077-1-raj.khem@gmail.com>
Subject: [PATCH 3/3] gmp: Update to 6.1.2
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
X-List-Received-Date: Mon, 13 Feb 2017 18:00:26 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Append-the-user-provided-flags-to-the-auto-detected-.patch  | 0
 .../0001-confiure.ac-Believe-the-cflags-from-environment.patch       | 0
 meta/recipes-support/gmp/{gmp-6.1.1 => gmp-6.1.2}/amd64.patch        | 0
 .../gmp/{gmp-6.1.1 => gmp-6.1.2}/use-includedir.patch                | 0
 meta/recipes-support/gmp/{gmp_6.1.1.bb => gmp_6.1.2.bb}              | 5 ++---
 5 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-support/gmp/{gmp-6.1.1 => gmp-6.1.2}/0001-Append-the-user-provided-flags-to-the-auto-detected-.patch (100%)
 rename meta/recipes-support/gmp/{gmp-6.1.1 => gmp-6.1.2}/0001-confiure.ac-Believe-the-cflags-from-environment.patch (100%)
 rename meta/recipes-support/gmp/{gmp-6.1.1 => gmp-6.1.2}/amd64.patch (100%)
 rename meta/recipes-support/gmp/{gmp-6.1.1 => gmp-6.1.2}/use-includedir.patch (100%)
 rename meta/recipes-support/gmp/{gmp_6.1.1.bb => gmp_6.1.2.bb} (88%)

diff --git a/meta/recipes-support/gmp/gmp-6.1.1/0001-Append-the-user-provided-flags-to-the-auto-detected-.patch b/meta/recipes-support/gmp/gmp-6.1.2/0001-Append-the-user-provided-flags-to-the-auto-detected-.patch
similarity index 100%
rename from meta/recipes-support/gmp/gmp-6.1.1/0001-Append-the-user-provided-flags-to-the-auto-detected-.patch
rename to meta/recipes-support/gmp/gmp-6.1.2/0001-Append-the-user-provided-flags-to-the-auto-detected-.patch
diff --git a/meta/recipes-support/gmp/gmp-6.1.1/0001-confiure.ac-Believe-the-cflags-from-environment.patch b/meta/recipes-support/gmp/gmp-6.1.2/0001-confiure.ac-Believe-the-cflags-from-environment.patch
similarity index 100%
rename from meta/recipes-support/gmp/gmp-6.1.1/0001-confiure.ac-Believe-the-cflags-from-environment.patch
rename to meta/recipes-support/gmp/gmp-6.1.2/0001-confiure.ac-Believe-the-cflags-from-environment.patch
diff --git a/meta/recipes-support/gmp/gmp-6.1.1/amd64.patch b/meta/recipes-support/gmp/gmp-6.1.2/amd64.patch
similarity index 100%
rename from meta/recipes-support/gmp/gmp-6.1.1/amd64.patch
rename to meta/recipes-support/gmp/gmp-6.1.2/amd64.patch
diff --git a/meta/recipes-support/gmp/gmp-6.1.1/use-includedir.patch b/meta/recipes-support/gmp/gmp-6.1.2/use-includedir.patch
similarity index 100%
rename from meta/recipes-support/gmp/gmp-6.1.1/use-includedir.patch
rename to meta/recipes-support/gmp/gmp-6.1.2/use-includedir.patch
diff --git a/meta/recipes-support/gmp/gmp_6.1.1.bb b/meta/recipes-support/gmp/gmp_6.1.2.bb
similarity index 88%
rename from meta/recipes-support/gmp/gmp_6.1.1.bb
rename to meta/recipes-support/gmp/gmp_6.1.2.bb
index 614d21ab7d..5e65075585 100644
--- a/meta/recipes-support/gmp/gmp_6.1.1.bb
+++ b/meta/recipes-support/gmp/gmp_6.1.2.bb
@@ -14,9 +14,8 @@ SRC_URI = "https://gmplib.org/download/${BPN}/${BP}${REVISION}.tar.bz2 \
            file://0001-Append-the-user-provided-flags-to-the-auto-detected-.patch \
            file://0001-confiure.ac-Believe-the-cflags-from-environment.patch \
            "
-
-SRC_URI[md5sum] = "4c175f86e11eb32d8bf9872ca3a8e11d"
-SRC_URI[sha256sum] = "a8109865f2893f1373b0a8ed5ff7429de8db696fc451b1036bd7bdf95bbeffd6"
+SRC_URI[md5sum] = "8ddbb26dc3bd4e2302984debba1406a5"
+SRC_URI[sha256sum] = "5275bb04f4863a13516b2f39392ac5e272f5e1bb8057b18aec1c9b79d73d8fb2"
 
 acpaths = ""
 
-- 
2.11.1


