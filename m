Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 450FE6AC1E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 01:38:03 +0000 (UTC)
Received: by pdbci14 with SMTP id ci14so91356719pdb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jun 2015 18:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=iTHpVI8G8Aln4nGGqNti+XHwQ8uF0moaeMU56YkM+uE=;
	b=hzdfmQPwbxOuCqeYAOrAHNfn52w0kTyvB4NmItma1eb4WbmcIygQtSQGaxlA5Hz04F
	VqkzVO52NiQGX/2Ll6LItF+60PrHR3VoYQ+DSexjkm07p01ZyOoCYgy+GHwlo6InfDCm
	TF+k8wzAes1KjSf27PbCsvK/PqbCiPa3G4/kipA06EuSf6akWHzZkqStTszn152SUFya
	2ozT5/Ed+5ck+6PF1FYHTektVh+0SKsARgiFQ0usTPGDn8J/2FBRFrX5tr+EP0HZjybZ
	A5JpWdRSItZEJjCWYJe+Ca2VXCJoJ2ix6rcKcir+GGnrMWlICXAeG7XmfenrhszLPSlu
	PqTw==
X-Received: by 10.70.127.231 with SMTP id nj7mr64640421pdb.63.1435023485268;
	Mon, 22 Jun 2015 18:38:05 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	fo5sm21157965pbb.41.2015.06.22.18.38.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Jun 2015 18:38:03 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 3EA09FC46EA; Mon, 22 Jun 2015 18:37:56 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jun 2015 18:37:54 -0700
Message-Id: <cover.1435022780.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/3] Update gnutls 3.4.1
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
X-List-Received-Date: Tue, 23 Jun 2015 01:38:07 -0000

The nettle and gnutls updates must be done as a pair.

The following changes since commit c40eb563fe771740f98aaa197d82af71de874c44:

  bitbake: runqueue: Sanity check BB_NUMBER_THREADS (2015-06-20 06:50:50 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/gnutls_update
  http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/gnutls_update

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


