Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TbNdF-0005UP-Cq
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 04:39:17 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAM3P8i2027379
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Nov 2012 19:25:08 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Wed, 21 Nov 2012 19:25:07 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 22 Nov 2012 11:25:44 +0800
Message-ID: <cover.1353553772.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] V3 drop lsbsetup
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
X-List-Received-Date: Thu, 22 Nov 2012 03:39:17 -0000
Content-Type: text/plain

V3:
move the links from lsbsetup to package lsb

The following changes since commit c206007235df3e00c21a1cbf30e8a1bccc07a9e5:

  libcheck: Add missing rdepends on gawk and set path correctly (2012-11-21 14:43:13 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/lsb
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/lsb

Kang Kai (3):
  lsbsetup: drop it
  packagegroup-core-lsb: remove lsbsetup
  lsb: move links from lsbsetup to here

 meta/recipes-extended/lsb/lsb_4.1.bb               |   10 +-
 meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh    |  230 --------------------
 meta/recipes-extended/lsb/lsbsetup_1.0.bb          |   26 ---
 .../packagegroups/packagegroup-core-lsb.bb         |    3 +-
 4 files changed, 10 insertions(+), 259 deletions(-)
 delete mode 100644 meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh
 delete mode 100644 meta/recipes-extended/lsb/lsbsetup_1.0.bb

-- 
1.7.5.4



