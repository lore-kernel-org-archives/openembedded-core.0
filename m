Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D53AD607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 06:32:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t636WQsh000399
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Jul 2015 23:32:26 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Thu, 2 Jul 2015 23:32:25 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Jul 2015 14:32:57 +0800
Message-ID: <cover.1435905135.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] lsbinitscripts: avoid exit 1 in functions
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
X-List-Received-Date: Fri, 03 Jul 2015 06:32:29 -0000
Content-Type: text/plain

The following changes since commit dd09fab685de2eaf04aa5ab60f8220b89c1deae9:

  tune-core2.inc: set X86ARCH32 to i686 (instead of i586) (2015-07-02 23:08:27 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/lsbinitscripts
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/lsbinitscripts

Chen Qi (1):
  lsbinitscripts: avoid exit 1 in functions script

 ...void-exit-1-which-causes-init-scripts-to-.patch | 23 ++++++++++++++++++++++
 meta/recipes-extended/lsb/lsbinitscripts_9.63.bb   |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-extended/lsb/lsbinitscripts/0001-functions-avoid-exit-1-which-causes-init-scripts-to-.patch

-- 
1.9.1


