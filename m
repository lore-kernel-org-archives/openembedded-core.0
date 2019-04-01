Return-Path: <xavier.berger@bio-logic.net>
X-Greylist: delayed 451 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 01 Apr 2019 13:57:37 UTC
Received: from smtp.smtpout.orange.fr (smtp05.smtpout.orange.fr
	[80.12.242.127])
	by mail.openembedded.org (Postfix) with ESMTP id 69C497CFAE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 13:57:37 +0000 (UTC)
Received: from srvmail.bio-logic.net ([176.149.180.241]) by mwinf5d40 with ME
	id v1q61z0025Ctoqw031q6Gf; Mon, 01 Apr 2019 15:50:06 +0200
X-ME-Helo: srvmail.bio-logic.net
X-ME-Auth: YmlvLWxvZ2ljQHdhbmFkb28uZnI=
X-ME-Date: Mon, 01 Apr 2019 15:50:06 +0200
X-ME-IP: 176.149.180.241
Received: from ubuntu.bio-logic.loc (unknown [10.100.11.254])
	by srvmail.bio-logic.net (Postfix) with ESMTP id 0930980477;
	Mon,  1 Apr 2019 15:50:06 +0200 (CEST)
From: Xavier Berger <xavier.berger@bio-logic.net>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Apr 2019 15:49:57 +0200
Message-Id: <cover.1554106752.git.xavier.berger@bio-logic.net>
X-Mailer: git-send-email 2.7.4
Subject: [PULL][PATCH 0/2] Implement debian packages GPG signing
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
X-List-Received-Date: Mon, 01 Apr 2019 13:57:37 -0000


The following patches add signing feature for debian packages.


The following changes since commit 3bc700a12d4f21a5c7a1575da0972f9f78b4a091:

  mesa: update 19.0.0 -> 19.0.1 (2019-03-29 08:28:53 +0000)

are available in the git repository at:

  git://push.yoctoproject.org/poky-contrib xberger/deb_sign

Xavier Berger (2):
  gpg-sign: Add parameters to gpg signature function
  package_manager: sign DEB package feeds

 meta/lib/oe/gpg_sign.py        |  6 +++++-
 meta/lib/oe/package_manager.py | 19 ++++++++++++++++---
 2 files changed, 21 insertions(+), 4 deletions(-)

-- 
2.7.4


