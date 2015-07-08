Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id C11CB75D3C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 09:36:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 758785188046
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jul 2015 10:35:54 +0100
Message-Id: <cover.1436347958.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/1] Fix mount when using systemd
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
X-List-Received-Date: Wed, 08 Jul 2015 09:36:10 -0000

This series imports a fix for mount when using systemd from Fedora.

The following changes since commit df6ddc4bf9795212fda87f9d401893eb254074da:

  file: fix long-options (2015-07-07 23:57:14 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/systemd
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/systemd

Joshua Lock (1):
  systemd: fix immediate unmount of mountpoints not in fstab

 ...-mount-add-dependencies-to-dynamically-mo.patch | 36 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_219.bb           |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-core-mount-add-dependencies-to-dynamically-mo.patch

-- 
2.1.4


