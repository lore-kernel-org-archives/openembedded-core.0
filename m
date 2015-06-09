Return-Path: <akuster808@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 653E3758B0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 19:30:28 +0000 (UTC)
Received: by qkbx78 with SMTP id x78so3210127qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jun 2015 12:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=+Bn456OJv3yV/IZ0V9od0J5ZsgKnx1BKckkTP2UeMXc=;
	b=O1LvO71e7aWNnwSIoUlOhxbHNW/+fHV6CIWvDKza5ga+eGey52hWymqiMSOe8SZm+M
	vpccgv4ZxWb5rvliBw7sptba7P4cYANFckvu6djxlIsqySbgob9wuSqfoq+XyRO8jVI0
	vWl26T5I6k69cSylpqJV3bSZ7tAf+nnom27DstEIuoyYXzjor3SBdgxsYcvf8Zc82/jH
	LjNYiF7komJguGEoPjcDYCo0TQjFc73v1FK1uE97wHZz+NrJKKTHb1f8LpyqHWc/UOXC
	5JBA4SOwdtiU5NY+Ev79NWhXzo+3Lh5e9BZTWu8322tyPI3P8wZnyUw4jOjXyJCoIS7r
	OlIg==
X-Received: by 10.140.104.13 with SMTP id z13mr27567566qge.76.1433878229803;
	Tue, 09 Jun 2015 12:30:29 -0700 (PDT)
Received: from Pahoa2.mvista.com (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by mx.google.com with ESMTPSA id 138sm3074610qhx.18.2015.06.09.12.30.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Jun 2015 12:30:28 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jun 2015 12:30:23 -0700
Message-Id: <1433878226-21350-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH 0/3] gnutls update to 3.4.1
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
X-List-Received-Date: Tue, 09 Jun 2015 19:30:30 -0000

re-sending as I think I may have done it incorrectly before. did not see it in patch queue.

builds oe-world, sato and minimal images.

Armin Kuster (3):
  nettle: update package to 3.1.1 version.
  gnutls: update to 3.4.1
  neon: fix compat issues with gnutls 4.3

 meta/recipes-support/gnutls/gnutls.inc             |  3 +-
 .../gnutls/configure.ac-fix-sed-command.patch      | 29 ++++++------
 meta/recipes-support/gnutls/gnutls_3.3.14.bb       |  8 ----
 meta/recipes-support/gnutls/gnutls_3.4.1.bb        |  8 ++++
 .../neon/neon/gnutls_4.3_fixup.patch               | 53 ++++++++++++++++++++++
 meta/recipes-support/neon/neon_0.30.1.bb           |  3 +-
 meta/recipes-support/nettle/nettle_2.7.1.bb        | 26 -----------
 meta/recipes-support/nettle/nettle_3.1.1.bb        | 26 +++++++++++
 8 files changed, 104 insertions(+), 52 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/gnutls_3.3.14.bb
 create mode 100644 meta/recipes-support/gnutls/gnutls_3.4.1.bb
 create mode 100644 meta/recipes-support/neon/neon/gnutls_4.3_fixup.patch
 delete mode 100644 meta/recipes-support/nettle/nettle_2.7.1.bb
 create mode 100644 meta/recipes-support/nettle/nettle_3.1.1.bb

-- 
2.3.5


