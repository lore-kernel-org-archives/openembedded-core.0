Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Qo2jA-0005dQ-So
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 02:20:57 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p720GYAY020002
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 17:16:34 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 1 Aug 2011 17:16:34 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 1 Aug 2011 19:17:37 -0500
Message-ID: <cover.1312243899.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/5] Fix the SDK generation
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
X-List-Received-Date: Tue, 02 Aug 2011 00:20:57 -0000
Content-Type: text/plain

This is an attempt to fix a number of issues with the SDK generation.  It has been
tested using bitbake meta-toolchain-sdk.

Note, patches:

 4/5: package_ipk: SDK generation workaround
 5/5: update-alternatives: Add alternatives as a runtime provide

4/5 might be reasonable to implement immediately to resolve this issue.. However
5/5 is absolutely incorrect and that is noted within the patch header.  I'd
like comments on the issue to understand how to fix the problem.


The following changes since commit 2a41a311ddda11713296391050f3c2c1b2c1d3d3:

  arch-armv7a.inc: fix armv7a-vfp-neon -> armv7a compat case (2011-08-01 16:49:03 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/oecore/sdk-fix-WIP
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/oecore/sdk-fix-WIP

Mark Hatle (5):
  rootfs_rpm: Cleanup and minor bug fixes
  bitbake.conf: Add SDK_PACKAGE_ARCHS
  populate_sdk_*: Sync SDK and regular rootfs functions
  package_ipk: SDK generation workaround
  update-alternatives: Add alternatives as a runtime provide

 meta/classes/package_deb.bbclass         |    6 +-
 meta/classes/package_ipk.bbclass         |   43 +++++------
 meta/classes/package_rpm.bbclass         |  120 ++++++++++++------------------
 meta/classes/populate_sdk.bbclass        |    9 ++
 meta/classes/populate_sdk_deb.bbclass    |   35 ++++-----
 meta/classes/populate_sdk_rpm.bbclass    |   89 +++++++++++++++++------
 meta/classes/rootfs_rpm.bbclass          |   30 ++++----
 meta/classes/update-alternatives.bbclass |    2 +
 meta/conf/bitbake.conf                   |    1 +
 9 files changed, 179 insertions(+), 156 deletions(-)

-- 
1.7.3.4



