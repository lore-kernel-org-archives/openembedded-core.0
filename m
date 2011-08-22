Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1QvKzB-0000fN-9r
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Aug 2011 05:15:37 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7M3ArFR019175
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Aug 2011 20:10:53 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Sun, 21 Aug 2011 20:10:52 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Aug 2011 11:11:13 +0800
Message-ID: <cover.1313982402.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH v2 0/1] libpam: Setting suid bit for unix_chkpwd
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
X-List-Received-Date: Mon, 22 Aug 2011 03:15:37 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

v2 updates: with ${sbindir} to replace the hardcode '/usr/sbin'

The following changes since commit 36396b6ecb0c84c6752cdc8118c496e8ec05a388:
  Richard Purdie (1):
        xcb/libpthreads: Add BBCLASSEXTEND to resolve missing providers in world builds

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/1252
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/1252

Wenzong Fan (1):
  libpam: Setting suid bit for unix_chkpwd

 meta/recipes-extended/pam/libpam_1.1.4.bb |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)



