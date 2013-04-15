Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1URaAg-0006Og-3m
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 05:33:35 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r3F3G4Rc013356
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Apr 2013 20:16:04 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Sun, 14 Apr 2013 20:16:04 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <mark.hatle@windriver.com>
Date: Mon, 15 Apr 2013 11:17:54 +0800
Message-ID: <cover.1365995348.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] V2: Fix rpm2cpio segment fault
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
X-List-Received-Date: Mon, 15 Apr 2013 03:33:44 -0000
Content-Type: text/plain

Hi Mark,

As my last mail on Apr 12 mentioned, not only macro "_dbpath" need to be defined. Macros "_dbi_config*" are needed too, and they can't be simply assigned some value.

I think parse config files first could be a workaround to fix rpm2cpio segment fault error for now.

Thanks,
Kai


The following changes since commit 4c02dd5f6432c6e683a57d47b610f56433e9ca0d:

  kern-tools: fix conditional configuration items (2013-04-11 08:27:41 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/rpm2cpio-segfault
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/rpm2cpio-segfault

Kang Kai (1):
  rpm: fix rpm2cpio segmentation fault

 .../rpm/rpm/rpm2cpio-fix-segmentation-fault.patch  |   28 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    1 +
 2 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm2cpio-fix-segmentation-fault.patch

-- 
1.7.5.4



