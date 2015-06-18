Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0377D60670
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 04:50:16 +0000 (UTC)
Received: by pdbnf5 with SMTP id nf5so57629010pdb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 21:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=KHDu5v8wRNPVE8K2swZSGHBbjDoQpvw0aY2ovc1RgPQ=;
	b=gPxkmlPZte1vgPO71Mf1nGngftkgsCrJ2SSGR7IjoN0D2fpQvvFpBFtCO/P0DEqBIG
	hhjZVH+B2CGz1I0fEY/wEX9HNc51Y0Fks+ydlCb9xyjEkgjI73elbpZREEOYjORB3ZDU
	kEpjSmmunT5YGPYdjFYqqEPAEFdFOHalU5Eu31dLra+NDKU+WAlcgFXZwJ5AuUwUii0y
	qSAmPK+TOIthLCBvEu5PnjSn7EDOzB+bsmyb2Qh09Smk3EAi11pxwnMJdabrweCCHkjW
	YDtQ6kGm/T7U+YrwvsEt47Yro5N2K4GjHBCodK9BuBe/S8mpl7mKRrZBwZdpJ5LtUFTN
	bvQw==
X-Received: by 10.66.197.134 with SMTP id iu6mr17976118pac.50.1434603017863;
	Wed, 17 Jun 2015 21:50:17 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id ja1sm6409728pbc.51.2015.06.17.21.50.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Jun 2015 21:50:16 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id BC6D0FC2A1E; Wed, 17 Jun 2015 21:50:11 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jun 2015 21:50:06 -0700
Message-Id: <cover.1434601375.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/3] [v3] Gntls update to 4.3.1
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
X-List-Received-Date: Thu, 18 Jun 2015 04:50:20 -0000

THe nettle and gnutls updates must be done as a pair.

The following changes since commit 1675ff6fff53dda89fa8d4f3a2c292c23fd346d7:

  bitbake: tests/data: Add new data tests (2015-06-12 00:02:28 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/gnutls-update
  http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/gnutls-update

Armin Kuster (3):
  nettle: update package to 3.1.1 version.
  gnutls: update to 3.4.1
  neon: fix compat issues with gnutls 4.3

 meta/recipes-support/gnutls/gnutls.inc             |  4 +-
 .../gnutls/configure.ac-fix-sed-command.patch      | 29 +++++----
 meta/recipes-support/gnutls/gnutls_3.3.14.bb       |  8 ---
 meta/recipes-support/gnutls/gnutls_3.4.1.bb        |  8 +++
 .../neon/neon/gnutls_4.3_fixup.patch               | 68 ++++++++++++++++++++++
 meta/recipes-support/neon/neon_0.30.1.bb           |  3 +-
 .../nettle/{nettle_2.7.1.bb => nettle_3.1.1.bb}    | 12 ++--
 7 files changed, 100 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/gnutls_3.3.14.bb
 create mode 100644 meta/recipes-support/gnutls/gnutls_3.4.1.bb
 create mode 100644 meta/recipes-support/neon/neon/gnutls_4.3_fixup.patch
 rename meta/recipes-support/nettle/{nettle_2.7.1.bb => nettle_3.1.1.bb} (48%)

-- 
1.9.1


