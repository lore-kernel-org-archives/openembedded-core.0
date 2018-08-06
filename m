Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0C6A277BC5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 16:20:10 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id j205-v6so23244896oib.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 09:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6d/mbn+WudAGNwQtGBlxjtD6hvbqT2eNpwr5Q/7JtWc=;
	b=WbOXFCkGVh34zMwU/CjwtWrKCsb9iwa+DsyH0RTL98wqUUZsVF4Ll/s+gJcPLgpXkj
	wZNS4hr/zPNIbHBcvaXXyxdlsGOVHLwgXCDFJby0Kkl6b3nf30tCxOdyM9x5ZuoCJcdA
	mTNBLQ2HBzhNBp+rtOOM1uzwwpVespa4tTKQuGMzgy08j0lpCGWiH56CLS9lOPRv6x1u
	TVNJLb8iikaXRSkRXxODkvE/zYuWsyugQdSePCV595GIqbWoeqOcPhbXuUCN0VYhdkGc
	BN3wS4z/wSpSAeiP4H45u/csn52bmQjbdq5gy1sS8FCX0fqS1yU0qz7mf0yxbdQQpnTj
	kyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6d/mbn+WudAGNwQtGBlxjtD6hvbqT2eNpwr5Q/7JtWc=;
	b=U4io+PJD6sc/f+KkIt6XooyM2OLrrULKFNGaMh8fWBGZQTj7MR0E9hxAyCwiLz2waI
	2N4h9YJegqBcfnsLLae2e/BFV1IDD5qpQdA5bHKPQvoFqDoEMgdCYHlTclpsWm31SxoT
	e3mqXc1OHQ3xerAue7Z8bln14lqO1OCATj8tmyt4KUZPToHDOyHOrBWKt8efG/3YoLMq
	YdF6hBl3VVS/opP+skDTL2/RbI055sI5F3awo7D+1Uvu4DyziaLzeIFLqf/eCWl5jd3w
	ENkVwtY74/B2hsPk9bXcLRqJ24zPI7VB+lBB8yvq96ImsN/8XiervSegzq3xoWjQp9XR
	9Hqg==
X-Gm-Message-State: AOUpUlHvFXTIrOCkvPIWV+lsNRg6J7BjW3+5wO5J5KTnEBYCeai5DxtH
	SyITTTxbPZXYho6iEBLAZttCAC8p
X-Google-Smtp-Source: AAOMgpen1V1Ijj3R3yy+LEPRa7Hj1JnGW6crLL0e7CIw/DFpTZGLMKA0PZNzPX9Gc/ahuTPRFqjEnA==
X-Received: by 2002:aca:dbc2:: with SMTP id
	s185-v6mr14121026oig.251.1533572412100; 
	Mon, 06 Aug 2018 09:20:12 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:ac25:fc33:9f90:b6d1])
	by smtp.gmail.com with ESMTPSA id
	p132-v6sm11896374oia.31.2018.08.06.09.20.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Aug 2018 09:20:11 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 09:20:02 -0700
Message-Id: <1533572407-3066-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533572407-3066-1-git-send-email-akuster808@gmail.com>
References: <1533572407-3066-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 3/8] linux-yocto/4.4: update to 4.4.141
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
X-List-Received-Date: Mon, 06 Aug 2018 16:20:11 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto_4.4.bb | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 97c16d5..094e4fb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "400c0f39b954cd8fffdf53e6ec97852b73fea7af"
-SRCREV_machine_qemuarm64 ?= "4d31a8b7661509ff1044abcf9050750cc2478e20"
-SRCREV_machine_qemumips ?= "fb03a9472367b6c177729ac631326aafd5d17c92"
-SRCREV_machine_qemuppc ?= "4d31a8b7661509ff1044abcf9050750cc2478e20"
-SRCREV_machine_qemux86 ?= "4d31a8b7661509ff1044abcf9050750cc2478e20"
-SRCREV_machine_qemux86-64 ?= "4d31a8b7661509ff1044abcf9050750cc2478e20"
-SRCREV_machine_qemumips64 ?= "26b8ba186a6d39728fc1510bd2264110c75842f5"
-SRCREV_machine ?= "4d31a8b7661509ff1044abcf9050750cc2478e20"
-SRCREV_meta ?= "b149d14ccae8349ab33e101f6af233a12f4b17ba"
+SRCREV_machine_qemuarm ?= "acf04f09f4f2d2b568618b20171cf45afd6b2e28"
+SRCREV_machine_qemuarm64 ?= "7c4dd5edc287abd270a97eb38cee98f0d0318418"
+SRCREV_machine_qemumips ?= "df50bef6ecd2df365c203cc400920f6560e26a8c"
+SRCREV_machine_qemuppc ?= "7c4dd5edc287abd270a97eb38cee98f0d0318418"
+SRCREV_machine_qemux86 ?= "7c4dd5edc287abd270a97eb38cee98f0d0318418"
+SRCREV_machine_qemux86-64 ?= "7c4dd5edc287abd270a97eb38cee98f0d0318418"
+SRCREV_machine_qemumips64 ?= "27acba48690468efe0a888fcd68493c82658c7c2"
+SRCREV_machine ?= "7c4dd5edc287abd270a97eb38cee98f0d0318418"
+SRCREV_meta ?= "b41a36ffe53f73c86a0f3672d32b5ebec59ab15e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.113"
+LINUX_VERSION ?= "4.4.141"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.7.4


