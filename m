Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 062E86E5CC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:46:28 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id w144so24545861wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=hyfB/FhrQ0EutYTwDOLFOEpmSOH85+o3r8f8Y9ivyNM=;
	b=n4H6Z0JzfehpJRX6Lwjq+Yf4w+5r03IjoyC8M/x/Tf0uTnq70vSmeBy1h37f9zVyA8
	VQgTKDGGSdtlNKwxScFUcPMB9n2EojTPw6D3r0AVwFzoUzbxVxZkllu4uhXxDwxEDI30
	sqQWbazLRwGqWDmgcS/6W5hZcyCi6ybgLvVHJrriD9aBwmoKZAqox8p0EI/Eim42+efC
	Tlc70pMhifNAUqS3xqWnGKX/kgENzTCWbyLA6H3xwm/bP6FmYuoL7w6JPkacbrzy7foJ
	R6ZwIG5g2/vzAsQb91bfIGbotUJMYGkWGLsMaFyVXN25Rx0/Ew+7Oi1eyt3/VV4zDX0+
	dH4g==
X-Received: by 10.28.45.72 with SMTP id t69mr43770964wmt.32.1449755189029;
	Thu, 10 Dec 2015 05:46:29 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id 193sm919821wmp.16.2015.12.10.05.46.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 05:46:28 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 14:48:01 +0100
Message-Id: <4948c2645aa49edbef3299f1387bae8bb702e1a0.1449754336.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1449754336.git.Martin.Jansa@gmail.com>
References: <cover.1449754336.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1449754336.git.Martin.Jansa@gmail.com>
References: <cover.1449754336.git.Martin.Jansa@gmail.com>
Subject: [PATCH][dizzy][RESEND 3/7] layer.conf: Add several allarch dependency exclusions
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
X-List-Received-Date: Thu, 10 Dec 2015 13:46:29 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

These are dependencies that our allarch packages have in OE-Core that cause
those allarch packages to rebuild every time MACHINE changes.

With these changes, OE-Core allarch packages all have a common sstate
signatures and no longer rebuild.

(From OE-Core rev: 63bff90fa4fb4a95e8c79f9f8e5dd90ae1dfc69d)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/layer.conf | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index de96548..047292d 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -43,5 +43,15 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   gcc-cross-${TARGET_ARCH}->musl \
   gcc-cross-${TARGET_ARCH}->uclibc \
   gcc-cross-${TARGET_ARCH}->linux-libc-headers \
+  ppp-dialin->ppp \
+  resolvconf->bash \
+  docbook-xsl-stylesheets->perl \
+  initramfs-framework->busybox \
+  initramfs-framework->systemd \
+  liberation-fonts->fontconfig \
+  gnome-icon-theme->librsvg \
+  font-alias->font-util \
+  weston-init->weston \
+  weston-init->kbd \
 "
 
-- 
2.6.3


