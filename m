Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QgKKQ-0005jy-A4
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jul 2011 19:31:30 +0200
Received: by yxi19 with SMTP id 19so1697860yxi.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2011 10:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=YWp3IYpZOWGkeZIStjQs0yYvpB/mWQv/epyoSk+07Ek=;
	b=BhbiE1oGw72X+MTIS4OWBT7jW+UbcH7V/xEr6+8UsLplJ9UeyYb1sl7iqkNdNYnyio
	zp7VOu0A5Yv6VkZlNk+jK6Vq9XCBenBsvr1XzsAnAKteN/ZaJoPrlb7D4QuoNPUuvDaS
	3DuAm+L9qp7WSW8E9gT9m07lKf3fISCEFOiUg=
Received: by 10.236.155.39 with SMTP id i27mr5834683yhk.445.1310405252121;
	Mon, 11 Jul 2011 10:27:32 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id z28sm3592901yhn.35.2011.07.11.10.27.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jul 2011 10:27:30 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2011 17:27:14 +0000
Message-Id: <cover.1310405202.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/5] Pending patches on O.S. Systems tree
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Jul 2011 17:31:30 -0000

The following changes since commit 4f36a7f698de5056cb38641a7bf12921dba7d962:

  libx11: enable xcb support (2011-07-08 23:01:54 +0100)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/master

Chris Larson (2):
  Rework how the devshell functions
  oe.terminal: improve how we spawn screen

Otavio Salvador (3):
  fix SDK building due TARGET_ARCH use in installation path
  libarchive: remove undistributable copyright content from source
  cmake: update to 2.8.5 release

 meta/classes/devshell.bbclass                      |   26 ++---
 meta/classes/populate_sdk.bbclass                  |    2 +-
 meta/classes/terminal.bbclass                      |   30 ++++++
 meta/conf/bitbake.conf                             |    2 +-
 meta/lib/oe/classutils.py                          |    2 +
 meta/lib/oe/terminal.py                            |  107 ++++++++++++++++++++
 meta/recipes-devtools/cmake/cmake-native_2.8.5.bb  |   11 +--
 meta/recipes-devtools/cmake/cmake_2.8.5.bb         |   11 +--
 ...rchive_2.8.4.bb => libarchive_2.8.4.yocto.1.bb} |    8 +-
 9 files changed, 161 insertions(+), 38 deletions(-)
 create mode 100644 meta/classes/terminal.bbclass
 create mode 100644 meta/lib/oe/terminal.py
 rename meta/recipes-extended/libarchive/{libarchive_2.8.4.bb => libarchive_2.8.4.yocto.1.bb} (68%)

-- 
1.7.2.5



