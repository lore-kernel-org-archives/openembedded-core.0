Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id ABB087F23A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 21:56:52 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id x10so2276508pgi.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 14:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yO3wL+2Fupvw/OsRrN+KUzcPylsMKa17pfDX8uZ8uMg=;
	b=nSnFXoKr5aCseHoHQjPDFJI1dN0LqwUvcqzoy8p90BfDo8FcLh0hr8hehLmPyAkNAM
	cp9kWsSSk7fMlXh0BkIX9EQgx7Z2ZWcw/65Ax9X+tR7eZiFVaR0MPxECOvJdDizUPJo9
	ZhNbcNHEmF+OyIDN1RYDqLYRaLGQrI473FVLuYjlDYaNoBtKahJ1fq+gVpTjE5PifwDA
	ymKyMJ8b/Ckh+4pzA9rHRn0MiLfe5RxUZQ/o3a/TYqEXGULYbQOIdhK5lNSLmRaUfWVg
	X0xxQm5ZFTEFQ4pl+q6SPy5WyYOUxYjiR4PFiG2hEY3BZEtr/b9x9iRjOyLYzVfDacbr
	UQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yO3wL+2Fupvw/OsRrN+KUzcPylsMKa17pfDX8uZ8uMg=;
	b=E3rBsVhlVCm7d7bSE8sh6YQg0Cka/E9nldFraOqF7dibztj0lwbhN2Vaio5i7TfgU3
	CK1dQG7TagKLpGnv2mS7ZF9KwNKMyCC6mxgsJytDMbj+BqF/fGuzwdefFDCVr9n4nB6A
	uJ20WX1RQhS1C7m5xMawJaFaquqo1s8PFdY2Ilp7n+CX6fZ7seFnmpjd1+5BztcPlHWh
	y+9GWzgza50vGSmjJsQRsHrBE5lZNKvVirUEWoDOX6Svg3XEG7PzB3dbKj1Jow1hOAdU
	Q+B8eoRH9KjHa++v4n1rKUssxXDZzSPEnpu/EFm6zNKNauvNL1e+62cyZv53EeP14d09
	XRlg==
X-Gm-Message-State: APjAAAXBzc5gE0EKgfv3+3/BLHOqgcVer0vDKv46DhKD/OjhXel78qQ+
	6wdkV62+/jO/PPgD+JelPqssasXTzxg=
X-Google-Smtp-Source: APXvYqxXhyQsgF72DgwUhsmyo+Szqitm3rZjqy0WPnYjUOSPOHkDrbh8H1cm2olYiXU6j5tdWz1R6A==
X-Received: by 2002:a65:5c0b:: with SMTP id u11mr5639969pgr.294.1569535012731; 
	Thu, 26 Sep 2019 14:56:52 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id 64sm256232pfx.31.2019.09.26.14.56.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 26 Sep 2019 14:56:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Sep 2019 14:56:42 -0700
Message-Id: <20190926215642.2906506-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] strace: Upgrade to 5.3
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
X-List-Received-Date: Thu, 26 Sep 2019 21:56:52 -0000
Content-Transfer-Encoding: 8bit

Detailed features are here [1]

[1] https://github.com/strace/strace/releases/tag/v5.3

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../strace/strace/disable-git-version-gen.patch        | 10 +++++-----
 .../strace/{strace_5.2.bb => strace_5.3.bb}            |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/strace/{strace_5.2.bb => strace_5.3.bb} (93%)

diff --git a/meta/recipes-devtools/strace/strace/disable-git-version-gen.patch b/meta/recipes-devtools/strace/strace/disable-git-version-gen.patch
index d6354bf4b6..5fefff33e9 100644
--- a/meta/recipes-devtools/strace/strace/disable-git-version-gen.patch
+++ b/meta/recipes-devtools/strace/strace/disable-git-version-gen.patch
@@ -1,4 +1,4 @@
-From ed30a4fc4dc264ce5f5881462e03ae13c921bfed Mon Sep 17 00:00:00 2001
+From 3bc47502ab011ea8d7c9cd724b25174ecd9506bc Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Mon, 18 Jan 2016 13:33:50 -0800
 Subject: [PATCH] strace: remove need for scripts
@@ -16,20 +16,20 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 8045ebd..4319709 100644
+index 949b058..4ba989c 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -12,12 +12,12 @@
  
  AC_PREREQ(2.57)
  AC_INIT([strace],
--	m4_esyscmd([./git-version-gen .tarball-version]),
+-	st_esyscmd_s([./git-version-gen .tarball-version]),
 +	m4_esyscmd_s([cat .tarball-version]),
  	[strace-devel@lists.strace.io],
  	[strace],
  	[https://strace.io])
--m4_define([copyright_year], m4_esyscmd([./copyright-year-gen .year]))
--m4_define([manpage_date], m4_esyscmd([./file-date-gen strace.1.in]))
+-m4_define([copyright_year], st_esyscmd_s([./copyright-year-gen .year]))
+-m4_define([manpage_date], st_esyscmd_s([./file-date-gen strace.1.in]))
 +m4_define([copyright_year], m4_esyscmd_s([cat .year]))
 +m4_define([manpage_date], m4_esyscmd_s([cat .strace.1.in.date]))
  AC_COPYRIGHT([Copyright (c) 1999-]copyright_year[ The strace developers.])
diff --git a/meta/recipes-devtools/strace/strace_5.2.bb b/meta/recipes-devtools/strace/strace_5.3.bb
similarity index 93%
rename from meta/recipes-devtools/strace/strace_5.2.bb
rename to meta/recipes-devtools/strace/strace_5.3.bb
index a16c3b8598..775a22fc62 100644
--- a/meta/recipes-devtools/strace/strace_5.2.bb
+++ b/meta/recipes-devtools/strace/strace_5.3.bb
@@ -15,8 +15,8 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch \
            file://ptest-spacesave.patch \
            "
-SRC_URI[md5sum] = "b9c02b07dcde5125498ce7da69b77baf"
-SRC_URI[sha256sum] = "d513bc085609a9afd64faf2ce71deb95b96faf46cd7bc86048bc655e4e4c24d2"
+SRC_URI[md5sum] = "84f5e72de813c9b1bb6057ee8ab428d8"
+SRC_URI[sha256sum] = "6c131198749656401fe3efd6b4b16a07ea867e8f530867ceae8930bbc937a047"
 
 inherit autotools ptest
 
-- 
2.23.0


