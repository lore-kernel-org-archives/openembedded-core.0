Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 145546011C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 06:48:10 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id y9so59744157qgd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 22:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yyqGKVEM7kQqB+Qf2oYpsdbuPtyLvoptekmHdTtv+VU=;
	b=yUiztVCQu36kk9IZ6ebHq5oknjgVDLybo2w2/NCuTcyvunPz31/98zhOBMIjQR+iMv
	pg7PkAU8zliCV7Wb6YPWcrD0vs2fG0s2AH24VLnTVwrxf9/UCMwvVGbTVjNqKKnH6I2z
	BBPFlWwbEa7kRZGCn+DzrffxP3t725qSARfZJDpCfefNoy6XQHvhj2dIdpSNGM2X/KSv
	7OA+WDVw0BDxFuMz4wLgVUmez//rTS2rXpT1TrpKauVqieZKZKcP7d6uwkIOPBhx5gfS
	Ec3r4yHM4body9UzbM1xkEI4T0x7Xuflc6gDQIDC2ABJW62kzt38R6tcp2IKtInU0/GX
	psjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yyqGKVEM7kQqB+Qf2oYpsdbuPtyLvoptekmHdTtv+VU=;
	b=TZLP3YgQdenRqdw+mOq3WGYjUHG+ZoQpWAIm3z6ZSfNMGnflD2YDNV4r+ewfXl1avA
	A7wNMhlnCkSUfia6yxOBOkV2QehyNHCFGKLPamE/lchF+FxSamF1NPwQLHU5I99LDpAi
	C65f7QKxOVz1dUNLi3hhu4erGKa9DqaCPkjXgFwQX4+Q5npde9B3EiiUsOtwashBJpqt
	CCafFzLrKrJjssmq7V2s5ssKq1ENBo1+VSVP/y9zyTIvX8GdMz7nPstBagtjGVpU132b
	1HTSAngU4IePo0nYdjw1qyeHZUkt1aMk/rRKwD8+j2McHz0EK89RQ532jWdEaD4GO0JS
	4Kag==
X-Gm-Message-State: AG10YOQgt0AqGbk15b73UP8T6gbDvsZrtR+WdsRpdxatSeGGjB9Avr453Nla+ZwaPL8I7A==
X-Received: by 10.140.161.198 with SMTP id h189mr46806608qhh.24.1456469291598; 
	Thu, 25 Feb 2016 22:48:11 -0800 (PST)
Received: from nyx.sys.comcast.net (a-96-118-179-135.sys.comcast.net.
	[96.118.179.135]) by smtp.gmail.com with ESMTPSA id
	d65sm4779761qgf.30.2016.02.25.22.48.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Feb 2016 22:48:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Feb 2016 06:48:01 +0000
Message-Id: <1456469281-6333-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1456469281-6333-1-git-send-email-raj.khem@gmail.com>
References: <1456469281-6333-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 3/3] musl: Add linux-libc-headers to deps
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
X-List-Received-Date: Fri, 26 Feb 2016 06:48:11 -0000

This is highlighted with clang when trying to
build a single package clean from scratch it
missed kernel headers

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 250f837..3b7c9a5 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -20,6 +20,7 @@ PROVIDES += "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc virtual/libiconv
 DEPENDS = "virtual/${TARGET_PREFIX}binutils \
            virtual/${TARGET_PREFIX}gcc-initial \
            libgcc-initial \
+           linux-libc-headers \
            bsd-headers \
           "
 
-- 
1.8.3.1


