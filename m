Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f49.google.com (mail-pl0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id 644C978CA6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 07:41:39 +0000 (UTC)
Received: by mail-pl0-f49.google.com with SMTP id z7-v6so1957830plo.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 00:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=0y8LUbwwDL4ae5/sk6Yl16f/+Bo8ladVR09i8YY+U24=;
	b=MBEuobPwAuU64a7gPIhaq94ZJvqjbDML2IhF788oUm88AR70CIteBDvorXRmTAvOOj
	W/88ZvbzNiu/N4ifayJWvQm7fpRG+BItkjeRJ9ZxtqdzmyKBjEAA7hjoS6oiIiR+eO4Z
	7+/mI7PQRfSbBM5K550V3QnY1ELF4Gn82NK9Mn8PvTdsJowIYc2ET2hjKrXUOtO0e6pq
	EGHXSxOIgEP2JnJQ05VNp0D3/CXZcDtct/LQCeB2ago5BDaGHFVkfrVmhs9w4JG0120Z
	7NsqkEEEpA6yH3oho3jT7LGOkQonRbxpu2dMYwz4Wzb3qIyMoNWSf7c2aDH5XbrmEFdz
	OWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0y8LUbwwDL4ae5/sk6Yl16f/+Bo8ladVR09i8YY+U24=;
	b=DpvNJGXevuh5tFDtPTO4N807jK+nbWVSIaaJHPn+d3+qAhXBenYYhnCmfxf5I6jfZG
	dliMP4KSsFONUS1+N8qbjVWK+Q04Sa4EAHa9oVUJd8wjD2KgmFslLpykuCxzZWi5i+KT
	Q3uxWM2IVaDsTjdeF1j+JCTc5UZ6iQxo3OhE9sB9g8plg1afR3IzxQCuv+QRkieeOawW
	qipkabLrGQJbzmifUBvExnGOqz19e0uba3LqTcvhvXLhoxodcY3bGo2sOwo5vMu5HMEt
	92ecUd8d1rIjr4WMWVN309tWCmNe/hggMTLGu3RD1Sm0AIvvoVVamBvmq220LCT4SNhv
	aohg==
X-Gm-Message-State: AOUpUlF9xIrncE9ErXvCyR5/nX812+LtmkwT2t2MOiGNF+xrR9eRZIny
	ePX8J3t5/jpjzGHb/OpEJT/8pyam
X-Google-Smtp-Source: AAOMgpdY+kGP3V7VJ9bX8TyGDLE5clv/yeBnnP1yKgzXQwIoYSj8xqIyECc1vvqZ4ezjdLEV6wGtKg==
X-Received: by 2002:a17:902:b709:: with SMTP id
	d9-v6mr5039796pls.138.1532677299899; 
	Fri, 27 Jul 2018 00:41:39 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::ee7a])
	by smtp.gmail.com with ESMTPSA id
	y18-v6sm3048518pfl.90.2018.07.27.00.41.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 00:41:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2018 00:41:30 -0700
Message-Id: <20180727074130.19685-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH V2] defaultsetup.conf: Enable security flags+pie by default
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
X-List-Received-Date: Fri, 27 Jul 2018 07:41:39 -0000

This has been an opt-in for so long, some distributions e.g.
poky-lsb uses it by default however, since most of linux
distros have started to default to these settings for security
enhancements, time has come for OE to make it default too

remove documentation from advanced local.conf sample

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2:
- Remove references to explicitly enabling security flags

 meta/conf/distro/defaultsetup.conf   |  1 +
 meta/conf/local.conf.sample.extended | 11 -----------
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index ca2f9178d2..352e279596 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -1,6 +1,7 @@
 include conf/distro/include/default-providers.inc
 include conf/distro/include/default-versions.inc
 include conf/distro/include/default-distrovars.inc
+require conf/distro/include/security_flags.inc
 include conf/distro/include/world-broken.inc
 
 TCMODE ?= "default"
diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index e698acb84b..7f107831ee 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -270,17 +270,6 @@
 #COPYLEFT_RECIPE_TYPES = 'target'
 #
 
-#
-# GCC/LD FLAGS to enable more secure code generation
-#
-# By including the security_flags include file you enable flags
-# to the compiler and linker that cause them to generate more secure
-# code, this is enabled by default in the poky-lsb distro.
-# This does affect compile speed slightly.
-#
-# Use the following line to enable the security compiler and linker flags to your build
-#require conf/distro/include/security_flags.inc
-
 # Image level user/group configuration.
 # Inherit extrausers to make the setting of EXTRA_USERS_PARAMS effective.
 #INHERIT += "extrausers"
-- 
2.18.0


