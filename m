Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C1A3E6FAE6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 09:10:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4T9AKdX000243
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 02:10:21 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 29 May 2014 02:10:20 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 May 2014 17:10:18 +0800
Message-ID: <cover.1401354584.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] nfs-utils: use cross toolchain to compile testlk
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
X-List-Received-Date: Thu, 29 May 2014 09:10:27 -0000
Content-Type: text/plain

The following changes since commit c42df8cb48ceb6081680ffb802e85dad557cf29c:

  i2c-tools: Add i2c-tools to the core (2014-05-28 09:42:14 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/nfs-utils
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/nfs-utils

Chong Lu (1):
  nfs-utils: use cross toolchain to compile testlk

 .../nfs-utils-use-cross-toolchain-to-compile.patch | 26 ++++++++++++++++++++++
 .../nfs-utils/nfs-utils_1.3.0.bb                   |  3 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-use-cross-toolchain-to-compile.patch

-- 
1.8.1.2


