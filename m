Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4AF2C7D2BB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 16:19:27 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 10so853433wmk.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 09:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yW2NdPhDEhew6ipmA7mzFCbLrdc8jqvnASgHvUBGL0Q=;
	b=OcqwIh5DmUUIVKX++xC/mQgCEylC+SI8WqpYHDjij7q3GeY1aPRG3M4hX/fTPH13Jg
	JpMjzfkib/Z+Cdrn6V+wGJCxtoJkHV137GsbgMkWHPHAp7opYc6zfkTTIOmtT70Wd+++
	Ju56rJ1qOMO+ivBbcIAh6Oe1tOK3qXW8aWyPZ16QPQQ9A36ZXNzMiAc/PvQVun+3OQB8
	1svCBVMMXiioYKld6AlgpxXrBBrjY0PfkVlHx7bkLg9UqahYBmA1Tfa+DbCPRgJylLPw
	6Atmin2iP0KMV0HVCvT/BDCGotY6Ax7yBWU2zJb4Gje4luVS5T8agaRjkuse2mwSS8SA
	bOdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yW2NdPhDEhew6ipmA7mzFCbLrdc8jqvnASgHvUBGL0Q=;
	b=r/FG5PmzZ/ruBJeeuHkla1OyImUjGvbjJWrclcl+iQpIWYjm6ctuw6KuYkxFNneeoy
	HioFqFP7BCDBixeblMz3iCriRHa+aSwxkAJGqFaPkOg2ao4zKRsB5k/OY7MMM15brOYl
	yOukUuJSB3xwaSazEWO6bW8WhqZwjuYa8kPhiWwXvaRbKFkJIvR4gBvpTbi3JbRWqR5s
	RQPEJ0QmLTZNDhNqNycVFDIEwJKgFjk5cfvuPcwYMjopJb8crgF86tQKlUBPZNktjieW
	4Pbv3/KpKl6Q5aybYPNZKubdWhPr3kChdWlN1PZroqPy6TWbSxaX/ceuCph724W4k0bF
	Ireg==
X-Gm-Message-State: APjAAAXBBbhFU75vFPZBmHW8eN/uAGGBvHtLn6AoNipURnVLw4Y+KIbF
	1uSt8tMR33pnGZ55FZGkSkomMndqwuc=
X-Google-Smtp-Source: APXvYqzd4o/jtj3J7p89+BlJfsCkruw3ruHGBrl8Zont+sAn5OjTINZmoyChPIk+iasJLHoxVeETnA==
X-Received: by 2002:a1c:c74b:: with SMTP id x72mr2822583wmf.151.1556036367992; 
	Tue, 23 Apr 2019 09:19:27 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	t76sm22599142wmt.8.2019.04.23.09.19.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 09:19:27 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Apr 2019 18:19:11 +0200
Message-Id: <20190423161916.25572-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190423161916.25572-1-alex.kanavin@gmail.com>
References: <20190423161916.25572-1-alex.kanavin@gmail.com>
Subject: [PATCH 4/9] python-scons: update to 3.0.5
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
X-List-Received-Date: Tue, 23 Apr 2019 16:19:27 -0000

Do not use the latest pypi tarball, as it lacks several files (the LICENSE, for instance).

License-update: copyright years.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...s-native_3.0.1.bb => python-scons-native_3.0.5.bb} |  0
 .../{python-scons_3.0.1.bb => python-scons_3.0.5.bb}  | 11 +++++++----
 2 files changed, 7 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python-scons-native_3.0.1.bb => python-scons-native_3.0.5.bb} (100%)
 rename meta/recipes-devtools/python/{python-scons_3.0.1.bb => python-scons_3.0.5.bb} (51%)

diff --git a/meta/recipes-devtools/python/python-scons-native_3.0.1.bb b/meta/recipes-devtools/python/python-scons-native_3.0.5.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-scons-native_3.0.1.bb
rename to meta/recipes-devtools/python/python-scons-native_3.0.5.bb
diff --git a/meta/recipes-devtools/python/python-scons_3.0.1.bb b/meta/recipes-devtools/python/python-scons_3.0.5.bb
similarity index 51%
rename from meta/recipes-devtools/python/python-scons_3.0.1.bb
rename to meta/recipes-devtools/python/python-scons_3.0.5.bb
index d5084b2d16f..939c15bcc63 100644
--- a/meta/recipes-devtools/python/python-scons_3.0.1.bb
+++ b/meta/recipes-devtools/python/python-scons_3.0.5.bb
@@ -1,15 +1,18 @@
 SUMMARY = "Software Construction tool (make/autotools replacement)"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=46ddf66004e5be5566367cb525a66fc6"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=37bb53a08e6beaea0c90e7821d731284"
 
-SRC_URI[md5sum] = "b6a292e251b34b82c203b56cfa3968b3"
-SRC_URI[sha256sum] = "24475e38d39c19683bc88054524df018fe6949d70fbd4c69e298d39a0269f173"
+SRC_URI = "${SOURCEFORGE_MIRROR}/scons/scons-${PV}.tar.gz"
+SRC_URI[md5sum] = "9f9c163e8bd48cf8cd92f03e85ca6395"
+SRC_URI[sha256sum] = "df676f23dc6d4bfa384fc389d95dcd21ab907e6349d4c848958ba4befb73c73e"
+
+S = "${WORKDIR}/scons-${PV}"
 
 UPSTREAM_CHECK_URI = "http://scons.org/pages/download.html"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
 
-inherit pypi setuptools
+inherit setuptools
 
 RDEPENDS_${PN} = "\
   python-fcntl \
-- 
2.17.1


