Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id D9ACE7D6BF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2019 15:38:04 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id q14so5659568itk.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2019 08:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=whenA8gidWwoKV62lXct0WTmzl7Bueig3sgJaWejupU=;
	b=ex5ZNSiGjbhZ72AKxkP+dxoUCZ93a2GvjrIQ9W/LqrwDZaIBbjuYd1lr+5kjyvCcD2
	iA0g1KDr12gUv4zUUSGQSC7O1c0nyCtmwNvzNQIpJJglj8giHqe+IGY6hap2M+rgQ+ev
	4YJ3DJiNrxDFNMu13BRUVKuce/dXf6OCJzd7h3B0zlH4eqTjDCZDRYvWYSB3DrD1NCIz
	PmuGyA/KPKv7dnIO0mMOVFhC9yKCZs8X97MLDCHxQENgbG8M/zv6KqgEAvyVsmSkJyjG
	WhNFKDlLX9wQbUEWmruS7di8+K5S3eEnzGJba+KaRg3AsSnvqwcHNVhrI3XDzRKWC+cv
	+XgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=whenA8gidWwoKV62lXct0WTmzl7Bueig3sgJaWejupU=;
	b=ec8sF4H14reH2nGB3Bec7QyzZHDMZxSpeUezcNGeaEryyvkjhNF2QfHgOdSeXf9VUs
	KXYvNj4HbZ5kY24+MP1IfhsNcUAZ2V2EER5zSVYsRrMK6b9/+8tChJl/axmdNt6PpZpW
	1b21vNo1dsaHq6ylGGTnYq/QSVpNWCbYjAEvMtjCTCOWqhPHWRYBFUNhFVxKvB1hTAHJ
	TH0tUqBZuYT1cJF1fGYSFw56VXOtbGTNzT08f7Uz5duPANd/PivhAF4TDAahZPw61OzQ
	7r2aajvQji06WHkJsBd6dra8j1ZnLeQrEu2Pbq4AE+6YwMdbL7ns4YOe9UhW2FLuk+Nb
	gtoQ==
X-Gm-Message-State: APjAAAXo/guj9LTRy2aA3L5727jytb1BOLtMdMQmB+nEKuxSDgbJpmBr
	HiTZY419B2gwaqZSnOuPJj1CdW8k+9w=
X-Google-Smtp-Source: APXvYqzfe+Z7RMZRQ7nav8n0mNZ82X+zRwM8nHyMWS8nZCx49S513YoKZZtlPtcQ8Y0mkAVj+XtcTg==
X-Received: by 2002:a24:4a4a:: with SMTP id k71mr25232011itb.124.1554824285908;
	Tue, 09 Apr 2019 08:38:05 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	y24sm12376510iol.8.2019.04.09.08.38.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Apr 2019 08:38:05 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Tue,  9 Apr 2019 11:37:55 -0400
Message-Id: <ae59ba550ed1643224ff5e0508d1a6848bff20f7.1554824014.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1554824014.git.bruce.ashfield@gmail.com>
References: <cover.1554824014.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] qemumips: Enable the poweroff driver
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
X-List-Received-Date: Tue, 09 Apr 2019 15:38:05 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following configuration change:

Author: Kevin Hao <kexin.hao@windriver.com>
Date:   Wed Apr 3 19:30:58 2019 +0800

    mips: Enable the poweroff driver for the qemumips/qemumips64

    As Indicated by Richard Purdie, in order to shutdown the machine we have
    to explicitly enable the PIIX4 poweroff driver for the
    qemumips/qemumips64 after the kernel commit dd129c6374e9 ("MIPS: Malta:
    Use PIIX4 poweroff driver to power down") is merged.

    Signed-off-by: Kevin Hao <kexin.hao@windriver.com>

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
index 26c11def0d..7a0b7231ee 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "eac4b8fe170fc8745377cb37c5433db69356d6d8"
-SRCREV_meta ?= "d85f07e03c980eca5ffd5ba058985d6ed3a83801"
+SRCREV_meta ?= "55b740965496961a660674aa4e5b8568b1b9fb7e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index 68c57e89f3..9c0dbcf4ba 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "06e1ff79ea9efef052404ee1989cae038b28e954"
-SRCREV_meta ?= "172634f02e7e293bb53c6c7b1473306b9b30058d"
+SRCREV_meta ?= "bf8eb7d888f05965789dec325e84a3dce8011712"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index 8e132caae7..84a02afc4d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "03eb6106990498e86298646c682fce9fc61f2131"
 SRCREV_machine ?= "253c39a252f25843111b7be0c8247eb4bd6c328d"
-SRCREV_meta ?= "d85f07e03c980eca5ffd5ba058985d6ed3a83801"
+SRCREV_meta ?= "55b740965496961a660674aa4e5b8568b1b9fb7e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
index b3027c0057..c692ce75c5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "b0477279877bb2b5cca6ec49c64e931901ff2022"
 SRCREV_machine ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
-SRCREV_meta ?= "172634f02e7e293bb53c6c7b1473306b9b30058d"
+SRCREV_meta ?= "bf8eb7d888f05965789dec325e84a3dce8011712"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index 0217daa243..f83a6d689b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "253c39a252f25843111b7be0c8247eb4bd6c328d"
 SRCREV_machine_qemux86-64 ?= "253c39a252f25843111b7be0c8247eb4bd6c328d"
 SRCREV_machine_qemumips64 ?= "bb7ae8a8cbe76c9ce2804f651936f059f9f621a2"
 SRCREV_machine ?= "253c39a252f25843111b7be0c8247eb4bd6c328d"
-SRCREV_meta ?= "d85f07e03c980eca5ffd5ba058985d6ed3a83801"
+SRCREV_meta ?= "55b740965496961a660674aa4e5b8568b1b9fb7e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA} \
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index dc3cc11466..8474b500cd 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
 SRCREV_machine_qemux86-64 ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
 SRCREV_machine_qemumips64 ?= "2468c20c15477ebe5ecd73c0e0162d7432149318"
 SRCREV_machine ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
-SRCREV_meta ?= "172634f02e7e293bb53c6c7b1473306b9b30058d"
+SRCREV_meta ?= "bf8eb7d888f05965789dec325e84a3dce8011712"
 
 # remap qemuarm to qemuarma15 for the 5.0 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1


