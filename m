Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7EA3E78A93
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 17:21:15 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id o76so18101994wrb.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 09:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=RtpSxy7Ss8p2UF33E0sLURSPbAKK4HaplgkBS922da4=;
	b=fC/Ls0NRBdDY1GTonzRX00x3s9ulx33XEUKMig+7pkM/I7svJOxl31Cm7JOimb6QE/
	gt8rBhMeEVBN+yhkFkFAYZitDQHLTd4f3m/YJLrP86QW0mak+KWiXX9NlZeHmHAFOgEt
	Z46C6wLxj7K/oIfu7otFjRlE+V62IqCKiXyLUiG8X5pWXSvDOoccb/PQBduHmVlznN2G
	t3XTlalgu5hp27AovhsuH1XZpGrqt4G6T2LYaRMmVsHev8qnq6CEHdVkQzX3I/3YYFHx
	gjmGJDImC8xf6AvvOdnBMgv4LP19exoCbkU1KYg4HMGLsLHrhbq4EtUy2/pGxG8gQ1uB
	w8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=RtpSxy7Ss8p2UF33E0sLURSPbAKK4HaplgkBS922da4=;
	b=O+HLgQSLMl20XsUX2saq4irgiDLDDjKzjXcWaEltPYwqSXzaH+ecujbRF/KU/H2UKl
	CmaxkRXuT/djg2zGhaefllAw9iKGxrPQiGJhpv2kvJwqbGmwJXOPyZagbSPCVvZW/EpE
	SYGmm2AUrLBWWR5Mj9rwWDN455MTXa1G1h0sAMDtVHdd8Wn0YMEyNb0XoHnVtR+bwINK
	08u5TH5HCBD0AwvDAzH5ZeJatx2TC23npoPtS9Ole3chfks6+I0g6Uq5hCvEBN81vQq3
	MUdHNt13pYlY8uqL1xqCWHrgFHzM11w0Xc1dpn5FpagxggXX5xB5H1/8xooM+hwVTD7i
	D9dg==
X-Gm-Message-State: APf1xPBXmEXKoIVpVzaAagKKBCI7lbdTCD+i5FwuGUJYQs37PjWLjLeh
	KAw/WILlxnaPfP7uek/blymCzUqt
X-Google-Smtp-Source: AG47ELvrabzOH3XyGB//0fTEdrtVVPa0ZV+2zWtaT95JFD5aC5wN5elrjuDACx4+zk08o4KbLrfCWw==
X-Received: by 10.223.209.18 with SMTP id a18mr13283727wri.141.1520270476246; 
	Mon, 05 Mar 2018 09:21:16 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m190sm10082047wmb.6.2018.03.05.09.21.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 09:21:15 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 17:20:41 +0000
Message-Id: <20180305172046.21729-24-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180305172046.21729-1-ross.burton@intel.com>
References: <20180305172046.21729-1-ross.burton@intel.com>
Subject: [PATCH 24/29] libaio: refresh patches
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
X-List-Received-Date: Mon, 05 Mar 2018 17:21:16 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/libaio/libaio/destdir.patch | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/libaio/libaio/destdir.patch b/meta/recipes-extended/libaio/libaio/destdir.patch
index dad9601c496..0f90406bee5 100644
--- a/meta/recipes-extended/libaio/libaio/destdir.patch
+++ b/meta/recipes-extended/libaio/libaio/destdir.patch
@@ -2,16 +2,16 @@ Upstream-Status: Pending
 
 from openembedded, added by Qing He <qing.he@intel.com>
 
-Index: libaio-0.3.106/Makefile
+Index: libaio-0.3.110/Makefile
 ===================================================================
---- libaio-0.3.106.orig/Makefile	2004-02-26 07:25:10.000000000 -0800
-+++ libaio-0.3.106/Makefile	2006-10-14 09:19:07.000000000 -0700
-@@ -15,7 +15,7 @@
+--- libaio-0.3.110.orig/Makefile
++++ libaio-0.3.110/Makefile
+@@ -15,7 +15,7 @@ all:
  	@$(MAKE) -C src
  
  install:
 -	@$(MAKE) -C src install prefix=$(prefix) includedir=$(includedir) libdir=$(libdir)
 +	@$(MAKE) -C src install prefix=$(DESTDIR)$(prefix) includedir=$(DESTDIR)$(includedir) libdir=$(DESTDIR)$(libdir)
  
- 
- clean:
+ check:
+ 	@$(MAKE) -C harness check
-- 
2.11.0


