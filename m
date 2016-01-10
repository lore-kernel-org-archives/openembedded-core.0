Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 60C08731EC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 00:30:58 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id a20so17986474pag.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jan 2016 16:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=DjZGVudj2bzkX/3R1w+4n8kEJCAzIXalaNVoCAuj3Wc=;
	b=i1d+aCZTnnRpqAv5bFCjF1hG2tNHes+yFozTpar3q3ubu63P+JcZtgYKSvY8c0+EtK
	6RheROx8V+4PYdJgevcRV5LP0D1QFR5wgFQZTJ4M6t//eO0/swU8j5V5qFwthuOPYHBQ
	mI9LuLwb2xhfyhuIoZC368AGzcLWKamJryQBOyZ0H5gj1EeGkAgeN4Ar9cipcew8pJ43
	bEkMfdllS2FRBWVHR6tfb1r08/3g0igA3uESgdF3idv67DSurbI7IEwzaRJTPxvrnzOq
	sPNVIdbqy2sN22pyJ+S4ZkQ/tFrOqQCtWXm6TsPOTEcg0DBfHzuZovT7FsPdFfZwrxY9
	oybA==
X-Received: by 10.66.189.200 with SMTP id gk8mr4458461pac.36.1452385859355;
	Sat, 09 Jan 2016 16:30:59 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	73sm13694421pfm.10.2016.01.09.16.30.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 16:30:55 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 3C0F5FCC83C; Sat,  9 Jan 2016 16:30:49 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jan 2016 16:30:33 -0800
Message-Id: <b84f9e3b17fd10833dd45682a6b0db7345c0ab2a.1452385571.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452385571.git.akuster808@gmail.com>
References: <cover.1452385571.git.akuster808@gmail.com>
In-Reply-To: <cover.1452385571.git.akuster808@gmail.com>
References: <cover.1452385571.git.akuster808@gmail.com>
Subject: [PATCH 07/20] layer.conf: Add several allarch dependency exclusions
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
X-List-Received-Date: Sun, 10 Jan 2016 00:30:58 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

These are dependencies that our allarch packages have in OE-Core that cause
those allarch packages to rebuild every time MACHINE changes.

With these changes, OE-Core allarch packages all have a common sstate
signatures and no longer rebuild.

(From OE-Core rev: 63bff90fa4fb4a95e8c79f9f8e5dd90ae1dfc69d)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
1.9.1


