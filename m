Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9CB5760671
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 03:23:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9M3Ng47021911
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Oct 2014 20:23:42 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 21 Oct 2014 20:23:42 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Oct 2014 23:23:39 -0400
Message-ID: <cover.1413947830.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] lsof: fix LSOF_CCV in version.h
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
X-List-Received-Date: Wed, 22 Oct 2014 03:23:47 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

When using cross compiler to build the package "lsof" on a host,
the value of LSOF_CCV in version.h genegrated by the Makefile
is the version of the compiler on the host while it should be
the version of cross compiler.

On Ubuntu host before fixed:
  #define LSOF_CCV        "4.6.3 (Ubuntu/Linaro 4.6.3-1ubuntu5) "

After fixed:
  #define   LSOF_CCV        "4.9.1 (GCC) "

The following changes since commit 924da20c6f2f183fa7e930e4c3c6b14c090acbe5:

  build-appliance-image: Update to dizzy head revision (2014-10-18 16:16:38 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/lsof
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/lsof

Wenzong Fan (1):
  lsof: fix LSOF_CCV in version.h

 .../lsof/files/compiler-version-fault.patch        |   25 ++++++++++++++++++++
 meta/recipes-extended/lsof/lsof_4.87.bb            |    4 +++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/lsof/files/compiler-version-fault.patch

-- 
1.7.9.5


