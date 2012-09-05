Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1T9HHO-0001CG-Lx
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 17:12:35 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q85F0AfG028346
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Sep 2012 08:00:10 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Wed, 5 Sep 2012 08:00:09 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Sep 2012 22:54:06 +0800
Message-ID: <cover.1346824226.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] package_rpm.bbclass: fix incremental rpm image generation
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
X-List-Received-Date: Wed, 05 Sep 2012 15:12:35 -0000
Content-Type: text/plain

Test info:
# With INC_RPM_IMAGE_GEN = "1"
$ bitbake core-image-sato-sdk core-image-sato core-image-minimal \
	package-index meta-toolchain-sdk
# Build 3 times.
#
# Modified some packages and rebuild it, the incremental image
# generation works well.

# Without INC_RPM_IMAGE_GEN = "1"
$ bitbake core-image-sato-sdk core-image-sato core-image-minimal \
	package-index meta-toolchain-sdk

// Robert

The following changes since commit 99c85ba93075a1aff789cafabbacf42e6a93bd32:

  build-appliance-image: Update to latest poky master (2012-09-04 18:04:40 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/rpm_inc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/rpm_inc

Robert Yang (1):
  package_rpm.bbclass: fix incremental rpm image generation

 meta/classes/package_rpm.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)



