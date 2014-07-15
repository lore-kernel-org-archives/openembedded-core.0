Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 87655705EA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 14:29:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6FETCZ9012849
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 07:29:12 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 15 Jul 2014 07:29:12 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Jul 2014 07:29:10 -0700
Message-ID: <cover.1405434230.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] Add python to python-distribute and connman-tests' RDEPENDS
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
X-List-Received-Date: Tue, 15 Jul 2014 14:29:17 -0000
Content-Type: text/plain

We don't need this in theory, they are only used for fixing the QA check
of file-depends, we need add python to the RDEPENDS here is because the
"rpmdeps" can't find the indirect dependencies.

I think that add python to their RDEPENDS is harmless, or we can disable
the file-depends check for the two recipes.

//Robert

The following changes since commit fa325e44f5b429b4038022b31285af9c94672943:

  insane: Ensure do_package_qa happens after do_packagedata (2014-07-11 23:19:18 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/python
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/python

Robert Yang (2):
  connman: add python to RDEPENDS_connman-tests
  python-distribute: add python to RDEPENDS_python-distribute

 meta/recipes-connectivity/connman/connman.inc      |    4 +++-
 .../python/python-distribute_0.6.32.bb             |    1 +
 .../python/python3-distribute_0.6.32.bb            |    1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

-- 
1.7.9.5


