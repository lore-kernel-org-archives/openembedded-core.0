Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6FBE4770A0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 06:51:09 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id s68so52393317qkh.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Feb 2016 22:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9BTcaruWI8mY/DbA+WpDyoRPSpCwLf3tyfI21e6yoGM=;
	b=N29oFZ/LTO/A2ozY0ds92q0MCQDW1EWqa68Cwf8mvcoay1ELgsLpuiH7DOtKe1dG0r
	VK5GlBBa50PepQ6xnGVcxb3UUg701y3PrHlCO+WA+gasDswcxTrRwB2nBW6MpS4DL8ww
	w2YJKzEIrWFtxJoaq/AkMxWd1qeWgXEh00yynr3f3oJkEhxzHs3NCJ4KLwZ87Np/ApSC
	vZq0bqkeArdZvpT24IBpMd8qvkGyL1kxomxbdAh4VR0UH9YvWbgPCQzoSx3T++wPw3vv
	lSb3TypVFpe1txD360cnUUBc0drSBQuUVWpyBJYgADZMAdQLl19eWx0FBlJO1P19mulT
	xufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9BTcaruWI8mY/DbA+WpDyoRPSpCwLf3tyfI21e6yoGM=;
	b=B8+IV4LMM4egggq3B3U7s3v8JTruL6j6rK+gJT8IpwQ0hHNnhEGPlaQiEyt7r9FPmM
	aPQpg+DH+mLqj/Xm2SfmvpqU2enTY23TGBSPfMgmkyUn5gvyzW6xu+Ta1QOBGrFKZbU6
	GXnL15HjQkia7VXssbp0ME/yzIgg4Rey0UILSMlcFBqsl7sMBhMwPAkQanucglGMUl6H
	t07TRpY34iaH3Gh8l7/nSwSr/pEJ7w1CSV9UJ6NTqoPuLH0DXxVioltJUtpcTWL6gB3W
	dbXtLVbzdGmrfGyUfG7N3Rxh0yUZ6So9zY2vqIefmmYP1WucCqQJL60rbOVNu/imp0tq
	0Wvw==
X-Gm-Message-State: AG10YOTMoa/p0+ffKFrWWgipRL3qyJPnUoswDe34n7Ejwptaq6+B91caeShoEpayNrJy7g==
X-Received: by 10.55.15.79 with SMTP id z76mr9149577qkg.8.1456123870030;
	Sun, 21 Feb 2016 22:51:10 -0800 (PST)
Received: from nyx.sys.comcast.net (a-96-118-179-135.sys.comcast.net.
	[96.118.179.135])
	by smtp.gmail.com with ESMTPSA id f30sm6114265qga.6.2016.02.21.22.51.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 Feb 2016 22:51:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Feb 2016 06:50:55 +0000
Message-Id: <1456123857-8502-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1456123857-8502-1-git-send-email-raj.khem@gmail.com>
References: <1456123857-8502-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/4] clutter: Upgrade 1.24.2 -> 1.25.6
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
X-List-Received-Date: Mon, 22 Feb 2016 06:51:11 -0000

Here is changes between two versions
https://git.gnome.org/browse/clutter/log/?qt=range&q=1.24.2..1.25.6

For me it has configure fixes to compile it with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../clutter/{clutter-1.0_1.24.2.bb => clutter-1.0_1.25.6.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/clutter/{clutter-1.0_1.24.2.bb => clutter-1.0_1.25.6.bb} (60%)

diff --git a/meta/recipes-graphics/clutter/clutter-1.0_1.24.2.bb b/meta/recipes-graphics/clutter/clutter-1.0_1.25.6.bb
similarity index 60%
rename from meta/recipes-graphics/clutter/clutter-1.0_1.24.2.bb
rename to meta/recipes-graphics/clutter/clutter-1.0_1.25.6.bb
index 093bf6e..f63283b 100644
--- a/meta/recipes-graphics/clutter/clutter-1.0_1.24.2.bb
+++ b/meta/recipes-graphics/clutter/clutter-1.0_1.25.6.bb
@@ -2,8 +2,8 @@ require clutter-1.0.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[archive.md5sum] = "3b98e1b33719982a5736ae42cbf7183e"
-SRC_URI[archive.sha256sum] = "9631c98cb4bcbfec15e1bbe9eaa6eef0f127201552fce40d7d28f2133803cd63"
+SRC_URI[archive.md5sum] = "85ff3ccf892f1467317195e0a2ff395c"
+SRC_URI[archive.sha256sum] = "5f705785d9ab338d54abe0643a9f8af8d79ea691418aff22cfa692995bff1e80"
 SRC_URI += "file://install-examples.patch \
             file://run-installed-tests-with-tap-output.patch \
             file://run-ptest"
-- 
1.8.3.1


