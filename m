Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 395776FF22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 13:57:14 +0000 (UTC)
Received: by wmec201 with SMTP id c201so156851954wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 05:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=tSQ592q5wc2jSQd8Vyw79XJlCBlOrH9APQYxwYixvhs=;
	b=BCr6I3j4ZfMCnPwEqYImRfJAMXNwKGLa6eOieoaxuhJdeaLAhKtJxNk+MnzDKoF+Yy
	ZXrVjI8u8GzMpeOlFe3xtcn+LChPb1oHbtLOOXRMCmPkP8Lfgf10wuGkB0isW/V+yqSC
	m+FvwoaqkIHu6uwbu6aM5CNxRdnxrAv/s+gw8ILFhbhbW5JU1gtW0f6echC3Vw2lQHGN
	nn/8H6X5rYuHp3NZ2FiRS5csR0NG/mr5hBetQe/REL7ME80CWw/NgwiBMGJDAFX9z1T9
	Odsu+qhY6GVAZvaXke7R5uCcFUUtImxZXi7taUzVW4fsmxPdN91o9U6izyB2FCEnKqak
	iXKw==
X-Received: by 10.28.68.133 with SMTP id r127mr28788402wma.71.1448891835193;
	Mon, 30 Nov 2015 05:57:15 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	t64sm21594803wmf.23.2015.11.30.05.57.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Nov 2015 05:57:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Nov 2015 14:58:04 +0100
Message-Id: <1448891884-30920-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
Subject: [PATCH][fido] layer.conf: Add several allarch dependency exclusions
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
X-List-Received-Date: Mon, 30 Nov 2015 13:57:15 -0000

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
index 573579a..4880371 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -45,5 +45,15 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
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


