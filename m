Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RuW6l-0004yq-4D
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 22:28:19 +0100
Received: by ghbf19 with SMTP id f19so2762357ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2012 13:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ER4EhuPA47Tag58AUmEKOzDF7CZaTnPjS3jDV256dew=;
	b=ucXGw35/eXBDYDBTaMCzNrRYUZ5L7J9LmG9G+rselzNCm+4XADUCD/cWL8MqB61KLP
	jLgIM2gYHokqIunamkNanFIdX/lvTNqHOaet2tyI17iPwqczHIT/it1jbkTu27+Sh6OB
	ylqneovFBfamhs5Km3Z8aGfJ7R7Mrym72sCh4=
Received: by 10.101.114.11 with SMTP id r11mr8208384anm.4.1328563217396;
	Mon, 06 Feb 2012 13:20:17 -0800 (PST)
Received: from localhost.localdomain (hsvwanfw1-nat.mentorg.com.
	[139.181.24.34])
	by mx.google.com with ESMTPS id u11sm37999299anc.12.2012.02.06.13.20.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Feb 2012 13:20:16 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Feb 2012 15:20:09 -0600
Message-Id: <cover.1328563142.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.7
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 0/4] 2nd pass of external-csl-toolchain improvements
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
X-List-Received-Date: Mon, 06 Feb 2012 21:28:19 -0000

From: Christopher Larson <chris_larson@mentor.com>

The following changes since commit 18d9fcfc4bc4b01f73e89f3b988c9d3d543c7705:

  libzypp: add missing runtime dependences on gzip and gnupg (2012-02-03 17:23:28 +0000)

are available in the git repository at:
  https://github.com/kergoth/oe-core external-toolchain-fixes

Christopher Larson (4):
      external-csl-toolchain: set PKG/PKGV for staticdev
      external-csl-toolchain: fix mtd-user.h issue
      external-csl-toolchain: correct binary packaging
      external-csl-toolchain: split out gdbserver packages

 meta/recipes-core/meta/external-csl-toolchain.bb |   18 +++++++++++++++---
 1 files changed, 15 insertions(+), 3 deletions(-)

Christopher Larson (4):
  external-csl-toolchain: set PKG/PKGV for staticdev
  external-csl-toolchain: fix mtd-user.h issue
  external-csl-toolchain: correct binary packaging
  external-csl-toolchain: split out gdbserver packages

 meta/recipes-core/meta/external-csl-toolchain.bb |   18 +++++++++++++++---
 1 files changed, 15 insertions(+), 3 deletions(-)

-- 
1.7.7



