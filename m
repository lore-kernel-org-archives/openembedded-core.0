Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SaO31-0004Dy-3v
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jun 2012 11:21:31 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q519B8lN012005
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Jun 2012 02:11:08 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Fri, 1 Jun 2012 02:11:08 -0700
From: <xiaofeng.yan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Jun 2012 17:13:46 +0800
Message-ID: <cover.1338541462.git.xiaofeng.yan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/3 V2]lsb: Add initscripts to enhance init functions in an lsb image
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
X-List-Received-Date: Fri, 01 Jun 2012 09:21:31 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

This is V2. The modification is as follows by comparison with V1:
- Add extra description in section "DESCRIPTION"
- Use bbclass update-alternatives instead of command method.

The following changes since commit de4cdfd6bc1280ac7ac0559b87734d26294ef773:
  Scott Rifenbark (1):
        documentation/kernel-manual/kernel-how-to.xml: Updated to kernel 3.4

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib xiaofeng/2133
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/2133

Xiaofeng Yan (3):
  lsbinitscripts: Add initscripts to enhance init functions in an lsb
    image
  lsbinitscripts: Patch file functions for confirming to an lsb image
  task-core-lsb: Add another initscripts to an lsb image

 .../lsb/lsbinitscripts/functions.patch             |   11 ++++++++
 meta/recipes-extended/lsb/lsbinitscripts_9.03.bb   |   26 ++++++++++++++++++++
 meta/recipes-extended/tasks/task-core-lsb.bb       |    3 +-
 3 files changed, 39 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-extended/lsb/lsbinitscripts/functions.patch
 create mode 100644 meta/recipes-extended/lsb/lsbinitscripts_9.03.bb



