Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1TxZKP-0007uh-Ob
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 09:35:35 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0M8K22S016280
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2013 00:20:02 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.131) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 22 Jan 2013 00:20:02 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jan 2013 16:19:53 +0800
Message-ID: <cover.1358824498.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/4]support incremental deb image generation
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
X-List-Received-Date: Tue, 22 Jan 2013 08:35:55 -0000
X-List-Received-Date: Tue, 22 Jan 2013 08:35:55 -0000
Content-Type: text/plain

The following changes since commit be2a1508b16b3afc89521b3fa1eb195a0c6970fe:

  oprofile: set correct kernel path (2013-01-20 13:14:08 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/incremental-deb-image
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/incremental-deb-image

Hongxu Jia (4):
  apt-native:fix support configuring etc dir in apt.conf
  rootfs_deb.bbclass:support incremental deb image generation
  image.bbclass:support incremental deb image generation
  package_deb.bbclass:support incremental deb image generation

 meta/classes/image.bbclass               |   21 +-
 meta/classes/package_deb.bbclass         |  377 +++++++++++++++++++++++++++---
 meta/classes/rootfs_deb.bbclass          |   58 ++++-
 meta/recipes-devtools/apt/files/apt.conf |    2 +-
 4 files changed, 414 insertions(+), 44 deletions(-)

-- 
1.7.10.4



