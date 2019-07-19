Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 55C087F157
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 09:47:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6J9lJ8m028921
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 02:47:19 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Fri, 19 Jul 2019 02:47:18 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Jul 2019 18:00:07 +0800
Message-ID: <cover.1563530365.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] Two fixes about cleaning up temp dir
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
X-List-Received-Date: Fri, 19 Jul 2019 09:47:18 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit ecf098877522508875ccff8c56cd7fee0fa3762a:

  distro/include: Add poky-distro-alt-test-config.inc (2019-07-19 08:46:04 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/temp-clean
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/temp-clean

Chen Qi (2):
  runtime_test.py: use track_for_cleanup for temp dir
  devtool: remove temp dir in upgrade

 meta/lib/oeqa/selftest/cases/runtime_test.py | 4 +---
 scripts/lib/devtool/upgrade.py               | 1 +
 2 files changed, 2 insertions(+), 3 deletions(-)

-- 
1.9.1


