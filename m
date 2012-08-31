Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1T7ODA-0005f6-1J
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 12:12:29 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7VA057I007459
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2012 03:00:05 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Fri, 31 Aug 2012 03:00:05 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Aug 2012 18:00:04 +0800
Message-ID: <cover.1346406022.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/8] Patches for LSB perl test
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
X-List-Received-Date: Fri, 31 Aug 2012 10:12:29 -0000
Content-Type: text/plain

The following changes since commit b4c5725af4cd85d5644f0373e2674e903c4eab2b:

  yocto-bsp: add missing xserver-xf86-config .bbappend for qemu (2012-08-25 14:47:07 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/lsb
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/lsb

Kang Kai (8):
  libclass-isa-perl: add it
  perl: package modules Pod-Html and Tie-Hash-NamedCapture
  libpod-plainer-perl: add it
  libdumpvalue-perl: add it
  libenv-perl: add it
  libfile-checktree-perl: add it
  libi18n-collate-perl: add it
  task-core-lsb: add packages

 meta/recipes-devtools/perl/perl-5.14.2/config.sh   |    2 +-
 .../perl/libclass-isa-perl_0.36.bb                 |   32 +++++++++++++++++++
 .../perl/libdumpvalue-perl_1.16.bb                 |   20 ++++++++++++
 meta/recipes-extended/perl/libenv-perl_1.03.bb     |   22 +++++++++++++
 .../perl/libfile-checktree-perl_4.41.bb            |   33 ++++++++++++++++++++
 .../perl/libi18n-collate-perl_1.02.bb              |   22 +++++++++++++
 .../perl/libpod-plainer-perl_1.03.bb               |   24 ++++++++++++++
 meta/recipes-extended/tasks/task-core-lsb.bb       |    9 +++++-
 8 files changed, 162 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/perl/libclass-isa-perl_0.36.bb
 create mode 100644 meta/recipes-extended/perl/libdumpvalue-perl_1.16.bb
 create mode 100644 meta/recipes-extended/perl/libenv-perl_1.03.bb
 create mode 100644 meta/recipes-extended/perl/libfile-checktree-perl_4.41.bb
 create mode 100644 meta/recipes-extended/perl/libi18n-collate-perl_1.02.bb
 create mode 100644 meta/recipes-extended/perl/libpod-plainer-perl_1.03.bb

-- 
1.7.5.4



