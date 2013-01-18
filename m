Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TwLN2-0007zR-M2
	for openembedded-core@lists.openembedded.org;
	Sat, 19 Jan 2013 00:29:22 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0INDkWU003227
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2013 15:13:46 -0800 (PST)
Received: from localhost.localdomain (172.25.34.110) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Fri, 18 Jan 2013 15:13:45 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 18 Jan 2013 17:13:36 -0600
Message-ID: <cover.1358550581.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
X-Originating-IP: [172.25.34.110]
Subject: [PATCH 0/2] Fix meta-toolchain and meta-toolchain-gmae install problems
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
X-List-Received-Date: Fri, 18 Jan 2013 23:29:27 -0000
Content-Type: text/plain

The following changes since commit 18bc7b44ef58cbcbe32d45504d71eed54ef695a4:

  guilt: add git 1.8.x support (2013-01-18 13:20:56 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib mhatle/ua-dep
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mhatle/ua-dep

Mark Hatle (2):
  populate_sdk_rpm: Re-add a few system provides to the SDK
  update-alternatives: Add a build-time dependency

 meta/classes/populate_sdk_rpm.bbclass          |    4 +++-
 meta/classes/update-alternatives.bbclass       |   13 +++++++++++++
 meta/conf/distro/include/default-providers.inc |    2 +-
 3 files changed, 17 insertions(+), 2 deletions(-)



