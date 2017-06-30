Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6F59460111
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 06:30:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v5U6UFub003586
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jun 2017 23:30:15 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 29 Jun 2017 23:30:14 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Jun 2017 14:30:08 +0800
Message-ID: <cover.1498803976.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH 0/2] rootfs-postcommands: split ssh_allow_empty_password
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
X-List-Received-Date: Fri, 30 Jun 2017 06:30:16 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

--
The following changes since commit de7914954571ea8e717f56b6d6df13157b0973bc:

  scripts/contrib/patchreview: add new script (2017-06-29 13:01:32 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/d_ssh-allow-empty_170630_0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/d_ssh-allow-empty_170630_0

Jackie Huang (2):
  dropbear: add default config file to disable root login
  rootfs-postcommands: split ssh_allow_empty_password

 meta/classes/image.bbclass                         |  2 +-
 meta/classes/rootfs-postcommands.bbclass           | 25 +++++++++++++++++++---
 meta/recipes-core/dropbear/dropbear.inc            |  3 +++
 .../dropbear/dropbear/dropbear.default             |  2 ++
 4 files changed, 28 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear.default

-- 
2.11.0


