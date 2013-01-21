Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1Tx7Ub-000487-6n
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 03:52:16 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0L2agrZ005147
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 20 Jan 2013 18:36:42 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.143) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Sun, 20 Jan 2013 18:36:41 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Jan 2013 10:36:37 +0800
Message-ID: <cover.1358735456.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: joe.macdonald@windriver.com, martin.jansa@gmail.com
Subject: [PATCH 0/2 v2] define and use tcp-wrappers DISTRO_FEATURE
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
X-List-Received-Date: Mon, 21 Jan 2013 02:52:17 -0000
X-List-Received-Date: Mon, 21 Jan 2013 02:52:17 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

*** BLURB HERE ***
The following changes since commit 5892db9a34c188b8a9bdaa86e19ba62a7f4793b5:

  oprofile: set correct kernel path (2013-01-20 13:13:54 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib enable_tcp_wrapper_for_xinetd
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=enable_tcp_wrapper_for_xinetd

Roy.Li (2):
  xinetd: enable tcp-wrappers support by DISTRO_FEATURE
  bitbake.conf: add tcp-wrappers to default DISTRO_FEATURES_BACKFILL

 meta/conf/bitbake.conf                        |    2 +-
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb |    5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
1.7.10.4



