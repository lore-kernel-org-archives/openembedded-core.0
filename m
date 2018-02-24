Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5B29A6093D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Feb 2018 04:12:52 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id k8so6055637pli.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 20:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=IlJnnXh+CPNICCKEWgdaKrX/rhdjCNBdbF93wYWazc8=;
	b=mszU9NilwVdU2VnYbROoPIzR4evFGWGV8TX1Fs7uiWhDvF8x6FLXqT3IG+59c4NrwZ
	nVE0loYRqvKU5fpfKaIEM4w4xoY5WmhKAhfNy3PBn+kmuhsp7D84UXroU6ysQB6tah2Q
	SkkioTjKFX2016L/XSBAyfrQQKO3Ozksh3cfl2kEdqDTRL92Aiystjl2e45noO9DXSTe
	aMjunX63+d5sYOQec3ZiRVYp4LBPkVXm+LRo57izyoZLzmzvalJRjPp/i2r5gFwn4hxB
	x5OXrIe122oLMfCRCqfd1UyDS5cemnDfNqP0vI2wJNdw3Ap5o84OBNhZ2gK3BPWpCx6V
	HK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=IlJnnXh+CPNICCKEWgdaKrX/rhdjCNBdbF93wYWazc8=;
	b=FoM6D8gh3hSUUknlWbPzLWPvWOUK6klq/YVGgi8qPy0mhXy/YFZS066mA90YUS7nIB
	HRHFMaZYXh/1bycpAMy8qNaDQNIP7wJywOra8UbRbyMfDh5sRnte1Q6MV/6Ce25OJi3Y
	q/Ckd3FiaSUGlgt+OlfQ211ftevWRd1vgkZhjnJFqN66jDq/Pnt3UteJrM8m2QVWeFWx
	FTszEUPZ9m1QFxB198/Sx0jafDKW3ZqEiQg9TsMklXW/RCIaEJa3sOx4Qzw6rtd/nW6O
	tSCFt2lOOw6Ple2/5wmntbsZa+Y+zVYNWzcGXnuCikuI4Lnkr/YM0bcHaj4sEHo9dh5i
	X4fg==
X-Gm-Message-State: APf1xPC/uRPUKUiyP6rUyC1KP9HwmvUQaQDqNE2F+ECjFNA7ujLpnrMV
	hVtFm3Gs4oaeHKKoGNum4I0=
X-Google-Smtp-Source: AH8x226ONZX7yfYLSOuBznXHY7jykyDOU+ymWjBW77Nw2WaLKEAcsZHJuln0zanircmScIawbNmtoQ==
X-Received: by 2002:a17:902:7796:: with SMTP id
	o22-v6mr3864002pll.215.1519445574558; 
	Fri, 23 Feb 2018 20:12:54 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:d4a8:b8d7:4edf:beec])
	by smtp.gmail.com with ESMTPSA id 186sm6641324pfe.2.2018.02.23.20.12.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Feb 2018 20:12:53 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri, 23 Feb 2018 20:12:50 -0800
Message-Id: <1519445572-25411-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [pyro][PATCH 1/3] linux-yocto/4.1: update to 4.1.49 plus meltdown
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
X-List-Received-Date: Sat, 24 Feb 2018 04:12:53 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto_4.1.bb | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 316bc32..230f81e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "642e9b95f97f8e00ef819bbfb2f281c1079bfbb1"
-SRCREV_machine_qemuarm64 ?= "782133d8166ac71ef1ffaba58b7cf81ec9e532a1"
-SRCREV_machine_qemumips ?= "54d4575d0df1805e127c5fa59201cd978849fb3f"
-SRCREV_machine_qemuppc ?= "58906f2737c644e67a7c9754b7e36630005a0011"
-SRCREV_machine_qemux86 ?= "782133d8166ac71ef1ffaba58b7cf81ec9e532a1"
-SRCREV_machine_qemux86-64 ?= "782133d8166ac71ef1ffaba58b7cf81ec9e532a1"
-SRCREV_machine_qemumips64 ?= "03f0c0293abfe5226c2fdd22328476854fa0127f"
-SRCREV_machine ?= "782133d8166ac71ef1ffaba58b7cf81ec9e532a1"
-SRCREV_meta ?= "9f9c9a66ef3452343586adf150137967e955d71a"
+SRCREV_machine_qemuarm ?= "8a40392c9aab6a3b25560c1a5d4a31d87a65a088"
+SRCREV_machine_qemuarm64 ?= "a315195324973d3edbd4868a0d7acbd82b7d53ae"
+SRCREV_machine_qemumips ?= "ea667187404992a98d49ea62313f826e6b7a9849"
+SRCREV_machine_qemuppc ?= "8c3cd05eab5cf9c49847ed73d77f1d036808b5dc"
+SRCREV_machine_qemux86 ?= "a315195324973d3edbd4868a0d7acbd82b7d53ae"
+SRCREV_machine_qemux86-64 ?= "a315195324973d3edbd4868a0d7acbd82b7d53ae"
+SRCREV_machine_qemumips64 ?= "4a026b26ffed34b40a7fb8fd190ee3eed964b5ea"
+SRCREV_machine ?= "a315195324973d3edbd4868a0d7acbd82b7d53ae"
+SRCREV_meta ?= "4e12cb8f8e06636f2058ea0ab3096ed38228a88b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.43"
+LINUX_VERSION ?= "4.1.49"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.7.4


