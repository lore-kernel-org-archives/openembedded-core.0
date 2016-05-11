Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7FED46FFD8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:36:15 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id r187so5033395pfr.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Q+QwPJVw3RUEX2PUpiuxpiGIKuY4siLBwJ9KxwWK6xI=;
	b=HJr4AxLlV4jHXKaOMjWTq58Yo35j62YUlfA/jwyXib4qkuoD6QZsujK6UQ55pXiKL9
	c19nwaq3K02pHwhK9csGHid1NEhmzq1HnLiSauOE81fFiGcCYE4jlWGcnARgwO7d5/f4
	9Hc8Bg4cHo+X6G7R7nqVpoTXI3VHCJQxgCc3OKPj9w7zFB2XjLLedPkpijU+OGw0Qc3F
	PV/Pr7axb42wB3oNV2VcervEao8Xx4ftdHB6MByBg1Jn4vaz9kQ36otz9q/2ZQfPzl5C
	fhUtbeURCk56JrU7PO7fcNtuBg1aOVoBonMFF8cr7ZKz6YpRpW+wnnTaeDXafp4X1LEQ
	/nzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Q+QwPJVw3RUEX2PUpiuxpiGIKuY4siLBwJ9KxwWK6xI=;
	b=EGWp7CqdVnJ6gJA7gASc/XMrbzi8MMIV1GVk3m/KaPTgsKAL3i/DGGES2y5or4S5wP
	PiiLLr50WGu2JTMsBYFFr1dpEedfoUDZN/DNmJPJZHNcXyVh3LqSVf9SHiV39uDqQ7Os
	s35cpiF7q8fV2FY72qtcFaOk2yANET/PpV5hiCyWJqNsMPJJXDDU7iQvcGjDK1wQ0a9t
	Do3G2jhRtFVgBuEvHBxadf5G3k6M+MwfttxNsecyq08CJbUUuh2Chy/cvjtZRj25iBpU
	yQ0fOTCdP3Feh03J1lpZ7sxIqNPuRQEtwt/RqM0yyKjXLd9xFrkLFy6FPl5kOBH3h0uv
	KxWg==
X-Gm-Message-State: AOPr4FUxlB7CE0NScKkQLF1HpzW3JZEQiZ9QcVjf9ppWLiYWve4BI5xr6tBGfQK8rH+5xw==
X-Received: by 10.98.102.20 with SMTP id a20mr6746541pfc.137.1462988176555;
	Wed, 11 May 2016 10:36:16 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm13669903pat.19.2016.05.11.10.36.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 10:36:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 10:35:27 -0700
Message-Id: <27b4d9f57e6002d301331cd1c6cfb86fdcdca923.1462987863.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
Subject: [PATCH 24/42] python-native: Point to expat in native sysroot
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
X-List-Received-Date: Wed, 11 May 2016 17:36:15 -0000

This fixes inconsistency where expat dependency is
then depending upon build host having it or not having it

Fixes errors like
WARNING: renaming "pyexpat" since importing it failed: build/lib.linux-x86_64-2.7/pyexpat.so: undefined symbol: XML_SetCommentHandler

also reported here
https://dev.openwrt.org/ticket/20087

This work due to the fact that we use -isystem pointing to native sysroot
so the search order of native includedir is moved after buildhosts system
includdirs. Moment we replace it with -I, build falls apart

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python/python-native_2.7.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-native_2.7.11.bb b/meta/recipes-devtools/python/python-native_2.7.11.bb
index 4c204a4..add8868 100644
--- a/meta/recipes-devtools/python/python-native_2.7.11.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.11.bb
@@ -27,7 +27,7 @@ inherit native
 
 RPROVIDES += "python-distutils-native python-compression-native python-textutils-native python-codecs-native python-core-native python-unittest-native"
 
-EXTRA_OECONF_append = " --bindir=${bindir}/${PN}"
+EXTRA_OECONF_append = " --bindir=${bindir}/${PN} --with-system-expat=${STAGING_DIR_HOST}"
 
 EXTRA_OEMAKE = '\
   BUILD_SYS="" \
-- 
2.8.2


