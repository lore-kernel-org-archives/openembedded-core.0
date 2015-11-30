Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id C83FC60616
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 13:54:57 +0000 (UTC)
Received: by wmww144 with SMTP id w144so130421605wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 05:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=hyfB/FhrQ0EutYTwDOLFOEpmSOH85+o3r8f8Y9ivyNM=;
	b=ShQW7Y0yP5yMg5KlKYtrq3fRMYoHF0ttnGK+gBkxmC1+ndu6BgpGsgfdHjrYe6oGg6
	THCFXsoqdbSjqh8vNZ/fEyH0rr5gvsVEayeuxhfuitSQJsze5p8Shk1mkh0k6TA9jaZS
	MSuG5rlFaGw5gqG+GAeCynNO4VNmXCnTrZPkTLCcLvS/0/x24vE0OZ8NC2S9Dnacgk3E
	FczvCDsr54JsoL32SbqNBvyT/g4rh41Rgbu6XpLEPdiU5htjlO1JsMJXHwuYs8fGCRuN
	axtdFjDwu0sdQ9ntaNob7OrJLLlBJMkAb8pfAv+Ns4EzIhlCu6S9UA1GZvcVaGf5AQ7P
	gi9g==
X-Received: by 10.194.116.170 with SMTP id jx10mr45370593wjb.166.1448891697493;
	Mon, 30 Nov 2015 05:54:57 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	a186sm21389666wmh.4.2015.11.30.05.54.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Nov 2015 05:54:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Nov 2015 14:55:46 +0100
Message-Id: <1448891746-30556-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
Subject: [PATCH][dizzy] layer.conf: Add several allarch dependency exclusions
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
X-List-Received-Date: Mon, 30 Nov 2015 13:54:59 -0000

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


