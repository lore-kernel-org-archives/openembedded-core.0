Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1T9S1I-0008Og-GG
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 04:40:40 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q862SEWi018251
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Sep 2012 19:28:14 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Wed, 5 Sep 2012 19:28:14 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Thu, 6 Sep 2012 10:28:16 +0800
Message-ID: <cover.1346836639.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 0/9] V3: Patches for LSB perl test
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
X-List-Received-Date: Thu, 06 Sep 2012 02:40:40 -0000
Content-Type: text/plain

Hi Saul,

V3 just update packagegroup-core-lsb.bbappend commit that I missed the task --> packagegoups rename.

V2:
I create layer meta-lsb and put the new added recipes for LSB test there.
Patch for perl is just modify the file in layer meta.

Regards,
Kai

The following changes since commit 99c85ba93075a1aff789cafabbacf42e6a93bd32:

  build-appliance-image: Update to latest poky master (2012-09-04 18:04:40 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/lsb
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/lsb

Kang Kai (9):
  meta-lsb: add layer meta-lsb
  libclass-isa-perl: add it
  perl: package modules Pod-Html and Tie-Hash-NamedCapture
  libpod-plainer-perl: add it
  libdumpvalue-perl: add it
  libenv-perl: add it
  libfile-checktree-perl: add it
  libi18n-collate-perl: add it
  packagegroup-core-lsb.bbappend: add bbappend file

 meta-lsb/README                                    |    4 ++
 meta-lsb/conf/layer.conf                           |   10 ++++++
 .../packagegroups/packagegroup-core-lsb.bbappend   |   15 +++++++++
 .../perl/libclass-isa-perl_0.36.bb                 |   32 +++++++++++++++++++
 .../perl/libdumpvalue-perl_1.16.bb                 |   20 ++++++++++++
 meta-lsb/recipes-devtools/perl/libenv-perl_1.03.bb |   22 +++++++++++++
 .../perl/libfile-checktree-perl_4.41.bb            |   33 ++++++++++++++++++++
 .../perl/libi18n-collate-perl_1.02.bb              |   22 +++++++++++++
 .../perl/libpod-plainer-perl_1.03.bb               |   24 ++++++++++++++
 meta/recipes-devtools/perl/perl-5.14.2/config.sh   |    2 +-
 10 files changed, 183 insertions(+), 1 deletions(-)
 create mode 100644 meta-lsb/README
 create mode 100644 meta-lsb/conf/layer.conf
 create mode 100644 meta-lsb/recipes-core/packagegroups/packagegroup-core-lsb.bbappend
 create mode 100644 meta-lsb/recipes-devtools/perl/libclass-isa-perl_0.36.bb
 create mode 100644 meta-lsb/recipes-devtools/perl/libdumpvalue-perl_1.16.bb
 create mode 100644 meta-lsb/recipes-devtools/perl/libenv-perl_1.03.bb
 create mode 100644 meta-lsb/recipes-devtools/perl/libfile-checktree-perl_4.41.bb
 create mode 100644 meta-lsb/recipes-devtools/perl/libi18n-collate-perl_1.02.bb
 create mode 100644 meta-lsb/recipes-devtools/perl/libpod-plainer-perl_1.03.bb

-- 
1.7.5.4



