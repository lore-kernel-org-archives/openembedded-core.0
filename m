Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 07458793C1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 03:55:49 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id x17-v6so3260962pfh.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 20:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=i4FZFubAl8mUdHopqOn4T0iMMssQT5lcHaMSCleChXA=;
	b=KLDh2gUVJ8k4HGtYeJR7W9thtMBLy4k8dTFaUkCMjeKOGF/MAfS59nszrcFRRHHTPJ
	7x00OmeJYMc/v/Fqq9fbyl5j8bUSlm112NPdrjwHt8A2f11SzhHP6IH9Pw4Mcrli4Vps
	kmWjWrYvY0geBu9tfSHAHJsHO/CxIsMG0yMZDsVGEgzud16BNoAFmxeZe/E9+k0FGDGH
	aPK5FDBq0DRrIoGxo/5/EzfGGFBYOjr0+FwVKf4qtNRPCg/mGFSR2nmzL/0SWYVPesXC
	uaS/m/ZIS7/99PVL2auwbrI9hbUhtsP475eueJzMTzvGl2u4t0v9UuJVnCP8fzrK/3Bh
	zXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=i4FZFubAl8mUdHopqOn4T0iMMssQT5lcHaMSCleChXA=;
	b=MGjp4PSMjhjG8wgzvCo8In3mycWoJewRRDi+hKGymlJwpSUgFvno/CeVtdotA3OMNa
	xkToRcLI5y25HKCGv2m6rtuyq94YiVYXZHAQPgu24PUljAZCb8hMKh0KLJvXDZ5m005Z
	HJZnZA5u/FcszAuo/bM8crmL0CbMJpx+kfWEnH0Y1o0qi2pgtREGBrLQOadVzlsbGsF0
	5rTUv/WTpTOSnNaWnW4LibW4JZeJPPGn/tj/v/0pONNFY1Ewm0hVRxdPIGLYjjeNqTeQ
	hQPqldFrMC6RTxV+HEBVDf7TUzKgLMgWKHVsautQ96uPbUHbp3kdTbiM9A9CXVg5w4Oa
	C01Q==
X-Gm-Message-State: APzg51AYO1lVMn3++zw8OmXqE3MoZyObXSajP8LwZ/ues6cUyHdMasfR
	yEBuHQ67pwolrT01kPB9qNrUSgnv
X-Google-Smtp-Source: ANB0VdawHQ1qli6EOtVxc00JHcNahnEXbzymwYekKjuEJv2hi08M8nL27U4qZp6RCiQgG2l8sygSsQ==
X-Received: by 2002:a62:dbc5:: with SMTP id
	f188-v6mr8788484pfg.182.1535601350770; 
	Wed, 29 Aug 2018 20:55:50 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f180])
	by smtp.gmail.com with ESMTPSA id
	77-v6sm8056381pga.40.2018.08.29.20.55.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Aug 2018 20:55:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Aug 2018 20:55:36 -0700
Message-Id: <ed1d14d5b20bd6a359b4202751e13cc55869709d.1535601148.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1535601148.git.raj.khem@gmail.com>
References: <cover.1535601148.git.raj.khem@gmail.com>
Subject: [PATCH 4/7] glibc-locale: Enable riscv64 and riscv32 in BINARY_LOCALE_ARCHES supported architectures
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
X-List-Received-Date: Thu, 30 Aug 2018 03:55:50 -0000

This support is there using cross-localedef but was not enabled, this
caused the post-install for locales to be emitted which delays the boot
significantly.

emitted postints for locales contain exit 1 which is flagged now and was
causing image generation to fail.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc-locale.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
index e50e5cf5e3..1b676dc26e 100644
--- a/meta/recipes-core/glibc/glibc-locale.inc
+++ b/meta/recipes-core/glibc/glibc-locale.inc
@@ -21,13 +21,13 @@ RDEPENDS_localedef += "glibc"
 # to decrease initial boot time and avoid localedef being killed by the OOM
 # killer which used to effectively break i18n on machines with < 128MB RAM.
 
-# default to disabled 
+# default to disabled
 ENABLE_BINARY_LOCALE_GENERATION ?= "0"
 ENABLE_BINARY_LOCALE_GENERATION_pn-nativesdk-glibc-locale = "1"
 
 #enable locale generation on these arches
 # BINARY_LOCALE_ARCHES is a space separated list of regular expressions
-BINARY_LOCALE_ARCHES ?= "arm.* aarch64 i[3-6]86 x86_64 powerpc mips mips64"
+BINARY_LOCALE_ARCHES ?= "arm.* aarch64 i[3-6]86 x86_64 powerpc mips mips64 riscv32 riscv64"
 
 # set "1" to use cross-localedef for locale generation
 # set "0" for qemu emulation of native localedef for locale generation
-- 
2.18.0


