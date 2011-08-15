Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1QsuGI-0002k6-RT
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 12:19:15 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7FAEbGx023229
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 03:14:37 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Mon, 15 Aug 2011 03:14:36 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Aug 2011 18:18:32 +0800
Message-ID: <cover.1313400142.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH 0/1] The Skeleton initscript doesn't work on minimal image
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
X-List-Received-Date: Mon, 15 Aug 2011 10:19:15 -0000
Content-Type: text/plain

Testing:
1) Edit meta/recipes-core/images/core-image-minimal.bb, add "service" to
   the IMAGE_INSTALL

2) Edit build/conf/local.conf, add "/path/to/poky/meta-skeleton" to the
   BBLAYERS.

3) $ bitbake core-image-minimal(or sato)

3) start qemu, and run "/etc/init.d/skeleton start(or status stop ..)",
   it works well

// Robert

The following changes since commit 30381645eefe4e3222fd3ce45823f143ce2fa82c:

  rt-tests: use an explicit commit ID (2011-08-12 21:07:02 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/initscripts
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/initscripts

Robert Yang (1):
  The Skeleton initscript doesn't work on minimal image

 .../initscripts/initscripts-1.0/functions          |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)



