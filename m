Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0FE7C7C2F4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2019 03:07:23 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id x129so25452565qke.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 19:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4UAaqkHUsebuax1q07GPPF5ukusM/O9OWiASLrGjON8=;
	b=Sc8TH43BovHt7aPKwGc8bkvRoTjOMNzEKBPMX0c2JniVN2oNNbPfTuwcnoWmrNnOWE
	WGHkNod3nlcBDspBhUaH/tZe+xA04fWp/5GR8DDPt8Lm9iYmrqO/W85JqdK/NdZh/jUr
	0Oin8yXLNPhn2seOVvaxQh9SchU5sW3n+0sC75egJtflLV3e5/psjxLLPvzFbFh4kBZm
	JGlorEWb/IkTRPoqKgwwbXbwL7qhEY7Mm86iqugM1JA7aHDC9bJroJeZVvN27EuO4qoG
	44fRJpdVj+dm3o2iUvWh5apNpPdxB20FUTJUEYmX/0HlK6cAKqJCmJObf6LQMgMg10Pd
	wo/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4UAaqkHUsebuax1q07GPPF5ukusM/O9OWiASLrGjON8=;
	b=IHjpgdpO7tFiXNvh2AA+d1B6FAbnJjaSl4LUSGM5gUHqbq6Krh59V3d4FR3PTmxC4t
	jMnB4NxCN6qIvRlgLzw9vqUdxr6WFwrGmOH2buRcGKgvbWVEPNzhLXYFGLIKNlmzgt/E
	r2qpq8JNS1P9sDWdjlLKJz8nWM2uJJpemDch2yHlTVE73JHeKh9uJlPVU5Qrho5jpUPp
	mcWC0k5vATcKB8VkEWsGHapGDEVHz6m92x7vwcnrgs/QS/LIJE5iPNDvuddf/uN7UFYi
	9iBzTJ2cSQC+KthTYR8Ai3wd2TOfOQsbPRQPKJQhPc24MLHvE5yPpK2JyoB1N3BUeCY7
	CNYQ==
X-Gm-Message-State: APjAAAWkfEt2brab1MQQKoh8mOnGL1A//DUP55JrKeeoPz5B2m4z5L4c
	S8sxoO/0EDqKvfW2YQjbASE=
X-Google-Smtp-Source: APXvYqxVN8YaaiNcv4zvon/wfh75/l2HptiPfFu9WDtUvFo8q5/dqIfoiDwUKDiX3/CrA5d6YuHKyg==
X-Received: by 2002:a05:620a:1265:: with SMTP id
	b5mr53034301qkl.172.1577675243846; 
	Sun, 29 Dec 2019 19:07:23 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	z141sm12036800qkb.63.2019.12.29.19.07.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Dec 2019 19:07:23 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Sun, 29 Dec 2019 22:07:17 -0500
Message-Id: <cover.1577674956.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Mon, 30 Dec 2019 03:07:24 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

Here's a few more linux-yocto changes that I queued while waiting for
my previous batch to merge.

There are two more 5.2 -stable updates, a gcc10 fix from Khem and a
meta-data fix that was discussed on oe-core. I'll send a documenation
update for the meta-data patch change separately.

I haven't picked up any regressions on these updates, so I've sent
them for merge.

These will likely be the last updates for 5.2, since I have isolated
the mips64 boot problem on 5.4+ and am in the process of coming up
with a work around / fix (but that's on hold until after the
holidays).

Cheers,

Bruce

The following changes since commit 3780744968f0b26cc2f4fea61a0cc594da6fa616:

  chrpath: Cleanup and fix previous patch (2019-12-29 09:27:16 +0000)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto/5.2: update to v5.2.27
  linux-yocto/4.19/5.2/-dev: fix gcc10 build
  linux-yocto/5.2: update to v5.2.28
  kernel-yocto: allow external (aka non-integrated) BSPs to supply
    patches

 meta/classes/kernel-yocto.bbclass             | 15 +++++++++++++
 .../linux/linux-yocto-rt_4.19.bb              |  2 +-
 .../linux/linux-yocto-rt_5.2.bb               |  6 ++---
 .../linux/linux-yocto-tiny_4.19.bb            |  4 ++--
 .../linux/linux-yocto-tiny_5.2.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_4.19.bb | 16 +++++++-------
 meta/recipes-kernel/linux/linux-yocto_5.2.bb  | 22 +++++++++----------
 7 files changed, 44 insertions(+), 29 deletions(-)

-- 
2.19.1


