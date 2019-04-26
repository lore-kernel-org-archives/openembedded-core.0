Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5EF2C7DBB9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 14:52:22 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id a190so6259215ite.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 07:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=g1HwFg3P5l1XRssVseX70nFbsqICqG0vAfOPy3YZXoc=;
	b=CUlH2wU3JnYB+aAXi28kS+dDj8JfrEmpSyt9NeVqKYq26eDr4hdK0fc0IxGO+vAT8C
	Fi043iua4MqXfZ9gTX10YrHaCohzlOG4zIQOfedAihrK2dLVSSnhok0GatOtqBbFXadE
	uGbH+soFizc9qu2WdNFKZszAGZ/c6gyA3P5SmAyIsmN34e+NOdgQTQo8OnNf7HxHBIgl
	2LCgnW92rwtxZwJbPEyXKF+H7R5kVlSVnQ964EwEM5I4XgPJz7focPXZmyoYckWAnmCZ
	8fQcRYiMi+25NAvsG1awO8u0HhXAMbKjQC/0SO3d8My6/CMRQFMvlqVHQj2mujsUzopP
	fdLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=g1HwFg3P5l1XRssVseX70nFbsqICqG0vAfOPy3YZXoc=;
	b=S3e6C1WZegsI0631J7nEG4juIuXSjUW75EgJTwYyRjZp/U2f+V1+gdJ8uqEqh1RRej
	pDRn32DEusAW5B59TuDOXme4/GWdB+XZhVs2s5FnBfGdKIDQPH74TnGUXeTmiYuFDlL7
	aMbYYNxp5RQCGZ29lPTxrcpf0mwmU74AmYPyxz2sCFLaSvZOwGdSBERkNSJjcC9tdHA+
	g9E228zNOBbqSBOfAuMOiFmEMSn+uT5H/Munf/sJwcx1B8pN4Kz4Gc0xA8jeF5wsQ8qe
	+OxkPzwOB48npIz5WEKiksDKkj/tRO2KwJA7hZ4OWcrf4dhAfr7smlE8mctK+rLF+cdj
	8NBg==
X-Gm-Message-State: APjAAAXfr6fzxaBg8wqt0MzPzGAmWmLcH5MqcjV1AbwtnERQO7qqfb/l
	320jVZA5KxKvwDxu/waye88=
X-Google-Smtp-Source: APXvYqyLBoT356Zs45uwc/qwWjaHtH4yjFRLYGVECbPhpKZFe2650yoICM9DFZWGzNnhi1WTatFHzw==
X-Received: by 2002:a05:660c:685:: with SMTP id
	n5mr9084916itk.57.1556290343124; 
	Fri, 26 Apr 2019 07:52:23 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208])
	by smtp.gmail.com with ESMTPSA id t24sm4625947ioc.1.2019.04.26.07.52.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Apr 2019 07:52:22 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Fri, 26 Apr 2019 10:52:16 -0400
Message-Id: <27fba68ef9896043491e89eeb33532a9a67d87fe.1556289910.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1556289910.git.bruce.ashfield@gmail.com>
References: <cover.1556289910.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] linux-yocto/5.0: port RAID configuration tweaks from master
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
X-List-Received-Date: Fri, 26 Apr 2019 14:52:22 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Porting the following three RAID config changes from master to
the 5.0 branch:

   ffd8cf5baf8 intel-x86: add Intel VMD support
   8edf951a15c cfg/efi.cfg: built-in CONFIG_EFIVAR_FS to support Intel VROC
   041a6c04244 intel-x86: built-in nvme driver to support boot from nvme disk

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.0.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index 842aa5b93f..07fa910ee8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "04585fb29f99725a27acb96fc25efa0a55a62a8a"
-SRCREV_meta ?= "7477b32eaf608884be5664fadd79331b39afaaa6"
+SRCREV_meta ?= "ffd8cf5baf8e741b8987b72c942ce3b9cc7c7f30"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
index eba6cc6f47..c1084f2bb9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "e265300362d7004e3b57bb5cbcfc65fb469b9ce9"
 SRCREV_machine ?= "9c40ed0d86ad87f48659aad4fdead2455e8b5db8"
-SRCREV_meta ?= "7477b32eaf608884be5664fadd79331b39afaaa6"
+SRCREV_meta ?= "ffd8cf5baf8e741b8987b72c942ce3b9cc7c7f30"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index fe773bed98..01269dda27 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "9c40ed0d86ad87f48659aad4fdead2455e8b5db8"
 SRCREV_machine_qemux86-64 ?= "9c40ed0d86ad87f48659aad4fdead2455e8b5db8"
 SRCREV_machine_qemumips64 ?= "437d99225c689f3f192bb834e4d649ea0467ac87"
 SRCREV_machine ?= "9c40ed0d86ad87f48659aad4fdead2455e8b5db8"
-SRCREV_meta ?= "7477b32eaf608884be5664fadd79331b39afaaa6"
+SRCREV_meta ?= "ffd8cf5baf8e741b8987b72c942ce3b9cc7c7f30"
 
 # remap qemuarm to qemuarma15 for the 5.0 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1


