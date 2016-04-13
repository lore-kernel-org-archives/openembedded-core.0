Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id D9329605FE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 16:12:17 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id n63so10174485qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 09:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=uUVo6tMbfssSj56vbAPUgfdMEEWwpw+5QDoqxV61A0o=;
	b=qOIbjePsR+VyZNukF9pxaTUJ4oBlts30bCE9zZ+cWJUnnGG8jwttmZEjrx5y/woM9r
	P1QyeQi5hfBUWJV0nU5gT7t1Tw/MIZnBJHAugyjtFaYkqnQCFziblpF8mxpTx5mY58MV
	rm9/fYUHOJbgE9tXAMnaWqGh07sB9rGHtifPj3XsmHL/Uaf30TrBhj42Td7xuvGCqQ7E
	E30ivKT9JTmmvDKZ9VGu/EEmv8JhlyUs0OTE1iDxuYi/O07FTlLrKSpl84gmaFx7bv7T
	j03VPfkHPbVW6AlbiqZR6V+kv0Cabk3QAKYAlxJBdKAP5gH4xsbl76PrNTOa+lXSwHqJ
	jaeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=uUVo6tMbfssSj56vbAPUgfdMEEWwpw+5QDoqxV61A0o=;
	b=WYGo22vGVlcnLlXTFBjNXipKA6tnbYzipkE5rYziRiRA4WpHUZFXOFTQ47ntJaA7TY
	L418iCWjpr4JI2j6k/Ryy+OtatoL9yWLZ3zxWTAgUrDw+t6qviJjLmCXOK/noEpCFquA
	Zd0W8ftfUjbub2V/IS7BtFjuFihfY/na5yhnwXFenFzwEXj6xUuxR8FBkSdefUFN2x13
	bHMditGwjUxERsb2DtkNT7i5OD/9Yccq44aY2hQsoTZb2QGDV+x0M+kNplpaAXUYWMsm
	lz6gO3PYUmUTjZakJLViX2fmw1nAZV0N2csI26GO39T7svkQeaaFtTM+x1R99fGBVPbd
	Er7A==
X-Gm-Message-State: AOPr4FVPXlhd/UAvd+O449uvM+fPyBxkvmKlDXKgYeHIloM8LyfIZkMAvJ5FuEXBMFBdoA==
X-Received: by 10.55.71.143 with SMTP id u137mr12723548qka.1.1460563936650;
	Wed, 13 Apr 2016 09:12:16 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CMbcc810032faf.cpe.net.cable.rogers.com.
	[99.224.124.24]) by smtp.gmail.com with ESMTPSA id
	y123sm16264104qka.0.2016.04.13.09.12.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Apr 2016 09:12:14 -0700 (PDT)
Sender: Bruce Ashfield <bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 13 Apr 2016 12:12:08 -0400
Message-Id: <cover.1460563722.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] linux-yocto: consolidated pull request
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
X-List-Received-Date: Wed, 13 Apr 2016 16:12:18 -0000

Hi all,

This series contains some changes that I've been gathering over the past
week. Nothing serious, just BSP mainline backports, configuration tweaks
to tiny (for usability) and a change to make aufs4 opt-in (versus always
on).

I've built and booted this for qemu* (standard and -rt).

Cheers,

Bruce

The following changes since commit e912c468875ffea7e8070cb7813bca262d1cbb0b:

  kbd: remove uclibc-stdarg.patch (2016-04-13 10:12:53 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (5):
  linux-yocto/4.4: gpio-pca953x: fix the "drive" property cannot
    read/write
  linux-yocto/4.1: mainline SPI backports
  linux-yocto/4.4: BXT enablement
  linux-yocto: tiny and pin ctrl config updates
  linux-yocto: make aufs4 optional

 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 18 +++++++++---------
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 18 +++++++++---------
 6 files changed, 26 insertions(+), 26 deletions(-)

-- 
2.5.0


