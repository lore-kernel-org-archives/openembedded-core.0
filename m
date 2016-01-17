Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id F07BD7017D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:36:56 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id q63so146452364pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JPdbsQZnuC6VWHnFjhhe+LpEONujPC1PeAEfTagsgqk=;
	b=YEVHQSHEzhc4Y5Uihowp/CZfwDm/4djwCHYFMRI49E5hUfttRnN7UOoEO017NSlBWm
	D1LkmAFA4HplAOllGRLET7x7JS09abwZLLsUdlkTl26q9bL2h+tmTpuafMlBsTgMn5EM
	CoAHWrD3iywOI1vGVxNiqFhBj3faVKmUrD8thUQIQLwcXsjiHoo47nIzk0NkQXIGq0hF
	Cd4BbMcRJ1jKQfokiPy1uiDdg4lVYK4DvBdzE+MTPZaFGmQ3KcsHQsZ2JuZvMVci6R3i
	H4ZdWD8jhrHhzAkkeAjq1n20w8nYsWxSh7y9iouGB1FUyM8Zdi8Z02hfVLcDi27A4ICX
	0KGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JPdbsQZnuC6VWHnFjhhe+LpEONujPC1PeAEfTagsgqk=;
	b=E777V/1DWZiB9RCO7r4a3ka+v3Zux1g4Ub29myFVu1zDlqj2ZUlyJOoqgNbfHc7B2g
	YOszMatbw/vKTTrzYYJK1+lIa/MBV0w/Jc4Y2D8iCwPnDt/+EINmA0og73/0rQSyiSWZ
	JMkFGrCTD4tmdrrQWPg5G8vMSH0xjRoMoTAGgwtsi2Zy8+eKycTvENwhbE8WK1MZl08M
	Rw/WMj8zrsGaa+7Eo8Ke1Y88Y7hrquaySXX+YnKXnY+GJCFFuqNXrYGMTrgJgbc6TzJV
	cqYVaDApOh5WoqEJdlhUidSXz/sVHDsJfhgbpAADRvYusJg+8ZwsHPwRRMjiQx8J9+hD
	r3vQ==
X-Gm-Message-State: ALoCoQlRwcUlF7bBgJyDhW95J2JdqhMhaAutEnfoS68CsRWiE9vvL/UwiLR9OGArhKqxiRijbiKmCHI6PxaxcTERkNem7vzFHA==
X-Received: by 10.98.69.93 with SMTP id s90mr28168695pfa.77.1453030617529;
	Sun, 17 Jan 2016 03:36:57 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.36.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:36:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:35:34 -0800
Message-Id: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 01/73] powertop: Include right headers for timval struct
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
X-List-Received-Date: Sun, 17 Jan 2016 11:36:57 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-include-rquired-headers-for-typedefs.patch | 47 ++++++++++++++++++++++
 meta/recipes-kernel/powertop/powertop_2.8.bb       |  4 +-
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/powertop/powertop/0001-include-rquired-headers-for-typedefs.patch

diff --git a/meta/recipes-kernel/powertop/powertop/0001-include-rquired-headers-for-typedefs.patch b/meta/recipes-kernel/powertop/powertop/0001-include-rquired-headers-for-typedefs.patch
new file mode 100644
index 0000000..0fd6310
--- /dev/null
+++ b/meta/recipes-kernel/powertop/powertop/0001-include-rquired-headers-for-typedefs.patch
@@ -0,0 +1,47 @@
+From 0856d8145d187a7e5a49625247abe43a13f95acc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 15 Sep 2015 19:36:28 +0000
+Subject: [PATCH] include rquired headers for typedefs
+
+timeval struct needs to include sys/time.h and sprintf() usage requires
+to include stdio.h headers from system
+
+Fixes
+src/perf/perf_bundle.cpp:141:2: error: use of undeclared identifier 'sprintf'; did you mean 'vswprintf'?
+src/devices/devfreq.h:35:18: error: field has incomplete type 'struct timeval'
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/devices/devfreq.h    | 1 +
+ src/perf/perf_bundle.cpp | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/src/devices/devfreq.h b/src/devices/devfreq.h
+index 16a60fb..4bede7c 100644
+--- a/src/devices/devfreq.h
++++ b/src/devices/devfreq.h
+@@ -25,6 +25,7 @@
+ #ifndef _INCLUDE_GUARD_DEVFREQ_H
+ #define _INCLUDE_GUARD_DEVFREQ_H
+ 
++#include <sys/time.h>
+ #include "device.h"
+ #include "../parameters/parameters.h"
+ 
+diff --git a/src/perf/perf_bundle.cpp b/src/perf/perf_bundle.cpp
+index cf1ae11..232f894 100644
+--- a/src/perf/perf_bundle.cpp
++++ b/src/perf/perf_bundle.cpp
+@@ -27,6 +27,7 @@
+ #include <algorithm>
+ #include <string.h>
+ #include <stdint.h>
++#include <stdio.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <fcntl.h>
+-- 
+2.5.2
+
diff --git a/meta/recipes-kernel/powertop/powertop_2.8.bb b/meta/recipes-kernel/powertop/powertop_2.8.bb
index a466067..1f2dfb8 100644
--- a/meta/recipes-kernel/powertop/powertop_2.8.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.8.bb
@@ -6,7 +6,9 @@ DEPENDS = "ncurses libnl pciutils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
-SRC_URI = "http://01.org/sites/default/files/downloads/powertop/powertop-${PV}.tar.gz"
+SRC_URI = "http://01.org/sites/default/files/downloads/powertop/powertop-${PV}.tar.gz \
+           file://0001-include-rquired-headers-for-typedefs.patch \
+"
 
 SRC_URI[md5sum] = "c55fedb69203e480801b18bd7b886241"
 SRC_URI[sha256sum] = "a87b563f73106babfa3e74dcf92f252938c061e309ace20a361358bbfa579c5a"
-- 
2.7.0


