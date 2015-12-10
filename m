Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id B7C1E6E668
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:46:40 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id c201so33846121wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=tSQ592q5wc2jSQd8Vyw79XJlCBlOrH9APQYxwYixvhs=;
	b=H8Hb1dOUiUXklF+xtSOrvaqOMYy3c2wf3rkmg/KcA97EDCaU+32BXfUHlHlBlwTP26
	uHHm5z9892jG4a+8k1z2gfMoZm5tkLsfjYGZk9sNwkr77fFBPL2Jwhgq6U6cSlk1fIDv
	MxbOR16g7c3O3HO/NWpk/ypIpDRU4TnQAtyBUKBoS0+aBKp0fteNq5/1byeHEYVxRhoj
	GWV9i1JegOhal1PmROp8YjskJx6LT+C2E/qkEF8v1LKUaEAKa1ofP9nKA28p2uj4VXFC
	bfZPlxD/wnhWQvj+kSI479HLY3edUi7b91iHlz4eQ2Iwq4/wwXyNICHPKNBzSOYbE3QP
	7qrQ==
X-Received: by 10.28.23.136 with SMTP id 130mr44612499wmx.94.1449755200974;
	Thu, 10 Dec 2015 05:46:40 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id q74sm4132376wmd.0.2015.12.10.05.46.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 05:46:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Joshua Lock <joshua.lock@collabora.co.uk>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 14:48:17 +0100
Message-Id: <50e7351ba590b54618e023b5ad0cb7fb9bb16c15.1449754339.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1449754339.git.Martin.Jansa@gmail.com>
References: <cover.1449754339.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1449754339.git.Martin.Jansa@gmail.com>
References: <cover.1449754339.git.Martin.Jansa@gmail.com>
Subject: [PATCH][fido][RESEND 1/5] layer.conf: Add several allarch dependency exclusions
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
X-List-Received-Date: Thu, 10 Dec 2015 13:46:40 -0000

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


