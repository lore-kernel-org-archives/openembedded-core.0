Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1T3iWR-0006T1-Tw
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 09:05:08 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7L6r3rF013188
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 23:53:03 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Mon, 20 Aug 2012 23:53:01 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Aug 2012 14:48:47 +0800
Message-ID: <cover.1345519167.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] package_rpm.bbclass: fix and enhance the incremental rpm generation
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
X-List-Received-Date: Tue, 21 Aug 2012 07:05:08 -0000
Content-Type: text/plain

* Test info:
$ bitbake core-image-sato core-image-sato-sdk meta-toolchain meta-toolchain-sdk
$ bitbake package-index

Tested the incremental rpm generation based on core-image-minimal and
core-image-sato

* Note: it doesn't have any conflict with the "Install external binary packages"
  patches which are in Patch Review.

// Robert

The following changes since commit 7c40daab587306da25c8d8f566392ee1f57bbef4:

  qemu: Fix broken accidental path move (2012-08-20 17:25:28 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/inc_rpm
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/inc_rpm

Robert Yang (1):
  package_rpm.bbclass: fix and enhance the incremental rpm generation

 meta/classes/package_rpm.bbclass |   68 ++++++++++++++++++++++++--------------
 1 files changed, 43 insertions(+), 25 deletions(-)



