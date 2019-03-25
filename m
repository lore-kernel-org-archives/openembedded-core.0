Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 827037D074
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 03:12:07 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id g17so11861762ita.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Mar 2019 20:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=02g/v21VDy0VDiK39TU4niaLkyGzoGBYdXLz5ias3OU=;
	b=nbWYsl8b/G5rNjbuuUCaOhrC9fjfNYWi1XbloPVqHvroKyuNMu7WXA+pwIJOBhAji8
	GIaQcPT/a3b9lG1BPFUJGteO8b0HJbaDF/J+4EPJWdv2CKrJt6h30NnBk1jBd4GEoVLS
	9wTdDB+5m9OZuNlzNgSAvkQF60SSi15OtqqQKrNxFOn7zat/u5SxC7geS1qEsr0nEfLn
	rsT0qFj/aY54btqHZT3fVm4C1Qf+Ni9jh8U8Os3EKKmiT58SEeHsZLVM2NtqLYMyv+Fm
	DcRE9hBOSG6hVaO4LjWckQ7QEvXn9WdMh486jgqNPSOu69N1KkUTkvZlH2xAmZKSxJdq
	6BEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=02g/v21VDy0VDiK39TU4niaLkyGzoGBYdXLz5ias3OU=;
	b=ij7Xmfm+TAB6pxzsrA/ObPWrc7vr7SRlKtgLA0yW7w1Xg0kFhi1Y8vko2WX2kpI6D4
	vWY3Qp9xo9sF2w88bAVXva14y4+TBR5g9iz+HSMy6dSuJa4QaqjFUeErW9carr0o1gbV
	bIte9bHwPamany3trJ1e4PVu3Iwig9DHSP+x82+JoenfoIPtQ9Baitz/2A01JefcSNTo
	dUS1nbiXA/+OQC5WGzGILPBqwhA7scyuQwm4njJXa+AjGFdrfBmrtkpKEbPO3jx66Spt
	ZPcePCs/pJH2jf4fgzMio/yLCccV7DdXhEfu2ra5JUZ021XM8NgWLuNjrpkJ1mvbCJyt
	0cwQ==
X-Gm-Message-State: APjAAAWGOQXb6H0hinHM2xyT34e08Djt7Z8MMVAAJR6pZVyp+Ow1JnWQ
	8irjtYSiiENeUKK+bV4XFD4=
X-Google-Smtp-Source: APXvYqywF+S2NAkCn87S1N0fnBVcuu+JXwJun+mUHKwo3u5sFBjPMw0ugHgBqQF9wVXRuu87Xehj+g==
X-Received: by 2002:a02:499c:: with SMTP id p28mr16062345jad.118.1553483528498;
	Sun, 24 Mar 2019 20:12:08 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.116.254.195])
	by smtp.gmail.com with ESMTPSA id l8sm5443416itl.26.2019.03.24.20.12.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Mar 2019 20:12:07 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Sun, 24 Mar 2019 23:11:56 -0400
Message-Id: <eb0f282dcbb9e99d57471d8ae414bc585cbd00ae.1553483380.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1553483380.git.bruce.ashfield@gmail.com>
References: <cover.1553483380.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/8] linux-yocto/5.0: x86/resctrl: Rename INTEL_RDT to RESCTRL
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
X-List-Received-Date: Mon, 25 Mar 2019 03:12:07 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

    The following upstream commits have renamed INTEL_RDT to RESCTRL.
    6fe07ce35e8a ("x86/resctrl: Rename the config option INTEL_RDT to RESCTRL")
    e6d429313ea5 ("x86/resctrl: Avoid confusion over the new X86_RESCTRL config")

Signed-off-by: He Zhe <zhe.he@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.0.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index 204f70030a..65c3698495 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "06e1ff79ea9efef052404ee1989cae038b28e954"
-SRCREV_meta ?= "806a4922a78c0f447e3d0f61fe6b3cce1e2c0acb"
+SRCREV_meta ?= "705457837e7ddd27e4e2ecf6d3dbd255b1aaf848"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
index 105273ff7c..dc60548c6f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "b0477279877bb2b5cca6ec49c64e931901ff2022"
 SRCREV_machine ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
-SRCREV_meta ?= "806a4922a78c0f447e3d0f61fe6b3cce1e2c0acb"
+SRCREV_meta ?= "705457837e7ddd27e4e2ecf6d3dbd255b1aaf848"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index c7e288c4f8..be5dbaedc1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
 SRCREV_machine_qemux86-64 ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
 SRCREV_machine_qemumips64 ?= "2468c20c15477ebe5ecd73c0e0162d7432149318"
 SRCREV_machine ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
-SRCREV_meta ?= "806a4922a78c0f447e3d0f61fe6b3cce1e2c0acb"
+SRCREV_meta ?= "705457837e7ddd27e4e2ecf6d3dbd255b1aaf848"
 
 # remap qemuarm to qemuarma15 for the 5.0 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1


