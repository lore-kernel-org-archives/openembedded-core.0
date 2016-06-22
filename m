Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id BFA3873192
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 11:34:27 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id v199so83563414wmv.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 04:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=DMasqjzEAtHA3oP++DSEadw93UDcnVxuHbbVT5GrtAo=;
	b=O9ABLHbLAKpWvA6WFoOeylczwWoNe0b1BpfkFKjs9IYOPVlFFXs6NhQoGgelUHQQzs
	mUnWTdd6khS/82Av9GC9JhODAUPqGyQ5giFQ8KyZ2BccnWQj2p1Q1cvDb3isUdC6poUW
	sOPg6wthdK2m06VfQk2N9s8YXoQBXtbygXbwpkanYWLmSRTAhZIfDpQ985B0kZSqxPZ5
	FuibII+WTQKNaoXN0ct0I4EwISmyJUZZIla5DQDFXXWpOoVneYSGC7YA6cm6OiyDPGwg
	n7BYlSZW2Poy5Lq5rVat5nzNY6tDJs229VUyBQPTnrwPudVXgw59iUuAu0u4yhgLTupl
	ONPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=DMasqjzEAtHA3oP++DSEadw93UDcnVxuHbbVT5GrtAo=;
	b=RXzpDanAN6NSNVMG1wRHaMWeB00zWBEIVsQ+1v1Qj3G7ms+rg/0NMhXKV6W1r9inW3
	7EyaqtzraLq/kCDhDqJOCMmxNSXE7fTSS7TPhp1efbaZHtRRVC8pR1cejelyxT7M5lRT
	emm3aKHWMAxHFBLMakccXa9/KKt6jup1wMuAEc4CVqX5ejAla8WMHs7VJYZe9VJaGak7
	0yNEYi04x3nfiEpdYazD/vo0WHbkZVm5+adicShhLTELmwib6pQReOhakXx7cuMK/B03
	u5zkeVq9EHsvPL/JuliXP3Z3d84a4vyf8Gu5Ynji1GMGlrXNQ0YZVU+//1XVHV52XyFc
	kqyQ==
X-Gm-Message-State: ALyK8tJUNWC76uEyEraM4naATp5HKkWKSuywW+wzqTTq/p0vLD23Mldq3O6visCZPi9RjRe1
X-Received: by 10.28.50.194 with SMTP id y185mr7740170wmy.51.1466595267864;
	Wed, 22 Jun 2016 04:34:27 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	b187sm185135wmg.15.2016.06.22.04.34.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Jun 2016 04:34:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jun 2016 12:34:25 +0100
Message-Id: <1466595265-4646-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] qemu: add PACKAGECONFIG stanza for bzip2
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
X-List-Received-Date: Wed, 22 Jun 2016 11:34:29 -0000

This is just for reading bzip-compressed DMG files, so disable it by default.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 44e6744..b865223 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -131,6 +131,7 @@ PACKAGECONFIG[glx] = "--enable-opengl,--disable-opengl,mesa"
 PACKAGECONFIG[lzo] = "--enable-lzo,--disable-lzo,lzo"
 PACKAGECONFIG[numa] = "--enable-numa,--disable-numa,numactl"
 PACKAGECONFIG[gnutls] = "--enable-gnutls,--disable-gnutls,gnutls"
+PACKAGECONFIG[bzip2] = "--enable-bzip2,--disable-bzip2,bzip2"
 
 EXTRA_OECONF += "${@bb.utils.contains('PACKAGECONFIG', 'alsa', '--audio-drv-list=oss,alsa', '', d)}"
 
-- 
2.8.1


