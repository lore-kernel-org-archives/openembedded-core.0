Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5CE467FAB6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 09:47:46 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id c22so1658038wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 02:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=qA9kp0bj93/0rnmkNz6X/c+TjTM3kjQT1l+igW0Tsr0=;
	b=tqMIly5XPDFiBqMRBlbLlODr76GpM0DkueZKI7FehsYdKlczMn88D5CaO3ojDGIvgk
	wvdq5iLcxLkIY5MtrOnctVXfOGKcxnWRSFI5l95hCVBf0KIRPBJQvRhjsMUu0e3iMmrI
	m/K8pnK2IOuYcNlaDhTTqsYhwSE44hOrZ2KQ59T1IKlO5mTwHJ2t/vQfYViDXII0ijRH
	EY+fVhCbknmc6kk2glbg19U2LSbB6Q8k2thf+eHV07Wy1X+GCyNft1QMIPZz3aS2mYWv
	JrteowdaGY8cjXn0kxf63TdCcGegH2wJPLf2uCyboIhB4ZpShdH1NuQFr7pzNO5bfbZQ
	21Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=qA9kp0bj93/0rnmkNz6X/c+TjTM3kjQT1l+igW0Tsr0=;
	b=r4ukEX+OAQIjgoVKLZQbtuZW7+XyOS6zCy9n4z0NuyRVOSVeO4tOu7iLLak2gAoyjb
	yCFI0nauCsiCrF7IxeQhYQKstMV9h/yQTrNzkGlWq9AujP6wzWq7wxreujWDk3yh79Ts
	Y8t6ziKhFYxFZHzrZ7mYLh0EqucOcVwcUWeN1Qzh7o6RPXQkfcba/QJca8BsEm+OUYUu
	v2bB19gY870OTANyWoOSxf82CMMWwZkceVO4yG2BoHtP0/TDjBHOHeh6701M9emog0bq
	JQyZiJgmmmwUfMU+dcfzbN9YItb2RdSvAXUWL/LeSS+uo6A6gu6gC5Lar++0lehaQl56
	2dig==
X-Gm-Message-State: APjAAAX3tURD6xR0uHEWwC8RLWZyxSVCkESlu3TESfAhBF5pUITZFqUQ
	niAwLXKOtL2uho36RVOqzqWPkvbKjVg=
X-Google-Smtp-Source: APXvYqzfzJqrgo5gxhWW40GhyTjTXkGxUi1sUSppHSSOlspaEwKTZJfL2Oq7Q7dTnyqwGDqXoNnf4Q==
X-Received: by 2002:a7b:c7c8:: with SMTP id z8mr3156821wmk.29.1572342466867;
	Tue, 29 Oct 2019 02:47:46 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com ([91.217.168.176])
	by smtp.gmail.com with ESMTPSA id
	36sm29150537wrj.42.2019.10.29.02.47.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Oct 2019 02:47:46 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Oct 2019 10:47:18 +0100
Message-Id: <404aeb5c35a67101c2ebeca7a05d287bf87676b4.1572341125.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572341125.git.akuster808@gmail.com>
References: <cover.1572341125.git.akuster808@gmail.com>
Subject: [warrior 05/19] linux-yocto: bsp/beaglebone: support qemu -machine virt
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
X-List-Received-Date: Tue, 29 Oct 2019 09:47:46 -0000

From: Bruce Ashfield <bruce.ashfield@gmail.com>

While we don't normally do a dual h/w and virt BSP (since they
tend to have conflicting requirements over time). A minimal overhead
option to do this was submitted to linux-yocto. Since it has no
impact on the h/w reference, has SDK testing value and can serve
as a template on how to do this for other arm boards, it is worth
making the configuration available.

The original commit log follows:

[

   If the kernel supports Qemu's virt machine, runqemu works almost for free.
   The device tree for machine virt is included in Qemu, which simplifies
   everything quite a bit.
   This change adds ARCH_VIRT=y and some drivers to the beaglebone kernel
   configuration which allows to:

     export MACHINE="beaglebone-yocto"
     bitbake core-image-minimale
     runqemu

   This also works out of an eSDK. Whithout this feature usually two
   different SDKs need to be compiled and maintained. One SDK is used for development
   in Qemu, another one is used to develop for the real target hardware.

   Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
]

(From OE-Core rev: cc1fca6d464775daa15032f11c02d16b99759407)

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.0.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index cc6ffd5..d7b3b38 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "9c1e84c9b81b6bf1df55f26f2e0517266c37f7eb"
-SRCREV_meta ?= "eb6ef084f987441359145c41cadcbdd768eeb012"
+SRCREV_meta ?= "c2e34d9ab2894edc6abc6be9ac89907bf4348447"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
index a3a9315..c0caed3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "fabee455f397ba8054f35a3ad5f2250bbad93bef"
 SRCREV_machine ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
-SRCREV_meta ?= "eb6ef084f987441359145c41cadcbdd768eeb012"
+SRCREV_meta ?= "c2e34d9ab2894edc6abc6be9ac89907bf4348447"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index b106a37..895cb15 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
 SRCREV_machine_qemux86-64 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
 SRCREV_machine_qemumips64 ?= "5a8b27bcc0b16077ab8edfcd3fb25c80dc2c652e"
 SRCREV_machine ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
-SRCREV_meta ?= "eb6ef084f987441359145c41cadcbdd768eeb012"
+SRCREV_meta ?= "c2e34d9ab2894edc6abc6be9ac89907bf4348447"
 
 # remap qemuarm to qemuarma15 for the 5.0 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.7.4


