Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0A6EE60777
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 02:24:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0A2OjFO030674
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Jan 2017 18:24:45 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.184) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Mon, 9 Jan 2017 18:24:44 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jan 2017 10:24:52 +0800
Message-ID: <cover.1484014927.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] selftest: fix path assumption
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
X-List-Received-Date: Tue, 10 Jan 2017 02:24:45 -0000
Content-Type: text/plain

The following changes since commit 840e221ea7c35177fda37af618c4727fa7754789:

  bitbake: event: Replace slightly elderly bbmake references! (2017-01-09 13:39:13 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/selftest-path-assumption
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/selftest-path-assumption

Chen Qi (2):
  selftest/bbtests.py: fix path assumption for LICENSE_DIRECTORY
  selftest/buildoptions.py: fix path assumption for DEPLOY_DIR_SRC

 meta/lib/oeqa/selftest/bbtests.py      | 5 +++--
 meta/lib/oeqa/selftest/buildoptions.py | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

-- 
1.9.1


