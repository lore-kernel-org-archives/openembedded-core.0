Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 00A3370644
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 05:34:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6S5YXkW026404
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 27 Jul 2014 22:34:33 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 27 Jul 2014 22:34:33 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Jul 2014 13:34:49 +0800
Message-ID: <cover.1406525420.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: clarson@kergoth.com
Subject: [PATCH 0/3] Support 'read-only-rootfs' IMAGE_FEATURES for systemd based systems
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
X-List-Received-Date: Mon, 28 Jul 2014 05:34:36 -0000
Content-Type: text/plain

This patchset mainly comes from https://github.com/MentorEmbedded/meta-ro-rootfs with only a little
modification.

//Chen Qi

The following changes since commit 3f7fcbc167c13bdaa6c12a81c7851530d72f02e0:

  directfb-examples: Fix building with new autoconf (2014-07-27 08:30:13 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/systemd_readonly
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/systemd_readonly

Chen Qi (3):
  volatile-binds: add recipe
  systemd: add volatile-binds to RDEPENDS
  image.bbclass: tweak read_only_rootfs_hook to also support systemd
    based systems

 meta/classes/image.bbclass                         |    5 +-
 meta/recipes-core/systemd/systemd_213.bb           |    1 +
 meta/recipes-core/volatile-binds/files/COPYING.MIT |   17 +++++
 .../volatile-binds/files/mount-copybind            |   34 +++++++++
 .../volatile-binds/files/volatile-binds.service.in |   19 +++++
 meta/recipes-core/volatile-binds/volatile-binds.bb |   74 ++++++++++++++++++++
 6 files changed, 148 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/volatile-binds/files/COPYING.MIT
 create mode 100755 meta/recipes-core/volatile-binds/files/mount-copybind
 create mode 100644 meta/recipes-core/volatile-binds/files/volatile-binds.service.in
 create mode 100644 meta/recipes-core/volatile-binds/volatile-binds.bb

-- 
1.7.9.5


