Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RNNnY-0001xW-Ab
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 12:55:32 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pA7BnITV006255
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Nov 2011 03:49:18 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 7 Nov 2011 03:49:18 -0800
Message-ID: <cover.1320665106.git.xiaofeng.yan@windriver.com>
Old-Date: Mon, 7 Nov 2011 19:25:06 +0800
Date: Mon, 7 Nov 2011 19:57:14 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 0/2] qmmp: update to 2.8.5
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
X-List-Received-Date: Mon, 07 Nov 2011 11:55:32 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Hi Saul,

I make some changes to qmmp_0.5.2.bb according to koen's suggestion.
Please check it again.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/qmmp
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/qmmp

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (2):
  qmmp: update to 0.5.2
  distro_tracking_fields.inc: Modify the status of qmmp

 .../conf/distro/include/distro_tracking_fields.inc |    8 ++-
 meta/recipes-qt/qt-apps/qmmp_0.5.1.bb              |   47 -----------------
 meta/recipes-qt/qt-apps/qmmp_0.5.2.bb              |   54 ++++++++++++++++++++
 3 files changed, 60 insertions(+), 49 deletions(-)
 delete mode 100644 meta/recipes-qt/qt-apps/qmmp_0.5.1.bb
 create mode 100644 meta/recipes-qt/qt-apps/qmmp_0.5.2.bb



