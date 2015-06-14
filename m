Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 254FC60557
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Jun 2015 05:37:19 +0000 (UTC)
Received: by pdbki1 with SMTP id ki1so49817126pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Jun 2015 22:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=3sFRKVVjF6mJTVyBuYYXlGnMb7CQIhiQds0AmoAzP/g=;
	b=Sx1GgB8rN3/zZuC83y4PNYnJ2NOD9gVRyBfp9dND3HC+LPyQl7KPmMQnM4XUpCYzSP
	+RQ1bnHjIfJMu9ssoOqhwgcBbXviqS9J8+G+YawIxQwRK/UF/VianK64QLfX3FRwKxkE
	DKeaUEBhPL8alGM8IK/dhZburiJDnD308q6KHFJ9/PIq1BwnUQWINQvFGoGycRMkJYOb
	rfoik71z6/hZMTI7eGxCnJlNtkJ5GkKI2zOYILDoVHKpwUBphe/Rd33Qq609fyLHDEE6
	U3/yQN/ywzVBF7g0iWgjmYyIhcS/A8V3x6RFnUVNA5GFhfzemVr4KwzP/BI+24stdvJv
	pOzA==
X-Received: by 10.68.69.48 with SMTP id b16mr36628459pbu.144.1434260241253;
	Sat, 13 Jun 2015 22:37:21 -0700 (PDT)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id g2sm8253328pdh.11.2015.06.13.22.37.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 13 Jun 2015 22:37:20 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Jun 2015 22:37:11 -0700
Message-Id: <cover.1434259784.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH 0/3] Gnutls update 4.2 V2
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
X-List-Received-Date: Sun, 14 Jun 2015 05:37:22 -0000

The nettle and gnutls updates must be done as a pair.

Include neon build fixes for the above update

The following changes since commit 1675ff6fff53dda89fa8d4f3a2c292c23fd346d7:

  bitbake: tests/data: Add new data tests (2015-06-12 00:02:28 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/gnutls-update
  http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/gnutls-update

Armin Kuster (3):
  nettle: update package to 3.1.1 version.
  gnutls: update to 3.4.1
  neon: fix compat issues with gnutls 4.3

 meta/recipes-support/gnutls/gnutls.inc             |  3 +-
 .../gnutls/configure.ac-fix-sed-command.patch      | 29 +++++----
 meta/recipes-support/gnutls/gnutls_3.3.14.bb       |  8 ---
 meta/recipes-support/gnutls/gnutls_3.4.1.bb        |  8 +++
 .../neon/neon/gnutls_4.3_fixup.patch               | 68 ++++++++++++++++++++++
 meta/recipes-support/neon/neon_0.30.1.bb           |  3 +-
 .../nettle/{nettle_2.7.1.bb => nettle_3.1.1.bb}    | 12 ++--
 7 files changed, 99 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/gnutls_3.3.14.bb
 create mode 100644 meta/recipes-support/gnutls/gnutls_3.4.1.bb
 create mode 100644 meta/recipes-support/neon/neon/gnutls_4.3_fixup.patch
 rename meta/recipes-support/nettle/{nettle_2.7.1.bb => nettle_3.1.1.bb} (48%)

-- 
2.3.5


