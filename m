Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 633F5745C8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 08:25:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w3B8PA5e006497
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 01:25:10 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.197) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 11 Apr 2018 01:25:09 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Apr 2018 16:26:17 +0800
Message-ID: <cover.1523433347.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] valgrind: fix the shared object issue while prelink ptest
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
X-List-Received-Date: Wed, 11 Apr 2018 08:25:10 -0000
Content-Type: text/plain

The following changes since commit 0a0d01adddf6b4abc91f3fda93055da061f82a5d:

  license.bbclass: be a bit more strict when searching ${PN}-${LICENSE_PACKAGE_SUFFIX} in packages (2018-04-10 09:10:36 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/valgrind-ptest-prelink
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/valgrind-ptest-prelink

Zhixiong Chi (1):
  valgrind: fix the shared object issue while prelink ptest

 .../valgrind/valgrind/0002-remove-rpath.patch      | 35 ----------------------
 meta/recipes-devtools/valgrind/valgrind_3.13.0.bb  |  3 +-
 2 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0002-remove-rpath.patch

-- 
1.9.1


