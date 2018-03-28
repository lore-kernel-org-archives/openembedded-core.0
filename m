Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 557E46093C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 16:28:10 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id v21so6088245wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 09:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=PhgLgJAkSkRHCCMe4R8Lgr41bqkkJ2sBwKIZ7dYT06k=;
	b=VdKNGd9n0KHB6Yx/eQ45E2HE0xZyW98StbnnGF7UEVB73A5hkfNud6mjNBvJv1TZQi
	l1Ga7md0Wcbs/mxoo6+hvV9XE9FtmAAp+TpLoXMjDZR96pQc/Qi3k3SOKkkXPJctpEWD
	AUuMg9sngBQ88S6oOjbsePDTnm8wTkuKaIYA4sORsAq7nGhWZmNEjoslPpwasidtSHig
	3GlXBretuDhN6pQx+VJD6EUHR8Ok/hOAp++F3oIsOv2SX3v1GM1PxbDutyjeIbR60tsw
	BUIzUqDZHXG1FNj40RiF4uXF/RnwQEdAFTBngGrz5f3O4b46sFu1zNStnoVlJIuojvwW
	a4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=PhgLgJAkSkRHCCMe4R8Lgr41bqkkJ2sBwKIZ7dYT06k=;
	b=d/ILzShhGPBWAJYYaukCxNT0FmG5uMQa8WJlLJdnXBTYD3PSbU72AXrKH1veaRw1Sv
	xwQIU45tC0Q3u3XfaN3UzLHDj6ebx4870vZ8uJbkwspTBr59CrUEYanvTR4JV2fhOx8d
	IffObQdDhQdR45twa9Uy7zm6kFPAvO3xGVhOFEEXFynPecsMIExr254xXwQqTKTC3TYB
	QbyLpnTIh7flgvKGCM/gD3pjEofitWNkvgaMDKu5L//ZRwGNpHK/ffiJy+PxCZdyhhG9
	mPU2QkZXtADnKmaeF8EAUSRL0hyz7Ct1ZVVzhubojfZpmq/cwLKiqPUvScDzFHXQbqUW
	nXQg==
X-Gm-Message-State: AElRT7Egq/5shIfGDlaACq3pAsNPQpJ1PnL4fYnngAregn83MSmAyHeh
	MZconlbZvOBSv9silHW9vhq7nR6Q
X-Google-Smtp-Source: AIpwx48HCjf0tzBnJLLhpID3yUMGZxLsfpAMjcOpGZrtbCdTSg8BPYRAjKHexxIWqWd4xQWZ2+10LA==
X-Received: by 10.28.175.82 with SMTP id y79mr3327542wme.93.1522254490807;
	Wed, 28 Mar 2018 09:28:10 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id l41sm8099023wrl.2.2018.03.28.09.28.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Mar 2018 09:28:10 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Mar 2018 17:28:08 +0100
Message-Id: <20180328162808.9990-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] qemu: actually use the aarch64 patch
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
X-List-Received-Date: Wed, 28 Mar 2018 16:28:10 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/qemu/qemu_2.11.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu_2.11.1.bb b/meta/recipes-devtools/qemu/qemu_2.11.1.bb
index 90eeee95c5f..f4b7d69fcad 100644
--- a/meta/recipes-devtools/qemu/qemu_2.11.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.11.1.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
            file://apic-fixup-fallthrough-to-PIC.patch \
            file://linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
            file://memfd.patch \
+           file://0001-arm-translate-a64-treat-DISAS_UPDATE-as-variant-of-D.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+\..*)\.tar"
 
-- 
2.11.0


