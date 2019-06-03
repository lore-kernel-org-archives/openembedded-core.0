Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 205677D208
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 20:27:52 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id u13so15489689iop.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2019 13:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pNkKy9s/EUfHpPS4rQe1vYUf763ljpt18nK6j+3bKlA=;
	b=BdkrWfMB+k177Omxq8nlJ9wWKf+GY9dU1zs0uVfaWF6y+G5b42TE3PQlXSDe8h4/c5
	cFMlWNPgccy4QVNqsYqvSNzsEWGhGsd71wQRFkZ6FSNFsu/HqH74GKDmICumZ+2BS1hz
	f+fd46MzzPVrETgkiOkaoD1J8S86Q2g9mDHZy7ueebICqpNNY3oQuTpOCDzG2PWj88qV
	B6L22qaQMkJ5MEleb9kCnFexKoL3+yi5F5EhyB3b65fOyXRyg0iyRBzjPAIvl2Ax55j9
	Z43+sm5jBlAC9j7HE9MdqkpBfAgXmgfVwla5C9IdO2N2SkyWvZBbwwLIjFf4JVYAoJiP
	kaXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pNkKy9s/EUfHpPS4rQe1vYUf763ljpt18nK6j+3bKlA=;
	b=P6Syy8HEYFZrV6T05TlMrJmT77lqfIIE0fiUjulz0wVd64EXs8hZSUBWUqnDPPy0Zm
	6e1nqceGSfP77q3FSuu16z6SnxHDDzupjGWXfM6NmetAt9/iS72q+LdZ5MRCRkB2MNVq
	M7LTBglTgX1JSFVAjr6TvnF/L4PLFHOVny58W1FCCRor/9XZUEh4eLIoyFTueFYIukC4
	DvnPDqrXZo7EmtGIhlo3VTWyqnTJ/354ycZ+7MdrJscuToZtFNhd9HsxkUvOgxxfXee/
	QvstRFF5d6QAD6od8PoYh/wiPO8t6BVNpqpG5usnZiuKITO1En+27Ue/a65u2Y+ojg+b
	eBPw==
X-Gm-Message-State: APjAAAVQcKDbQYQ4n16dx09aIUHTK7pyMoTeiIzLmLTVt8F+zaqdREPs
	Hlvik9UNRjmL/FRXvKimfqM=
X-Google-Smtp-Source: APXvYqxHLId7aTU0GTILQZTLO7Rb4uMdyLwJP7YUimMLuXNlB8ZSwmYSRNh0kWg+z6FC1uHRwv+atg==
X-Received: by 2002:a5d:9749:: with SMTP id c9mr7882178ioo.258.1559593672821; 
	Mon, 03 Jun 2019 13:27:52 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208])
	by smtp.gmail.com with ESMTPSA id 69sm6560312itl.7.2019.06.03.13.27.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Jun 2019 13:27:51 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Mon,  3 Jun 2019 16:27:50 -0400
Message-Id: <20190603202750.43644-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto: ptest: Add SCSI debug configuration for util-linux
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
X-List-Received-Date: Mon, 03 Jun 2019 20:27:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping the SRCREVs to pickup the following configuration tweak for
ptest usage:

  Author: Mariano López <just.another.mariano@gmail.com>
  Date:   Sat Jun 1 17:30:46 2019 -0500

      Add SCSI debug configuration for util-linux ptest

      The ptests from util-linux require the scsi debug module to be installed
      for a subset of tests. This patch would allow to build the kernel module
      for the linux-yocto kernel.

      Signed-off-by: Mariano López <just.another.mariano@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb    | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb  | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.0.bb       | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index ef1d2a5afa..6604bdf90c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "4dbcaca4c9ff89e866d2b5d01df005f317c618a4"
-SRCREV_meta ?= "6e8033d26894b07e17c48abb5951cc3d4dd9b2a9"
+SRCREV_meta ?= "ad235db461bf4595c668700ca8a909c322009cc1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index e1d2b2e9ac..1fe28b1bf0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "9c1e84c9b81b6bf1df55f26f2e0517266c37f7eb"
-SRCREV_meta ?= "ff7928637fcdf5a7176a2f735f8cb21cd0f4b219"
+SRCREV_meta ?= "31de88e51d100f2c3eefb7acb7390b0144bcfc69"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index 22aac72fac..4ca11d769a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "a3cd9d732b27e78f94634924b7232b6280dae002"
 SRCREV_machine ?= "f0c6c85e155632580bd44a5db01cbb19dcc1559c"
-SRCREV_meta ?= "6e8033d26894b07e17c48abb5951cc3d4dd9b2a9"
+SRCREV_meta ?= "ad235db461bf4595c668700ca8a909c322009cc1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
index 7024d7017f..a9c463cf08 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "fabee455f397ba8054f35a3ad5f2250bbad93bef"
 SRCREV_machine ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
-SRCREV_meta ?= "ff7928637fcdf5a7176a2f735f8cb21cd0f4b219"
+SRCREV_meta ?= "31de88e51d100f2c3eefb7acb7390b0144bcfc69"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index c6f5f0fd57..a5fdafe6b2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "f0c6c85e155632580bd44a5db01cbb19dcc1559c"
 SRCREV_machine_qemux86-64 ?= "f0c6c85e155632580bd44a5db01cbb19dcc1559c"
 SRCREV_machine_qemumips64 ?= "d9c77fe2a6038848fbadd660882b78e590c3252e"
 SRCREV_machine ?= "f0c6c85e155632580bd44a5db01cbb19dcc1559c"
-SRCREV_meta ?= "6e8033d26894b07e17c48abb5951cc3d4dd9b2a9"
+SRCREV_meta ?= "ad235db461bf4595c668700ca8a909c322009cc1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA} \
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index 214e83bd33..da795d97aa 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
 SRCREV_machine_qemux86-64 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
 SRCREV_machine_qemumips64 ?= "5a8b27bcc0b16077ab8edfcd3fb25c80dc2c652e"
 SRCREV_machine ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
-SRCREV_meta ?= "ff7928637fcdf5a7176a2f735f8cb21cd0f4b219"
+SRCREV_meta ?= "31de88e51d100f2c3eefb7acb7390b0144bcfc69"
 
 # remap qemuarm to qemuarma15 for the 5.0 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1


