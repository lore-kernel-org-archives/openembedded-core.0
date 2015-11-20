Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id C939760112
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 22:44:10 +0000 (UTC)
Received: by igcto18 with SMTP id to18so22474907igc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 14:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=GGPTQ1oDJWV0lv48wyYsApjqy2o+lBERJ/+wcIJpsyg=;
	b=xKRZCqmFml+W73rUSrOQ2dQFDunhI1vBqzlS2uzmjfTeXHwfLTmEHk0HrFTxssLMR4
	Q9TxFNWIJn3bEWXqwjdLBA2d4mB4dIRM8WXV5yCoqhdGvG8SGVx0nR5DDWNQP2UiT136
	/e+1URWEQqpthS5Xo536cX2n5PEu1tY5mJGvEAv92c/qII3oTAtK7pIqQOBqHwgqb0UQ
	688iRAZMpi/LQD4mS1tkFw1XWij6Xv4gvlg5CnCrtTXuuwUDxN3yFVQNPs98DpqzI0X3
	gYJXSgFvhspH1eQ5AFl0VdVgmZ/zci5YNH6emJcaAAXgYusn7Qppg1yz8sZETH5t3I+j
	nNRw==
X-Received: by 10.50.17.74 with SMTP id m10mr2443988igd.8.1448059450974;
	Fri, 20 Nov 2015 14:44:10 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id p79sm677008ioi.15.2015.11.20.14.44.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Nov 2015 14:44:09 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Nov 2015 14:43:47 -0800
Message-Id: <1448059438-24431-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2 00/11] busybox fixes and cleanups + update 1.23.2 -> 1.24.1
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
X-List-Received-Date: Fri, 20 Nov 2015 22:44:11 -0000

Andre McCurdy (11):
  busybox_git: Enable getopt applet
  busybox.inc: don't export EXTRA_OEMAKE
  busybox: move EXTRA_OEMAKE etc into busybox.inc
  busybox.inc: don't set .config CROSS_COMPILER_PREFIX
  busybox.inc: fix CONFIG_EXTRA_CFLAGS configmangle
  busybox.inc: set CC=${CC} via make command line
  busybox.inc: remove '-e MAKEFLAGS=' from EXTRA_OEMAKE
  busybox: re-order defconfig to align with busybox 1.24.1
  busybox: update 1.23.2 -> 1.24.1
  busybox: disable support for mounting NFS file systems on Linux < 2.6.23
  busybox: enable resize applet

 meta/recipes-core/busybox/busybox.inc              |  16 +-
 .../busybox/0001-Switch-to-POSIX-utmpx-API.patch   | 388 ---------------------
 .../busybox/busybox/0001-chown-fix-help-text.patch |  34 --
 ...ix-double-free-fatal-error-in-INET_sprint.patch |  67 ----
 meta/recipes-core/busybox/busybox/defconfig        |  63 ++--
 meta/recipes-core/busybox/busybox/resize.cfg       |   2 +
 .../{busybox_1.23.2.bb => busybox_1.24.1.bb}       |  16 +-
 meta/recipes-core/busybox/busybox_git.bb           |  18 +-
 8 files changed, 61 insertions(+), 543 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-Switch-to-POSIX-utmpx-API.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-chown-fix-help-text.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-ifconfig-fix-double-free-fatal-error-in-INET_sprint.patch
 create mode 100644 meta/recipes-core/busybox/busybox/resize.cfg
 rename meta/recipes-core/busybox/{busybox_1.23.2.bb => busybox_1.24.1.bb} (70%)

-- 
1.9.1


