Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id C4D0071C86
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 03:06:16 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id i88so6745988pfk.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2016 19:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=y5J4MC1p0z7+lJDkSlssxClVo/EgTuY9ELDmwzM0az8=;
	b=EnZqRg6xYRdMs0hcpS0AwMXKEpPvnoptZqLM2B+6QZ30aXKaC+mUyqjCDie2x/a5ZN
	ZbomZifduwk4oFgym0Ro9Z9stfrk1PWXnj9pQ+UPtHI9/qD7PtS5IACbUIGUeSdXxMi1
	h3EoYeK3zHBzAfeX5t+Cn9bVRh+IYLOkaZdvD3NcPmYUlBVQojHhdLROWrWver9fcOlM
	mmv6GAu2hzYFC/Dliz8FHx8M3HJn5TG3Fb19xW1uqjvZOecmwQ2sw0b4PDM1R0suvR8Z
	6JGShVblHGFLJrSURX7TWyKTx4hk2tvaQ6bTVUVx/Doh7CfpMr6QSlu3N2mFFPzc/hye
	F2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=y5J4MC1p0z7+lJDkSlssxClVo/EgTuY9ELDmwzM0az8=;
	b=r0i3ay9pYZDKB5NU17xsRE5+/XDAmfO/weKa/D2s12+/so4UzRRe+tMFJLVDhKj6X6
	0IdAiyeraFDX2kLa5ai9ITuKcdFGZA9LPUoj0Oi3Y5wmPl4ZCPwm2oGB2RqIt3XK1spq
	2RXaK2559vDKvAA8XLOUq5laszRCXSYpk0uQIr0oFAe8M+Q66nFQpV4/oOjOBPsXGh66
	9R7z7vjae/Ke4BHGw8h+Fb0sTWEI4mULCR7RWRHYWFmbDRuFMBnP4ntp8lGphFbm4wfP
	qrOJ0HOo5851jEwG9r99L+gd01iAASCPOvBlNLOXQK2SrF74CE0X+nn0uoTkqLIMjTmh
	XnQA==
X-Gm-Message-State: AKaTC00WUfNyrG8uKH3t0VH41dAbdGaUFm3jjvX/R3caW4ATuqjghQQ287Gb+63TTO7ILw==
X-Received: by 10.98.4.134 with SMTP id 128mr13221800pfe.156.1482116778350;
	Sun, 18 Dec 2016 19:06:18 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	65sm26830276pfn.12.2016.12.18.19.06.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Dec 2016 19:06:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Dec 2016 19:05:59 -0800
Message-Id: <20161219030600.1284-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20161219030600.1284-1-raj.khem@gmail.com>
References: <20161219030600.1284-1-raj.khem@gmail.com>
Subject: [PATCH 7/8] x264: Fix build on mips architectures
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
X-List-Received-Date: Mon, 19 Dec 2016 03:06:17 -0000

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


