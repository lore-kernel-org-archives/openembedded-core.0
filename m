Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF89FC83F20
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 12:51:55 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.35634.1752324707277009631
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Jul 2025 05:51:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=hoIcOl+1;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-20250712125145f5ed271d9288e2dad6-n1g5h2@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250712125145f5ed271d9288e2dad6
        for <openembedded-core@lists.openembedded.org>;
        Sat, 12 Jul 2025 14:51:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=QKjmyXv+1q7ky8VBRMZ739ES4965JwCG2W5cMhFCfdk=;
 b=hoIcOl+1lFOW8YKEjMNFmINyFrh8EWWrJzV6sYyEAlP6e9xvl1jevsbmOB/npUa70gSkgU
 41zVq4vSxwDo2fimSiDsREX6nXNZ6aKVe0vFjY5RJqizKZnNbF5A7g/eK10Al4nnMCjJLMld
 8kN2KKxcQybO6/iV77GoJjGMsf5waXUWLty5FyZ8WEMr9T3lULcG1Xo/d/pgtz5DmvCQ7UT9
 jSHQUl+WcK3gm9gQaZixZammDDqpGfShPnhjsZkrgy8gYaPcSiYZg5nzm2p5CJMcHgcNWR+O
 MDuGbEuica8gSlhm47J1hqHvQMTouKstAirmfmeo2bvFh2tYWJViY85Q==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 0/2] oe-selftest: devtool: split tap detection into function
Date: Sat, 12 Jul 2025 14:50:41 +0200
Message-ID: <20250712125103.3404739-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Jul 2025 12:51:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220178

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Changes compared to the previous v1:

- Split the changes into two patches, rather than one patch that makes
  three changes at once.
- Dropped the part which removed the test for the /etc/runqemu-nosudo
  file. This was discussed controversially in the patch review meeting.
  The file is kind of an API and is used in multiple scripts, not only
  by oe-selftest.

The first patch (moving the function) is a pre-requisite for
https://patchwork.yoctoproject.org/project/Poky/list/?series=36153.

Adrian Freihofer (2):
  oe-selftest: devtool: split tap detection into function
  oeqa/utils/command: simplify tap detection

 meta/lib/oeqa/selftest/cases/devtool.py | 14 ++------------
 meta/lib/oeqa/utils/commands.py         | 14 ++++++++++++++
 2 files changed, 16 insertions(+), 12 deletions(-)

-- 
2.49.0


