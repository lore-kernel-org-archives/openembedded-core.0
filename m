Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E44F9C02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 16:40:39 +0000 (UTC)
Received: from smtp-190b.mail.infomaniak.ch (smtp-190b.mail.infomaniak.ch [185.125.25.11])
 by mx.groups.io with SMTP id smtpd.web10.15356.1737132034023150856
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jan 2025 08:40:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.11, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YZQTD1TNdzGN4;
	Fri, 17 Jan 2025 17:40:32 +0100 (CET)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4YZQTC4Tb5zlc5;
	Fri, 17 Jan 2025 17:40:31 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH RFC kirkstone scarthgap styhead 0/2]
 uboot-extlinux-config.bbclass: add support for DTBOs
Date: Fri, 17 Jan 2025 17:40:18 +0100
Message-Id: <20250117-extlinux-overlays-backport-v1-0-dad9fdb81777@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPKHimcC/x3MQQqDMBBA0avIrBswoVLabaEH6LZ0EZPRDJFEJ
 qlExLs3unx/8TdIyIQJHs0GjAsliqFCXhowTocRBdlqUK3qWilvAkueKPyKiAvypNckem38HDk
 L26O8W9ldlRqgDmbGgco5/8D79TyaJ/Ypx4AHktGc3ajnE3l1qC189/0PLG0Q05YAAAA=
X-Change-ID: 20250117-extlinux-overlays-backport-dbe19d15422f
To: openembedded-core@lists.openembedded.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jan 2025 16:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209992

I am not sure this is actually a desirable backport as it's not a
bugfix, hence the RFC.

Applies cleanly on top of all listed branch, nothing more done on my
side than that.

It's just that I'll need to support extlinux config with overlays in a
few weeks for my BSP layer based on scarthgap and modifying the behavior
from my own layer is not a lot of fun I'm expecting.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (2):
      uboot-extlinux-config.bbclass: simplify FDT/FDTDIR logic
      uboot-extlinux-config.bbclass: add support for DTBOs

 meta/classes-recipe/uboot-extlinux-config.bbclass | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)
---
base-commit: 62dfe689246d648f9970a5476716e486b1a33765
change-id: 20250117-extlinux-overlays-backport-dbe19d15422f

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


