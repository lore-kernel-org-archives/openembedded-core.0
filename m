Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id B3DC177115
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 18:27:03 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id f6so3857928ith.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 11:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=I3AhnfaW9cduikCMTN2gNMJfe6D6tSvkw9NHlv6BffA=;
	b=zfINqGQRaqG8DgmcUlb5T5hh0MGtKhVF1z3iA+t2GKTNaoE8nVaKRdIS6oWZ2di7lD
	WYsZlhzPHw8fIW3nRx5Oe1P4B3BEbROq16vREFdodMzDGnKTMknB+fw5DJsPkKsPe25m
	+VSwlDGjXPF1IZwFL9RXzdcmI0COH/ck+LTg+2Y40W1tTnzppoYQkbAgMfmENhIcKtoM
	H/ARoxpV4l/giErWzVFyDPHBbWGeOG3WAt4g5szlH/85ecwmhmMnDMYN0ztbgIq1GzcU
	Bu6/3CsHnoaMurF/Q7poXXcFAc1VFdYJ2hNHNXJIMcPZ+Bg9IdX0vQpe3fo2pbloj1yv
	cmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:references;
	bh=I3AhnfaW9cduikCMTN2gNMJfe6D6tSvkw9NHlv6BffA=;
	b=G6M+NF5ODJjIIgktm1U2YyPWINSkmaZeVBvfqaLyFqj1lTSlwidY1SuzpBo32a6SMx
	NZdrFmh/T336ehBLac4IZtadZRMWtZBav6WOacv51nabtGRBY6JUdT/s958y8sKJP+Ru
	wbQ3OT688zXkLp9MLOn753VUcZZOmlYBek+xuSeBkOgBucBOwoH/FL1fFGglvwb7QXlD
	edsAHuIA5vFvIWJ/heic/39l4YSlW/KWP1hqSqRJz52p0RsIFV/UQtNQWBXfQSsQg+1w
	+MMbYETa/gTToNpcsrWO8yCFIUXuMcdNBjMpewpN/IZC+bzw9qfR4hrHF9Gm7sHujxEN
	JZuQ==
X-Gm-Message-State: AEkoous9gp0qmDM/lO2Ft/GLEO4S2uM+pbXF/bXm+JwTOBRybDuNletPtlLaW+E92TmAqw==
X-Received: by 10.36.217.9 with SMTP id p9mr16297195itg.46.1471285624506;
	Mon, 15 Aug 2016 11:27:04 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CMbcc810032faf.cpe.net.cable.rogers.com.
	[174.112.43.94])
	by smtp.gmail.com with ESMTPSA id 65sm7908858itl.16.2016.08.15.11.27.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Aug 2016 11:27:04 -0700 (PDT)
Sender: Bruce Ashfield <bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 15 Aug 2016 14:26:58 -0400
Message-Id: <4a0874dc16e8da610bb0b1eee47df1198428d0b9.1471281772.git.bruce@zedd.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1471281772.git.bruce@zedd.org>
References: <cover.1471281772.git.bruce@zedd.org>
In-Reply-To: <cover.1471281772.git.bruce@zedd.org>
References: <cover.1471281772.git.bruce@zedd.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] linux-yocto/4.4: -rt update patch meta-data to remove ()
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
X-List-Received-Date: Mon, 15 Aug 2016 18:27:04 -0000

The existing kernel patching scripts don't like () in patch names, since they
are detected as function calls. Although the scripts will be updated to avoid
this error, it is worthwhile fixing the patch names in the meantime.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 82ea08b..2b10d90 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "2b65eaade74b9ec3b3009a6939461ea55d646801"
-SRCREV_meta ?= "86bf91f444418076181fedba14bdafad3a531cf0"
+SRCREV_meta ?= "b030d96c7b8c391a9e155719d649eb0f87358117"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index fca2c54..78b148c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "ddab242999407fadae68e7ee5381b0ec6679d443"
-SRCREV_meta ?= "86bf91f444418076181fedba14bdafad3a531cf0"
+SRCREV_meta ?= "b030d96c7b8c391a9e155719d649eb0f87358117"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index ef0e64b..170f34c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "ddab242999407fadae68e7ee5381b0ec6679d443"
 SRCREV_machine_qemux86-64 ?= "ddab242999407fadae68e7ee5381b0ec6679d443"
 SRCREV_machine_qemumips64 ?= "2d0080f2350e088bdc6129c376eb9e2654a0448a"
 SRCREV_machine ?= "ddab242999407fadae68e7ee5381b0ec6679d443"
-SRCREV_meta ?= "86bf91f444418076181fedba14bdafad3a531cf0"
+SRCREV_meta ?= "b030d96c7b8c391a9e155719d649eb0f87358117"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
-- 
2.5.0


