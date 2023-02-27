Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC67C64ED8
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 19:42:43 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.4630.1677526960829061297
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 11:42:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RVWBLnyH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexis.lothore@bootlin.com)
Received: (Authenticated sender: alexis.lothore@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9E6DA60009;
	Mon, 27 Feb 2023 19:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677526958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yGBABnuCmYb1wj2H6+IML3SVb8jNcopQFtk2iHjxpDM=;
	b=RVWBLnyHTguzvZ92SYJZVz6ufy+yk9OlaYaKmc71J0cSf9fA2M3O3Us0ob1hiiLbOaAfet
	VMgVZYSlt01X0ROYysIfhC0NaVdLjyfiiapsAapOrDbekPy/Oo81yOCfRWShOC5QrjjQgE
	roDr2BWILu7ou94Qfke0MxXGGOELoxshM8uvXAvIfhujKTca2wFsfaRWpl0prprfRTJCb2
	gdsXzCrTyB8mZ2v+h1RYqZyGYAEqOGAzKvPJqJT1jhDQi1wCF0IsL3kE5paMhsVXJwLyoW
	A129wnvOGKpb9zf0npD5ib4o/W+gX+NVdKy1MUJbStL9HpZ3KSHJ+d84w7dusQ==
From: alexis.lothore@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com,
	thomas.petazzoni@bootlin.com
Subject: [PATCH 0/2] scripts: yocto_testresults_query fixes and resulttool missing tests
Date: Mon, 27 Feb 2023 20:42:21 +0100
Message-Id: <20230227194223.24304-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 19:42:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177806

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Hello,
this series is a small follow-up to [1]

- add explicit error when running yocto_testresults_query.py from
  oe-core instead of poky. Since the tool is working with git references
  from poky, it will not manage to resolve SHA-1 in oe-core
- add tests for new resulttool regression features (oeselftest metadata,
  ptest naming fixes, ltp matching, machine matching)

[1] https://lore.kernel.org/openembedded-core/20230224164555.67634-1-alexis.lothore@bootlin.com/

Alexis Lothoré (2):
  scripts/yoct_testresults_query: manage base/target revision not found
  oeqa/selftest/resulttool: add test for metadata filtering on
    regression

 .../oeqa/selftest/cases/resulttooltests.py    | 243 ++++++++++++++++++
 scripts/yocto_testresults_query.py            |  15 +-
 2 files changed, 255 insertions(+), 3 deletions(-)

-- 
2.39.2


