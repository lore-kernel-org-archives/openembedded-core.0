Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20487C02195
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 15:18:20 +0000 (UTC)
Received: from smtp-bc0a.mail.infomaniak.ch (smtp-bc0a.mail.infomaniak.ch [45.157.188.10])
 by mx.groups.io with SMTP id smtpd.web11.90018.1738595894012508595
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 07:18:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.10, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YmqrM6Rv1zLTd;
	Mon,  3 Feb 2025 16:18:11 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4YmqrM3HhTzKb7;
	Mon,  3 Feb 2025 16:18:11 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH v2 0/2] add basic b4 config file
Date: Mon, 03 Feb 2025 16:17:56 +0100
Message-Id: <20250203-b4-support-v2-0-848008ad29ea@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACTeoGcC/23MQQ6CMBCF4auQWVvTaakkrryHYUHpVGYDzRQbC
 eHuVtYu/5e8b4dMwpTh3uwgVDjzMtcwlwbGaZhfpDjUBqON04id8q3K75QWWRXqQBZtdNZ3UA9
 JKPLnxJ597Ynzush22gV/61+moEIVqWsHF50mf3uME4ls10DQH8fxBdxgkWqkAAAA
X-Change-ID: 20250117-b4-support-10de313f53b7
To: openembedded-core@lists.openembedded.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 15:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210655

This adds very basic support for using b4 in OE-Core. This essentially
just automatically adds the proper mailing list when running b4 prep
--auto-to-cc.

This also adds the b4 wrapper script that poky will need to use in order
to identify which mailing list a patch needs to be sent to and do some
additional per-patch checks that aren't necessary when running from
vanilla OE-Core.

Once this is merged, poky will need to merge OE-Core into itself and
override with its own .b4-config that makes use of that script.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Changes in v2:
- add mention to first patch that running patchtest for b4 prep --check
  is what we're eventually aiming for,
- add poky b4 wrapper script (it used to be in the patch series for
  poky, c.f. https://lore.kernel.org/poky/20250123-b4-support-v1-1-4841f52eccbb@cherry.de/T/#m95d6aa25cc42352416da477cf07d7b3cbd671231
- poky b4 wrapper script properly identifies patches with files modified
  in both OE-Core and other repos part of poky,
- poky b4 wrapper script pretty prints when there's more than one
  project modified by a script, instead of lazily printing a Python
  list,
- Link to v1: https://lore.kernel.org/r/20250117-b4-support-v1-1-fe74a5f50eb6@cherry.de

---
Quentin Schulz (2):
      add basic b4 config file
      scripts: add b4-wrapper for poky

 .b4-config                 |   3 +
 scripts/b4-wrapper-poky.py | 170 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 173 insertions(+)
---
base-commit: 30ea609d3357fb3de911f2f6a5e6856c151b976a
change-id: 20250117-b4-support-10de313f53b7

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


