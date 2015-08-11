Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id BD48A76932
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 08:45:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 044F860022B
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Aug 2015 09:45:01 +0100
Message-Id: <cover.1439282534.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
Subject: [RFC PATCH 0/1] Fix runtime error with generated OPKG feeds
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
X-List-Received-Date: Tue, 11 Aug 2015 08:45:18 -0000

When playing around with automatically generated opkg feeds I noticed that
we're inserting a feed pointing to the root of ${DEPLOY_DIR}/ipk - however for
my builds that directory doesn't include a Packages.gz resulting in opkg
printing an error.

The following patch removes the code which inserts that feed entry.

Cheers,

Joshua

The following changes since commit 5094354a2811825e6d60963f03959daa349cab23:

  bind: upgrade to 9.10.2-p3 (2015-08-09 15:14:32 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/opkg
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/opkg

Joshua Lock (1):
  lib/oe/package_manager: fix opkg feed generation

 meta/lib/oe/package_manager.py | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

-- 
2.1.4


