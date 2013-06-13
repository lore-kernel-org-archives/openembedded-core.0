Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2BBA16A88D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2013 03:11:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5D3BB6e028830
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 20:11:11 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Wed, 12 Jun 2013 20:11:09 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Jun 2013 11:11:06 +0800
Message-ID: <cover.1371092329.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1 v2] openssh: two fixes
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
X-List-Received-Date: Thu, 13 Jun 2013 03:11:09 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

The following changes since commit 74158c2e99c6d8631800ae80025d1cc9f19336d2:

  tune-cortexa*.inc: fix tunings for cortex a5, a7, a8, a9, a15 machines. (2013-06-12 17:54:28 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib roy/openssh-1
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/openssh-1

Roy.Li (1):
  openssh: two fixes

 .../openssh/openssh-6.2p2/mac.patch                |   76 ++++++++++++++++++++
 meta/recipes-connectivity/openssh/openssh_6.2p2.bb |    4 ++
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh-6.2p2/mac.patch

-- 
1.7.10.4


