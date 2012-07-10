Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SoX28-0007Sl-Dz
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 11:47:04 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6A9Zq9a008779
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 02:35:52 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 10 Jul 2012 02:35:53 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jul 2012 17:35:49 +0800
Message-ID: <cover.1341909636.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] subversion: do_install failed (parallel issue)
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
X-List-Received-Date: Tue, 10 Jul 2012 09:47:04 -0000
Content-Type: text/plain

The following changes since commit 8d8b9e77aa3403e880cbbdfefc7f24a993b3161f:

  linux-yocto/3.4: perf scripting & unionfs fixes (2012-07-09 17:06:09 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/svn
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/svn

Robert Yang (1):
  subversion: do_install failed (parallel issue)

 .../subversion/fix-install-depends.patch           |   45 ++++++++++++++++++++
 .../subversion/subversion_1.6.15.bb                |    6 ++-
 .../subversion/subversion_1.7.2.bb                 |    3 +-
 3 files changed, 51 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/subversion/subversion/fix-install-depends.patch



