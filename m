Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 32997600B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 21:59:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u5MLxPFr024844
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 14:59:25 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 22 Jun 2016 14:59:24 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jun 2016 14:59:23 -0700
Message-ID: <1466632764-22540-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 0/1] blacklist: add BPNBLACKLIST support
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
X-List-Received-Date: Wed, 22 Jun 2016 21:59:24 -0000
Content-Type: text/plain

We have encountered some issues with the use of PNBLACKLIST in recipes.
In particular, PNBLACKLIST[pkg] will not suppress building of lib32-pkg
or lib64-pkg so world builds can fail unexpectedly.

One solution could be to implement BPNBLACKLIST[] which checks BPN instead
of PN when a recipe is being parsed.  I have included a patch to do this.

If this were adopted, there are many recipes under meta-openembedded that
should probably changed to use BPNBLACKLIST instead of PNBLACKLIST.

Joe Slater (1):
  blacklist: add BPNBLACKLIST support

 meta/classes/blacklist.bbclass |   24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

-- 
1.7.9.5


