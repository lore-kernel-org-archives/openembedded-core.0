Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1QmcrR-0002Io-F4
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 04:31:37 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6T2RJw7029378
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 28 Jul 2011 19:27:19 -0700 (PDT)
Received: from localhost (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 28 Jul 2011 19:27:18 -0700
Message-ID: <cover.1311906027.git.kai.kang@windriver.com>
Old-Date: Fri, 29 Jul 2011 10:20:27 +0800
Date: Fri, 29 Jul 2011 10:27:15 +0800
To: <sgw@linux.intel.com>
From: Kang Kai <kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.213]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] update distro tracking fields V2
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
X-List-Received-Date: Fri, 29 Jul 2011 02:31:37 -0000
Content-Type: text/plain

From: Kang Kai <kai.kang@windriver.com>

Hi Saul,
  
I update the libnewt SRC_URI and checksum. Because the bb file is libnewt and the source
file is newt, so I write the SRC_URI with newt-${PV}.

Update the distro tracking fields of mailx slang libnewt and alsa-tools.

Because the mailx license file COPYING has lots of copyrights including personal,
company and MPL. I have no idea how to update the LICENSE and so keep the STATUS "red".
Do you have any suggestion about this?

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
 .../newt/files/include-without-python.patch        |   73 --------------------
 .../{libnewt_0.52.12.bb => libnewt_0.52.13.bb}     |   10 ++-
 meta/recipes-extended/slang/slang_2.2.4.bb         |    1 +
 .../recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb |    9 ++-
 5 files changed, 31 insertions(+), 90 deletions(-)
 delete mode 100644 meta/recipes-extended/newt/files/include-without-python.patch
 rename meta/recipes-extended/newt/{libnewt_0.52.12.bb => libnewt_0.52.13.bb} (80%)

-- 
1.7.5.1.300.gc565c



