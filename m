Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1T4u8T-0000Jl-Kd
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 15:41:17 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7ODT8tN003421
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2012 06:29:08 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Fri, 24 Aug 2012 06:29:07 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Aug 2012 21:29:05 +0800
Message-ID: <cover.1345711916.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] gdk-pixbuf: call gtk-update-icon-cache with -t in postinstall script
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
X-List-Received-Date: Fri, 24 Aug 2012 13:41:18 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* Test info:
$ bitbake core-image-sato core-image-sato-sdk
$ runqemu qemux86 core-image-sato nographic
$ runqemu qemux86 core-image-sato-sdk nographic

The following changes since commit e3b0925f4c861393e436deb6b1912f9f1f325d1e:

  libtool: normalize link paths before considering for RPATH (2012-08-22 14:22:51 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/bug2905_gdk_0823
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/bug2905_gdk_0823

Jackie Huang (1):
  gdk-pixbuf: call gtk-update-icon-cache with -t in postinstall script

 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.4



