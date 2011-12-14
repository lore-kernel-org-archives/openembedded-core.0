Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1Ranzb-0006TA-3u
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Dec 2011 13:31:27 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pBECOS6A008736
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2011 04:24:29 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 14 Dec 2011 04:24:28 -0800
Message-ID: <cover.1323864630.git.xiaofeng.yan@windriver.com>
Old-Date: Wed, 14 Dec 2011 20:10:30 +0800
Date: Wed, 14 Dec 2011 20:18:24 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 0/2] add a bb file to build an image for gtk over directfb
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
X-List-Received-Date: Wed, 14 Dec 2011 12:31:27 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

gtk-directfb is for reminding user to add "gtk-directfb" to DISTRO_FEATURES and remove "x11"
core-image-gtk-directfb is for getting an image to gtk over directfb.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/gtk-directfb
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/gtk-directfb

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (2):
  gtk-directfb: add bbclass gtk-directfb
  core-image-gtk-directfb: add a bb file to build an image for gtk over
    directfb

 meta/classes/gtk-directfb.bbclass                  |   12 ++++++++++
 .../images/core-image-gtk-directfb.bb              |   22 ++++++++++++++++++++
 2 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/gtk-directfb.bbclass
 create mode 100644 meta/recipes-graphics/images/core-image-gtk-directfb.bb



