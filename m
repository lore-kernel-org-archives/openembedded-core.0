Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RNQ8r-0000S7-NP
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 15:25:42 +0100
Received: by bkbzs2 with SMTP id zs2so403929bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2011 06:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=fjFu5gU1rKBjfIFuYC8FLZ8sgCpXuFcaVxKBtwdhGp8=;
	b=A4as1PWbBFXpaofwSbf4lZp69EHkkAmGMfh0d0Niphy7732f/J4bj2DoTpPwSBI9DS
	RPnKDlyJfATHKWpkE5F9nSOIRWG1Na8QjxK4mSIEmUX+UrkwGD8lEwc2FwaAbZ4BZhsn
	kjbGmePjQUtdh4JizwBzDrsOW5sMNFVHXiOAw=
Received: by 10.152.144.136 with SMTP id sm8mr6583554lab.33.1320675558670;
	Mon, 07 Nov 2011 06:19:18 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fr5sm8634124lab.5.2011.11.07.06.19.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Nov 2011 06:19:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Nov 2011 15:19:09 +0100
Message-Id: <cover.1320675529.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.2
Subject: [oe-core 0/6] Merge more stuff from meta-oe
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
X-List-Received-Date: Mon, 07 Nov 2011 14:25:42 -0000

The following changes since commit 0809f98e995d3a2ce24ad25bade3dcd5154061fd:

  lighttpd 1.4.29: rename index.html to avoid clashes with DL_DIR (2011-11-07 14:03:38 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib jansa/pull2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull2

Martin Jansa (6):
  libsdl: enable cdrom, alsa and tslib, disable rpath and add few fixes
    from meta-oe
  kbd: import from meta-oe
  kbd: add RREPLACES/RCONFLICTS/RPROVIDES for upgradeable path from
    console-tools
  task-core-boot, keymaps: add another VIRTUAL-RUNTIME to allow
    distributions to use different set of initscripts or no initscripts
    at all
  keymaps: depend on kbd instead of console-tools
  task-core-x11: use VIRTUAL-RUNTIME variables for xserver_common and
    graphical_init_manager

 meta/recipes-bsp/keymaps/keymaps_1.0.bb       |    9 +++++++--
 meta/recipes-core/kbd/kbd_1.15.2.bb           |   24 ++++++++++++++++++++++++
 meta/recipes-core/tasks/task-core-boot.bb     |    6 ++++--
 meta/recipes-graphics/libsdl/libsdl_1.2.14.bb |   18 ++++++++++++------
 meta/recipes-sato/tasks/task-core-x11.bb      |   10 ++++++++--
 5 files changed, 55 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-core/kbd/kbd_1.15.2.bb

-- 
1.7.7.2



