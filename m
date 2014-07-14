Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BB20F70254
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 09:01:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6E91nV0014500
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 14 Jul 2014 02:01:49 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 14 Jul 2014 02:01:49 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Jul 2014 17:01:41 +0800
Message-ID: <cover.1405328408.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 0/1] perl-rdepends: Add perl as perl-misc/${PN}-pod runtime dep
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
X-List-Received-Date: Mon, 14 Jul 2014 09:01:58 -0000
Content-Type: text/plain

The following changes since commit 9e99bcffec594cb5b4c3533200e8eb56d32e6a77:

  insane: Ensure do_package_qa happens after do_packagedata (2014-07-11 23:20:04 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-perl-rdep
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-perl-rdep

Hongxu Jia (1):
  perl-rdepends: Add perl as perl-misc/${PN}-pod runtime dep

 meta/recipes-devtools/perl/perl-rdepends_5.20.0.inc | 2 ++
 1 file changed, 2 insertions(+)

-- 
1.8.1.2


