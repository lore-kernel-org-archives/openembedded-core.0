Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9EBBB7002B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 14:39:08 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id us13so1472450pab.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 07:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+Cqq3EU9gY/dJQX3ly9fuVFzMcg7xBjo/VE8KOniDmA=;
	b=yUm2U0EP0F7NLZ3upWPwoK09DsTeuHuC9ZmjIxxzZ1STxB/civ97NnYj9VIUb2t9vA
	wojgqPj/DEJZngry0ZGPyEY4sjRlAgoaG3YwwwBNht9zGgErt5v6EZflggSz0fCfTdpy
	y0TuebWm1zfhAeL+SR6KVHDtLKmgQZnh5othQXV8ceHKaqPqTBWhfgmOYuZ7tiwFJT82
	ntpSwpytG4zowyPDZSTgPKdC2YmiJv2k4aR/9MurQmeZdVQIETSwykIheXvXWq7j7JvU
	89PbebBsXHYXT4mxzON7RPxE74tUwYvENyPrVCdy1YePeN+p9738j6ut63HiYgTOQLFV
	OHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+Cqq3EU9gY/dJQX3ly9fuVFzMcg7xBjo/VE8KOniDmA=;
	b=OIKNGMjO2/aUH6l6IpSJ5Y4ctiyYic/kmSRmFeVjeRd0c5nbKivhbS94lUnttMPM9H
	dLwVzZjGDLdsnItoyAGS1lf5DmIysGDrV37qfLEuUn8BpVk/X1qNv6UJFp/or5dils95
	muJwNYrS73MxmP6Xxc5Iulv6BJTRQZNjCviKq4HVFfTs2REz/hthZJUilKPxUQ+ZJ2r/
	CGal5a2kFh46xwCQOSZq2FqsNEGteKwZTJNaPqm0i1RQ03d905VReA2c6nI19QePEHQx
	gx2iynh6A6cy8dfn6YxVBdGqAKKq4/YoddCAerIpyJv+bFT2WEYo5Sj2u57Aa0uvd9TZ
	1mBQ==
X-Gm-Message-State: ALyK8tKwaAIIKORNcSIpumYhXd1/qvok30fjvgHSX+C1jXO//UBqDPEnIXE+IM37CNiWKA==
X-Received: by 10.66.101.105 with SMTP id ff9mr28264553pab.84.1466519949040;
	Tue, 21 Jun 2016 07:39:09 -0700 (PDT)
Received: from akuster-ThinkPad-X240.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by smtp.gmail.com with ESMTPSA id
	t4sm51199340paf.39.2016.06.21.07.39.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Jun 2016 07:39:07 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Tue, 21 Jun 2016 07:39:01 -0700
Message-Id: <1466519942-5978-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1466519942-5978-1-git-send-email-akuster808@gmail.com>
References: <1466519942-5978-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 2/3] linux-yocto: add qemuppc64
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
X-List-Received-Date: Tue, 21 Jun 2016 14:39:08 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-kernel/linux/linux-yocto_4.1.bb | 22 ++++++++++++----------
 meta/recipes-kernel/linux/linux-yocto_4.4.bb | 22 ++++++++++++----------
 2 files changed, 24 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 667212f..6053ea3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -7,19 +7,21 @@ KBRANCH_qemuarm  ?= "standard/arm-versatile-926ejs"
 KBRANCH_qemuarm64 ?= "standard/qemuarm64"
 KBRANCH_qemumips ?= "standard/mti-malta32"
 KBRANCH_qemuppc  ?= "standard/qemuppc"
+KBRANCH_qemuppc64  ?= "standard/qemuppc"
 KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "a6899b7c294ed25d9d37afde858cdd52f41f86b0"
