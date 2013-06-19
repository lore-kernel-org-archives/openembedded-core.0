Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0FFA360668
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 03:21:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5J3LRkj013464
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 20:21:32 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 18 Jun 2013 20:21:30 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Jun 2013 23:21:28 -0400
Message-ID: <cover.1371608997.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] libpam: Fix for CVE-2010-4708
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Jun 2013 03:21:31 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Change default for user_readenv to 0 and document the
new default for user_readenv.
    
This fix from:
http://pam.cvs.sourceforge.net/viewvc/pam/Linux-PAM/modules/pam_env
/pam_env.c?r1=1.22&r2=1.23&view=patch
http://pam.cvs.sourceforge.net/viewvc/pam/Linux-PAM/modules/pam_env
/pam_env.8.xml?r1=1.7&r2=1.8&view=patch

The following changes since commit 590010a6525b0e1bc1de73e794764e23404591df:

  core-image-weston: add weston-examples to the image (2013-06-18 17:33:17 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/libpam
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/libpam

Wenzong Fan (1):
  libpam: Fix for CVE-2010-4708

 .../pam/libpam/libpam-fix-for-CVE-2010-4708.patch  |   41 ++++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.1.6.bb          |    1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-extended/pam/libpam/libpam-fix-for-CVE-2010-4708.patch

-- 
1.7.9.5


