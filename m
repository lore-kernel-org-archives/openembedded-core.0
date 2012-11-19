Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1TaOXU-0003R2-5Y
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Nov 2012 11:25:18 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAJABAr7009119
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2012 02:11:10 -0800 (PST)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 19 Nov 2012 02:11:10 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Nov 2012 18:11:07 +0800
Message-ID: <cover.1353319512.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
MIME-Version: 1.0
Cc: Jackie.Huang@windriver.com, Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] python-pygtk: add gtk-types.defs into gdk.c dependence
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
X-List-Received-Date: Mon, 19 Nov 2012 10:25:19 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* Test info:
1) MACHINE=qemux86-64/qemuppc/qemumips
   PARALLEL_MAKE = "-j 5" (and -j24)
$ bitbake core-image-sato 
$ bitbake python-pygtk

The following changes since commit d109b24ad354382cd40b28e86211e53929a0910f:

  pulseaudio: explicitly disable xen, rather than letting it detect (2012-11-18 16:39:43 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/d_python-pygtk_1119_1
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/d_python-pygtk_1119_1

Jackie Huang (1):
  python-pygtk: add gtk-types.defs into gdk.c dependence

 .../add-gtk-types.defs-into-gdk.c-dependence.patch |   32 ++++++++++++++++++++
 .../recipes-devtools/python/python-pygtk_2.24.0.bb |    1 +
 2 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-pygtk/add-gtk-types.defs-into-gdk.c-dependence.patch

-- 
1.7.4



