Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1Qtyod-0000gJ-DW
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 11:23:07 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7I9IQ54021016
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Aug 2011 02:18:26 -0700 (PDT)
Received: from localhost (128.224.162.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 18 Aug 2011 02:18:26 -0700
Message-ID: <cover.1313636030.git.kai.kang@windriver.com>
Old-Date: Thu, 18 Aug 2011 10:53:50 +0800
Date: Thu, 18 Aug 2011 17:18:22 +0800
To: <sgw@linux.intel.com>
From: Kang Kai <kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.220]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] bug fix for 1212 and split the previous distro tracking fields commit
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
X-List-Received-Date: Thu, 18 Aug 2011 09:23:08 -0000
Content-Type: text/plain

From: Kang Kai <kai.kang@windriver.com>

Hi Saul,

I add a method to check the depencies between eglibc configurable options. When one option
is set in DISTRO_FEATURES_LIBC then the required options will be set too.
Fixes [Yocto #1212]

Split the previous update distro tracking fields commit.

Regards,

The following changes since commit a21ff559e7c93e9da61104f4a33e42e6004189fd:

  Fixup remaining bb.msg.domain users (2011-08-15 17:31:52 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/distro
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/distro

Kang Kai (5):
  eglibc: check dependencies among eglibc options
  mailx: update license and distro tracking fileds
  slang: add homepage and update distro tracking fields
  alsa-tools: update license and add distro tracking fields
  newt: update distro tracking fields

 meta/conf/distro/include/default-distrovars.inc    |    2 +-
 .../conf/distro/include/distro_tracking_fields.inc |   29 +++++---
 meta/recipes-core/eglibc/eglibc-options.inc        |   75 +++++++++++++++++++-
 meta/recipes-extended/mailx/mailx_12.5.bb          |    4 +-
 meta/recipes-extended/slang/slang_2.2.4.bb         |    3 +-
 .../recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb |   11 ++-
 6 files changed, 104 insertions(+), 20 deletions(-)

-- 
1.7.5.1.300.gc565c



