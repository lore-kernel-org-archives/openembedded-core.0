Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RYgSl-0008Us-6l
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 17:04:47 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pB8Fvuk3020726
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Dec 2011 07:57:56 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 8 Dec 2011 07:57:56 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Dec 2011 10:03:52 -0600
Message-ID: <cover.1323360188.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/1] Rename references to POKY_*_INSTALL to OE..
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Dec 2011 16:04:47 -0000
Content-Type: text/plain

The following changes since commit 60f0b866b4b7c4aa337a2ff764455741a73665da:

  package.bbclass: Adding license collection (2011-12-08 15:23:58 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/poky-rename
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/poky-rename

Mark Hatle (1):
  Rename leftover POKY references to OE in image variables

 meta/classes/core-image.bbclass                    |    8 ++++----
 meta/recipes-core/images/core-image-minimal.bb     |    2 +-
 meta/recipes-core/images/self-hosted-image.bb      |    2 +-
 meta/recipes-extended/images/core-image-basic.bb   |    2 +-
 meta/recipes-extended/images/core-image-lsb-dev.bb |    2 +-
 meta/recipes-extended/images/core-image-lsb-sdk.bb |    2 +-
 meta/recipes-extended/images/core-image-lsb.bb     |    2 +-
 meta/recipes-graphics/images/core-image-clutter.bb |    2 +-
 meta/recipes-qt/images/qt4e-demo-image.bb          |    2 +-
 9 files changed, 12 insertions(+), 12 deletions(-)

-- 
1.7.3.4



