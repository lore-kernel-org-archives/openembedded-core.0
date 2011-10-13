Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1REAx4-0003bU-Nj
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 04:23:19 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9D2HXTB004298
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 19:17:33 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 12 Oct 2011 19:17:33 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Oct 2011 10:22:58 +0800
Message-ID: <cover.1318472103.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/1] qt4-x11-free: Fix broken regexes in qt4-x11-free's recipe.
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
X-List-Received-Date: Thu, 13 Oct 2011 02:23:19 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

This patch merged from Wind River Linux, it fix a potential '/' issue for
qt4-x11-free.

[yocto bug id: 1671]

The following changes since commit b92b776d56e64a437181de9bc76f8dcc8e15a5f8:
  Richard Purdie (1):
        meta-yocto: Catch up with xserver and mesa upgrades/rename

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/qt4_trailingslash
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/qt4_trailingslash

Wenzong Fan (1):
  qt4-x11-free: Fix broken regexes in qt4-x11-free's recipe.

 meta/recipes-qt/qt4/qt4.inc |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)



