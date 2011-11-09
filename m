Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROCDX-0007og-ME
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 18:45:43 +0100
Received: by faat2 with SMTP id t2so2001263faa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2011 09:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=sVn6qUupD3/rO37y1EifAbfNjpMCSWWvFbY8h5cFG40=;
	b=eLeE4Gwi1ZUwoVgltvCAbg6thglRcppt0bQ9oLjKIhQMay5ctFou/KZsEBZm71B8gG
	IA4w15XicAcasgSEHlRhzk0xGqcMMwHXnIaK7TZxlADcAI3XAvvPFk2f7XCCaKESqd4t
	aBK0hD05FXSgaWJMLDdI6xqfvyuR/P0UBdWyI=
Received: by 10.223.17.23 with SMTP id q23mr6229713faa.11.1320860368137;
	Wed, 09 Nov 2011 09:39:28 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y2sm7409411fag.12.2011.11.09.09.39.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Nov 2011 09:39:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 18:39:20 +0100
Message-Id: <cover.1320860288.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
Subject: [PATCHv2][oe-core 00/10] Merge more stuff from meta-oe
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
X-List-Received-Date: Wed, 09 Nov 2011 17:45:43 -0000

v2: 3 more libsdl patches based on sgw review to cleanup libsdl dir and use PACKAGECONFIG

The following changes since commit 25fae81538a92e15eab3fc169ebce44505f67839:

  python: skip setup.py 'import check' when cross-compiling (2011-11-08 21:44:23 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib jansa/pull2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull2

Martin Jansa (10):
  kbd: import from meta-oe
  kbd: add RREPLACES/RCONFLICTS/RPROVIDES for upgradeable path from
    console-tools
  task-core-boot, keymaps: add another VIRTUAL-RUNTIME to allow
    distributions to use different set of initscripts or no initscripts
    at all
  keymaps: depend on kbd instead of console-tools
  task-core-x11: use VIRTUAL-RUNTIME variables for xserver_common and
    graphical_init_manager
  libsdl: drop unused files
  libsdl: rename files dir to libsdl-1.2.14 for faster lookup
  libsdl: enable cdrom, alsa and tslib, disable rpath and add few fixes
    from meta-oe
  libsdl: enable alsa/opengl based on PACKAGECONFIG and respect
    DISTRO_FEATURES
  libsdl: replace tabs with spaces

 meta/recipes-bsp/keymaps/keymaps_1.0.bb            |    9 +++-
 meta/recipes-core/kbd/kbd_1.15.2.bb                |   24 +++++++++
 meta/recipes-core/tasks/task-core-boot.bb          |    6 ++-
 .../libsdl/files/directfb_obsolete_calls.patch     |   35 ------------
 .../recipes-graphics/libsdl/files/extra-keys.patch |   55 --------------------
 .../{files => libsdl-1.2.14}/configure_tweak.patch |    0
 meta/recipes-graphics/libsdl/libsdl_1.2.14.bb      |   28 +++++++---
 meta/recipes-sato/tasks/task-core-x11.bb           |   10 +++-
 8 files changed, 62 insertions(+), 105 deletions(-)
 create mode 100644 meta/recipes-core/kbd/kbd_1.15.2.bb
 delete mode 100644 meta/recipes-graphics/libsdl/files/directfb_obsolete_calls.patch
 delete mode 100644 meta/recipes-graphics/libsdl/files/extra-keys.patch
 rename meta/recipes-graphics/libsdl/{files => libsdl-1.2.14}/configure_tweak.patch (100%)

-- 
1.7.8.rc1



