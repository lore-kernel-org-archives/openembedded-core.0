Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1QyZq4-0001i5-NQ
	for openembedded-core@lists.openembedded.org;
	Wed, 31 Aug 2011 03:43:37 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7V1cfHj005400
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 18:38:41 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 30 Aug 2011 18:38:40 -0700
Message-ID: <cover.1314754472.git.xiaofeng.yan@windriver.com>
Old-Date: Wed, 31 Aug 2011 09:34:32 +0800
Date: Wed, 31 Aug 2011 09:39:54 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 0/1] Fix bug 999
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
X-List-Received-Date: Wed, 31 Aug 2011 01:43:37 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

qt-init-demo was needed during building a qt4e-demo-image.
So I pull it from Openembeded and push it into OE-core.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/qt4e-demo-image
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/qt4e-demo-image

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (1):
  qt-demo-init: Fix bug 999

 meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init |   55 ++++++++++++++++++++++
 meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb      |   19 ++++++++
 2 files changed, 74 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init
 create mode 100644 meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb



