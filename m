Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7304371624
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Oct 2014 03:10:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9F3AnHp014553
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Oct 2014 20:10:51 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 14 Oct 2014 20:10:49 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Oct 2014 23:10:47 -0400
Message-ID: <cover.1413342461.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] sstate.bbclass: specify func dirs for sstate_hardcode_path
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
X-List-Received-Date: Wed, 15 Oct 2014 03:10:52 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

For some recipes that inhrient cmake, the ${B} may be removed by
cmake_do_configure() while sstate_hardcode_path() running, this
causes build errors:

  Exception: OSError: [Errno 2] No such file or directory: \
  '/path/to/build'

The function sstate_hardcode_path() called command:

  $SSTATE_SCAN_CMD which extended as "find ${SSTATE_BUILDDIR} ..."

So the proper function dirs could be ${SSTATE_BUILDDIR}.

The following changes since commit ccf5a4d2342c4fd40e4e0b332ea7e34e0bf175d4:

  build-appliance-image: Update to dizzy head revision (2014-10-11 08:11:17 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/fix-sstate
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/fix-sstate

Wenzong Fan (1):
  sstate.bbclass: specify func dirs for sstate_hardcode_path

 meta/classes/sstate.bbclass |    5 +++++
 1 file changed, 5 insertions(+)

-- 
1.7.9.5


