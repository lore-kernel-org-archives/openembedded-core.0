Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 61AB677D89
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 08:04:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3784QVR001742
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Apr 2017 01:04:26 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.201) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Fri, 7 Apr 2017 01:04:25 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Apr 2017 16:05:53 +0800
Message-ID: <cover.1491551982.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] Fix runqemu problem when 'rm_work' is enabled
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
X-List-Received-Date: Fri, 07 Apr 2017 08:04:25 -0000
Content-Type: text/plain

The following changes since commit 633ad6c9f436f5d2b6ee1a005b697661a054a394:

  oeqa/runtime/utils/targetbuildproject: use parent classes defaults tmpdir (2017-04-06 10:13:39 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/runqemu_rm_work
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/runqemu_rm_work

Chen Qi (2):
  qemuboot.bbclass: add two vars for use by runqemu
  runqemu: make use of two new vars

 meta/classes/qemuboot.bbclass |  5 ++++-
 scripts/runqemu               | 10 ++++++++--
 2 files changed, 12 insertions(+), 3 deletions(-)

-- 
1.9.1


