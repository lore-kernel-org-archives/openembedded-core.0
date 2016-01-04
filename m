Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4D6C6731BD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 14:09:08 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id u188so148252654wmu.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jan 2016 06:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2774GzkCACzVNb5Ww6c/CZjX/+Ajcd7b8TG+Y4QAtjI=;
	b=Mz5Us8ySgxTzGA+lf7z2ggrwYMmm+YjIc3ITiHpu4Fx/yppfuL/LvNxCE3fwPNMKuR
	BkEazVYI+tcZfNzKxpYRu8brzYPTt/fYs1rf5eg9ZseUg257ZyZfcpqx7rjgkB2UxvNU
	5C7zA2Ee2OGtRcQtPB0jt7YUfYGV00L9ZMHJl3nlYT42lFjGLM7D/NfaGnzIiZ8+5z7s
	T1W7Gqswpgaw+XWgBkOyoH3ihIxRayH+0pQUYNfSdRRcoB2VJawBupEESflm64Ngeh6J
	vShdav4uzH0h2U9wih2T/3K3SYy+WPuFFRQPxb2ffHMCWv4o6gBrOfwyJH8bBXUN9BV+
	BgqQ==
X-Received: by 10.194.9.42 with SMTP id w10mr57663647wja.159.1451916549536;
	Mon, 04 Jan 2016 06:09:09 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	c203sm61910624wmd.5.2016.01.04.06.09.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Jan 2016 06:09:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jan 2016 15:13:15 +0100
Message-Id: <1451916795-24862-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1451916795-24862-1-git-send-email-Martin.Jansa@gmail.com>
References: <1451916795-24862-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] pulseaudio: add PACKAGECONFIG for lirc
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
X-List-Received-Date: Mon, 04 Jan 2016 14:09:09 -0000

* it's autodetected from sysroot

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 27197bd..ec73526 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -52,6 +52,7 @@ PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
 # Since many embedded systems don't have non-root users, it's useful to be
 # able to use pulseaudio autospawn for root as well.
 PACKAGECONFIG[autospawn-for-root] = ",,,"
+PACKAGECONFIG[lirc] = "--enable-lirc,--disable-lirc,lirc"
 
 EXTRA_OECONF_append_arm = "${@bb.utils.contains("TUNE_FEATURES", "neon", "", " --enable-neon-opt=no", d)}"
 EXTRA_OECONF_append_armeb = "${@bb.utils.contains("TUNE_FEATURES", "neon", "", " --enable-neon-opt=no", d)}"
-- 
2.6.4


