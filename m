Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8655F60C61
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 17:46:03 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id a2so2544069qko.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 09:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=UtBqASH7ZUOmGIV1BKgqAAEoareG9sMqjCugas9e59M=;
	b=vO5GjY+0AArussgiyEx2Sf0U3aMj34EbTGtBxYpz9B/PI2i2qZtmwy/vOU8VBXDXLG
	rqkD5xlAsnSAdxV3rWnBaiRfKLErILxYIJE24ldxfKOTKdHwonX+0+PCfh6sQ8OK5DPz
	30Xai9ru89eAohT3INz8a/vQLycv+NdDO8DuMiVWq5IpKTDVEX+VjxQH9R7hKtltiH1q
	zdAS7lH5ivxPEaPI3ysR3f37t/dsgc4Jza+YeOKjUsUhDuqs3ptKE5xs34QtU5aT5s71
	lvZBcG6K+7uhULMwMKCD3+3qmZa7XuK0v0OxqqbYPHrW8bhkRV7hMbw6U7ncPoqyMC8E
	P6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=UtBqASH7ZUOmGIV1BKgqAAEoareG9sMqjCugas9e59M=;
	b=nwha0QslQOD5L7HVF890UjXwEHXC9i+wu2OADHx1+jtgmac7MWMyGvkQ7sPmVbKDry
	6FGcX4kUMY/Ov1P5PKIX0yC2OgwP0iMHPJVa0eY3L/UVHOTU9Uf/wLSP2MU/Fiq7e8Yo
	ZfyYuNl3sAa3u4mYkzhoYo8EIIi9csAgHitGQvx3RekchnW3nHSPzMF/f69LR3y3CJpK
	S0msNK1pijtAskKb4uhQ9g/nK3+YuMueqOQ0AkqmG616zlvmrbVR9eZCJ5VwcLRtLi6i
	fuvoWj3Z8qkA9eFJAaFGi2NMTdcdAXBj8D+Fmff0VPMqKx1BTAlfCeiR/ap9nF7t7Ycx
	VVNw==
X-Gm-Message-State: APjAAAUpb+7f5H85C13pPP4LZAIobF40sF1veGEo0BsT6z7DGZB5gwus
	qDvwrwmPZ0q7mgbad5DaGUk=
X-Google-Smtp-Source: APXvYqx875KeditZhn4m0MAgJDIixg812DYN8XE/SMVYyEEF0JKU1tpZwSz2Iaxds7V6luo91+29bw==
X-Received: by 2002:a37:a254:: with SMTP id l81mr33394116qke.133.1582307164195;
	Fri, 21 Feb 2020 09:46:04 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	g17sm1855153qtq.29.2020.02.21.09.46.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 21 Feb 2020 09:46:03 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Fri, 21 Feb 2020 12:45:52 -0500
Message-Id: <cover.1582306887.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/10] linux-yocto: conslidated pull request
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
X-List-Received-Date: Fri, 21 Feb 2020 17:46:03 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

This is the latest in the ongoing efforts to stablize v5.4 and the
reference kernel for the upcoming release.

This has now passed multiple AB runs for me, with only a single
reprodicibility issue popping up (that doesn't look related to the
new kernel).

Note: I'll remove v5.2 shortly as well, but I'm only dropping 4.19
in this series to keep things simpler.

Note2: I'll send a separate series to the yocto lists to bump the
defaults in those layers as well.

Cheers,

Bruce

The following changes since commit 0f54a2fd69c9513cb857a3a0436bd8b75332f4e9:

  oescripts.py: use unittest.SkipUnless for class skip (2020-02-20 13:00:28 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (10):
  linux-yocto/5.4: update to v5.4.18
  linux-yocto/5.4: update to v5.4.20
  linux-yocto/5.2: update to v5.2.29
  linux-yocto: fix PV
  devsrc: fix objtool generation for v5.4+
  linux-yocto/5.4: integrate mips64 multlib/32bit VDSO fix
  linux-yocto: perf: Make perf able to build with latest libbfd
  linux-yocto/5.4: update to -rt11
  linux-yocto: drop 4.19 recipes
  qemu: bump default reference kernel to v5.4

 meta/conf/machine/include/x86-base.inc        |  2 +-
 meta/conf/machine/qemuarmv5.conf              |  2 +-
 meta/recipes-kernel/linux/kernel-devsrc.bb    |  5 ++
 .../linux/linux-yocto-rt_4.19.bb              | 44 ----------------
 .../linux/linux-yocto-rt_5.2.bb               |  6 +--
 .../linux/linux-yocto-rt_5.4.bb               |  8 +--
 .../linux/linux-yocto-tiny_4.19.bb            | 32 ------------
 .../linux/linux-yocto-tiny_5.2.bb             |  8 +--
 .../linux/linux-yocto-tiny_5.4.bb             | 10 ++--
 meta/recipes-kernel/linux/linux-yocto_4.19.bb | 50 -------------------
 meta/recipes-kernel/linux/linux-yocto_5.2.bb  | 22 ++++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 24 ++++-----
 12 files changed, 46 insertions(+), 167 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_4.19.bb

-- 
2.19.1


