Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1SfPg1-000130-5O
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 08:06:33 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5F5tqbv019053
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Jun 2012 22:55:53 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Thu, 14 Jun 2012 22:55:52 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jun 2012 13:56:06 +0800
Message-ID: <cover.1339739522.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/4] Update cleanup-workdir
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
X-List-Received-Date: Fri, 15 Jun 2012 06:06:33 -0000
Content-Type: text/plain

Hi,

This series of patches update the cleanup-workdir:
1 update the help text
2 update the way to check obsolete directories
3 only clean the directories related to current arch
4 replace module commands with subprocess

Regards,
Kai

The following changes since commit 5ed855d12cddf2de535c3f6d05d3dfe85d69d99d:

  openjade-native: Ensure we reautoconf the package (2012-06-12 16:34:30 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/distro
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/distro

Kang Kai (4):
  cleanup-workdir: update the way to check obsolete dirs
  cleanup-workdir: replace commands with subprocess
  cleanup-workdir: only deal dirs related to current arch
  cleanup-workdir: update help text

 scripts/cleanup-workdir |  128 ++++++++++++++++++++++++++++++-----------------
 1 files changed, 82 insertions(+), 46 deletions(-)

-- 
1.7.5.4



