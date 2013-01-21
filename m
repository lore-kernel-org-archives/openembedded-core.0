Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TxM50-0004JN-Rf
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 19:27:09 +0100
Received: from mail-ee0-f70.google.com ([74.125.83.70])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 21 Jan 2013 10:11:16 -0800
Received: by mail-ee0-f70.google.com with SMTP id l10so7517457eei.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 10:11:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=7nEoDbAk1zmG5EC3Nzo9OGpPBg2H2QNaH3ITam9QzWc=;
	b=UlAuTlFgRCI8gQ6b8VJ0jui99aXhNqSlHdfMImPHLKtVkMNrPtFzfYvYISFkGf04NT
	VBAJqwHNIQRpO220FADhhfXujwBj9SBfDBXp3v8FPyJ1L7ymzbndNihnnAould3h/V1V
	wUioKFe9iY2imPIBTGCAZDnmpsMUqDGOL8ZPbV2cRb0Q5dqlfbYww9tFoC5Q6S/gO/zK
	WNpb0Qa1aRVlLXs6JLsWWtsH4GWanKkhRCWVDPXR0wWp68K3G16mw74iZYSiDmcN5yvq
	KbbchIVw/3rulk40bMIg2QRT2Nw68wKotuwqjIwe9QHlgiRaxgebpdnIvbrYaPgr7c08
	NnKg==
X-Received: by 10.180.93.41 with SMTP id cr9mr16893762wib.19.1358791874480;
	Mon, 21 Jan 2013 10:11:14 -0800 (PST)
X-Received: by 10.180.93.41 with SMTP id cr9mr16893747wib.19.1358791874335;
	Mon, 21 Jan 2013 10:11:14 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bz12sm19814367wib.5.2013.01.21.10.11.12
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 21 Jan 2013 10:11:13 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jan 2013 18:09:16 +0000
Message-Id: <cover.1358791697.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQlwKEKONd5EerAAwfY4yj/h7cbTHNESS/nxGrfhtrwKLWkzkAaT+DvlLRREi9uw1nLScebflaMPjzrBLC3WQibwmAkxkIjk2BuycAGCa4su4WDYh4f+/p3lV4qMz/I1DTymU/R0TSXvBT3Mb9ZJFQ4bm3iJR16UCQfgh+bdpSPuVOqg5zttHwh1r6CdTCaIRjI87z33
Subject: [PATCH 0/4] More systemd fixes
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
X-List-Received-Date: Mon, 21 Jan 2013 18:27:14 -0000

Some more fixes - mainly to skip -serialgetty on !systemd builds to world works,
but two cleanups too.

Ross

The following changes since commit 6b5e11d8d6c839af21c26c89ce01bf2ac94043bf:

  systemd: add missing patch headers (2013-01-21 12:44:54 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/systemd

for you to fetch changes up to 0d1c6df01c4757e227008fc1dee37f225354ebf0:

  systemd: remove unused SERIAL_CONSOLE variable (2013-01-21 17:56:14 +0000)

----------------------------------------------------------------
Ross Burton (4):
      systemd: update uclibc patch headers
      systemd-serialgetty: remove redundant statements
      systemd-serialgetty: skip package when not using systemd
      systemd: remove unused SERIAL_CONSOLE variable

 meta/recipes-core/systemd/systemd-serialgetty.bb              |    9 ++++++---
 .../recipes-core/systemd/systemd/optional_secure_getenv.patch |    4 ++--
 .../systemd/systemd/systemd-pam-configure-check-uclibc.patch  |    2 +-
 .../systemd/systemd/systemd-pam-fix-execvpe.patch             |    2 +-
 .../systemd/systemd/systemd-pam-fix-fallocate.patch           |    2 +-
 .../systemd/systemd/systemd-pam-fix-getty-unit.patch          |    2 +-
 .../systemd/systemd/systemd-pam-fix-mkostemp.patch            |    2 +-
 .../systemd/systemd/systemd-pam-fix-msformat.patch            |    2 +-
 meta/recipes-core/systemd/systemd_196.bb                      |    2 --
 9 files changed, 14 insertions(+), 13 deletions(-)

Ross Burton (4):
  systemd: update uclibc patch headers
  systemd-serialgetty: remove redundant statements
  systemd-serialgetty: skip package when not using systemd
  systemd: remove unused SERIAL_CONSOLE variable

 meta/recipes-core/systemd/systemd-serialgetty.bb              |    9 ++++++---
 .../recipes-core/systemd/systemd/optional_secure_getenv.patch |    4 ++--
 .../systemd/systemd/systemd-pam-configure-check-uclibc.patch  |    2 +-
 .../systemd/systemd/systemd-pam-fix-execvpe.patch             |    2 +-
 .../systemd/systemd/systemd-pam-fix-fallocate.patch           |    2 +-
 .../systemd/systemd/systemd-pam-fix-getty-unit.patch          |    2 +-
 .../systemd/systemd/systemd-pam-fix-mkostemp.patch            |    2 +-
 .../systemd/systemd/systemd-pam-fix-msformat.patch            |    2 +-
 meta/recipes-core/systemd/systemd_196.bb                      |    2 --
 9 files changed, 14 insertions(+), 13 deletions(-)

-- 
1.7.10.4



