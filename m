Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EB23B73243
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 22:59:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8MMxJiW023342
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 15:59:19 -0700 (PDT)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 22 Sep 2015 15:59:18 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Sep 2015 17:59:09 -0500
Message-ID: <cover.1442962633.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 2.3.1
MIME-Version: 1.0
Subject: [PATCH 0/1] pseudo 1.7.4 (bug #8282)
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
X-List-Received-Date: Tue, 22 Sep 2015 22:59:20 -0000
Content-Type: text/plain

This fix (based on work by Ross Burton) should fix up the one
remaining case where pseudo was generating files with 0600 filesystem
modes when they weren't intended. The tarball has been submitted but
may not be online yet; however, you can probably use the pseudo_git
recipe to try it out in the mean time if you're curious.

The following changes since commit 72682d72b52355c3fed947167ca3c6064340ead1:

  autotools.bbclass: mkdir ${B} -> mkdir -p ${B} (2015-09-16 22:17:19 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/pseudo174
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/pseudo174

Peter Seebach (1):
  pseudo_1.7.4.bb: fix f*open()

 meta/recipes-devtools/pseudo/{pseudo_1.7.3.bb => pseudo_1.7.4.bb} | 4 ++--
 meta/recipes-devtools/pseudo/pseudo_git.bb                        | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/pseudo/{pseudo_1.7.3.bb => pseudo_1.7.4.bb} (77%)

-- 
2.3.1


