Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2390060720
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 08:13:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8Q8DxZG027383
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 01:14:00 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Mon, 26 Sep 2016 01:13:59 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Sep 2016 15:56:27 +0800
Message-ID: <cover.1474875470.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [PATCH 0/2 v2] boost: add support for additional boost libs
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
X-List-Received-Date: Mon, 26 Sep 2016 08:14:00 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Changes in v2:

1. Add a workaround as a separate commit for the issue found in:
http://autobuilder.yocto.io:8010/builders/nightly-x86-64-lsb/builds/56/

2. Add PACKAGECONFIG for graph_parallel and mpi but disable by default
   since they depend on mpich which is in meta-oe.

3. Add proper configs in user-config.jam for boost-mpi.

Tested with:
- default PACKAGECONFIG
- all libs in PACKAGECONFIG (need to add meta-oe)

Notes:
boost-exception will not be created since it's intentional.

----
The following changes since commit 8dfcfbeb14a179a5d5722007d7c986da1dd41b40:

  arch-mips: Add mips64-o32 tunes (2016-09-24 07:30:10 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/r_add_boost_libs_160926-1
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/r_add_boost_libs_160926-1

Jackie Huang (2):
  boost: disable pch when build boost-math
  boost: add support for additional boost libs

 meta/recipes-support/boost/boost.inc               | 33 ++++++++++++++++++++--
 .../boost/boost-math-disable-pch-for-gcc.patch     | 31 ++++++++++++++++++++
 meta/recipes-support/boost/boost_1.61.0.bb         |  1 +
 3 files changed, 62 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch

-- 
2.8.3


