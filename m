Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id BB29E60111
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Jul 2016 18:15:57 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id bz2so52545822pad.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Jul 2016 11:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=bqAGsOdyvQsBK4fPPPSCn3TKEkf6sQyeVwu9v/vejKk=;
	b=awEEno5FSblbwChmvFIPzBsLyO6IB/rY146n9If67FNyAwSxppjqVbugJ5L6IzNiLR
	aA3Mjcn9RszrmvYs/9yCh9VOf6ldZhrvlmlEb7MQfYKbsQXqHvdTaxt0hp1AGa1ZUJYd
	O50tnjRV+Q8ph0FGsKkHivqeUSER8IuL4MsuidSqU8F4PVjq6Rn34nhWHSMuFZdKNeel
	+nDkPue4YLyAAPsc0AqujBAQlYNnbMWIEfenhHKiw8idrBJF4skB4LqXA5uOmeuuu9Ji
	JuQ4ge3/3rohMuqOpQ1m7vt8nql2YdwsOOvpBOrRsvWIebidc6+tw3tJjwzQEl1s0IrA
	1XJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=bqAGsOdyvQsBK4fPPPSCn3TKEkf6sQyeVwu9v/vejKk=;
	b=c4eFRsI+QPOi8XSRIoCeXzcUlnFV+OYb/epya49aFxM56qwFl0zeSLtdo6HTj0+e/0
	sSH7Xv0EAqm50Q+/m291LoVvH3K/DlTscOuTjbGV5omnPbDxW97gMLTuhrdlgpYZXa+0
	GtrKQmLAnEAJH3RREwctx7+lrmNPbZ6UU1JFSXAyIWY1LvBNZU7j3MRr2J1ecZ2QGv7K
	eP9FXGH3VIn4B6WR9cyBcgzHVh3t9xPuT5Re7OzVNcgPt9J0SS4jjO0bm1H9lv0CbFaM
	CkJVpUcBt35ZaGI2OA+WNey+f9XB73PfbKa+ZJs46WwXTswe1mt8eb+IxIqxZzeEGEEe
	JKXw==
X-Gm-Message-State: ALyK8tJ5HAgBjblDNWMb5fRdKjyk70BKnRz2v764mIgl0JWkJ0hIUGF3HVfviZY/JnSzPQ==
X-Received: by 10.67.13.164 with SMTP id ez4mr15976891pad.32.1467569758329;
	Sun, 03 Jul 2016 11:15:58 -0700 (PDT)
Received: from akuster-ThinkPad-X240.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by smtp.gmail.com with ESMTPSA id 77sm4822770pfp.66.2016.07.03.11.15.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Jul 2016 11:15:57 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster@mvista.com
Date: Sun,  3 Jul 2016 11:15:43 -0700
Message-Id: <cover.1467569369.git.akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/5][v2] Adding qemuppc64
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
X-List-Received-Date: Sun, 03 Jul 2016 18:15:59 -0000

From: Armin Kuster <akuster@mvista.com>

Please consider these changes to add qemuppc64 support.

Added qemu-native support (hope I did it correctly)
Update kernel SRCREV 

[Yocto #9778]


The following changes since commit 5c11e365e19357f721c49d076971567e7b64b61b:

  lib/oeqa: add Galculator to SDK and runtime tests (2016-07-01 16:22:48 +0100)

are available in the git repository at:

  http://git.yoctoproject.org/git/poky-contrib akuster/qemuppc64v2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/qemuppc64v2

Armin Kuster (5):
  machine: add qemuppc64 machine
  linux-yocto: add qemuppc64 kernel support
  runqemu: Add qemuppc64
  qemu: add ppc64 to QEMU_TARGETS
  qeme: add ppc64 to poky QEMU_TARGET

 meta-poky/conf/distro/poky.conf              |  4 +++-
 meta/conf/machine/qemuppc64.conf             | 13 +++++++++++++
 meta/recipes-devtools/qemu/qemu.inc          |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb |  4 +++-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb |  4 +++-
 scripts/runqemu                              |  9 ++++++---
 scripts/runqemu-internal                     | 24 ++++++++++++++++++------
 7 files changed, 47 insertions(+), 13 deletions(-)
 create mode 100644 meta/conf/machine/qemuppc64.conf

-- 
1.9.1


