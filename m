Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id BA5B87C4DB
	for <openembedded-core@openembedded.org>;
	Tue,  7 Jan 2020 02:34:53 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id k197so27748171pga.10
	for <openembedded-core@openembedded.org>;
	Mon, 06 Jan 2020 18:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=GcmdobHgqPeCe1CVhQmzi6KkhOUL+I9Sg4VHdQnX1Fs=;
	b=dgxA1bVditrrCT/l9EpBvqAhvj0bjw5LMNQsDDjfsInKkwS82Bdejk0uqKD4bods1/
	CzuAJhLRlSMudOup+pTNdUMm8kQi1ebuw2mwWSmv9hQAJl7JBAxNnDQNtJjBaKr5QeC/
	R1WUFMIMzaM73szJOh42liLpMTLULtJuZV530y6vEseMrIHHE96472r2f1f6aUBiHJ1d
	UEzy4qFnFCMS0eQbQuomli1thFnkFFz/JVgLpnO3IcELzMX2p6ymz9OCGb+Ru2Ybu/bn
	QHJaDTlwC0D8La32QP6LXQUuRRDLbYBGM07CTg6kwwPhnyckqFnAmPzMAFuvJhxlcysa
	F6Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=GcmdobHgqPeCe1CVhQmzi6KkhOUL+I9Sg4VHdQnX1Fs=;
	b=cXn3n0NBytgZ2uaraftEtENfNjFmL7oor042xl4iS9qGIf+Wq5l8WMku6IVKW3rpv8
	vjQMPNnBtGudXb7Ld6aGm5NOxFAa2k39g/zLKY0d/KzpmJOoaDOi3m1yjrgSUdufZNxo
	Xou40qkMZtHvs2EXjWF8yQL3a2Zxi6nbEikKXLIalWSEZJ+JUfelT3WvjeVJTQ+TVZC6
	mABpMYVtmKYMusB4AmsMaTVZNzOELhRwpT6y8uWKAKwWocI7caHhKjCZQuGcKV0u5qkp
	Wl9LK8cmNerDW8yvar5m1Q6Qmlf1JvFHS1RW09OAa/DUdQcWkPtiSbSRVG/eskRSVO1K
	WyMg==
X-Gm-Message-State: APjAAAWqWdYjSPOedl/LG0NGr/eVbmUJZD5m0zwKUupIx18rYKtAQosw
	c3FUqHpsPedWjvmKNBVP0IJsX4WD
X-Google-Smtp-Source: APXvYqykDdcRSmBtnkY0r7UMkL+wfAJE+z3efQY2GA6qNO4r4XzzFcJvev6VpSRYlgwfNzPgr9/rjg==
X-Received: by 2002:a65:68d4:: with SMTP id
	k20mr115528250pgt.142.1578364494464; 
	Mon, 06 Jan 2020 18:34:54 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	d23sm77806193pfo.176.2020.01.06.18.34.53
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 18:34:54 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon,  6 Jan 2020 18:34:21 -0800
Message-Id: <e2544503a36bd5e4e5269e4bc04bef5f2b750441.1578364301.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578364301.git.akuster808@gmail.com>
References: <cover.1578364301.git.akuster808@gmail.com>
Subject: [zeus 16/28] linux-yocto/4.19/5.2/-dev: fix gcc10 build
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
X-List-Received-Date: Tue, 07 Jan 2020 02:34:53 -0000

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating Khem's gcc10 build fix:

