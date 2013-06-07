Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7EB666A456
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 02:27:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r572RcTa011487
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Jun 2013 19:27:38 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.158) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 6 Jun 2013 19:27:37 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Jun 2013 10:27:42 +0800
Message-ID: <cover.1370568886.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] openssh: three fixes
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
X-List-Received-Date: Fri, 07 Jun 2013 02:27:38 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

The following changes since commit 9ba812ab1f613d28f9eb3192d2ff1a34dfce33e4:

  binutils: fix compile error of complex expressions before @l/@h (2013-06-03 16:46:37 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib roy/openssh
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/openssh

Roy.Li (1):
  openssh: three fixes

 .../openssh-6.2p1/mac_compute-alignment.patch      |   39 ++++++++++++++++++++
 .../openssh-permit_empty_passwd.patch              |   33 +++++++++++++++++
 meta/recipes-connectivity/openssh/openssh_6.2p1.bb |    5 +++
 3 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh-6.2p1/mac_compute-alignment.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh-6.2p1/openssh-permit_empty_passwd.patch

-- 
1.7.10.4


