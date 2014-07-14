Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A8AD1703BC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 19:07:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6EJ7HG3024342
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 12:07:17 -0700 (PDT)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 14 Jul 2014 12:07:17 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Jul 2014 14:12:28 -0500
Message-ID: <cover.1405365020.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH 0/1] pseudo 1.6
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
X-List-Received-Date: Mon, 14 Jul 2014 19:07:18 -0000
Content-Type: text/plain

This is the pseudo 1.6 update, now with an explicit dependency on
attr to make sure xattr.h is available. Also a signed-off-by.

Previous blurb:
pseudo 1.6.0 is a moderately significant update. It should actually
be better in a number of ways. Performance may be slightly improved
by changes to how debugging messages are generated. Debugging output
is dramatically improved. Extended attributes are supported.

I don't really feel this can be tested adequately without pretty
broad exposure, so I'm leaving the 1.5.1 recipe in-tree in this update,
so people can go back if they have problems.

The following changes since commit fa325e44f5b429b4038022b31285af9c94672943:

  insane: Ensure do_package_qa happens after do_packagedata (2014-07-11 23:19:18 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib seebs/pseudo16
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/pseudo16

Peter Seebach (1):
  pseudo_1.6.0.bb: uprev to pseudo 1.6

 meta/recipes-devtools/pseudo/pseudo.inc      |    6 +-----
 meta/recipes-devtools/pseudo/pseudo_1.5.1.bb |    4 ++++
 meta/recipes-devtools/pseudo/pseudo_1.6.0.bb |   10 ++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb   |    4 ++--
 4 files changed, 17 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.6.0.bb


