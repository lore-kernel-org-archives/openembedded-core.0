Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1U1FX4-00062g-1G
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 13:16:12 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r118q6gk014995
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Feb 2013 00:52:06 -0800 (PST)
Received: from pek-usp-3.wrs.com (128.224.163.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Fri, 1 Feb 2013 00:52:05 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Feb 2013 16:55:28 +0800
Message-ID: <cover.1359687579.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/2] bitbake-whatchanged: print what is about to happen
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
X-List-Received-Date: Fri, 01 Feb 2013 12:16:14 -0000
Content-Type: text/plain

The following changes since commit 9a26b9c69c47c87ce71a06f76682c187767e7897:

  rpm: Ensure native binaries are correctly wrapped (2013-01-30 14:47:30 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/what
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/what

Robert Yang (2):
  bitbake.conf: add STAMPS_DIR for constructing STAMP
  bitbake-whatchanged: print what is about to happen

 meta/conf/bitbake.conf       |   5 +-
 scripts/bitbake-whatchanged  | 339 +++++++++++++++++++++++++++++++++++++++++++
 scripts/oe-buildenv-internal |   6 +-
 3 files changed, 347 insertions(+), 3 deletions(-)
 create mode 100755 scripts/bitbake-whatchanged

-- 
1.7.11.2



