Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.2132.1598468340340688937
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2020 11:59:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: joe.slater@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 07QIwwBo020591
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2020 11:58:59 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Wed, 26 Aug 2020
 11:58:58 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [oe-core][PATCH 0/1] pseudo - renaming to self
Date: Wed, 26 Aug 2020 11:58:56 -0700
Message-ID: <20200826185857.24292-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Bugzilla 13426

Simple test using rename() and renameat() attached to case.

Joe Slater (1):
  pseudo: fix renaming to self

 .../pseudo/files/rename.patch                 | 73 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/rename.patch

-- 
2.17.1

