Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TQEZL-0003iF-DE
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 11:45:11 +0200
Received: from mail-bk0-f69.google.com ([209.85.214.69])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 22 Oct 2012 02:31:45 -0700
Received: by mail-bk0-f69.google.com with SMTP id jg15so1811932bkc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 02:31:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=zuViEX673OS1wBckbCqN0doSqvMCyBmXMaqXyvBYFdg=;
	b=PTzpgPS2rQNo3pxdsxbB/c4R5fU7Kk3M6C8andpwMIHToKXUAz/yH5ZTegd0FdelOr
	Qdi32gCYe0cnAkKtDXadJMMjVOS5mSvwB+rrhUBqwRHrl8P6cBYuc43qpCf/FpM+6qpZ
	VSgLxcbj+jAUPH6V4nmeEk0pgMuMRS0ZtGTmBJMbSY2jZ5wQDALzQdZxSd8tTg2Qknsv
	iERiCaJ59O0LddHGA+L2q6BcW0Jy9yPWg3rwUwtxPX2o2elhNrXLH/wzsRHnAzJFeTTT
	mljGT4Qh8XIuAy/Yz2BiM51i121gvsXP/GP4znspMaEX3PmkXe519CcIPybtiqpmjNjp
	UG3Q==
Received: by 10.180.91.169 with SMTP id cf9mr16923533wib.1.1350898303146;
	Mon, 22 Oct 2012 02:31:43 -0700 (PDT)
Received: by 10.180.91.169 with SMTP id cf9mr16923518wib.1.1350898302965;
	Mon, 22 Oct 2012 02:31:42 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id w8sm50203841wif.4.2012.10.22.02.31.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Oct 2012 02:31:42 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2012 10:30:26 +0100
Message-Id: <cover.1350898066.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmvMPzfViqHg6GZhQegs92PegCriJrslUN1/HiGsN/lKDCFrzWDZveNami42rJnZ5oXwoGF8AsYNJPrc3fsI0xu75eGELCBmkng/a5dZA7MJHLwDMGqZ7vyoPsslZTTggEGX3clMXCiLg8krsj+SENYWUPTonbN5/5SY1uT5xJJHvarrnRKO/oTbYkqUJ9SlFKP2Io4
Subject: [PATCH 0/3] Wayland precursors
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Oct 2012 09:45:11 -0000

Hi,

Some additions and upgrades as part of the build up for integration of Wayland.

Ross

The following changes since commit caba9cbfce09f19eb27f4c6615c0c5c48e1a2952:

  kernel.bbclass: add kernel-modules to PACKAGES (2012-10-19 23:06:26 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/wayland

for you to fetch changes up to af1365a98c78c547e373195e27c538f71c963dd3:

  atk: Update to 2.6.0 (2012-10-22 09:26:19 +0100)

----------------------------------------------------------------
Damien Lespiau (2):
      libxkbcommon: New window system-independent xkb library
      mtdev: New recipe for mtdev

Daniel Stone (1):
      atk: Update to 2.6.0

 meta/recipes-graphics/wayland/mtdev_1.1.2.bb       |   20 ++++++++++++++++++++
 meta/recipes-graphics/xorg-lib/libxkbcommon_git.bb |   19 +++++++++++++++++++
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc |    2 +-
 .../atk/{atk_2.4.0.bb => atk_2.6.0.bb}             |    8 ++++----
 4 files changed, 44 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/mtdev_1.1.2.bb
 create mode 100644 meta/recipes-graphics/xorg-lib/libxkbcommon_git.bb
 rename meta/recipes-support/atk/{atk_2.4.0.bb => atk_2.6.0.bb} (74%)

Damien Lespiau (2):
  libxkbcommon: New window system-independent xkb library
  mtdev: New recipe for mtdev

Daniel Stone (1):
  atk: Update to 2.6.0

 meta/recipes-graphics/wayland/mtdev_1.1.2.bb       |   20 ++++++++++++++++++++
 meta/recipes-graphics/xorg-lib/libxkbcommon_git.bb |   19 +++++++++++++++++++
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc |    2 +-
 .../atk/{atk_2.4.0.bb => atk_2.6.0.bb}             |    8 ++++----
 4 files changed, 44 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/mtdev_1.1.2.bb
 create mode 100644 meta/recipes-graphics/xorg-lib/libxkbcommon_git.bb
 rename meta/recipes-support/atk/{atk_2.4.0.bb => atk_2.6.0.bb} (74%)

-- 
1.7.10



