Return-Path: <lxy204899@163.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 921FECD1288
	for <webhook@archiver.kernel.org>; Sat, 30 Mar 2024 06:41:55 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by mx.groups.io with SMTP id smtpd.web10.9297.1711780905368699300
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Mar 2024 23:41:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@163.com header.s=s110527 header.b=D+qD/eoG;
 spf=pass (domain: 163.com, ip: 117.135.210.5, mailfrom: lxy204899@163.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=x2EMT
	OZBpRk2587Yk0RNDaLZYbti9M4Rcay0muz1m10=; b=D+qD/eoGvFMhhn/hVDftk
	VmatJo0QARC+g2qjwUmgfCDLvsF1z+dHr6/YPSWX81dTP4HOF8R7dWeB7VtCqAGc
	T/mTzi02HCRAPtmqIkB4UPuFy3h1kjVoUD3Epa/O9nI/Gu3WoA3wk0wuEFzOGtlS
	SaUuNWTqJk3p1bTzAGdt3k=
Received: from ubantupc-ThinkCentre-M920t-N000.. (unknown [139.159.170.28])
	by gzga-smtp-mta-g2-4 (Coremail) with SMTP id _____wDnl6YktAdm9nRIAg--.28555S4;
	Sat, 30 Mar 2024 14:41:41 +0800 (CST)
From: lixiaoyong <lxy204899@163.com>
To: openembedded-core@lists.openembedded.org
Cc: lixiaoyong <lxy204899@163.com>
Subject: [PATCH 0/2] *** SUBJECT HERE ***
Date: Sat, 30 Mar 2024 14:41:09 +0800
Message-Id: <20240330064111.2531269-1-lxy204899@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnl6YktAdm9nRIAg--.28555S4
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjfUbLvtDUUUU
X-Originating-IP: [139.159.170.28]
X-CM-SenderInfo: ho01jiiuyzmqqrwthudrp/1tbisgWxomVOChCqcQAAsO
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Mar 2024 06:41:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197644

*** BLURB HERE ***

lixiaoyong (2):
  utils.bbclass: enhance readelf command call with llvm
  oe/package.py: enhance objdump command call with llvm

 meta/classes-global/utils.bbclass | 4 ++--
 meta/lib/oe/package.py            | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.34.1


