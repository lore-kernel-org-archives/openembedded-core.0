Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB6CC369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 14:28:26 +0000 (UTC)
Received: from smtp-bc0c.mail.infomaniak.ch (smtp-bc0c.mail.infomaniak.ch [45.157.188.12])
 by mx.groups.io with SMTP id smtpd.web10.41325.1745332100861359368
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 07:28:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.12, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Zhl2p64wNzptV;
	Tue, 22 Apr 2025 16:28:18 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4Zhl2n4clBzxDt;
	Tue, 22 Apr 2025 16:28:17 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 0/2] mesa-demos: bump to latest commit in git, remove use
 of deprecated option
Date: Tue, 22 Apr 2025 16:26:57 +0200
Message-Id: <20250422-mesa-demos-git-v1-0-87eac5e3af26@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADGnB2gC/x3MPQqAMAxA4atIZgOpWvy5ijgUG2uGqjQignh3i
 +M3vPeAchJWGIoHEl+ism8ZpixgXt0WGMVnQ0WVpcZ0GFkdeo67YpATLVPnDZGt+xZydCRe5P6
 H4/S+H7p+0KlgAAAA
X-Change-ID: 20250418-mesa-demos-git-5e08d1005397
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 14:28:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215211

When trying to use vkgears on RK3588 with PanVK, version 9.0.0 (released
two years ago) currently crashes due to a Segfault. Considering there's
been quite a few commits since that version, let's use the latest commit
in the master branch instead of trying to figure out which patch(es)
exactly fix that issue.

While at it, remove the use of deprecated with-glut option in favor of
the glut meson feature option. This has been tested as binary equivalent
for build/src, package, image and sysroot-dirs directories with and
without this patch (and of course glut PACKAGECONFIG selected).

I'm traveling right now, so this is only build tested.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (2):
      mesa-demos: use latest git version
      mesa-demos: use glut feature instead of deprecated with-glut string option

 ...001-meson-fix-glx-detection-without-glvnd.patch | 46 ----------------------
 .../{mesa-demos_9.0.0.bb => mesa-demos_git.bb}     | 14 ++++---
 2 files changed, 8 insertions(+), 52 deletions(-)
---
base-commit: 53c772c941d5ce69ab89f35cd04724b740daf269
change-id: 20250418-mesa-demos-git-5e08d1005397

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


