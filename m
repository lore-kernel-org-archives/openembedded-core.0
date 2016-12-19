Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id BA805771D7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 06:40:09 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id y68so7056694pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2016 22:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=y5J4MC1p0z7+lJDkSlssxClVo/EgTuY9ELDmwzM0az8=;
	b=VLdxm8iKlZFSB3lXPauKprHKfbicnvry2/I+3OitOdawXw7tGRYXht860HRnwfNbZX
	Koon1Y9LhY/AoIXazuAJQh5SA8GUvDMBlmBaRXGu6Nneq8EkDrMum/5RMkR2qJRaUjjU
	vR6i4PzU5b0MpcmfpdYLKKGJuVecfzKQPEMPOOc9Tn6vB9csRG2EAVH2qmPRkYZVmVui
	f0VjBBBysVgQuZYYqBl+Oauxu042/ZiVbBpM8rJPBbIKTVYPPa67Xpm5AkMapKg8ljVK
	QHw7nuWfrcd0nfiJUroIgJI8pcohGEDXy5w+S/b7reYs0H5Ljyl5bYrUyHfjrFS639gF
	Nbgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=y5J4MC1p0z7+lJDkSlssxClVo/EgTuY9ELDmwzM0az8=;
	b=LRlWLDaq5O5eJ+KS1gwYm/owDjtQiyyVHXjNYmVb+w1UQ9tbljrPT6VDOjWZaIBJ3B
	lEB28r8a/PHK03BUjq+1hnhRGqNJw7PczhmYVwjlFAspIr6gFNZQ8ULgnZojkhzC0Mzk
	FQmbMY30lSEYZrT6+OYMqp2y0K90KcQ5q+m1xJ5EJwm9QoB7EoQPENw6z3FnPVXl9QSP
	wEkdduzXw8qI+otVQUNl+tYjtO9Yil4CHYAR7M6K0/+R7OO10/Mh0sHgE64Lst+2yfUR
	O/TIfBAtJaioTajsREu0UUm7ERQG8u56+lcL7d30ZtjYRaHbeY8J6ZSZ5/9xm1Q7k/SQ
	H41g==
X-Gm-Message-State: AKaTC00ZK54wf7ptAG6w/cHHQIFq73f+adJQxPXuXuuakvfKVmwUbsHBreGVZhUybWDzIQ==
X-Received: by 10.84.225.129 with SMTP id u1mr32007294plj.110.1482129610963;
	Sun, 18 Dec 2016 22:40:10 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	72sm28238304pfw.37.2016.12.18.22.40.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Dec 2016 22:40:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Dec 2016 22:39:54 -0800
Message-Id: <20161219063957.18716-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20161219063957.18716-1-raj.khem@gmail.com>
References: <20161219063957.18716-1-raj.khem@gmail.com>
Subject: [V2 07/10] x264: Fix build on mips architectures
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
X-List-Received-Date: Mon, 19 Dec 2016 06:40:10 -0000

Disable asm to fix

| You specified a pre-MSA CPU in your CFLAGS.
| If you really want to run on such a CPU, configure with --disable-asm.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/x264/x264_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index e790681ad3..240a19661f 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -23,6 +23,8 @@ inherit lib_package pkgconfig perlnative
 X264_DISABLE_ASM = ""
 X264_DISABLE_ASM_armv4 = "--disable-asm"
 X264_DISABLE_ASM_armv5 = "--disable-asm"
+X264_DISABLE_ASM_mips = "--disable-asm"
+X264_DISABLE_ASM_mipsel = "--disable-asm"
 X264_DISABLE_ASM_powerpc = "${@bb.utils.contains("TUNE_FEATURES", "spe", "--disable-asm", "", d)}"
 
 EXTRA_OECONF = '--prefix=${prefix} \
-- 
2.11.0


