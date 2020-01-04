Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id BAAAB7F8B2
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jan 2020 16:26:38 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id s64so24794499pgb.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Jan 2020 08:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=xxmiV56/BRUneh9WVNygqi7T8BpL0aQIYM8yzVaS64o=;
	b=NzF4d5viPX4K6eXi7txvF3Oe30DTNgE+57xmPCGzjQJUGpcLkDgsQLSAFRkNjbcjhE
	cr+YljFIlBapDSmx2ouemQ1AcH/owh67JiYwYQDUvalXVMUWnbnyxwesBDioDuunUBrZ
	c1nu01skt3V3mTHFrxxIi6AqD0EQ1xQkA5VHrTx9nJ0Zmt8Ei4iUjEcvhmehnFO364wT
	HJGJTrCH4TQXVuoXU9ZQlnqZDOnIDS4UZf/Z5sA2T6+IdBGWw5xr0G0k0U35J1LTEg6S
	l5L94ZzDGrWNhuVaAhQ7CW8X7BGB0rMBJRlFnFoMUUGHbWk4X5DZwijXZtTEupmJ+1nx
	O/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=xxmiV56/BRUneh9WVNygqi7T8BpL0aQIYM8yzVaS64o=;
	b=GvX/lm7pxMo2zKNUv5H6Rv0DafWWndHtv+gsMMXyjjT5yq00BYu0T2ybsr1AE/Mq3q
	1h7zZvU9Cc650NH03jAJMUQYIRaZE4wgVyBziM1+s5WHheWHItyr6fm8PSi00u5X0B6f
	vbjZkWYGHdUwZeFb2ijzWLpgHBH8RuLXQWRckLD9dMQTfr4GCn47NVNMHWjx8ESlUhiC
	wnkiYSsom8Ggz/4W1/ExwURC2Hc/DsxycY61/YnZUBfXFzX+ArmfZEmclN3pX1fXlWsy
	FcAQmBy327miuSFk93QPKngu/gz1ORJOqTPjPeXePVbTUa3c/ip90ivnrU0kMuKmTcvN
	WilQ==
X-Gm-Message-State: APjAAAUb3WASVM+pQ08NhfWXCVJqcJtmcYF17cT44FfAFuFAdugeoy2r
	nkT1lnrb1EY/yZdBrcEBgaT+2K6Osdk=
X-Google-Smtp-Source: APXvYqzOIAXmxJeMNQ2kXZ5cNqAUQUgBZ6KH0uoD1uf6J0cQ87hWJdrE5isT0pdZhodAcnAOqW37vQ==
X-Received: by 2002:aa7:979a:: with SMTP id o26mr100989344pfp.0.1578155199768; 
	Sat, 04 Jan 2020 08:26:39 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e812:6764:3882:fa62])
	by smtp.gmail.com with ESMTPSA id
	u23sm71589976pfm.29.2020.01.04.08.26.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 04 Jan 2020 08:26:39 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Jan 2020 08:26:10 -0800
Message-Id: <b8f7116366ec3cb53a142216125cd8039a83a7d0.1578155074.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578155074.git.akuster808@gmail.com>
References: <cover.1578155074.git.akuster808@gmail.com>
Subject: [zeus 29/29] kernel: Make symbol link to vmlinux.64 in boot directory
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
X-List-Received-Date: Sat, 04 Jan 2020 16:26:38 -0000

From: Vasyl Gomonovych <gomonovych@gmail.com>

Some mips 64 bit platforms use vmlinux.64 image name
Make a symbol link to vmlinux.64 in arch/mips/boot/

Signed-off-by: Vasyl Gomonovych <gomonovych@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 70626b52e5e61c80018e9f1f85bc169d0434b986)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/kernel.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index ebcb79a528..750988f4e5 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -613,6 +613,9 @@ do_kernel_link_images() {
 	if [ -f ../../../vmlinuz.bin ]; then
 		ln -sf ../../../vmlinuz.bin
 	fi
+	if [ -f ../../../vmlinux.64 ]; then
+		ln -sf ../../../vmlinux.64
+	fi
 }
 addtask kernel_link_images after do_compile before do_strip
 
-- 
2.17.1


