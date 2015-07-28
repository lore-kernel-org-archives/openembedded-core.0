Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 52219601F7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 23:21:15 +0000 (UTC)
Received: by igbij6 with SMTP id ij6so135094801igb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 16:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=THFeQJwu64M77rT5Dz+VdhjxNpRMc8/BNufO5EGB/Pc=;
	b=HG/SDVDwewXdFBiSdia5PV/p0cyAJQE5VZhMsBbhYaMQ0oZu+eiWL0W4jMCBwXY9mD
	i2YC/eWhpcwN2v0xTswnOn2xYO7DqJLZ4U7eV8TbHpeuMPYmFM/+gc6SPJMhjx+pCn4G
	gQiKvK8gzsrxumuJVP81N0NP2Zg7lcLcqM2TLub2C9x/M0TyladYVl9mKo0ObuxX3gWp
	ixwDiu+SR26SuAw/LvgV6/2pn3G+4WkuVZOjHtCqdlsIi0/lOenE74QGOYAmONe5uWhS
	i6b4aoAjAjpqaOnrPGxwmHZCd/hjHmfp1UBLcVlCrmZhSQ7NByYer+1s5xmYo02IHvD2
	H4zg==
X-Received: by 10.50.136.134 with SMTP id qa6mr11599278igb.26.1438125676093;
	Tue, 28 Jul 2015 16:21:16 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id i7sm9668533igt.18.2015.07.28.16.21.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Jul 2015 16:21:15 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jul 2015 16:20:57 -0700
Message-Id: <1438125665-14966-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/8 v2] refresh busybox defconfig
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
X-List-Received-Date: Tue, 28 Jul 2015 23:21:17 -0000

The current oe-core busybox defconfig dates back to busybox v1.20.2,
so configure options introduced in busybox v1.21.x, v1.22.x and
v1.23.x take on default values when the oe-core defconfig is run
through 'make oldconfig'. 

The first 4 patches just refresh the oe-core defconfig file (with no
change to the resulting busybox binary). The final 4 patches disable
busybox features added since v1.20.2 which may not be ideal for
oe-core.

Andre McCurdy (8):
  busybox: merge login-utilities.cfg into defconfig
  busybox: re-order defconfig to align with busybox 1.23.2
  busybox: remove CONFIG_FEATURE_VI_OPTIMIZE_CURSOR from defconfig
  busybox: refresh defconfig for busybox v1.23.2
  busybox: disable sha3sum in defconfig
  busybox: disable fatattr in defconfig
  busybox: disable fstrim in defconfig
  busybox: disable volumeid support for exFAT, F2FS and NILFS

 meta/recipes-core/busybox/busybox/defconfig        | 158 +++++++++++++--------
 .../busybox/busybox/login-utilities.cfg            |  13 --
 meta/recipes-core/busybox/busybox_1.23.2.bb        |   1 -
 meta/recipes-core/busybox/busybox_git.bb           |   1 -
 4 files changed, 98 insertions(+), 75 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox/login-utilities.cfg

-- 
1.9.1


