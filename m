Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 979C071503
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 09:44:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAE9i8Df020332
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 01:44:08 -0800 (PST)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 14 Nov 2014 01:44:07 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Nov 2014 04:44:02 -0500
Message-ID: <cover.1415957951.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2 0/4] Clean host path in target scripts
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
X-List-Received-Date: Fri, 14 Nov 2014 09:44:07 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

v2 changes:

* correct signature infos
* clean more for tcl:
   
      TCL_BUILD_LIB_SPEC, TCL_SRC_DIR, TCL_BUILD_STUB_LIB_SPEC,
      TCL_BUILD_STUB_LIB_PATH

The following changes since commit edaeb8940813b620090a0797ad3b6a076897512d:

  bitbake: cooker.py: fix loginfo op being set to an invalid value (2014-11-12 17:04:50 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/clean-path
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/

Shiqun Lin (4):
  bash: clean host path in bashbug
  e2fsprogs: clean host path in compile_et, mk_cmds
  bind: clean host path in isc-config.sh
  tcl: clean host path in tclConfig.sh

 meta/recipes-connectivity/bind/bind_9.9.5.bb       |    7 +++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb |    6 ++++++
 meta/recipes-devtools/tcltk/tcl_8.6.2.bb           |    5 +++++
 meta/recipes-extended/bash/bash.inc                |    4 ++++
 4 files changed, 22 insertions(+)

-- 
1.7.9.5


