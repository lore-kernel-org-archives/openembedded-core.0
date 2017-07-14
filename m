Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1EEEA780C0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 00:24:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6E0OMdV015236
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 17:24:22 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Thu, 13 Jul 2017 17:24:21 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Jul 2017 17:24:20 -0700
Message-ID: <1499991861-19044-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 0/1] valgrind - gcc7 and powerpc64
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Jul 2017 00:24:22 -0000
Content-Type: text/plain

This probably could do no harm since the actual code generated does not
seem to have changed between gcc6 and gcc7, and is not affected by this patch
except that without it, valgrind ppc64 won't compile.

There must also be a gcc7 bug, since if it is ok to clobber r2 for ppc32 it
is unlikely it is not ok for ppc64.

Joe Slater (1):
  valgrind: allow version 3.12 to build under gcc7

 .../valgrind/valgrind/wait-for-3.13.patch          | 40 ++++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.12.0.bb  |  3 ++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/wait-for-3.13.patch

-- 
2.7.4