-SRCREV_machine_qemuarm64 ?= "9ba8c36e9ea7419d06accab5311e7fb0d56513ff"
-SRCREV_machine_qemumips ?= "69936a9614608b7aa893ae78bd69e5cc197816c3"
-SRCREV_machine_qemuppc ?= "9ba8c36e9ea7419d06accab5311e7fb0d56513ff"
-SRCREV_machine_qemux86 ?= "9ba8c36e9ea7419d06accab5311e7fb0d56513ff"
-SRCREV_machine_qemux86-64 ?= "9ba8c36e9ea7419d06accab5311e7fb0d56513ff"
-SRCREV_machine_qemumips64 ?= "f0eb9eabbeafa5eadf66893822ea42d80e04afbd"
-SRCREV_machine ?= "9ba8c36e9ea7419d06accab5311e7fb0d56513ff"
-SRCREV_meta ?= "9f68667031354532563766a3d04ca8a618e9177a"
+SRCREV_machine_qemuarm ?= "a7b999561115b0b84814a2a27fe3f8c5b0599b0d"
+SRCREV_machine_qemuarm64 ?= "57f17e7008c57885ef5c41bda2829589e499ae28"
+SRCREV_machine_qemumips ?= "ce9d4e563925e65c7a4b73fd6027ed8d2a4fc5e4"
+SRCREV_machine_qemuppc ?= "57f17e7008c57885ef5c41bda2829589e499ae28"
+SRCREV_machine_qemuppc64 ?= "57f17e7008c57885ef5c41bda2829589e499ae28"
+SRCREV_machine_qemux86 ?= "57f17e7008c57885ef5c41bda2829589e499ae28"
+SRCREV_machine_qemux86-64 ?= "57f17e7008c57885ef5c41bda2829589e499ae28"
+SRCREV_machine_qemumips64 ?= "75260c1966188a38e070420624ac65b188f77948"
+SRCREV_machine ?= "57f17e7008c57885ef5c41bda2829589e499ae28"
+SRCREV_meta ?= "4b4199bd24f206d459061bb0a920d009429d5ed3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
@@ -31,7 +33,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
+COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index d69ecec..a277199 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -7,19 +7,21 @@ KBRANCH_qemuarm  ?= "standard/arm-versatile-926ejs"
 KBRANCH_qemuarm64 ?= "standard/qemuarm64"
 KBRANCH_qemumips ?= "standard/mti-malta32"
 KBRANCH_qemuppc  ?= "standard/qemuppc"
+KBRANCH_qemuppc64  ?= "standard/qemuppc"
 KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "cdfdcbd7ee553dc2e483813054a378ef9eaa44b6"
-SRCREV_machine_qemuarm64 ?= "bc64c8124504681545cb97a22b69a4e4bfeb55e2"
-SRCREV_machine_qemumips ?= "b1f51ad1d4e95be437bf7725e094d6ad1b8286b0"
-SRCREV_machine_qemuppc ?= "bc64c8124504681545cb97a22b69a4e4bfeb55e2"
-SRCREV_machine_qemux86 ?= "bc64c8124504681545cb97a22b69a4e4bfeb55e2"
-SRCREV_machine_qemux86-64 ?= "bc64c8124504681545cb97a22b69a4e4bfeb55e2"
-SRCREV_machine_qemumips64 ?= "4b17815085dbd2a0408d7969bf4689a4c2b12942"
-SRCREV_machine ?= "bc64c8124504681545cb97a22b69a4e4bfeb55e2"
-SRCREV_meta ?= "870134f4bfa6208d6e5339e065486be3b6e693a5"
+SRCREV_machine_qemuarm ?= "ae04be16985c86803d8016b06aa57c02fe63cab3"
+SRCREV_machine_qemuarm64 ?= "1f3e98df094cb7afb7d3d540dd0e47b3b8c89711"
+SRCREV_machine_qemumips ?= "1d16db0bce02f4f46a925e5425194de8d25a926e"
+SRCREV_machine_qemuppc ?= "1f3e98df094cb7afb7d3d540dd0e47b3b8c89711"
+SRCREV_machine_qemuppc64 ?= "1f3e98df094cb7afb7d3d540dd0e47b3b8c89711"
+SRCREV_machine_qemux86 ?= "1f3e98df094cb7afb7d3d540dd0e47b3b8c89711"
+SRCREV_machine_qemux86-64 ?= "1f3e98df094cb7afb7d3d540dd0e47b3b8c89711"
+SRCREV_machine_qemumips64 ?= "6fe42d5321cd24411c2a4b7f2aac8a01dfa82b8f"
+SRCREV_machine ?= "1f3e98df094cb7afb7d3d540dd0e47b3b8c89711"
+SRCREV_meta ?= "8900370d334ab4f7224fa71d7d46d62f0b11199d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
@@ -31,7 +33,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
+COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-- 
1.9.1


