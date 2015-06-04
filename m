Return-Path: <akuster808@gmail.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6A9F27580C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 19:37:14 +0000 (UTC)
Received: by qkoo18 with SMTP id o18so29548265qko.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jun 2015 12:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=SJLcPvPO+6YR2THxxq9louQPooNWS31/TyJZLPvikAE=;
	b=rxw/CSOHAwUxaSG/IbLssK4sydnB3FksIYTti0aR58QUJpBRxv4A6Igbrbwj8sQptT
	/E2GkiP7eXWqviGjFJ63MWQuVVcm3GyI1mWM02qO69tMT8G3zaADNu8RUjvucq33fZph
	N2YbZxxW2HScpmYe0/iVzlihA3Mh8rhVQGHK5uJUflc7NXIaKc0OHE4AJq+bzmvLhxB/
	6hYknZ77IcpQhYYYqdQVtDhj9LvZgt4DzPlkYo/ffO6C0njQNLYB8Yvf/ieW5d8oTrQZ
	MnwULRDBun0tiJlutVG/wmXRQ3I6r7BU1fqAnOYO5sAj8+SYVwZ7TpWJItqlrsCFuJa5
	8FKA==
X-Received: by 10.55.18.103 with SMTP id c100mr74476739qkh.2.1433446636162;
	Thu, 04 Jun 2015 12:37:16 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id q7sm2895116qkh.35.2015.06.04.12.37.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jun 2015 12:37:14 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id B196AFC91E9; Thu,  4 Jun 2015 12:37:09 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jun 2015 12:37:05 -0700
Message-Id: <cover.1433446500.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/3] Gntls update to 4.3.1
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
X-List-Received-Date: Thu, 04 Jun 2015 19:37:19 -0000

THe nettle and gnutls updates must be done as a pair.


The following changes since commit 6dc53d3694d555147b272d18678fcf908ddced32:

  bitbake: fixup 6 (2015-06-03 17:37:08 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/gnutls-update
  http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/gntls-update

Armin Kuster (3):
  nettle: update package to 3.1.1 version.
  gnutls: update to 3.4.1
  neon: build fix

 meta/recipes-support/gnutls/gnutls.inc             |  3 +-
 .../gnutls/configure.ac-fix-sed-command.patch      | 29 ++++++------
 meta/recipes-support/gnutls/gnutls_3.3.14.bb       |  8 ----
 meta/recipes-support/gnutls/gnutls_3.4.1.bb        |  8 ++++
 .../neon/neon/gnutls_4.3_fixup.patch               | 53 ++++++++++++++++++++++
 meta/recipes-support/neon/neon_0.30.1.bb           |  3 +-
 .../nettle/{nettle_2.7.1.bb => nettle_3.1.1.bb}    | 12 ++---
 7 files changed, 84 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/gnutls_3.3.14.bb
 create mode 100644 meta/recipes-support/gnutls/gnutls_3.4.1.bb
 create mode 100644 meta/recipes-support/neon/neon/gnutls_4.3_fixup.patch
 rename meta/recipes-support/nettle/{nettle_2.7.1.bb => nettle_3.1.1.bb} (48%)

-- 
1.9.1


