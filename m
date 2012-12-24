Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1Tmweu-0002uN-Cz
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Dec 2012 02:16:49 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qBO11ujm023630
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 23 Dec 2012 17:01:56 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.143) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Sun, 23 Dec 2012 17:01:56 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Dec 2012 09:02:03 +0800
Message-ID: <cover.1356310727.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] replace portmap with rpcbind
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
X-List-Received-Date: Mon, 24 Dec 2012 01:16:49 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

*** BLURB HERE ***
The following changes since commit 26bf8f6a047ccc0f73eaa40093afddabfce8ea1b:

  gst-openmax: fix build with newer GLib (2012-12-17 17:53:33 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib roy/rpcbind
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/rpcbind

Roy.Li (1):
  replace portmap with rpcbind.

 meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb |    2 +-
 .../initscripts/initscripts-1.0/mountnfs.sh            |   16 ++++++++--------
 meta/recipes-core/packagegroups/packagegroup-base.bb   |    2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

-- 
1.7.10.4



