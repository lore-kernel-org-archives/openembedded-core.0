Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2D5EF6C0EE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Feb 2019 19:50:42 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id z20so9045117itc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Feb 2019 11:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SiNYwTz0aCcqCZwxa0w/r3bRttyWWPu5mdyjZDQqtnw=;
	b=s8TbzjMVR4C9teRhY9KrUbTd1crG/d1o0esXHJ4MVgR6vKDAIZCzN6HYDZ11DoBqK7
	MhXapQhLcxGDCqChSLpqUC05uIuKz5DpjINmCcDuRh4wYdRGTw+9Omig+ceLIsFTAIOa
	WPPQlWVUx/6HGtP6HUuQOmOOYyZCaaARHY/DTVy67LoJrZNn/vbmWd1hNQ9Bol3oZpua
	RHD7VHMCzjq6Tx5NJb9LCcpHcCpXmBlqBCOUmSAmahZpoqjVYGhBxXtyaVsx77zzJHoQ
	OAiifNZmCkcNElK8beNN3l/SLvsHwJdvJS79h6yBl9Jvkc/O7JJgL1zxcUYdm7+sv2VG
	I4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SiNYwTz0aCcqCZwxa0w/r3bRttyWWPu5mdyjZDQqtnw=;
	b=mL08Zd3a4Zcp4nOHbE7Kwe0GJoo/FcQhIqUvdt/9NV1b59YMSZFFy7J3FUOYNqA8sR
	aYZbRfTo3WYKSJZ8zPI8VA8nwTbO5MvZfyrvGuKHA4naXwEDq2X3v7Az/X6c1/0s0FPa
	o7Rk5KIK67KxldE3RR72ACDleL9jgUOM0KK+d9eKSygSP61VXdvd1aLT1vZJGyZPLeyb
	jiqqUwn9zwSwGWa6OtG8hfrwFaTYqkw04bWa0X9DYRt4fldf+5qbuaKb9BVVYflVtCuV
	nlsXPV5By2BmC7hj/0muBXDRMa7NVQgQ7z5VCULDxr1mijVqOu7fwgx2mHJ90kdCLgl6
	ch4w==
X-Gm-Message-State: AHQUAubD3fsB9S5XgeMnjmGgTv6tu5yHI4vIdJF5bPX4KXC2CiL0qEzf
	El1AeMjIQjrBnX72Kf94nKpVLsF+VnZ62g==
X-Google-Smtp-Source: AHgI3IbWZIxhZ3+MZ6iQAluyJHXAnj1aGFgty7NEp8GHF4GGL/cBfv55/57oQCotezq0F2RQT44OpA==
X-Received: by 2002:a24:4545:: with SMTP id y66mr2872854ita.174.1549482642909; 
	Wed, 06 Feb 2019 11:50:42 -0800 (PST)
Received: from localhost.localdomain ([174.116.254.195])
	by smtp.gmail.com with ESMTPSA id
	w26sm3302983iol.60.2019.02.06.11.50.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Feb 2019 11:50:42 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed,  6 Feb 2019 19:50:37 +0000
Message-Id: <cover.1549481175.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] linux-yocto: consolidated pull request
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
X-List-Received-Date: Wed, 06 Feb 2019 19:50:42 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

In preparation for getting a 5.x kernel into the tree, I'm clearing out
my existing -stable bumps for the active kernels.

Nothing radical here, and they've built and booted on all the relevant
architectures.

Cheers,

Bruce

The following changes since commit 251ded90d4ad75da5e110e916068050f15ace07c:

  archiver/package_rpm: Fix the worst src.rpm generation race (2019-02-06 08:29:07 +0000)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  linux-yocto/4.18: update to v4.18.26
  linux-yocto/4.18: update to v4.18.27
  linux-yocto/4.19: update to v4.19.19

 .../linux/linux-yocto-rt_4.18.bb              |  6 +++---
 .../linux/linux-yocto-rt_4.19.bb              |  6 +++---
 .../linux/linux-yocto-tiny_4.18.bb            |  8 ++++----
 .../linux/linux-yocto-tiny_4.19.bb            |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto_4.18.bb | 20 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_4.19.bb | 20 +++++++++----------
 6 files changed, 34 insertions(+), 34 deletions(-)

-- 
2.19.1


