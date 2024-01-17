Return-Path: <ubely@ilbers.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D627CC47422
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 08:08:18 +0000 (UTC)
Received: from shymkent.ilbers.de (shymkent.ilbers.de [85.214.156.166])
 by mx.groups.io with SMTP id smtpd.web10.4623.1705478889028769035
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 00:08:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: ilbers.de, ip: 85.214.156.166, mailfrom: ubely@ilbers.de)
Received: from azat.m.ilbers.de (host-80-81-17-52.static.customer.m-online.net [80.81.17.52])
	(authenticated bits=0)
	by shymkent.ilbers.de (8.15.2/8.15.2/Debian-8+deb9u1) with ESMTPSA id 40H8866h031709
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jan 2024 09:08:06 +0100
From: Uladzimir Bely <ubely@ilbers.de>
To: openembedded-core@lists.openembedded.org
Cc: Uladzimir Bely <ubely@ilbers.de>
Subject: [meta-oe][PATCH 0/2] Buildstats improvements for using in Isar.
Date: Wed, 17 Jan 2024 09:07:52 +0100
Message-Id: <20240117080754.16123-1-ubely@ilbers.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 08:08:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193898

Isar project (https://github.com/ilbers/isar) borrows from OE
some functionality including buildstats.

Here are the changes that are mostly suitable to use in Isar but
they should not break anything in OE/Yocto.

Uladzimir Bely (2):
  buildstats: consider multiconfigs when collecting statistics.
  buildstats: support of custom disk usage command

 meta/classes/buildstats.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

-- 
2.41.0


