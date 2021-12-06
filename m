Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D93C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 15:35:36 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web12.53039.1638804936080034940
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 07:35:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.178.230,
 mailfrom: foss+yocto@0leil.net)
Received: from localhost.localdomain (84-115-236-2.cable.dynamic.surfer.at
 [84.115.236.2])
	(Authenticated sender: foss@0leil.net)
	by relay10.mail.gandi.net (Postfix) with ESMTPA id E806424000D;
	Mon,  6 Dec 2021 15:35:33 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 0/4] blacklist/blocklist and master/golden
Date: Mon,  6 Dec 2021 16:35:07 +0100
Message-Id: <20211206153511.34838-1-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 15:35:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159242

Hi all,

It seems some changes are not too invasive and can be made to be a bit
more inclusive, so I'll make the autobuilder try those patches and tell
me whether I broke something somewhere I wasn't aware of.

In other words: I did not test those changes.

Those changes warrant some notes in the migration guide once they
are merged.

Cheers,
Quentin

Quentin Schulz (4):
  rename core-image-testmaster* to core-image-testgolden
  core: initrdscripts: init-install{-efi,}-testfs.sh: rename masterimage
    into goldenimage
  oeqa: rename masterimage into goldenimage
  core: udev: udev-extraconf: rename mount.blacklist* to
    mount.blocklist.*

 meta/conf/distro/include/distro_alias.inc     |  4 +-
 meta/conf/distro/include/maintainers.inc      |  4 +-
 .../{masterimage.py => goldenimage.py}        | 44 +++++++++----------
 meta/lib/oeqa/runtime/cases/ssh.py            |  4 +-
 .../files/init-install-efi-testfs.sh          |  4 +-
 .../initrdscripts/files/init-install-efi.sh   |  2 +-
 .../files/init-install-testfs.sh              |  4 +-
 .../initrdscripts/files/init-install.sh       |  2 +-
 .../{mount.blacklist => mount.blocklist}      |  0
 .../recipes-core/udev/udev-extraconf/mount.sh |  4 +-
 meta/recipes-core/udev/udev-extraconf_1.1.bb  | 10 ++---
 ....bb => core-image-testgolden-initramfs.bb} |  2 +-
 ...testmaster.bb => core-image-testgolden.bb} |  4 +-
 meta/recipes-extended/parted/files/run-ptest  |  6 +--
 14 files changed, 47 insertions(+), 47 deletions(-)
 rename meta/lib/oeqa/controllers/{masterimage.py => goldenimage.py} (87%)
 rename meta/recipes-core/udev/udev-extraconf/{mount.blacklist => mount.blocklist} (100%)
 rename meta/recipes-extended/images/{core-image-testmaster-initramfs.bb => core-image-testgolden-initramfs.bb} (92%)
 rename meta/recipes-extended/images/{core-image-testmaster.bb => core-image-testgolden.bb} (80%)

-- 
2.33.1


