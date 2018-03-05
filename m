Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id AC26F78A5B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 17:21:00 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id v111so18098743wrb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 09:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=PBtyomkIs36b2Jg5mWgAfkPYVeGwxfRv6xgzwaB230Y=;
	b=HtyX2317YfusjkheqBXplW8TCh20pxgyAYL6hp5sd80SU3DOHdXe9R8WS5RXiycTMn
	erd9hkYR1VJlPG/VmuVbpNsCXUM7Opla6qKgbYcmYAjpM3PnpEl/BSr3usvIeErttYop
	2k6PvX06b3YqqXHMFqegR0oFruvur/mWju/SwhaqMJ/IDleHvstsb06T4yRnZtzm8AUS
	8dkXnpRuaWxVR2W5cWZPozWw1jJOqT1OrFPdp+JZ72LbX8YcQV2c5mRHbtyBhrH/iwy8
	l0C9cOT1f/ns7CKESpXolgInWk1dTd3Y1fThMTtgj7urKyiwRQ7XYZBDZ5RJPrJLzpnl
	Adcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=PBtyomkIs36b2Jg5mWgAfkPYVeGwxfRv6xgzwaB230Y=;
	b=EsDoZeTX1L1nc+WrCRJ9jLrcYfn5f4EZE38JzCERJxuTiJmb/xu48CD5LTMBcI/GMs
	XT5LyuOao84F0PUIC+LJVgTSNIjQo4Kc6ePtRjyyqq2y+a1JnXMcxW47HXVJKb7Auqhb
	cFwuZqJWJTEKTxHVbGSmR2Vw7Pw3BObJrDzuV5L9sg5ny6itUUB/Cp86jHkdFt83/v6U
	I+3Tfjfs8mFq0o1wwff4DiiEGLl+/MGbJEik/XX+8E9Qi+XbNPOynJMMil0vMv3PLVnx
	DDbksYECwf/wVf+j82scixc8Xja1RY9DPP0LhPWzAbcy8hTzjquhhYY5Mrh7CsAhZWSp
	tPQg==
X-Gm-Message-State: APf1xPBmAoiENgHzFcD+vuN6XB/L/mOl1iyR2r0A3QF7J0jtDNk0rWti
	BHAUZIXezRnwGrTjif4lHAd4GUuY
X-Google-Smtp-Source: AG47ELtHLOXlz+NtqSJRBfmlvNn1ZDnn8A64k+DAtCNl7eO8r2NZYxAJl4ygWyqGJ0wetwYL2dv92Q==
X-Received: by 10.223.171.247 with SMTP id s110mr13458121wrc.106.1520270461586;
	Mon, 05 Mar 2018 09:21:01 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m190sm10082047wmb.6.2018.03.05.09.21.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 09:21:00 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 17:20:27 +0000
Message-Id: <20180305172046.21729-10-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180305172046.21729-1-ross.burton@intel.com>
References: <20180305172046.21729-1-ross.burton@intel.com>
Subject: [PATCH 10/29] neard: refresh patches
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
X-List-Received-Date: Mon, 05 Mar 2018 17:21:01 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../neard/neard/Makefile.am-fix-parallel-issue.patch      | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-connectivity/neard/neard/Makefile.am-fix-parallel-issue.patch b/meta/recipes-connectivity/neard/neard/Makefile.am-fix-parallel-issue.patch
index 466067693d5..6e864079a98 100644
--- a/meta/recipes-connectivity/neard/neard/Makefile.am-fix-parallel-issue.patch
+++ b/meta/recipes-connectivity/neard/neard/Makefile.am-fix-parallel-issue.patch
@@ -16,18 +16,15 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  Makefile.am |    1 +
  1 file changed, 1 insertion(+)
 
-diff --git a/Makefile.am b/Makefile.am
-index 3241311..a43eaa2 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -164,6 +164,7 @@ MAINTAINERCLEANFILES = Makefile.in \
+Index: neard-0.16/Makefile.am
+===================================================================
+--- neard-0.16.orig/Makefile.am
++++ neard-0.16/Makefile.am
+@@ -244,6 +244,7 @@ SED_PROCESS = $(AM_V_GEN)$(MKDIR_P) $(di
  src/plugin.$(OBJEXT): src/builtin.h
  
  src/builtin.h: src/genbuiltin $(builtin_sources)
 +	$(AM_V_at)$(MKDIR_P) src
  	$(AM_V_GEN)$(srcdir)/src/genbuiltin $(builtin_modules) > $@
  
- $(src_neard_OBJECTS) \
--- 
-1.7.9.5
-
+ se/plugin.$(OBJEXT): se/builtin.h
-- 
2.11.0


