Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1Tb9Bt-0006AD-F0
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Nov 2012 13:14:06 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qAL9Ob1p021505
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2012 01:24:37 -0800 (PST)
Received: from jiahongxu-OptiPlex-990.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 21 Nov 2012 01:24:37 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Nov 2012 17:24:34 +0800
Message-ID: <cover.1353488396.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] binutils-native:do_compile failed on Ubuntu 12.10
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
X-List-Received-Date: Wed, 21 Nov 2012 12:14:06 -0000
Content-Type: text/plain

The following changes since commit 66861cce918eb7ed1f16f829d652c9d7105152b7:

  Revert "gcc: Use FILESPATH instead of FILESDIR and cleanup/simplify" (2012-11-20 16:47:11 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/binutils
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/binutils

Hongxu Jia (1):
  binutils-native: do_compile failed on Ubuntu 12.10

 meta/recipes-devtools/binutils/binutils-2.22.inc   |    3 +-
 .../binutils-check-size-before-memset.patch        |   43 ++++++++++++++++++++
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/binutils-check-size-before-memset.patch

-- 
1.7.10.4



