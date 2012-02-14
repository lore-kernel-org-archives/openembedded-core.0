Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1RxDf0-0008EF-RJ
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 09:22:51 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q1E8EerN025816
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2012 00:14:40 -0800 (PST)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 14 Feb 2012 00:14:40 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Feb 2012 15:56:22 +0800
Message-ID: <cover.1329185588.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/1] gettext: Get gettext use its own libunistring
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
X-List-Received-Date: Tue, 14 Feb 2012 08:22:51 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

gettext needs the libunistring, just add the configure option to get
it use its own internal version(--with-included-libunistring)

[yocto#1934]

The following changes since commit 41a83ccfe50ec69425a4828fb5836d38d3f99e67:
  Lianhao Lu (1):
        guile: fix cross configure failure

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/1934
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/1934

Wenzong Fan (1):
  gettext: Get gettext use its own libunistring

 meta/recipes-core/gettext/gettext_0.18.1.1.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)



