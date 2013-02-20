Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1U842B-0002OQ-IU
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 08:24:08 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1K77sEN028729
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2013 23:07:56 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 19 Feb 2013 23:07:53 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Feb 2013 15:07:51 +0800
Message-ID: <1361344072-31152-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: Randy.MacLeod@windriver.com
Subject: [PATCH 0/1] gcc: make compiler to search build directory before standard system
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
X-List-Received-Date: Wed, 20 Feb 2013 07:24:09 -0000
Content-Type: text/plain

The following changes since commit a5362de60c0051f16b88a40bd9cb41915bee0b0f:

  rootfs_ipkg: fix BAD_RECOMMENDATIONS handling (2013-02-19 14:37:44 -0800)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib gcc_search_build_dir_firstly
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gcc_search_build_dir_firstly

Roy.Li (1):
  gcc: make compiler to search build directory before standard system
    include directories

 meta/recipes-devtools/gcc/gcc-4.7.inc |    2 +-
 meta/recipes-devtools/gcc/gcc_4.7.bb  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.10.4



