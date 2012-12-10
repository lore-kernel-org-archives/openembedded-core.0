Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1Ti00s-0001nI-Kl
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Dec 2012 10:51:05 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBA9aVta024692
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 10 Dec 2012 01:36:31 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Mon, 10 Dec 2012 01:36:26 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Mon, 10 Dec 2012 17:37:13 +0800
Message-ID: <cover.1355131760.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] V2: Enable python support for libnewt and libuser
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
X-List-Received-Date: Mon, 10 Dec 2012 09:51:05 -0000
Content-Type: text/plain

V2:
add python to libnewt/libuser DEPENDS. Build successfully both with and without 
'INCOMPATIBLE_LICENSE = "GPLv3"' in local.conf

The following changes since commit c607095894cab60493ddfc4b967b0325e1c313b4:

  bitbake: Revert "BBHandler: Ensure parser state engine is correctly reset for new parsing" (2012-12-07 18:09:01 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/libuser_newt-with-python
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/libuser_newt-with-python

Kang Kai (2):
  newt: enable python support
  libuser: enable python support

 meta/recipes-extended/libuser/libuser_0.57.1.bb    |   14 ++++++++---
 .../newt/files/fix_python_fpic.patch               |   11 +++++++++
 meta/recipes-extended/newt/libnewt_0.52.14.bb      |   24 +++++++++++++++-----
 3 files changed, 39 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-extended/newt/files/fix_python_fpic.patch

-- 
1.7.5.4



