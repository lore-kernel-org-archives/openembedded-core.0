Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1Tw2Mt-0002Kl-W9
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 04:11:49 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0I2uOe9017181
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2013 18:56:24 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.143) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 17 Jan 2013 18:56:22 -0800
From: <rongqing.li@windriver.com>
To: <randy.macleod@windriver.com>, <joe.macdonald@windriver.com>,
	<openembedded-core@lists.openembedded.org>
Date: Fri, 18 Jan 2013 10:56:21 +0800
Message-ID: <cover.1358477598.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/2] define and use tcp-wrappers DISTRO_FEATURE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Jan 2013 03:11:49 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

*** BLURB HERE ***
The following changes since commit 98f17da7ccc1bf79fc5894f90e52769bdbcf89df:

  update-rc.d: fix failure on target (2013-01-17 20:16:38 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib roy/enable_tcp_wrapper_xinetd
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/enable_tcp_wrapper_xinetd

Roy.Li (2):
  xinetd: enable tcp-wrappers support by DISTRO_FEATURE
  default-distrovars: add tcp-wrappers to default DISTRO_FEATURES

 meta/conf/distro/include/default-distrovars.inc |    3 ++-
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb   |    5 ++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
1.7.10.4



