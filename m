Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1Qv51a-00038S-CX
	for openembedded-core@lists.openembedded.org;
	Sun, 21 Aug 2011 12:13:02 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7LA8I4Q025466
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Aug 2011 03:08:18 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Sun, 21 Aug 2011 03:08:17 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 21 Aug 2011 18:08:46 +0800
Message-ID: <cover.1313921149.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH 0/1] bitbake meta-toolchain with gcc 4.5.1 failed
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
X-List-Received-Date: Sun, 21 Aug 2011 10:13:02 -0000
Content-Type: text/plain

* Steps to reproduce the error:
1) Add the following lines to conf/local.conf:
  
SDKGCCVERSION="4.5.1"
GCCVERSION="4.5.1"

2) bitbake meta-toolchain

The we will notice the error that sed can't find the directory:
 
${TMPDIR}/work-shared/gcc-${PV}/gcc-${PV}-${PR}

we had changed the name of S from gcc-${PV} to gcc-${PV}-${PR}, but didn't
update meta/recipes-devtools/gcc/gcc-common.inc, so fix S in gcc-common.inc
would make it work.

The following changes since commit edd8e1e8b974eb3f0f9f66c2207aadf43612350b:

  documentation/adt-manual/adt-command.xml: general edits. (2011-08-20 17:52:00 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/gcc_451
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/gcc_451

Robert Yang (1):
  bitbake meta-toolchain with gcc 4.5.1 failed

 meta/recipes-devtools/gcc/gcc-common.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)



