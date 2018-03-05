Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4ECF778A71
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 17:20:57 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id v18so17453378wrv.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 09:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ch3Ut0QEr/n2FQ14IisqqKgaXPd+40xqnTxZh1h4KM4=;
	b=BTM8LwFqgI4SVqWcRm+9KA3Yt8IDm2nqSKxOF9A0IBSiF6haufkfec7arvTnwqP0G/
	Qt6Lx5MQHPQUlGpL8Z/DvK6IXM5Uhe44Jk7jOd0e5lrMd3PcVj2sL79hnB3YMdwRfejK
	b4zm8L0xCyPmOj0wJruroE9YoORpP47KBTUoG6lmhXw4vjdpiRqTlZkJMVtp8lHrRCB3
	ALtE6QbHs9eGIODZ6bmxQi3dVaEnzcmqW+PjvKpl00sRaZukD1qD5hGNd/+RTRE/0oEj
	+iZsUplzQwDbmELzFEqWpQsCFZgUhoqqcoSKwsEI+V14MSKx+o1FUD5DMGXVOzEWWUmh
	SDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ch3Ut0QEr/n2FQ14IisqqKgaXPd+40xqnTxZh1h4KM4=;
	b=UbjbcomHXKYuRFkRc+PRG6kHGXLIgthdx227PVwP3hmFjgsYiSQU6hqwN4zPDop4rR
	Y3OJh81UkUPEFFkNM4PlHur1LC77DguHOZhXHSUR4ivarXafGMJInlQkhxCGgez23g9K
	oIxedi7ss3KP++BRFhY5MCxlIYonvgbVrbLBXu6Tq+90ia2VifuLFC3iPkRdTOU/01sZ
	qQe5ck/BmJXA2tibsy4ZlGM4wc7rsBtl8oRutIZotXZPwcZNRT/cgr4wnZ4rFH5CvRpc
	2yS2op19lfGD5tmZ6PwMfHLi5gxJgj/dmQtdPHqevkJF0a2dbf1tXZSWcl4aq4R5eaxb
	5mQg==
X-Gm-Message-State: APf1xPDPVyQC3k1nY0kbsDOI7z9OJpQnvFukcGy9q9GafzIRvBm5VPuq
	BWb28rdC3TN2KWCAoZGJ3TutURtu
X-Google-Smtp-Source: AG47ELuBkDX8TgcPUr5Fsga2Rdg9baFe2n2GYkQ+IFNhxVu5Xw5x8ri6urOMmfTHMWiu8+3rE5vKXg==
X-Received: by 10.223.160.157 with SMTP id m29mr13287310wrm.119.1520270458239; 
	Mon, 05 Mar 2018 09:20:58 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m190sm10082047wmb.6.2018.03.05.09.20.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 09:20:57 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 17:20:24 +0000
Message-Id: <20180305172046.21729-7-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180305172046.21729-1-ross.burton@intel.com>
References: <20180305172046.21729-1-ross.burton@intel.com>
Subject: [PATCH 07/29] kbd: refresh patches
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
X-List-Received-Date: Mon, 05 Mar 2018 17:20:57 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../kbd/kbd/set-proper-path-of-resources.patch     | 26 +++++++++++-----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-core/kbd/kbd/set-proper-path-of-resources.patch b/meta/recipes-core/kbd/kbd/set-proper-path-of-resources.patch
index 27d6f42aaeb..a9a3ab8abfb 100644
--- a/meta/recipes-core/kbd/kbd/set-proper-path-of-resources.patch
+++ b/meta/recipes-core/kbd/kbd/set-proper-path-of-resources.patch
@@ -13,10 +13,10 @@ run as expected.
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 1976333..b36aef3 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
+Index: kbd-2.0.4/tests/Makefile.am
+===================================================================
+--- kbd-2.0.4.orig/tests/Makefile.am
++++ kbd-2.0.4/tests/Makefile.am
 @@ -1,7 +1,7 @@
  AM_CPPFLAGS = \
  	-I$(srcdir)/../src/libkeymap \
@@ -25,11 +25,11 @@ index 1976333..b36aef3 100644
 +	-DDATADIR=\".\" -DBUILDDIR=\"$(builddir)\"
  
  AM_CFLAGS = $(CHECK_CFLAGS)
- LDADD  = $(top_builddir)/src/libkeymap/libkeymap.la $(CHECK_LIBS)
-diff --git a/tests/alt-is-meta.in b/tests/alt-is-meta.in
-index ddd5ed8..772fb51 100755
---- a/tests/alt-is-meta.in
-+++ b/tests/alt-is-meta.in
+ LDADD  = $(top_builddir)/src/libkeymap/libkeymap.la $(CHECK_LIBS) @INTLLIBS@
+Index: kbd-2.0.4/tests/alt-is-meta.in
+===================================================================
+--- kbd-2.0.4.orig/tests/alt-is-meta.in
++++ kbd-2.0.4/tests/alt-is-meta.in
 @@ -7,8 +7,8 @@ cd "$cwd"
  rc=0
  temp="$(mktemp "@BUILDDIR@/temp.XXXXXXXXX")"
@@ -41,10 +41,10 @@ index ddd5ed8..772fb51 100755
  
  if [ "$rc" != 0 ]; then
  	printf 'failed\n'
-diff --git a/tests/dumpkeys-fulltable.in b/tests/dumpkeys-fulltable.in
-index 7c856e5..14d92c1 100755
---- a/tests/dumpkeys-fulltable.in
-+++ b/tests/dumpkeys-fulltable.in
+Index: kbd-2.0.4/tests/dumpkeys-fulltable.in
+===================================================================
+--- kbd-2.0.4.orig/tests/dumpkeys-fulltable.in
++++ kbd-2.0.4/tests/dumpkeys-fulltable.in
 @@ -5,7 +5,7 @@ cwd="$(readlink -ev "${0%/*}")"
  cd "$cwd"
  
-- 
2.11.0


