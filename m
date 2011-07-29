Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1Qmdte-0003Vi-Pc
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 05:37:59 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6T3XfTX007328
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 28 Jul 2011 20:33:41 -0700 (PDT)
Received: from localhost (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 28 Jul 2011 20:33:40 -0700
Message-ID: <cover.1311910283.git.kai.kang@windriver.com>
Old-Date: Fri, 29 Jul 2011 11:31:23 +0800
Date: Fri, 29 Jul 2011 11:33:36 +0800
To: <sgw@linux.intel.com>
From: Kang Kai <kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.213]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] update distro tracking fields V3
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
X-List-Received-Date: Fri, 29 Jul 2011 03:38:00 -0000
Content-Type: text/plain

From: Kang Kai <kai.kang@windriver.com>

Hi Saul,
  
v3 update the mailx license.

I update the libnewt SRC_URI and checksum. Because the bb file is libnewt and the source
file is newt, so I write the SRC_URI with newt-${PV}.

Update the distro tracking fields of mailx slang libnewt and alsa-tools.

Thank you!

The following changes since commit 860a41bae6b863a289b06a9684d9cf6c58a307bd:

  arch-ia32.inc: Fix up TUNE_ARCH variable conflicts (2011-07-26 22:39:59 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/distro
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/distro

Kang Kai (2):
  libnewt: update to 0.52.13
  distro_tracking_fields: update packages info

 .../conf/distro/include/distro_tracking_fields.inc |   28 +++++---
 meta/recipes-extended/mailx/mailx_12.5.bb          |    2 +-
 .../newt/files/include-without-python.patch        |   73 --------------------
 .../{libnewt_0.52.12.bb => libnewt_0.52.13.bb}     |   10 ++-
 meta/recipes-extended/slang/slang_2.2.4.bb         |    1 +
 .../recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb |    9 ++-
 6 files changed, 32 insertions(+), 91 deletions(-)
 delete mode 100644 meta/recipes-extended/newt/files/include-without-python.patch
 rename meta/recipes-extended/newt/{libnewt_0.52.12.bb => libnewt_0.52.13.bb} (80%)

-- 
1.7.5.1.300.gc565c



