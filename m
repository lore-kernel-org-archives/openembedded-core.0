Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1SjlWc-00038R-5p
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 08:14:50 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q5R63r8f008008
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2012 23:03:54 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Tue, 26 Jun 2012 23:03:54 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jun 2012 14:04:18 +0800
Message-ID: <cover.1340776826.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] lsbinitscripts: Add a linking for functions.lsbinitscripts
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
X-List-Received-Date: Wed, 27 Jun 2012 06:14:50 -0000
Content-Type: text/plain

Hi,

This patch and comments are from Xiaofeng Yan <xiaofeng.yan@windriver.com>.

I remove the function of update-alternative according to Richard's suggestion and using
linking in the stage of do_install.

The following changes since commit 8ce8d25bcda0e2e0b62204d5ca5875dedcaacf7d:

  sanity.bbclass: Increase LAYER_CONF_VERSION to match bblayers change (2012-06-25 17:20:54 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib xiaofeng/lsbinitscipts
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/lsbinitscipts

Xiaofeng Yan (1):
  lsbinitscripts: Add a linking for functions.lsbinitscripts

 meta/recipes-extended/lsb/lsbinitscripts_9.03.bb |   11 ++++-------
 1 files changed, 4 insertions(+), 7 deletions(-)

-- 
1.7.5.4



