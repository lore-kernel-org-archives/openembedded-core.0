Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AD64176FB8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 22:16:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t84MGTZF028203
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Sep 2015 15:16:29 -0700 (PDT)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Fri, 4 Sep 2015 15:16:28 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 4 Sep 2015 17:16:26 -0500
Message-ID: <cover.1441404865.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 2.3.1
MIME-Version: 1.0
Subject: [PATCH 0/1] any day now: pseudo 1.7, really
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
X-List-Received-Date: Fri, 04 Sep 2015 22:16:31 -0000
Content-Type: text/plain

So there was a bogus argument on an fchmodat(), which resulted in
mkdirat() being able to set errno on success, and glibc's localedef
errors out if errno is set even if it has already confirmed that the
operation was successful. But it is not *intended* that I set errno
even on success, so that's fixed now.

Tarball sent to RP/halstead, may not be on server yet. I left the
branch name alone because I am gradually slipping into despair and
anguish and updating branch names no longer seems like it will
help slow down the universe's gradual decline into entropy.

The following changes since commit aba3ef50d65e0dc8659a48bf98d0fb00dd44a6fc:

  debianutils: create package for run-parts (2015-09-02 23:51:16 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/pseudo172
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/pseudo172

Peter Seebach (1):
  pseudo_1.7.3.bb: New version of pseudo

 meta/recipes-devtools/pseudo/pseudo_1.7.3.bb | 19 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb   |  4 ++--
 2 files changed, 21 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.7.3.bb

-- 
2.3.1


