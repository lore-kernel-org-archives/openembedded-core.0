Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 36A2371951
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Feb 2018 07:13:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w127D65l011344
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Feb 2018 23:13:07 -0800
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 1 Feb 2018 23:13:05 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Feb 2018 15:10:32 +0800
Message-ID: <cover.1517555249.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH 0/2] e2fsprogs: fixes for ptest
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
X-List-Received-Date: Fri, 02 Feb 2018 07:13:07 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>


--
The following changes since commit 385944254d0ef88bd6450a221a54cbcb40020b42:

  tcmode-default.inc: drop preferred version of gzip-native (2018-01-31 17:01:20 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/d_e2fsprogs-ptest_180202_0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/d_e2fsprogs-ptest_180202_0

Jackie Huang (2):
  e2fsprogs: only quiet debugfs for native package
  e2fsprogs: fix the hardcoded paths for ptest

 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

-- 
2.11.0


