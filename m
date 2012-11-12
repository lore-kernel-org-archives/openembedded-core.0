Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TXsTb-000236-Cl
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Nov 2012 12:46:51 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qACBWwYo006059
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2012 03:32:59 -0800 (PST)
Received: from chenqi-OptiPlex-760.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 12 Nov 2012 03:32:56 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Nov 2012 19:33:33 +0800
Message-ID: <cover.1352714690.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] initscripts: improve the way it handles volatile storage
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
X-List-Received-Date: Mon, 12 Nov 2012 11:46:51 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The following changes since commit e421e95de0ce430cc2c6db9b0712a66ab96288a1:

  gnome-desktop: Now we depend on gnome-common-native, use the correct sysroot (2012-11-02 16:18:32 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/initscripts
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/initscripts

Chen Qi (1):
  initscripts: improve the way initscripts handle volatile storage

 .../initscripts/initscripts-1.0/bootmisc.sh        |    7 -----
 .../initscripts-1.0/populate-volatile.sh           |   28 +++++++++-----------
 .../initscripts/initscripts-1.0/volatiles          |    1 +
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 +-
 4 files changed, 15 insertions(+), 23 deletions(-)

-- 
1.7.9.5



