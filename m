Return-Path: <christopher.w.clark@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id B662778AFA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 23:46:45 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id q20-v6so303762ith.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 16:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ploBS/pSHF15iG2J1jCdSMksBpCDIlbIUCOL1/boJG8=;
	b=ttLAAFXPkKe2olJXBB1cKxPz88VMZ703XkrFO3UHinwueXNHTdyTy98/0ozMv26aUw
	73fKm9iaFKM30ibOVDllua+7sCltxLvPoU9u4qQFJk6idYk0hOFj2BO33fNvFqwPknwt
	aoc/O3GjIU/664IIV1O+T+L6qWivmqcznJP8pRe3I03DWO9bJSHWOOHtu0DMOhNgXU0O
	hf6iZ0khO10f66DqtiTXLIFy2n2e41fn3WdEEZfj07BdfEPzXedKVKwKdXjfmxeNX57Y
	ZpJyHP2nS4LkBPYs7eWmFNYK76XCauDkRcc8mWHLsA6YXaYLnS8ZsytikJYSfNsZeuNc
	YI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ploBS/pSHF15iG2J1jCdSMksBpCDIlbIUCOL1/boJG8=;
	b=YfUlaAcXkE3ipJnbpTk2UA9pluYx6z0oxfK3czMzSeZHOVkyFeXxveVj2ErDT6irF9
	A78MceR98ejsBjVNilIRfXKOG5FiRTrk54GeNSWHUAzPb3JMyXSaSSaj7hA5HHdtFtJV
	agdsARjK0LhYXHZuqqXU+JCb2Q0oJh0meiaue4dYEbzcet4bWKqW3UtiKrKX2ezozwWg
	2lPWUE/KqDjQHKnJ3IMq5U693TmFdHx0J3kmgyMg7zdm0gmF52mWpX98schl+GAG4i4X
	WH2CJZClFEODWGURapxoTlTKzWCABHp2t/l3v9s7ElvDu0G3KkNqHI/ZyI0tMPMcwaDu
	av8A==
X-Gm-Message-State: AOUpUlEUKpC1adEGYpJFCiURcvXXcCBkvjkEgEBR/yDwK0Eo1mQj+qD6
	3BLY3Aaa4fpu0vQ1VNdtdBUzCptn
X-Google-Smtp-Source: AAOMgpecRLYEc8U2m4d5c9/uALPmVYxwu3fbAJd1H2iyrwshMpIj/oVmj8/hWFB4v8Q2FUUmxqM5xg==
X-Received: by 2002:a24:5cc8:: with SMTP id q191-v6mr77118itb.63.1532562406365;
	Wed, 25 Jul 2018 16:46:46 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	125-v6sm48042itm.29.2018.07.25.16.46.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Jul 2018 16:46:45 -0700 (PDT)
From: Christopher Clark <christopher.w.clark@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jul 2018 16:46:34 -0700
Message-Id: <1532562394-27081-1-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] binutils : enable x86_64-pep for producing EFI binaries
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
X-List-Received-Date: Wed, 25 Jul 2018 23:46:45 -0000

From: Christopher Clark <christopher.clark6@baesystems.com>

On EFI architectures (arm/x86/x86_64/aarch64) add the x86_64-pep
emulation support to the linker to enable production of Portable
Executables for EFI binaries.

Enables building the EFI variant of the Xen hypervisor.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 meta/recipes-devtools/binutils/binutils.inc | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 37813dd..b3efbad 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -69,12 +69,19 @@ python do_package_prepend() {
 
 B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
 
+def enable_efi_targets(d):
+    translated_arch = d.getVar('TRANSLATED_TARGET_ARCH')
+    if translated_arch in ["x86-64", "i586", "i686", "arm", "aarch64"]:
+        return "--enable-targets=x86_64-pep"
+    return ""
+
 EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
                 --disable-werror \
                 --enable-deterministic-archives \
                 --enable-plugins \
                 ${LDGOLD} \
-                ${@bb.utils.contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)}"
+                ${@bb.utils.contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)} \
+                ${@enable_efi_targets(d)}"
 
 LDGOLD_class-native = ""
 LDGOLD_class-crosssdk = ""
-- 
2.7.4


