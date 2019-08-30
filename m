Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7E3127F3F2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 16:06:34 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id o9so15096724iom.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 09:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yUpOVDAZepg5IPOT3pLnAZyloAvvjREf5iMEPvN+wW8=;
	b=S5z1s1bqCsypwbQaQcxi8P0P1nToIvUJZOR+qwUqlSB4BVSdJh5YAA4F+n/eB/DBY4
	+Xnqkbdcy6b4qQKKELRcLppWU0Cl1uk8HYfKU3BBVrI5HH/6F4pR6E7vEjJrwBI9F2H3
	MeBZHz3j8MFE40py6l9INZ1ak9QnTObd6lwqYWCzwC8/Hg6PSh9snIpDDJH9chSAkkvW
	lKxT+cQPUj71+umAscXJfNCvmkXxyQxxYQwF7aMKrKGdhk91BGLV2XsFztQSlqIhXm10
	nbijcoW1vqt5BsYUnU6cdHPBxprIkv3dsRnQsj4sYmVrIEiJKH2X5hKcBDmeC3NWK94l
	jxbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yUpOVDAZepg5IPOT3pLnAZyloAvvjREf5iMEPvN+wW8=;
	b=Z6CtOinZ6D9SeLCd/6ZJMW2lEvRVKyypdP5vkgAqQWBpv1FIRM7c01L3cTLpgCmDy3
	gmIT5FZksgdk1Mg+KSqBH61ilUm/2D+aF27XJlRI1Bz6tDCvItji2kEyEPjCT4kAHtk1
	ak1KP9ukaG8wiPRFRWPEZsjmNUtknm1jqBs1DTegbbGlpGjbAG/rrb9mtYbhN0D3mrrh
	j4JwG8G2/z0nK23qpRHiRqyrvXB3+KAxfrTpefoVX3iDC2fpZvYMTLVi8ro/wdsX0eA9
	o0ZZuj/CUXXLIgyuMVK5TvZtjMHD84Qpthp0itIjOshv4QkdfcyGdPATQoqBM4Td42zm
	3LnA==
X-Gm-Message-State: APjAAAVmHSoZXKTJzm5tV8+IOoJJGkxwgQnfaw5uOvbAAeLPG4EFf7vb
	FbM9fYT7Eat5AiItIANjYEs=
X-Google-Smtp-Source: APXvYqyijlSUXZ3X9dn8XEsUf48ePX+gJ+OzCxHIfAMfSnNmjBkvfx5CYOwXgQKqxHUDLUVYLRRfiA==
X-Received: by 2002:a5e:a80f:: with SMTP id c15mr1079044ioa.270.1567181195142; 
	Fri, 30 Aug 2019 09:06:35 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208])
	by smtp.gmail.com with ESMTPSA id p3sm4514672iom.7.2019.08.30.09.06.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Aug 2019 09:06:34 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Fri, 30 Aug 2019 12:06:29 -0400
Message-Id: <cover.1567181039.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3 v2] kernel-yocto: 5.2 intro series
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
X-List-Received-Date: Fri, 30 Aug 2019 16:06:34 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

These are the patches for the 5.2 intro that aren't in your current master-next.

Kevin's meta-yocto-bsp can use a minor SRCREV bump, and I'll send that shortly
to the appropriate list. But even running with it as-is, isn't a problem.

I will also follow up with the 5.0 removal and some other minor tweaks once
this introduction of recipes goes green.

Cheers,

Bruce

The following changes since commit be28058c101a38ad9e01c0ce95bbe0c7dee19410:

  Revert "poky.conf: make systemd as default init manager" (2019-08-30 13:37:48 +0100)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel-next
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-next

Bruce Ashfield (3):
  linux-libc-headers: update to v5.2 headers
  linux-yocto: introduce 5.2 recipes
  qemu: bump linux-yocto preferred version to 5.2

 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 meta/conf/machine/include/x86-base.inc        |  2 +-
 meta/conf/machine/qemuarmv5.conf              |  2 +-
 ...sm-ptrace.h-should-not-depend-on-uap.patch | 62 -------------------
 ...aders_5.0.bb => linux-libc-headers_5.2.bb} |  5 +-
 .../linux/linux-yocto-rt_5.2.bb               | 44 +++++++++++++
 .../linux/linux-yocto-tiny_5.2.bb             | 32 ++++++++++
 meta/recipes-kernel/linux/linux-yocto_5.2.bb  | 54 ++++++++++++++++
 8 files changed, 135 insertions(+), 68 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-arm64-sve-uapi-asm-ptrace.h-should-not-depend-on-uap.patch
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_5.0.bb => linux-libc-headers_5.2.bb} (75%)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_5.2.bb

-- 
2.19.1


