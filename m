Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 401B97DEC6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:12:03 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id x64so7757432wmb.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=p7H3WBBiOVagYUoOd8TsXseocR/jVroISNSFV3JNAFo=;
	b=S82ydd7NN+/YpA7RgNrEEOU0Ta5SUTrD0J4xPNMb1XPj7+GjELCTVyOKlub4Aj9hE5
	C6aL6kuyb8jyf0Pjt01xrBgpfXRhMKOlv4/NhKIJe1nV2oRciZqwTd2FjHrmLmEOnOLE
	i+HH1ENG86XczOsiKHca/gGj7ei5/S713zBe7Ct+BLvneBbjoahBq70RWoBE/jut86zm
	PoK/zecD5M/NdrClwOX01kyrZREydjTbzCaY41AMxN/WigmIbiO/3qHgT4UzuP24WEMq
	mY6LjOCCrBvScd54WG5/xRRR9hY4n13jMrEv/2DwOEq9/iv8jgkznnYo6NrPTdSZIter
	EMhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=p7H3WBBiOVagYUoOd8TsXseocR/jVroISNSFV3JNAFo=;
	b=HCDYGYocEILSKN5KHcMIkGm/Mr6Ol+JJ3QDLV0Ef4rSlgr3c+8zofhzVIp2+VwPaTr
	70HqpJGqMpBCXm1gRcHeKCDIbOQ1735qbBr5RXG8r9GY4Z2CFYEzCjDW6p1AbA12aazV
	fgjUVLjxIqMteO9YQfNpseVjznZBVoEe9glqQlKo64dSFaXWoNNuCuYgyw//alzL/TtP
	oXO2UQ07JR9FwevnN5rMC2OtbB9KjASrRrKMYtWXXwvkY+y1CXsnSiUqjMmg0bZOMsGh
	oqTzLgZ20nyjhpMJ5V/Eg6D2Flkyfxq7aQSdqJu8JKjjVWw8eMdurYhn1amnYHXjKQDH
	f0mQ==
X-Gm-Message-State: APjAAAW9xWP1M200BO/Ya1KqObekCBqBqvR8SS1RwcREAeHg5GmGOkkF
	FNfqf/Yft1Ay+DCeZ0DH6xtLqfwV
X-Google-Smtp-Source: APXvYqy8/z3bHR38ftyS07ydgShZe2esewIZfFaF0qt9hziehLWdsOm/kF8PeuXJYdU8JthbPT7k+w==
X-Received: by 2002:a1c:700f:: with SMTP id l15mr3281556wmc.150.1558116723886; 
	Fri, 17 May 2019 11:12:03 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c63sm10188093wma.29.2019.05.17.11.12.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 11:12:03 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 20:11:21 +0200
Message-Id: <20190517181151.44001-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517181151.44001-1-alex.kanavin@gmail.com>
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
Subject: [PATCH 07/37] bison: upgrade 3.1 -> 3.3.2
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
X-List-Received-Date: Fri, 17 May 2019 18:12:03 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../bison/dont-depend-on-help2man.patch.patch    | 16 +++++++---------
 .../bison/{bison_3.1.bb => bison_3.3.2.bb}       |  4 ++--
 2 files changed, 9 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/bison/{bison_3.1.bb => bison_3.3.2.bb} (90%)

diff --git a/meta/recipes-devtools/bison/bison/dont-depend-on-help2man.patch.patch b/meta/recipes-devtools/bison/bison/dont-depend-on-help2man.patch.patch
index ac16c5770a5..8a41a3a7627 100644
--- a/meta/recipes-devtools/bison/bison/dont-depend-on-help2man.patch.patch
+++ b/meta/recipes-devtools/bison/bison/dont-depend-on-help2man.patch.patch
@@ -1,4 +1,4 @@
-From 4c0d7733f30903f8d7c7cd7433f5c8a7505e35f5 Mon Sep 17 00:00:00 2001
+From 31bb81ef15c42b10844eb8af8738f672076edf0e Mon Sep 17 00:00:00 2001
 From: Marko Lindqvist <cazfi74@gmail.com>
 Date: Tue, 21 Apr 2015 00:48:45 -0700
 Subject: [PATCH] doc/local.mk: dont-depend-on-help2man.patch
@@ -10,15 +10,16 @@ Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
 Updated for bison 3.0.4
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
 ---
- doc/local.mk |    9 +--------
+ doc/local.mk | 9 +--------
  1 file changed, 1 insertion(+), 8 deletions(-)
 
 diff --git a/doc/local.mk b/doc/local.mk
-index c340452..642f385 100644
+index d12836e..f9bf332 100644
 --- a/doc/local.mk
 +++ b/doc/local.mk
-@@ -98,10 +98,7 @@ endif ! CROSS_COMPILING
+@@ -101,10 +101,7 @@ endif ! CROSS_COMPILING
  ## Man Pages.  ##
  ## ----------- ##
  
@@ -30,9 +31,9 @@ index c340452..642f385 100644
  
  # Differences to ignore when comparing the man page (the date).
  remove_time_stamp = \
-@@ -124,10 +121,6 @@ $(top_srcdir)/doc/bison.1: $(MAN_DEPS)
+@@ -127,10 +124,6 @@ $(top_srcdir)/doc/bison.1: $(MAN_DEPS)
  	fi
- 	$(AM_V_at)rm -f $@*.t
+ 	$(AM_V_at)rm -f $@*.tmp
  
 -if ENABLE_YACC
 -nodist_man_MANS = doc/yacc.1
@@ -41,6 +42,3 @@ index c340452..642f385 100644
  ## ----------------------------- ##
  ## Graphviz examples generation. ##
  ## ----------------------------- ##
--- 
-1.7.9.5
-
diff --git a/meta/recipes-devtools/bison/bison_3.1.bb b/meta/recipes-devtools/bison/bison_3.3.2.bb
similarity index 90%
rename from meta/recipes-devtools/bison/bison_3.1.bb
rename to meta/recipes-devtools/bison/bison_3.3.2.bb
index a743bfdb810..adb9d48e90f 100644
--- a/meta/recipes-devtools/bison/bison_3.1.bb
+++ b/meta/recipes-devtools/bison/bison_3.3.2.bb
@@ -17,8 +17,8 @@ SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
 # No point in hardcoding path to m4, just use PATH
 EXTRA_OECONF += "M4=m4"
 
-SRC_URI[md5sum] = "db7e431785ad96870bfa570a15cab079"
-SRC_URI[sha256sum] = "7c2464ad6cb7b513b2c350a092d919327e1f63d12ff024836acbb504475da5c6"
+SRC_URI[md5sum] = "c9b552dee234b2f6b66e56b27e5234c9"
+SRC_URI[sha256sum] = "039ee45b61d95e5003e7e8376f9080001b4066ff357bde271b7faace53b9d804"
 
 inherit autotools gettext texinfo
 
-- 
2.17.1


