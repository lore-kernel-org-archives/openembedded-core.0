Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 64A57788CE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 00:42:44 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id e22so1565320wra.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 16:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=mx39QVHPf0In8NwTceVRAmDTjq/44UEECLKoc7fu2Hc=;
	b=li9mpFCUUdq2KzutZbZhwIiqsWNrCn5hBuc39RNhcK7Yg2bsKE15p90JzVy3uoRBlK
	I6EqJiALb48y5OnXAxg198A9yj547kRlL0VziBPfVb+xreZkf155b3gpabOl7fUfWfEM
	N4r8wAwe2mq/9jQM0YQmvA7G8SGO/XFJQ0SgQ9A7+kj1+es9MSvolRzafIJAYAwhav+I
	J3c3Fs6Yvg/99JcpTiLW0zPubC1ONXgTwu309OrNAoGipAkDgezn7OznUtIfVNLQpx95
	bRpOWbWpVFBpUJ6f50dvCZ10yaJAcjeW0Rya35+wON7lRQen2cQqVhjqmuwaYboF1gQn
	0MNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=mx39QVHPf0In8NwTceVRAmDTjq/44UEECLKoc7fu2Hc=;
	b=g+J2bDXZgP5w8P5F8P9rxoAvjms2xZc6wbb2JwVANxa3MOMkpbbHOQOCOo1SKZOK7T
	+P6jeqYwphk0A+E0zvVxzDhHdXe1NE3FgwvWjsFXmblDDtoazRqCv19+RI627SU0WTFD
	jwksFwuSPA7aPTLc+HJYv5ij3xK0ka0+NvRG6weM9FmZ3jdRoawf35PfRyo2IUL9BTEV
	a5h7P/VTMKTWfrKMR/OqAfFYcK7qxqogAvQxomHrUU/AFfexnBLlJHmAZOrcDngSJSwo
	p5IxHOw+0Si624qkIO3xbvWVKbm6RSqPVytpGX7qql4YHr0AMrh8h/RXDK/wnDNvwi4b
	QixQ==
X-Gm-Message-State: AElRT7GlFkPG5ikBAoj/+RhKy1RYm1lqVuzNVeI150Z2IEBgKesbNoQb
	vlwUreeNBsgBQH4ohYzwxU8=
X-Google-Smtp-Source: AG47ELtXkuG7SIOLGCTR/8gYcmi3BXGfuM+Jg2Zy/PBqLZCiVNFAQTh2smdHDukTWkKAR8lZeo0KBw==
X-Received: by 10.223.145.33 with SMTP id j30mr2420296wrj.172.1520728965617;
	Sat, 10 Mar 2018 16:42:45 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	i127sm2585181wmf.33.2018.03.10.16.42.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 10 Mar 2018 16:42:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 11 Mar 2018 00:42:22 +0000
Message-Id: <5098e46cd7101bcc66dd579352292136b29d840b.1520728802.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <cover.1520728802.git.Martin.Jansa@gmail.com>
References: <cover.1520728802.git.Martin.Jansa@gmail.com>
Subject: [morty][PATCH 10/16] gcc-runtime: Disable libitm on riscv
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
X-List-Received-Date: Sun, 11 Mar 2018 00:42:44 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit 21caa8bcda93ce67ef58548f7b85d0569d13d0b9)
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 15252f1a40..d5339b9a19 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -27,6 +27,8 @@ RUNTIMELIBITM_mipsisa64r6 = ""
 RUNTIMELIBITM_mipsisa64r6el = ""
 RUNTIMELIBITM_nios2 = ""
 RUNTIMELIBITM_microblaze = ""
+RUNTIMELIBITM_riscv32 = ""
+RUNTIMELIBITM_riscv64 = ""
 
 RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic ${RUNTIMELIBITM} \
     ${@bb.utils.contains_any('FORTRAN', [',fortran',',f77'], 'libquadmath', '', d)} \
-- 
2.15.1


