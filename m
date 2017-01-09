Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 07F6C71A40
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 07:08:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v0978uUU011694
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 8 Jan 2017 23:08:57 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.184) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Sun, 8 Jan 2017 23:08:56 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Jan 2017 15:09:01 +0800
Message-ID: <cover.1483945688.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] selftest: fix to not hardcode 'tmp' for TMPDIR
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
X-List-Received-Date: Mon, 09 Jan 2017 07:08:58 -0000
Content-Type: text/plain

The following changes since commit e016eb10b075e280b4e78a04e47b59a173386421:

  bitbake: bb/cooker: BBCooker stops notifier at shutdown (2017-01-06 00:01:07 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/selftest-tmp_dir
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/selftest-tmp_dir

Chen Qi (2):
  selftest/bbtests.py: do not hardcode 'tmp' for TMPDIR
  selftest/buildoptions.py: do not hardcode 'tmp' for TMPDIR

 meta/lib/oeqa/selftest/bbtests.py      | 5 +++--
 meta/lib/oeqa/selftest/buildoptions.py | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

-- 
1.9.1


