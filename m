Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1Txqzv-0003BC-1w
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 04:28:01 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0N3C3Yc005823
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 Jan 2013 19:12:03 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Tue, 22 Jan 2013 19:12:01 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Wed, 23 Jan 2013 11:13:12 +0800
Message-ID: <cover.1358910000.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] V3: Refactor external-python-tarball.bb
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
X-List-Received-Date: Wed, 23 Jan 2013 03:28:08 -0000
Content-Type: text/plain

V3:
Inherit bbclass at then end of bb file that we can still use ?= to define variables.
Remove DEPENDS that already defined in populate_sdk_base.bbclass.

The following changes since commit 37e025f6f9c410005e0f1dee0767e38eaec01cbd:

  bitbake: hob: Hob should display warnings generated during parsing (2013-01-21 19:05:31 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/external-python
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/external-python

Kang Kai (2):
  createrepo-native: update dependency
  external-python-tarball: code refactoring

 meta/recipes-core/meta/external-python-tarball.bb  |   67 +------------------
 .../createrepo/createrepo_0.4.11.bb                |    4 +-
 2 files changed, 6 insertions(+), 65 deletions(-)

-- 
1.7.5.4



