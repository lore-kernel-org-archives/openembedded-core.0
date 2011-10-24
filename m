Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RIBKv-00063e-TX
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Oct 2011 05:36:30 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9O3UWri003720
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2011 20:30:32 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Sun, 23 Oct 2011 20:30:32 -0700
Message-ID: <cover.1319427162.git.xiaofeng.yan@windriver.com>
Old-Date: Mon, 24 Oct 2011 11:32:42 +0800
Date: Mon, 24 Oct 2011 11:37:02 +0800
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
X-List-Received-Date: Mon, 24 Oct 2011 03:36:30 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Hi saul,

Use do_split_package for each grouping and name them correctly besides updating package.
The format to name plugins of qmmp:
qmmp-plugin-<group>-<library>  with the Description: Qmmp <Group> plugin for %s"

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/qmmp_update
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/qmmp_update

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (1):
  qmmp: update to 0.5.2

 meta/recipes-qt/qt-apps/qmmp_0.5.2.bb |   60 +++++++++++++++++++++++++++++++++
 1 files changed, 60 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-qt/qt-apps/qmmp_0.5.2.bb



