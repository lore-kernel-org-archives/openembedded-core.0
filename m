Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 60B0B6FFD8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:36:18 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y7so4253743pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=wCQYiQSL0ISpXTUknNUysBVNOoQL88jAUedixWGdf6I=;
	b=cT/PwN7ldOAqMHq4r6OFZC4On2eAp7NRxDdtJah/kgVBReYXiDclymKabJ62VygzT9
	tsbFVJb76neTsOgZ3Zf4aNfBgC6Xm54DhNauIoPHVp1wfqkAKWbx8KzJY4E4917LeVf9
	1mLHF5MrL0mHmMNu4IyB78M7NSrIhcX7tYgjc05iOPScjsa/1uiWpqxdXuM70Xnh/inq
	jI1CxFQ8Yw0Xbc8DRmQD+n+zyr6nw9rvqi4B+F4oVXe/qy6/iIZg5jDBHJY4iYzH7KQV
	F8ZvQccyyF7q8HlkN74PZ+DtUAkbMfPdDW4Q0vCWmuatygZgwnx0kLzAtoU0RF2BaVxL
	ZTmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=wCQYiQSL0ISpXTUknNUysBVNOoQL88jAUedixWGdf6I=;
	b=IVzepG0lsueWhnGOnwJhRmqJvjkjCAq41CgXbCQ9Ovi0nYeHXUfhS5NA2oYZTv2b6A
	VHbXNsiXiRxF+8GyQZqiAhaqlh3LExm+0NoyCYXp13fD+wKXQ4PTfg/CAX9BvM++be0c
	hInd2mYC1wocq449mfzyp+7/zbX/o8ECjUbVEnCI+HqRhvdg6QqN0zGlw7pwkw1F99wG
	+Jyh7J7KPUvVYnPJ6qkrVcYGjaRoWbQ2CGrUEMeWuqGpNOzSSzwZeBXgbHdJ8O5eyEDE
	rLoyEiEAzFrsfUAh/aomQLBmqOrJl4t975MulVMNLNbIM4gnSTBu5si4kqBv0CPcaRNN
	RqjQ==
X-Gm-Message-State: AOPr4FVbAQF1+f5BvapzTNSeYngQwDZr+G+KTKNez1TKAIDcaYX7FQB0yKP6svKI0AlZbQ==
X-Received: by 10.98.79.213 with SMTP id f82mr6683669pfj.65.1462988179421;
	Wed, 11 May 2016 10:36:19 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm13669903pat.19.2016.05.11.10.36.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 10:36:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 10:35:30 -0700
Message-Id: <0940645f301000b19ccedb441d3149cf5f5b0fbd.1462987863.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 27/42] musl: Upgrade to tip of tree
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
X-List-Received-Date: Wed, 11 May 2016 17:36:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

COPYRIGHT file was changed to clarfiy the MIT Licence
which resulted in checksum change, see

http://git.musl-libc.org/cgit/musl/commit/?id=f0a61399330bae42beeb27d6ecd05570b3382a60

below are changes in upgrade

Andrew Kelley (1):
      fix incorrect protocol name and number for egp

Bobby Bingham (1):
      add powerpc64 port

LeMay, Michael (1):
      fix redundant processing of --build flag in configure script

Petr Vaněk (1):
      remove dead store in res_msend

Rich Felker (10):
      fix undefined pointer comparison in stdio-internal __toread
      fix regression disabling use of pause instruction for x86 a_spin
      fix read past end of haystack buffer for short needles in memmem
      add support for mips and mips64 r6 isa
      add mips n32 port (ILP32 ABI for mips64)
      fix thread structure/dtv-pointer corruption on powerpc
      fix FILE buffer underflow in ungetwc
      update COPYRIGHT file to clarify that permissions apply for all files
      follow standard configure behavior for cross compile prefix
      fix spurious trailing whitespace in powerpc & powerpc64 bits/errno.h

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl.inc    | 2 +-
 meta/recipes-core/musl/musl_git.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/musl.inc
index d27867f..5e6cd01 100644
--- a/meta/recipes-core/musl/musl.inc
+++ b/meta/recipes-core/musl/musl.inc
@@ -9,7 +9,7 @@ standards-conformance and safety."
 HOMEPAGE = "http://www.musl-libc.org/"
 LICENSE = "MIT"
 SECTION = "libs"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=082411391b4d1ace0d30f4c84317cc05"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=7928b7ad32ceda04932478e330e52f7f"
 
 PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
 TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TCBOOTSTRAP}"
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index d4f9819..1e33b2d 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "5978eb703ce0e64dd778a88c1ffffb76fe5e2202"
+SRCREV = "49631b7b6c8b8c055aae5b6948930c219b95fdef"
 
 PV = "1.1.14+git${SRCPV}"
 
-- 
2.8.2


