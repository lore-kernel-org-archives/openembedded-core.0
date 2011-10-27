Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RJFkl-0002Z0-Rt
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Oct 2011 04:31:36 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9R2PYA0026450
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2011 19:25:34 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 26 Oct 2011 19:25:34 -0700
Message-ID: <cover.1319682417.git.xiaofeng.yan@windriver.com>
Old-Date: Thu, 27 Oct 2011 10:26:57 +0800
Date: Thu, 27 Oct 2011 10:32:22 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 0/1] qmmp: update to 0.5.2
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
X-List-Received-Date: Thu, 27 Oct 2011 02:31:36 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Hi Saul,

I Removed the old recipe qmmp_0.5.1 and added qmmp_0.5.2 according to your suggestion.

Thanks
Yan

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/qmmp_update
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/qmmp_update

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (1):
  qmmp: update to 0.5.2

 .../conf/distro/include/distro_tracking_fields.inc |    9 +++-
 meta/recipes-qt/qt-apps/qmmp_0.5.1.bb              |   47 ----------------
 meta/recipes-qt/qt-apps/qmmp_0.5.2.bb              |   57 ++++++++++++++++++++
 3 files changed, 64 insertions(+), 49 deletions(-)
 delete mode 100644 meta/recipes-qt/qt-apps/qmmp_0.5.1.bb
 create mode 100644 meta/recipes-qt/qt-apps/qmmp_0.5.2.bb



