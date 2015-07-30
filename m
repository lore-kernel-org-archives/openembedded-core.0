Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1716F763F2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 20:56:44 +0000 (UTC)
Received: by igbij6 with SMTP id ij6so4219360igb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 13:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=buKx9JLc88t1tCPTExBMWXThWzICyDq2LnTpHiqSDuI=;
	b=u+wKSIJlBnHp5PuWQcQ/RvS2b+Zw8grJv19LwdJtbjeea76268ZUQRh7zaOGqsyBis
	IfxCuLAqP7iRBPKmLRQbXj7gPJshhylO4sRN7XjzTVIJMFaD5PrqrSDXnwQ1IsgWbPZZ
	sSqzfc9bxxcEDUP5QSuJhrsKQ6mDVTYTXRHJKA69vj10J56BMFx2iJEmD4jy3QBsuUlE
	RWKcIXl2UczKrc3K47D6N5rc41wbSYqlJzV5EtUyqKjzFuyGFwz8SlgcsPcxNqzzA8/R
	giLvLKEancYKoZVpsjbgIEto8nhzw6gAavUm3M/8qjzaUWStdvPVE9P2AWX2NSDF4nO8
	B5Jw==
X-Received: by 10.50.124.1 with SMTP id me1mr8391220igb.83.1438289804701;
	Thu, 30 Jul 2015 13:56:44 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id a6sm1530978ioj.1.2015.07.30.13.56.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Jul 2015 13:56:44 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 13:56:21 -0700
Message-Id: <1438289788-23120-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/7 v3] refresh busybox defconfig + enable sha1sum and sha256sum
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
X-List-Received-Date: Thu, 30 Jul 2015 20:56:48 -0000

The current oe-core busybox defconfig dates back to busybox v1.20.2,
so configure options introduced in busybox v1.21.x, v1.22.x and
v1.23.x take on default values when the oe-core defconfig is run
through 'make oldconfig'. 

The first 3 patches just refresh the oe-core defconfig file (with no
change to the resulting busybox binary).

The final 4 patches contain functional changes to the way busybox is
configured. Most changes have been discussed on the oe-core list and
this v3 patch series hopefully incorporates all feedback.

The change to enable sha1sum and sha256sum is new.

Andre McCurdy (7):
  busybox: remove CONFIG_FEATURE_VI_OPTIMIZE_CURSOR from defconfig
  busybox: re-order defconfig to align with busybox 1.23.2
  busybox: refresh defconfig for busybox v1.23.2
  busybox: disable sha3sum in defconfig
  busybox: disable fatattr in defconfig
  busybox: support mount via label for btrfs and squashfs
  busybox: enable support for sha1sum and sha256sum applets

 meta/recipes-core/busybox/busybox/defconfig        | 134 +++++++++++++--------
 .../busybox/busybox/mount-via-label.cfg            |   9 ++
 meta/recipes-core/busybox/busybox/sha1sum.cfg      |   1 +
 meta/recipes-core/busybox/busybox/sha256sum.cfg    |   1 +
 meta/recipes-core/busybox/busybox_1.23.2.bb        |   3 +
 meta/recipes-core/busybox/busybox_git.bb           |   3 +
 6 files changed, 101 insertions(+), 50 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox/mount-via-label.cfg
 create mode 100644 meta/recipes-core/busybox/busybox/sha1sum.cfg
 create mode 100644 meta/recipes-core/busybox/busybox/sha256sum.cfg

-- 
1.9.1


