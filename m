Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QhuDh-0002AE-Ij
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jul 2011 04:03:05 +0200
Received: by iwn4 with SMTP id 4so1618496iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2011 18:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ELu2TL9Db1Snq7zAg3DB3eg85munqA9eobLNi5VSdHI=;
	b=h4Uu2rXbY1KppLnMD72I4rytgACeAa62sDicqXnC/fT3z0N2mCjJhQXJ9WTdyJ28CD
	ZAvEQJUX+TjP38CLEB0tkm4MohXiHXFY7iSHzrvO2umSPsKS78REA7mp/sdiB/XJ8bsW
	ZJqu40ODM3xyuCzO1JvMZpqCuyIYweMOTd1Sw=
Received: by 10.231.207.71 with SMTP id fx7mr3426305ibb.168.1310781543677;
	Fri, 15 Jul 2011 18:59:03 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id v16sm1208792ibe.17.2011.07.15.18.59.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 15 Jul 2011 18:59:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2011 18:58:52 -0700
Message-Id: <cover.1310781382.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/4] Make oecore default images buildable with uclibc
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
X-List-Received-Date: Sat, 16 Jul 2011 02:03:05 -0000

These patches make sure that core-image-minimal is buildable
by using *just* oe-core layer. Testing building and booting
qemux86-64 core-image-minimal

The following changes since commit 3d2c1ca9096790e4c6922b65b83ea1dffb90c362:

  util-linux: Replace sigsetmask with posix compliant functions (2011-07-15 18:52:49 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/uclibc-oecore
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/uclibc-oecore

Khem Raj (4):
  bitbake.conf: Change TERM default fallback to XTERM instead of
    GNOME_TERM
  oe-buildenv-internal: Replace POKYMODE POKYLIBC with TCMODE and
    TCLIBC
  default-distrovars: Add largefile to DISTRO_FEATURES
  acl,attr: Fix build failures when NLS is disabled on uclibc

 meta/conf/bitbake.conf                          |    4 ++--
 meta/conf/distro/include/default-distrovars.inc |    3 +--
 meta/recipes-support/attr/acl_2.2.51.bb         |    2 +-
 meta/recipes-support/attr/attr.inc              |    4 ----
 meta/recipes-support/attr/attr_2.4.46.bb        |    2 +-
 meta/recipes-support/attr/ea-acl.inc            |    4 ++++
 scripts/oe-buildenv-internal                    |    2 +-
 7 files changed, 10 insertions(+), 11 deletions(-)

-- 
1.7.4.1



