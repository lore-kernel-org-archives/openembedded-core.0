Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
	[209.85.208.169])
	by mail.openembedded.org (Postfix) with ESMTP id D1A1A7D2CC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 14:44:41 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id k2so2893024lje.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 07:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=kA43mMeSeNsrq3HfwouaKSKO6EtnNbh0aHPweJyKeew=;
	b=uQ/eVRajy863g8rqrm94EH5rgOw1hE46vPVSm4qVQD7gEHkLNYsfmEWxXcMNCNLpMs
	zklamKVBVlu0jGjpsZZUCHIoYzUlZeoWy3BNm6haWKo3VEue7GrY80WI925pCKy8UmTD
	RooWSFkvC2K4oyHhhPt/FvvCvcVSMP0DWx1Z4i2nn9FGwKOR37/nxe0jy4G413eANR9x
	Yy4oq1dddyUOfJfKcrOoL9PfuMHTi2hAJ1fFt1kcYQ/AO3/3kzhwkSYWpVACPHGLg8oS
	jh4vQq8WDeqjcN5iqVXHJqePMCX7zUUp9YNwjeRgnx7XLjlV18Nd7emg58mEH7d5i/M5
	P9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kA43mMeSeNsrq3HfwouaKSKO6EtnNbh0aHPweJyKeew=;
	b=sFSgf3Zpg5ZHQvTzMwRUk12ROl5lML2qZYYvF+gbrWF2MaaNMrVOs4zW/fBzF4v1Cy
	7Ygf3SvZ/WaJ6Ul8dM91LGPLiJbh9AEZxTneWFXpxLJXu4wlw5mRd8N2U1iemFHf3U7t
	KP5jSJE+UBOhQhSARe/mh+XIAGDceXTPvx3LWjezo7V9z+PSodK4jvfVmpClwhs+xBLc
	xf9AsirdSEOyqYh4oYuxCbqEgYqKnXiHqKjstsn2fpgbqPrDepnn8UMdrNpOtqmcIn8O
	DWSDhmAaS82ubS9K5oPWgFVBuVsYuC0s67QSe0HNoa18yUgAt1RU44VzOgQ1xqDfvGCL
	LecA==
X-Gm-Message-State: APjAAAVkukaSVNg4zBbyKiF/y4KyLUKBJ1Uh0NJfWbsZX675oa8JwQEj
	SBMtW5uJ8BPlg5EL5H5SPhZcZ/6gz0w=
X-Google-Smtp-Source: APXvYqxq33vp6aVtc1IL5fB/FECdqmJkvpZG4Ztxf2gL8Omi4K2nmjZWxvKh/RIMXh/yrt32+Vhjkw==
X-Received: by 2002:a2e:7d19:: with SMTP id y25mr7318003ljc.126.1556117081907; 
	Wed, 24 Apr 2019 07:44:41 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	v26sm3978682lja.60.2019.04.24.07.44.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Apr 2019 07:44:41 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2019 16:44:38 +0200
Message-Id: <20190424144438.26001-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] ninja: add Upstream-Status and SOB for musl patch
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
X-List-Received-Date: Wed, 24 Apr 2019 14:44:42 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-devtools/ninja/ninja/fix-musl.patch | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/ninja/ninja/fix-musl.patch b/meta/recipes-devtools/ninja/ninja/fix-musl.patch
index 543d4f1c48..7fd779110d 100644
--- a/meta/recipes-devtools/ninja/ninja/fix-musl.patch
+++ b/meta/recipes-devtools/ninja/ninja/fix-musl.patch
@@ -1,18 +1,22 @@
-2ff54ad7478a90bd75c91e434236a Mon Sep 17 00:00:00 2001
+From e92a915183f8bff268f74c8cd00d986301a2bbf8 Mon Sep 17 00:00:00 2001
 From: makepost <makepost@firemail.cc>
 Date: Mon, 24 Dec 2018 03:13:16 +0200
 Subject: [PATCH] Use st_mtim if st_mtime is macro, fix #1510
 
 In POSIX.1-2008, sys_stat has a st_mtim member and a st_mtime backward
 compatibility macro. Should help avoid hardcoding platform detection.
+
+Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
+
+Upstream-Status: Pending
 ---
  src/disk_interface.cc | 14 ++++----------
  1 file changed, 4 insertions(+), 10 deletions(-)
 
 diff --git a/src/disk_interface.cc b/src/disk_interface.cc
-index d4c2fb087..dc297c449 100644
---- src/disk_interface.cc
-+++ /src/disk_interface.cc
+index d4c2fb0..dc297c4 100644
+--- a/src/disk_interface.cc
++++ b/src/disk_interface.cc
 @@ -202,19 +202,13 @@ TimeStamp RealDiskInterface::Stat(const string& path, string* err) const {
    // that it doesn't exist.
    if (st.st_mtime == 0)
@@ -37,3 +41,6 @@ index d4c2fb087..dc297c449 100644
  #else
    return (int64_t)st.st_mtime * 1000000000LL + st.st_mtimensec;
  #endif
+-- 
+2.17.1
+
-- 
2.17.1


