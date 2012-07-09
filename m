Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1So3ri-0004fY-MU
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 04:38:23 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q692RAuB025281
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 8 Jul 2012 19:27:12 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Sun, 8 Jul 2012 19:27:09 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Mon, 9 Jul 2012 10:26:57 +0800
Message-ID: <cover.1341800388.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] V3: Fix lsbinitscripts link problem
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
X-List-Received-Date: Mon, 09 Jul 2012 02:38:23 -0000
Content-Type: text/plain

Hi Saul,

As your comment, I remove the manual rename of file functions in both of lsbinitscripts and initscripts.

Regards,
Kai

The following changes since commit 8ce8d25bcda0e2e0b62204d5ca5875dedcaacf7d:

  sanity.bbclass: Increase LAYER_CONF_VERSION to match bblayers change (2012-06-25 17:20:54 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/distro
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/distro

Kang Kai (2):
  initscripts: use update-alternative to handle file functions
  lsbinitscripts: increase ALTERNATIVE_PRIORITY

 meta/recipes-core/initscripts/initscripts_1.0.bb |    8 +++++++-
 meta/recipes-extended/lsb/lsbinitscripts_9.03.bb |    4 ++--
 2 files changed, 9 insertions(+), 3 deletions(-)

-- 
1.7.5.4



