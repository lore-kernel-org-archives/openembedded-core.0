Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id C186F7C49D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:47:20 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id d15so13855225wmb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 04:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=qYYAsecWaONxSWmkSSn0G5sTmUAfSiqAUoFA3YEaDHQ=;
	b=qk/yD/a++N11RxM3vsQgiTPxlK4HuYgmETnAuGzYUopE3hWmNefA+zQlwUBL5LoO3k
	2PcxUh5+5nJ7RXzQs9LjWJCDD0EiGT/Ov+rO/a4HvUSBj1sn7HMUFFFh0Qqm2rgqfF47
	vOmToq/la3AEBjhGHoi4tyf0s+TtleaoILIS0a75moRmJ1jKnSKTymGwwuNZjBJKlPKq
	ZqJqCeAWo9L3uoFzDiS/TYqbbCc/JHIeKo9mdcFrkUscHlhBnQE7dyxib3vJD5cVv8B1
	5gwpMJI41OQ8kCokagPRWYow1aWwj+uBgaySFncbMNE0QFqYPlWUmUOiUlHwBE5w8z22
	n3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=qYYAsecWaONxSWmkSSn0G5sTmUAfSiqAUoFA3YEaDHQ=;
	b=dY0aF4AOHcJcuhbMPplAbIHK2I/f1JLRFcsJOEP8zQ1XDXYeU4dS09HcYDiEry0hND
	j8hegDQoA+OnTOcL0rFzSwhd+lgr7IrYzNLMSLccfpirfUwsUV47zV5dEjjuuFZweefr
	IsvWrCefYVWuUhjsW/eerc6cb4TJh5UM3cw3mExWXGGVsrkaDbbX052mwvUlzSXf3bHq
	omVwPM7Ip1AvMr2oZeCDg5x82gphv+echEucULSe3RKeEZpUkbfDTefHCP3EZmhhZvzh
	dKL0kc5N0d+5tPw4AKfKsYSjWrliuQVSptNEqcIMptEExQT7tF5dIW00SMn2ej2vOV5k
	vezg==
X-Gm-Message-State: AJcUukeN5x5HRueCSEMm6e61Lv/BZDj9BV9KYO87rYOVdbWZfVdIUZg5
	5oT0B/uOy38aXDvAdAie0VB52GZV
X-Google-Smtp-Source: ALg8bN5OmYEvB3h8zP1J4t46+/RZ2ttOkllJKmRjgC1m2fW6wknF3VZxFM6TpjnN8JeD7B6S5OvC3A==
X-Received: by 2002:a7b:c34c:: with SMTP id l12mr16795168wmj.147.1548679641405;
	Mon, 28 Jan 2019 04:47:21 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j33sm186026218wre.91.2019.01.28.04.47.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 04:47:20 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 13:46:44 +0100
Message-Id: <4bf17233f8e7aa0d5b10361a1fb15e20dea48c79.1548679462.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548679462.git.alex.kanavin@gmail.com>
References: <cover.1548679462.git.alex.kanavin@gmail.com>
Subject: [PATCH 13/24] qemu: build target variant with gtk+, and nativesdk variant without sdl
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
X-List-Received-Date: Mon, 28 Jan 2019 12:47:21 -0000

As sdl is deprecated in favor of gtk+, it should not be the default.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 95e9e0ede77..07f78058e7b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -71,11 +71,11 @@ do_install_append() {
 # END of qemu-mips workaround
 
 PACKAGECONFIG ??= " \
-    fdt sdl kvm \
+    fdt gtk+ kvm \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
 "
 PACKAGECONFIG_class-native ??= "fdt alsa kvm virglrenderer glx"
-PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm virglrenderer glx"
+PACKAGECONFIG_class-nativesdk ??= "fdt kvm virglrenderer glx"
 
 # Handle distros such as CentOS 5 32-bit that do not have kvm support
 PACKAGECONFIG_class-native_remove = "${@'kvm' if not os.path.exists('/usr/include/linux/kvm.h') else ''}"
-- 
2.17.1


