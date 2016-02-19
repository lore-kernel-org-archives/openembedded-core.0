Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 348357720D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 14:48:41 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id yy13so51432967pab.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 06:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=GRKoDhXbRYq3w/y2C9PZzSJvbUtpxJxjD+kanjYSgYs=;
	b=dUGu5ihfCM3h4myponanXPJSKK/Nj1ea0EAFZIdM6o699qJhPsYiCxGyqu9OtAC3tf
	lNLx38h9SYkc6FZQZlko39Nw7bn0FSgPyYnrqipJwCy4D3GUn9t3K5o3XPPu2fcW+tdQ
	jpreWqVKJABB9XW1WCCCq3mEgAUm6A/AOkgO5cfBtZj1tI8zMawbQ6k645bHN0VdJkdv
	M4Muel6NkkZE0OdHjFhKnP9AFJDc5yKQRTlDw3s5vCcT4nS517MaqcbH++A5WYKj3dAW
	JdbjxF5vp0S7IeZ4CrTcFCw/Nru7e+A91lDuWeDizkhk7DTEwq4paaEhykP4cmPPxC+c
	y0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=GRKoDhXbRYq3w/y2C9PZzSJvbUtpxJxjD+kanjYSgYs=;
	b=ZEMCUonFhVbLuG4FSEN6D+h3PqHV1udSrFSJ/veDraOH6RoicoxHEVWxuRgzTkFpho
	ngayxHE+bEBE671kHmUHR4aOvrNqtj29qgZVTivak5Of9eqO1bOBMgDI9sxonaHL72zq
	+YdptZF+CnAd1jgqFDs6eAFy89bAW7MJiXz65uY3QVVLmKVPNka2pZORpfHj9RAnRGZB
	bzNhOyCyPxR4JHKQVytrdOX3lpuWWWyR0BxD8EvylWc4HRVULgLzWA5JKeDC0pJDljeA
	Riy3LMoVtP8lDrl+nvyk5JT8DN+5/M2p5lfuw9R7rr/MUeeE35co22dpTGDjTlsa3teS
	Vxqw==
X-Gm-Message-State: AG10YORxHHMLqiyPE2xEybJCzSA5SMYJmnnhuwmkbkJuvrBYMdmup1JmdCfxcvitk+J46w==
X-Received: by 10.66.132.73 with SMTP id os9mr18172933pab.27.1455893322526;
	Fri, 19 Feb 2016 06:48:42 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	195sm18469223pfa.5.2016.02.19.06.48.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 Feb 2016 06:48:41 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com, openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Fri, 19 Feb 2016 06:48:20 -0800
Message-Id: <cover.1455892758.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
Subject: [Jethro][PATCH 0/5] Jethro Pull request
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
X-List-Received-Date: Fri, 19 Feb 2016 14:48:42 -0000

From: Armin Kuster <akuster@mvista.com>

Please consider these security fixes for Jethro next. Some maybe a resend as I don't know if they are queued anywhere.

Master has these in some for or another.

The following changes since commit ae57ea03c6a41f2e3b61e0c157e32ca7df7b3c4b:

  libbsd: Security fix CVE-2016-2090 (2016-02-18 10:57:11 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/jethro_cve_fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/jethro_cve_fixes

Armin Kuster (5):
  uclibc: Security fix CVE-2016-2224
  uclibc: Security fix CVE-2016-2225
  libgcrypt: Security fix CVE-2015-7511
  qemu: Security fix CVE-2016-2197
  qemu: Security fix CVE-2016-2198

 meta/recipes-core/uclibc/uclibc-git.inc            |   2 +
 .../uclibc/uclibc-git/CVE-2016-2224.patch          |  49 +++++
 .../uclibc/uclibc-git/CVE-2016-2225.patch          |  32 +++
 .../recipes-devtools/qemu/qemu/CVE-2016-2197.patch |  59 +++++
 .../recipes-devtools/qemu/qemu/CVE-2016-2198.patch |  45 ++++
 meta/recipes-devtools/qemu/qemu_2.4.0.bb           |   2 +
 .../libgcrypt/files/CVE-2015-7511_1.patch          | 245 +++++++++++++++++++++
 .../libgcrypt/files/CVE-2015-7511_2.patch          |  55 +++++
 meta/recipes-support/libgcrypt/libgcrypt_1.6.3.bb  |   4 +
 9 files changed, 493 insertions(+)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/CVE-2016-2224.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/CVE-2016-2225.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-2197.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-2198.patch
 create mode 100644 meta/recipes-support/libgcrypt/files/CVE-2015-7511_1.patch
 create mode 100644 meta/recipes-support/libgcrypt/files/CVE-2015-7511_2.patch

-- 
2.3.5