[
    Author: Khem Raj <raj.khem@gmail.com>
    Date:   Fri Dec 20 17:42:02 2019 -0800

        x86/boot/compressed/64: Define __force_order only when CONFIG_RANDOMIZE_BASE is unset

        kaslr_64.c also defines the same variable, however when both files are
        included into final link, linker complains about multiple definition of
        `__force_order' which is coming from kaslr_64.o and pgtable_64.o, its
        possible that kaslr_64.o is disabled via CONFIG_RANDOMIZE_BASE config
        option, therefore define it conditionally only when
        CONFIG_RANDOMIZE_BASE is not set

        Signed-off-by: Khem Raj <raj.khem@gmail.com>
        Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
        Cc: Kees Cook <keescook@chromium.org>
        Cc: "H. Peter Anvin" <hpa@zytor.com>
        Cc: Ingo Molnar <mingo@redhat.com>
        Cc: Thomas Gleixner <tglx@linutronix.de>
        Cc: x86-ml <x86@kernel.org>
        Cc: Arnd Bergmann <arnd@arndb.de>
        Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d3112fcf7283b9c015e77db1b0a1a78044ed2e23)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../linux/linux-yocto-rt_4.19.bb               |  2 +-
 .../recipes-kernel/linux/linux-yocto-rt_5.2.bb |  2 +-
 .../linux/linux-yocto-tiny_4.19.bb             |  4 ++--
 .../linux/linux-yocto-tiny_5.2.bb              |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.19.bb  | 16 ++++++++--------
 meta/recipes-kernel/linux/linux-yocto_5.2.bb   | 18 +++++++++---------
 6 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index 2c967b3448..b6e0a1e9e2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "d3fb163023de0a5a57a021e58b55976f68142fc0"
+SRCREV_machine ?= "2fbf678238302f33b3aec5a2cba829f260744f24"
 SRCREV_meta ?= "4f5d761316a9cf14605e5d0cc91b53c1b2e9dc6a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
index 6dc2f8078c..673208e4c3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "817c65ec880afb367c6f1d67f524b94ee9c3ae6a"
+SRCREV_machine ?= "b31e1489cfd0f383e662b5599beb83dfe24507bc"
 SRCREV_meta ?= "af93d12baae0ddac3d4c3a1e1a8f8e72da8c395a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index 1220a05d5f..e2626ab4c9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "6e7574e9a9b41143e0c42fcb31b13802529602f0"
-SRCREV_machine ?= "2ba1fa4d5068982e785527ef8ad1a8b658f0add1"
+SRCREV_machine_qemuarm ?= "bd239fb802a15c2759ea456dd1f09f5e106fc88a"
+SRCREV_machine ?= "b44ad1b1e7c685e75b7788a026a2416edc2ee656"
 SRCREV_meta ?= "4f5d761316a9cf14605e5d0cc91b53c1b2e9dc6a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
index dd14bd4937..8bee225287 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "d55854d3c431023d48875bfd96208ed132c5e19d"
-SRCREV_machine ?= "4a765671adc689f3699cd60f58b2851403d0a880"
+SRCREV_machine_qemuarm ?= "0196404da85d109064f138a4a712061bcb999bbc"
+SRCREV_machine ?= "7107e4a83fb9c9e3b5c3d79222f6e0885e99db13"
 SRCREV_meta ?= "af93d12baae0ddac3d4c3a1e1a8f8e72da8c395a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index f585632e48..c6e482a984 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "v4.19/standard/base"
 KBRANCH_qemux86-64 ?= "v4.19/standard/base"
 KBRANCH_qemumips64 ?= "v4.19/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "4d9d89763cde098e4a8b879e8c831e35a5f39ae6"
-SRCREV_machine_qemuarm64 ?= "2ba1fa4d5068982e785527ef8ad1a8b658f0add1"
-SRCREV_machine_qemumips ?= "1f0855745653c8cb7d72ea2d03197889cc82a410"
-SRCREV_machine_qemuppc ?= "2ba1fa4d5068982e785527ef8ad1a8b658f0add1"
-SRCREV_machine_qemux86 ?= "2ba1fa4d5068982e785527ef8ad1a8b658f0add1"
-SRCREV_machine_qemux86-64 ?= "2ba1fa4d5068982e785527ef8ad1a8b658f0add1"
-SRCREV_machine_qemumips64 ?= "5ed73d6e6dc7d4ad8184de8eb6641bdb265ae2ea"
-SRCREV_machine ?= "2ba1fa4d5068982e785527ef8ad1a8b658f0add1"
+SRCREV_machine_qemuarm ?= "19fa1657d1d82d01647c6f73a2bbf39305505294"
+SRCREV_machine_qemuarm64 ?= "b44ad1b1e7c685e75b7788a026a2416edc2ee656"
+SRCREV_machine_qemumips ?= "8fb7ab96b84852ee3d9e1d9d9e7bc35e1249b653"
+SRCREV_machine_qemuppc ?= "b44ad1b1e7c685e75b7788a026a2416edc2ee656"
+SRCREV_machine_qemux86 ?= "b44ad1b1e7c685e75b7788a026a2416edc2ee656"
+SRCREV_machine_qemux86-64 ?= "b44ad1b1e7c685e75b7788a026a2416edc2ee656"
+SRCREV_machine_qemumips64 ?= "c8a036abd7d469013dddab15a23e0d2dde1d0000"
+SRCREV_machine ?= "b44ad1b1e7c685e75b7788a026a2416edc2ee656"
 SRCREV_meta ?= "4f5d761316a9cf14605e5d0cc91b53c1b2e9dc6a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.2.bb b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
index 16b6705f88..bc859519cf 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
@@ -12,15 +12,15 @@ KBRANCH_qemux86  ?= "v5.2/standard/base"
 KBRANCH_qemux86-64 ?= "v5.2/standard/base"
 KBRANCH_qemumips64 ?= "v5.2/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "78b937b0d5d9852a9620d532bb61c8399fc423b4"
-SRCREV_machine_qemuarm64 ?= "4a765671adc689f3699cd60f58b2851403d0a880"
-SRCREV_machine_qemumips ?= "0e8e4a3475849ac390213833980411f19b148841"
-SRCREV_machine_qemuppc ?= "4a765671adc689f3699cd60f58b2851403d0a880"
-SRCREV_machine_qemuriscv64 ?= "4a765671adc689f3699cd60f58b2851403d0a880"
-SRCREV_machine_qemux86 ?= "4a765671adc689f3699cd60f58b2851403d0a880"
-SRCREV_machine_qemux86-64 ?= "4a765671adc689f3699cd60f58b2851403d0a880"
-SRCREV_machine_qemumips64 ?= "5236aae3076bc8edc7a70b928190ae07512e2425"
-SRCREV_machine ?= "4a765671adc689f3699cd60f58b2851403d0a880"
+SRCREV_machine_qemuarm ?= "c0864234924e6b1fb2b5bcf817c88fab1c237d7b"
+SRCREV_machine_qemuarm64 ?= "7107e4a83fb9c9e3b5c3d79222f6e0885e99db13"
+SRCREV_machine_qemumips ?= "534d14808c2948d6e3464735f5dcc203cb4be7f7"
+SRCREV_machine_qemuppc ?= "7107e4a83fb9c9e3b5c3d79222f6e0885e99db13"
+SRCREV_machine_qemuriscv64 ?= "7107e4a83fb9c9e3b5c3d79222f6e0885e99db13"
+SRCREV_machine_qemux86 ?= "7107e4a83fb9c9e3b5c3d79222f6e0885e99db13"
+SRCREV_machine_qemux86-64 ?= "7107e4a83fb9c9e3b5c3d79222f6e0885e99db13"
+SRCREV_machine_qemumips64 ?= "d052f8cffc2a4ce18def4d9ee66e3c2e4f822150"
+SRCREV_machine ?= "7107e4a83fb9c9e3b5c3d79222f6e0885e99db13"
 SRCREV_meta ?= "af93d12baae0ddac3d4c3a1e1a8f8e72da8c395a"
 
 # remap qemuarm to qemuarma15 for the 5.2 kernel
-- 
2.17.1


