Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id F363F7E042
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:11:40 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id e15so14806527wrs.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=p7H3WBBiOVagYUoOd8TsXseocR/jVroISNSFV3JNAFo=;
	b=aTU9/cNato0Ey76BodNc1AoK5+HblF1UpxJJ+gu+w1l9SxVmkCQwPfKkTylqadIHGh
	s/XKqumOq2vKn737zawFHlNm8bASRH31rRLA41meDDRXlB22sEzgQnBgGB5jtPqeLz3G
	TCgOWCo/FjvHkUHRFeh2yguzzeKE5tvfSicnRYxARNTNKnQHNl2AidroAP09y7dUH7Bz
	ZSX4uxt3TiWnVStyRaejTWwl5Y5XTWjqLsU54+HIDCvqCrVKyFrd3HRbC+xjtHwyB9Cd
	9kHGERJSofjGLRAP/FpkEtTTxiPQ1nLH9IC4HLgCnpor/J+BUhnc1PptpJEU+WDrGgPy
	P8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=p7H3WBBiOVagYUoOd8TsXseocR/jVroISNSFV3JNAFo=;
	b=UIahau61VJvwiFacvU/zsNpdp5pQeOY7PVFjoc0TvjohBtQSGRWJHTn7KJEO4m1z21
	bvhj7CeBLJ61NrIGx2mr4CW6XCKcymu9v9z6QFfpkq+d1pI8/VxJt9CszGU45iwxY4J8
	JiO3dx+KCfM67D5CrXjUn03aO7pvq3QEnvfEItXqUNRQ2IkTgyqfBlXu2Q1dC0BU3tCt
	FuMOSUjcMrM1ZQFzvxAZKwFAYboNiCmSpJjlN4G41O01ceRYOxkc/UA/oIFAwPeCvqf3
	vI6OBIUsxDhHA1ZUs3eIqk3/bYSv//v4xpVOIRd6BojjSsQFIgdj036mhdmzpvVzsSjc
	ND2Q==
X-Gm-Message-State: APjAAAVCp51s/ptb342WUIoXmJfo5kVfc//cECq9j6QzK+mLNUEHT7ZR
	uV0i88dCXFS6AewM3uTjAwxi592g
X-Google-Smtp-Source: APXvYqyNmS12ys7Aq9VVlQ/Q7boK0+QYvoKCY7Kx8bRW33HSEO4C+iJuB97tgCe2+APsH0x9AxIJcg==
X-Received: by 2002:adf:ec0f:: with SMTP id x15mr45426623wrn.120.1558361500612;
	Mon, 20 May 2019 07:11:40 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.11.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:11:39 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:10:51 +0200
Message-Id: <20190520141125.10805-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Subject: [PATCH 08/42] bison: upgrade 3.1 -> 3.3.2
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
X-List-Received-Date: Mon, 20 May 2019 14:11:41 -0000

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


