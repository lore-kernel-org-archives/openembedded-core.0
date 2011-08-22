Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1QvSpq-0003Kf-Eo
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Aug 2011 13:38:30 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7MBXjuq021403
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2011 04:33:45 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 22 Aug 2011 04:33:45 -0700
Message-ID: <cover.1314010928.git.xiaofeng.yan@windriver.com>
Old-Date: Mon, 22 Aug 2011 19:02:08 +0800
Date: Mon, 22 Aug 2011 19:34:08 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 0/1] qt4-x11-demo-image: Fix bug 999
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
X-List-Received-Date: Mon, 22 Aug 2011 11:38:30 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Fix bug 999

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/qt4-x11-demo-image
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/qt4-x11-demo-image

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (1):
  qt4-x11-demo-image: Fix bug 999

 meta/classes/palmtop.bbclass                     |   26 ++
 meta/classes/sdk.bbclass                         |   74 ++++
 meta/recipes-qt/images/micro-base-image.bb       |   19 +
 meta/recipes-qt/images/qt4-x11-base-image.bb     |   35 ++
 meta/recipes-qt/images/qt4-x11-demo-image.bb     |   12 +
 meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init |   55 +++
 meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb      |   20 +
 meta/recipes-qt/qwt/files/qt2-fix.patch          |  408 ++++++++++++++++++++++
 meta/recipes-qt/qwt/qwt.inc                      |   33 ++
 meta/recipes-qt/qwt/qwt_5.2.1.bb                 |   13 +
 meta/recipes-qt/tasks/task-qt4-x11.bb            |   52 +++
 meta/recipes-qt/tasks/task-sdk-host.bb           |   21 ++
 12 files changed, 768 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/palmtop.bbclass
 create mode 100644 meta/classes/sdk.bbclass
 create mode 100644 meta/recipes-qt/images/micro-base-image.bb
 create mode 100644 meta/recipes-qt/images/qt4-x11-base-image.bb
 create mode 100644 meta/recipes-qt/images/qt4-x11-demo-image.bb
 create mode 100644 meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init
 create mode 100644 meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb
 create mode 100644 meta/recipes-qt/qwt/files/qt2-fix.patch
 create mode 100644 meta/recipes-qt/qwt/qwt.inc
 create mode 100644 meta/recipes-qt/qwt/qwt_5.2.1.bb
 create mode 100644 meta/recipes-qt/tasks/task-qt4-x11.bb
 create mode 100644 meta/recipes-qt/tasks/task-sdk-host.bb



