Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3F13D7C4BB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Feb 2019 13:06:07 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id y8so6114772wmi.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2019 05:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qYYAsecWaONxSWmkSSn0G5sTmUAfSiqAUoFA3YEaDHQ=;
	b=V3bUOmotDSI52XIiearn/THe6mwx0GykKe9loHilRUNCeYKoi9g57IU2exwN9EAcRG
	HrEonXf0VG9Zu2gKqBpcI7INY6U05UGa7y9BzdMXORGrTRJhhXJV2KSZUN8GHmU7KWTm
	B+FN58otPyi65oc1xiCJPBm24JTyCEQcQi4/+jFoCaXpm8CrS6j+vOFwXoFCCqeW0GLM
	BNg7WSu5zdQP6CdQzmPF43dS6gVDJCueo7e2a4PpKYXGkqMDSLkO23Xvi0gGM50mFgSm
	gRVEbB2v8vcLhoUFQn8boNrMQOQFFVwcpLEGUPADJOyTRQ6FTQG1EPGIpf287XfdJ2Vb
	5k+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qYYAsecWaONxSWmkSSn0G5sTmUAfSiqAUoFA3YEaDHQ=;
	b=aL/4wH6co96QWAIeUxl6mjQSKmx5X96UDgScddTtmnHIsIB1TrwHbp/hC8k7qv9kqA
	zckgKjbRC6PdPBpghw3urtje8cdNvBU6Z5624K1C9N9TZOkBWiZ/GM4E7oOZd1GvCBTw
	maaaeRAde6lwgkfGJvsOuZZnxXg1piooOgXZSHgo3CAzH6ARw9fnsVoiDvGbXP7tiNKW
	3tEQNxnkx4bLKKyY+3L1MjXWTh7oGe7QdINGVwSZhvMWfqLE8ynjptvwvwW8m5e+ghqc
	Cu3rBDCSBuNHLlNVc5VSwrW8FrBFM6klu+tfTwXZTg44fatxmNM79DHbZXV3WZyHt6L+
	5bMA==
X-Gm-Message-State: AHQUAubyMrqsVjdOyqiJVqUPUyXcEWRc//VT4g8dRghuO/cPr8iGxgkr
	LAOXrzxG4jgbJ4xntzmGVHXil+K7
X-Google-Smtp-Source: AHgI3IY26VpgcpFMAxa+cOtBjevInK2AdkUkc7V5gryPi2UZF9wsHiGHDbUBWNw/hAJEFdQUX9Yirw==
X-Received: by 2002:a1c:8054:: with SMTP id b81mr2289676wmd.65.1549026367619; 
	Fri, 01 Feb 2019 05:06:07 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	a14sm1273972wrr.13.2019.02.01.05.06.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Feb 2019 05:06:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Feb 2019 14:05:46 +0100
Message-Id: <20190201130554.90094-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190201130554.90094-1-alex.kanavin@gmail.com>
References: <20190201130554.90094-1-alex.kanavin@gmail.com>
Subject: [PATCH 05/13] qemu: build target variant with gtk+, and nativesdk variant without sdl
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
X-List-Received-Date: Fri, 01 Feb 2019 13:06:07 -0000

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


