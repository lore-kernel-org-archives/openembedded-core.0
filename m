Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB9FC4167E
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:36 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web12.3440.1652871569503225853
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=efOlCS2O;
 spf=pass (domain: gmail.com, ip: 209.85.218.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id y13so2303335eje.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tS838IwJrBZ9wl32Lrhor1HKuMtskYfrlL788ytM/4k=;
        b=efOlCS2OtYcpLNxfqNC2ptqHBiJfhxxYUdtnLI287pqV4GSAd3g+MyiO1otHO/6Yp2
         fErwyEf1z7X3sU779m+lHX+MCP5+4rh9MA+lCCqzTJpBkWRxQK1tMjX92ZFju6nmmrnW
         7nQBudrmlU8m0Hz1AGS5Res2eTtTIvRrX9wOA4+yL+PouZyoOv17fVa8K1iEUGSdT4MU
         sPFkPX12OGiMqGhpfq4ZkIhM4OjmudAo9ArExB2tifHzqw3BFW5fy4jCpgNv9PI2qHqj
         gn5EAX8CNruIHKotrldut2Zw/S6P+AdEAvmWGynzKDeDEFDsjCCEnjxlJ5AvpnTZlNbi
         C/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tS838IwJrBZ9wl32Lrhor1HKuMtskYfrlL788ytM/4k=;
        b=KbxAnoP5GoLG52W/fXCGjVaHCraV6PUme2sr/Ee2W96REWgNi9nyP3/oFHCw8MSWph
         AYhMiKT+ac7PbowHn20+kAOm5TSwUixg8MBDsoY7bvPpVBqjhg/cyCt9gZoQRSdVaKUM
         ySlamTYkjcGD7b92uClwym98clJF2ToVDq+IFvS4FRrknDGeNMB10QHDyl96CLiAFzgU
         9Mniu4hlucLMycAPpqgPr1UuUlfp6dAVvIa62tr7MIPgopVVheoHu32+8va69v4MMwLS
         yD87PiULvQIqGWkbBQzag+Wo2ww1HeZ/Qtk4PcWI66X3sQ3wUyfONx9zZgiHUVkk6/hz
         0D5w==
X-Gm-Message-State: AOAM530GVc+G2tJBS5790vF51SvMNUiHzupW5n0ioqgQd1O4dLvjvzyl
	JDNwig0dBbG3dof69TXQ7yoaPoc+CPw=
X-Google-Smtp-Source: 
 ABdhPJx7qLZozf7oBIU6WPHyhMZxVhEwHNsXdc44riPkBqhTeu4Du7/a1Jmmy9D0v8sOwXFwAcnFRg==
X-Received: by 2002:a17:907:7283:b0:6f4:ff4f:1b6e with SMTP id
 dt3-20020a170907728300b006f4ff4f1b6emr23044907ejc.344.1652871574888;
        Wed, 18 May 2022 03:59:34 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:59:34 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 47/49] stress-ng: upgrade 0.14.00 -> 0.14.01
Date: Wed, 18 May 2022 12:58:41 +0200
Message-Id: <20220518105843.3299331-47-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:59:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165844

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../stress-ng/0001-Makefile-quote-CC.patch    | 41 -------------------
 ...ess-ng_0.14.00.bb => stress-ng_0.14.01.bb} |  6 +--
 2 files changed, 2 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-extended/stress-ng/stress-ng/0001-Makefile-quote-CC.patch
 rename meta/recipes-extended/stress-ng/{stress-ng_0.14.00.bb => stress-ng_0.14.01.bb} (85%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng/0001-Makefile-quote-CC.patch b/meta/recipes-extended/stress-ng/stress-ng/0001-Makefile-quote-CC.patch
deleted file mode 100644
index 498a024830..0000000000
--- a/meta/recipes-extended/stress-ng/stress-ng/0001-Makefile-quote-CC.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From f6162ced588c17c1141a8f6154475a299a2ebc0d Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Tue, 26 Apr 2022 22:35:35 +0200
-Subject: [PATCH] Makefile: quote CC
-
-It can contain command line options, and therefore spaces, and so
-needs to be quoted.
-
-Upstream-Status: Submitted [https://github.com/ColinIanKing/stress-ng/pull/188]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- Makefile        | 2 +-
- Makefile.config | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 501093f5..8a454edd 100644
---- a/Makefile
-+++ b/Makefile
-@@ -432,7 +432,7 @@ stress-ng: $(OBJS)
- 	$(V)sync
- 
- config.h:
--	$(MAKE) CC=$(CC) STATIC=$(STATIC) -f Makefile.config
-+	$(MAKE) CC="$(CC)" STATIC=$(STATIC) -f Makefile.config
- 
- .PHONY:
- makeconfig: config.h
-diff --git a/Makefile.config b/Makefile.config
-index b76d0903..f03f7a85 100644
---- a/Makefile.config
-+++ b/Makefile.config
-@@ -69,7 +69,7 @@ else
- endif
- 
- 
--MAKE_OPTS=CC=$(CC) -f Makefile.config --no-print-directory
-+MAKE_OPTS=CC="$(CC)" -f Makefile.config --no-print-directory
- 
- comma = ,
- 
diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.14.00.bb b/meta/recipes-extended/stress-ng/stress-ng_0.14.01.bb
similarity index 85%
rename from meta/recipes-extended/stress-ng/stress-ng_0.14.00.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.14.01.bb
index e7cc1d1846..cba15e947e 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.14.00.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.14.01.bb
@@ -5,10 +5,8 @@ HOMEPAGE = "https://github.com/ColinIanKing/stress-ng#readme"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
-           file://0001-Makefile-quote-CC.patch \
-           "
-SRCREV = "ec7f6c4731a54f0e515bef7f7e84ef9e9b8125a2"
+SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master"
+SRCREV = "597da6154263c9317291f2dd0ed71a8ff1e8b2dc"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native"
-- 
2.30.2


