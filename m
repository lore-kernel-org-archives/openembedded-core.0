Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 27A7F6E26B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 15:41:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 859CF3C88753
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Sep 2015 16:41:19 +0100
Message-Id: <cover.1442245106.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v2 0/1] Fixes for a distro with a merged /usr
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
X-List-Received-Date: Mon, 14 Sep 2015 15:41:28 -0000

This fixes the previous kmod submission to use the lnr script from OE-Core
rather than requiring a version of coreutils where ln supports the -r switch,
thus ensuring compatibility with Debian 7 (though only tested locally on
Ubuntu 15.04).

The following changes since commit 2c8c3d9c4b65d2a5c7976d530138ebcaac2b1447:

  gcc: reformat 0063-nativesdk-gcc-support.patch (2015-09-12 23:01:31 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/merged-usr
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/merged-usr

Joshua Lock (1):
  kmod: fix link creation when base_bindir != /bin

 meta/recipes-kernel/kmod/kmod_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.1.4


