Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
	[209.85.219.65])
	by mail.openembedded.org (Postfix) with ESMTP id 399BD611E1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 14:55:26 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id ea1so892572qvb.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 06:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=x0ut99HHB6n4m+Z+IxuMs6PVLAwMkk7QeEqMiUN9BkI=;
	b=ss7iOmfHp483tralAIz31dVsr9EkzWXp/j4vYno8GvY4Q7q0t+j/idhrIete6IbF6Y
	3qHaWjwDNd9/4SDGc2T+4ThAOWjYbwRZmcZ1NkwOO/lvPLvYyAJBY0WhQVhbcwh3VY3O
	8FHtZkHMaFnyYx1jyTIBn2f80UufHsRsMzqaFO/NyriidF+Pf6mkuPRVfCJp8Ix6MiWB
	gDNQzVHnXUm7o4KRXkWL9N+VEER5C8zv9r14NFw0tJJkTXbPVUMcJTKYSBP3QlxU4Xfj
	IIRg+1UVKtsmDMowS0axZV5aOGyUbgHIXabpuMo6C3RYIzc5U3SRVtyJQnxlIdttdDaS
	bjrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=x0ut99HHB6n4m+Z+IxuMs6PVLAwMkk7QeEqMiUN9BkI=;
	b=cKrFmr2ff1X+YFY16TnURbg1AloBQhlnRVOFsBaiPtgjihvOyJZSmvf32XD06MENty
	qzuiYzVAquxCXb/3WRJU1osjZrxXIOdWXA7dPedH9zqXvQ0V6Aosjo/tQEKJiCg17Zb2
	qRYMkIxlQYhO2oJYSt2b8Q3PzIRyVHy0lAW2a0jQ/Tt7eE6BguG+4YiRxr/niFQ91oPE
	r6pe0QkQYs6FZs1PnyvIwcfkBw/LHRwtHWPv5XdtgWXNLLrgpC+mhmNS7N0W7h3N3xry
	VihxFqb6ITXECn7XMt3KiqQBMQo0vCfrUJdStZxv8hNy1YkXcx4yLyVnoZds4ELExNem
	68Fw==
X-Gm-Message-State: ANhLgQ0cn0A5OrQQhHU6XquROlVZ0Q2Gk1B9KWS5YejcHRYuufNVhI6a
	/fJSsCu3kCZPS4SC2u0fgys=
X-Google-Smtp-Source: ADFU+vvkFxk/0t5PzfPfFGrarJqYHOmrzRbCmH4ha98W9C+3Uark5WyYs4KTAlWmurBKtqSz7lnfjg==
X-Received: by 2002:a0c:cd87:: with SMTP id v7mr2250883qvm.151.1583333726925; 
	Wed, 04 Mar 2020 06:55:26 -0800 (PST)
Received: from localhost.localdomain
	(CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.240.214]) by smtp.gmail.com with ESMTPSA id
	w83sm13455065qkb.83.2020.03.04.06.55.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Mar 2020 06:55:26 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed,  4 Mar 2020 09:55:20 -0500
Message-Id: <cover.1583333447.git.bruce.ashfield@gmail.com>
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
X-List-Received-Date: Wed, 04 Mar 2020 14:55:27 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

As mentioned on the technical call yesterday, here's my latest set of
5.2 updates, 5.4 updates and more importantly, the removal of 5.2 from
master.

As usual, I'll continue to support and update 5.2, just without sending
SRCREV updates to master. The last set of updates to v5.2 put it in
good shape, and they are ready for backport to any stable branches.

I ran this through the AB and didn't see any issues or old references
to v5.2.

I'll follow up to other lists to drop a few of the old bbappends.

Cheers,

Bruce


The following changes since commit 92e172b5b4de8927d36409386dfce0fc2718f5d1:

  systemd: Fix service file for race issues (2020-03-03 13:06:29 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto/5.2: backport perf build fix for latest binutils
  linux-yocto: common-pc-drivers.cfg: add CONFIG_INPUT_UINPUT
  linux-yocto/5.4: update to v5.4.23
  linux-yocto: drop 5.2 recipes

 .../linux/linux-yocto-rt_5.2.bb               | 44 ---------------
 .../linux/linux-yocto-rt_5.4.bb               |  6 +--
 .../linux/linux-yocto-tiny_5.2.bb             | 32 -----------
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +--
 meta/recipes-kernel/linux/linux-yocto_5.2.bb  | 54 -------------------
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 ++++----
 6 files changed, 18 insertions(+), 148 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_5.2.bb

-- 
2.19.1


