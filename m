Return-Path: <fntoth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE64C48BDF
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:43 +0000 (UTC)
Received: from mailfilter03-out31.webhostingserver.nl
 (mailfilter03-out31.webhostingserver.nl [141.138.168.202])
 by mx.groups.io with SMTP id smtpd.web10.27042.1649015465822454019
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 12:51:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=softfail (domain: gmail.com, ip: 141.138.168.202, mailfrom: fntoth@gmail.com)
X-Halon-ID: 645c5ce3-b387-11ec-80d2-001a4a4cb9a5
Received: from s198.webhostingserver.nl (s198.webhostingserver.nl
 [141.138.168.154])
	by mailfilter03.webhostingserver.nl (Halon) with ESMTPSA
	id 645c5ce3-b387-11ec-80d2-001a4a4cb9a5;
	Sun, 03 Apr 2022 21:51:02 +0200 (CEST)
Received: from [2a02:a466:68ed:1:a97:eb0e:d916:69ac] (helo=delfion.fritz.box)
	by s198.webhostingserver.nl with esmtpa (Exim 4.94.2)
	(envelope-from <fntoth@gmail.com>)
	id 1nb6Fa-009Srb-AP; Sun, 03 Apr 2022 21:51:02 +0200
From: Ferry Toth <fntoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Xavier Berger <xavier.berger@bio-logic.net>,
	Alexander Kanavin <alex@linutronix.de>,
	Ferry Toth <ftoth@exalondelft.nl>
Subject: [PATCH v2 0/3] *** SUBJECT HERE ***
Date: Sun,  3 Apr 2022 21:50:43 +0200
Message-Id: <20220403195046.7060-2-fntoth@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220403195046.7060-1-fntoth@gmail.com>
References: <20220403195046.7060-1-fntoth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Antivirus-Scanner: Clean mail though you should still use an Antivirus
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163968

From: Ferry Toth <ftoth@exalondelft.nl>

*** BLURB HERE ***

Ferry Toth (2):
  package_manager: sign DEB package feeds
  apt: add apt selftest to test signed package feeds

Xavier Berger (1):
  gpg-sign: Add parameters to gpg signature function

 meta/lib/oe/gpg_sign.py                      |  6 +++-
 meta/lib/oe/package_manager/deb/__init__.py  | 19 ++++++++--
 meta/lib/oeqa/runtime/cases/apt.py           | 16 ++++++---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 38 ++++++++++++++++++++
 4 files changed, 70 insertions(+), 9 deletions(-)

-- 
2.32.0


