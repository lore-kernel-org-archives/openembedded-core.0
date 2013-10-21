Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C0C4A6D1B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 11:37:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9LBbPCE016091
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 04:37:25 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Mon, 21 Oct 2013 04:37:24 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Oct 2013 19:37:21 +0800
Message-ID: <cover.1382355293.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] debugedit: fix segment fault while file's bss offset have a large number
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
X-List-Received-Date: Mon, 21 Oct 2013 11:37:25 -0000
Content-Type: text/plain

The following changes since commit 529bf977e956175bd8405ebffc88194192e44740:

  update-rcd.bbclass: fix host/target test (2013-10-16 14:51:07 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-debugedit
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-debugedit

Hongxu Jia (1):
  debugedit: fix segment fault while file's bss offset have a large
    number

 ...debugedit-valid-file-to-fix-segment-fault.patch | 67 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/rpm/debugedit-valid-file-to-fix-segment-fault.patch

-- 
1.8.1.2


