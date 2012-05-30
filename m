Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SZY9V-00060z-2B
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 03:56:45 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4U1kQrJ006418
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 18:46:26 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 29 May 2012 18:46:25 -0700
From: <xiaofeng.yan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 May 2012 09:47:11 +0800
Message-ID: <cover.1338284916.git.xiaofeng.yan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/3 V1]:lsb: Add initscripts to enhance init functions in an lsb image
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
X-List-Received-Date: Wed, 30 May 2012 01:56:45 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

This initscripts has more functions than the simple one. There could be some errors for the current version with simple functions when running some programs because of absent some functions provided by initscripts.

The following changes since commit f28209d9d3c67203a2c7a2b25cacfe31643d1bfa:
  Kang Kai (1):
        cooker.py: terminate the Parser processes

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib xiaofeng/2133
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/2133

Xiaofeng Yan (3):
  lsbinitscripts: Add initscripts to enhance init functions in an lsb
    image
  lsbinitscripts: Patch file functions for confirming to an lsb image
  task-core-lsb: Add another initscripts to an lsb image

 .../lsb/lsbinitscripts/functions.patch             |   14 ++++++++
 meta/recipes-extended/lsb/lsbinitscripts_9.03.bb   |   36 ++++++++++++++++++++
 meta/recipes-extended/tasks/task-core-lsb.bb       |    3 +-
 3 files changed, 52 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-extended/lsb/lsbinitscripts/functions.patch
 create mode 100644 meta/recipes-extended/lsb/lsbinitscripts_9.03.bb



