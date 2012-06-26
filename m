Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1SjSMi-0005Hi-Pz
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jun 2012 11:47:21 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q5Q9aRcO020753
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2012 02:36:27 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Tue, 26 Jun 2012 02:36:27 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Jun 2012 17:36:52 +0800
Message-ID: <cover.1340703038.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/2] archiver.bbclass: Add the function of filtering packages
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
X-List-Received-Date: Tue, 26 Jun 2012 09:47:21 -0000
Content-Type: text/plain

Hi,

These patches are from Xiaofeng Yan <xiaofeng.yan@windriver.com>

This function can miss and tarball packages according to license from recipes.

Regards,
Kai

The following changes since commit 8ce8d25bcda0e2e0b62204d5ca5875dedcaacf7d:

  sanity.bbclass: Increase LAYER_CONF_VERSION to match bblayers change (2012-06-25 17:20:54 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib xiaofeng/archiver
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/archiver

Xiaofeng Yan (2):
  archiver.bbclass: Add the function of filtering packages
  local.conf.sample.extended: Add filtering function to
    archiver.bbclass

 meta-yocto/conf/local.conf.sample.extended |    3 +
 meta/classes/archiver.bbclass              |   71 +++++++++++++++++++++++++++-
 2 files changed, 73 insertions(+), 1 deletions(-)

-- 
1.7.5.4



