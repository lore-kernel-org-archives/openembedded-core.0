Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SWmHe-0005NH-BM
	for openembedded-core@lists.openembedded.org;
	Tue, 22 May 2012 12:25:42 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4MAFW6a003721
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2012 03:15:32 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 22 May 2012 03:15:32 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 May 2012 18:15:32 +0800
Message-ID: <cover.1337681343.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] tune-core2.inc: PACKAGE_EXTRA_ARCHS causes wrong packages install
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
X-List-Received-Date: Tue, 22 May 2012 10:25:42 -0000
Content-Type: text/plain

This patch is based on the denzil-next branch, the master branch also
needs it.

// Robert

The following changes since commit c8c394bd806978c867f2fe82e4bde65c98764880:

  quilt: fix perl path in target perl scripts (2012-04-26 10:43:39 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/121_pkg_arch
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/121_pkg_arch

Robert Yang (1):
  tune-core2.inc: PACKAGE_EXTRA_ARCHS causes wrong packages install
    into image

 meta/conf/machine/include/tune-core2.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)



