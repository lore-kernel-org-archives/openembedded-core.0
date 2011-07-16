Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QhyV9-0001L5-O9
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jul 2011 08:37:23 +0200
Received: by iwn4 with SMTP id 4so1714106iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2011 23:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=91YFCQ+tXaal95fX4RVaPD7NKy0leU8wZWfxvybSfjw=;
	b=r7+9GBZc2dWsdWbEyMuJus+vwZuRrG0T6aQtk+tAbGr5ZEHppcl5qBAK6Gclr/3MRG
	nsXIv+If+NSdxS9nlmcxoeF4ri0ar9Ts/u3TMXzNUZnGiq7dP6DkbPEYRxrIKKlsTGFa
	DRH37/nSM2E+kI3MGoHtKp3wkJN0dhEz9QZxg=
Received: by 10.42.179.195 with SMTP id br3mr4064060icb.478.1310797998689;
	Fri, 15 Jul 2011 23:33:18 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id k16sm349218icc.22.2011.07.15.23.33.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 15 Jul 2011 23:33:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2011 23:33:03 -0700
Message-Id: <cover.1310797743.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH v2 0/5] Make oecore default images buildable with uclibc
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
X-List-Received-Date: Sat, 16 Jul 2011 06:37:23 -0000

Changes On top of v1

Fixed gettext class to not disable nls for non target recipes

Build core-image-minimal for qemuarm qemumips qemuppc and booted on qemu
successfully

Build for TCLIBC=uclibc from scratch succeeds

The following changes since commit 3d2c1ca9096790e4c6922b65b83ea1dffb90c362:

  util-linux: Replace sigsetmask with posix compliant functions (2011-07-15 18:52:49 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/uclibc-oecore
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/uclibc-oecore

Khem Raj (5):
  bitbake.conf: Change TERM default fallback to XTERM instead of
    GNOME_TERM
  oe-buildenv-internal: Replace POKYMODE POKYLIBC with TCMODE and
    TCLIBC
  default-distrovars: Add largefile to DISTRO_FEATURES
  acl,attr: Fix build failures when NLS is disabled on uclibc
  classes/gettext: Do not disable nls for non target recipes

 meta/classes/gettext.bbclass                    |    2 +-
 meta/conf/bitbake.conf                          |    4 ++--
 meta/conf/distro/include/default-distrovars.inc |    3 +--
 meta/recipes-support/attr/acl_2.2.51.bb         |    2 +-
 meta/recipes-support/attr/attr.inc              |    4 ----
 meta/recipes-support/attr/attr_2.4.46.bb        |    2 +-
 meta/recipes-support/attr/ea-acl.inc            |    3 +++
 scripts/oe-buildenv-internal                    |    2 +-
 8 files changed, 10 insertions(+), 12 deletions(-)

-- 
1.7.4.1



