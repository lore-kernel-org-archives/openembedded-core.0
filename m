Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id B68AB6079F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 14:07:36 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id x1so1597735qkl.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 06:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mjQvSBgqU4q+Bbd5ojSEEHx7dsjCyjZrOi3j8NQoucU=;
	b=aS0a0P7vI8S32XP2o4QcEuLiuihZ2XqDCisAT+Kv/ZUnGeGK3EqVoqPKH3TuJ36hz8
	HgyrHdtH6RijZmVGfsLQELvTwvuiVtRpL2YKuHbnQN4z0CB0jnhTGoidiX1UOfWVJoHp
	TVT29ovXSGKg1d5F1UN4ByME7hRJ4UJCG24DtOyWziCyyv9KyvZIGdbA0GRWxoycJxZD
	zN9Y3a2Q6i48SsC1vqjMYIsrdC2sTKtjkaopJv3EUuE1CWOV53dzeQ2A8lp5rHgQKDj2
	w9Eb7AY3DLH2lMPtaL3psjByDEZfUKKaJ06ANARETqo/ksSIkjd9Jlm7SbhrnypzxonR
	NUbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mjQvSBgqU4q+Bbd5ojSEEHx7dsjCyjZrOi3j8NQoucU=;
	b=IN7DCegJ0mqlu6X4diFIxtTawkO5cv4+bPxdnekk2hVBHEKCuS01P0ikW/h7fxeTFm
	vGjteacHKvurL31isaSzVqjt+UsKcqm1f1dZj1/5+i5xKPH/Vr/DWwWul3pJ9pCaGMKh
	Yz0uYHQmCBCbZlWwdPVxDCCgTeEv9ap3X1Cxyc0xT9b1iHshWr+PQJqPmv6aKlZGciiG
	XNP7ZvXHUOYwVTy5DJAefOhLHQqww7lOZQGMYwNV9DJJHP/FpkyHxu6CAe5ovzYmaD7t
	BM00mXtz5kRbnNSuK5w99mRyiaqN+ay727z8yGEu/e4SxItN+Iaw8KcZfc8zjuBObte7
	d02A==
X-Gm-Message-State: APjAAAUTZ1iotWC7+s9HxfGcLGBBXfxWWzKTQvcEA8AQSbojIAnTxkpz
	m4YVXDY2/nx9f6o1erHG6/Iog6JaagT/Ew==
X-Google-Smtp-Source: APXvYqx454yBt/5sXYsrvWs1IUb0oj99aCxYCO8FgLZXSyZ7aG7TdAqPTrAVnZ7sUGZGMmJfyI8yng==
X-Received: by 2002:a37:77c5:: with SMTP id s188mr2702031qkc.369.1576678057312;
	Wed, 18 Dec 2019 06:07:37 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95])
	by smtp.gmail.com with ESMTPSA id k14sm668918qki.66.2019.12.18.06.07.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Dec 2019 06:07:36 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed, 18 Dec 2019 09:07:25 -0500
Message-Id: <cover.1576677592.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/9] linux-yocto: consolidated (-stable) pull request
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
X-List-Received-Date: Wed, 18 Dec 2019 14:07:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

Here is a delayed pull request on -stable updates that I've had queued
for a while now.

I had put a goal to test all of these on the autobuilder before sending
them, and we did manage to get that done. I've run the quick config against
both the 5.2 and 4.19 updates.

I have almost as many pending commits for the -stable updates queued, but
wanted to get these out first. As usual, the distict commits are on
purpose, since they represent known good build + boot test points.

Also, I hope to have 5.4 as the versioned kernel (dropping 5.2 and 4.19)
in master shortly, but the mips64 boot issue is still persisting and
needs to be solved.

Let's see if the AB testing I did was enough .. or something else manages
to pop out during integration builds!

Cheers,

Bruce

The following changes since commit 7e7b066085c2496a259b356c59acda32d444a261:

  YP 3.1 Docs: Updated Manual revision tables. (2019-12-16 23:32:33 +0000)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (9):
  linux-yocto-dev: bump to v5.4+
  linux-yocto/5.2: update to v5.2.21
  linux-yocto/5.2: update to v5.2.22
  linux-yocto/5.2: update to v5.2.23
  linux-yocto/4.19: update to v4.19.84
  linux-yocto/5.2: update to v5.2.24
  linux-yocto/4.19: update to v4.19.87
  linux-yocto/5.2: update to v5.2.25
  linux-yocto/5.2: update to v5.2.26

 meta/recipes-kernel/linux/linux-yocto-dev.bb  |  2 +-
 .../linux/linux-yocto-rt_4.19.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.2.bb               |  6 ++---
 .../linux/linux-yocto-tiny_4.19.bb            |  8 +++----
 .../linux/linux-yocto-tiny_5.2.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_4.19.bb | 20 ++++++++---------
 meta/recipes-kernel/linux/linux-yocto_5.2.bb  | 22 +++++++++----------
 7 files changed, 36 insertions(+), 36 deletions(-)

-- 
2.19.1


