Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 46DBA73744
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Feb 2015 02:32:29 +0000 (UTC)
Received: by iecar1 with SMTP id ar1so1439883iec.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Feb 2015 18:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0clXj4/HU1jNY5+ZDsUDG8TaB5AOp2H3gNSJVzsDPn4=;
	b=ViSLzcj69Ou5nCBcM2XNAiTt4xq35GU8OuyMn3WWUyvERrW0W9O70Gb5K+oqa0TsUl
	hx1BxllK3SPd0OOsFo0EUKF1uXvlXUx0Cid8K2/04lW5baUiwrlLDHTTMfjeM7udXk2G
	E+FxfWvnPK7RQDevHOKk9TnJrA0SH3Gk6jlFLAC13htGAPnTCSbk3Cw3kMsM2/xuBXNG
	H6M39/Dw/OvBjK7LatRWjSqOZG+CQLATEpeeoNpOPtPqW9eFQwJePsLd+1zUqN6DOnX2
	5pdei5MnV6pYziE6AEmIpEIybbdd/Rw+2yNWV7tMJb3XpSvJRkDltahXNZngM8G0+gEA
	KwQg==
X-Received: by 10.42.58.139 with SMTP id i11mr1452963ich.68.1424831551077;
	Tue, 24 Feb 2015 18:32:31 -0800 (PST)
Received: from kraj-ch2e.sys.comcast.net (a-96-119-88-205.sys.comcast.net.
	[96.119.88.205]) by mx.google.com with ESMTPSA id
	f12sm24302381ioi.21.2015.02.24.18.32.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 Feb 2015 18:32:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Feb 2015 02:31:56 +0000
Message-Id: <1424831516-15260-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1424831516-15260-1-git-send-email-raj.khem@gmail.com>
References: <1424831516-15260-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/2] libgpg-error: Upgrade 1.17 -> 1.18
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
X-List-Received-Date: Wed, 25 Feb 2015 02:32:32 -0000

License checksums changed due to year change

-   Copyright (C) 2003, 2004, 2010, 2013, 2014 g10 Code GmbH
+   Copyright (C) 2003, 2004, 2010, 2013, 2014, 2015 g10 Code GmbH

Change-Id: I870446796cf9ffe3acae7aeeac2d96d6305d4186
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libgpg-error/{libgpg-error_1.17.bb => libgpg-error_1.18.bb}    | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.17.bb => libgpg-error_1.18.bb} (87%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.17.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.18.bb
similarity index 87%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.17.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.18.bb
index c905bd1..9501b67 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.17.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.18.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 LICENSE = "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://src/gpg-error.h.in;endline=23;md5=5dfe776dc8b62af093ddc859de6f494c \
+                    file://src/gpg-error.h.in;endline=23;md5=8b204918f0ca707136394d8bb20c7ebc \
                     file://src/init.c;endline=20;md5=8f5a9b59634f4aebcd0ec9d3ebd53bfe"
 
 
@@ -13,9 +13,8 @@ SECTION = "libs"
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch"
-
-SRC_URI[md5sum] = "b4f8d8b9ff14aed41f279aa844563539"
-SRC_URI[sha256sum] = "3ff4e5a71116eb862cd14185fcd282850927b8608e3b4186834fd940fbef57b5"
+SRC_URI[md5sum] = "12312802d2065774b787cbfc22cc04e9"
+SRC_URI[sha256sum] = "9ff1d6e61d4cef7c1d0607ceef6d40dc33f3da7a3094170c3718c00153d80810"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.1.4


