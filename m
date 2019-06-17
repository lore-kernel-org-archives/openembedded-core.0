Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 40CB57D28D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 08:20:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5H8KdFH002611
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 01:20:49 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Mon, 17 Jun 2019 01:20:10 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Jun 2019 16:32:12 +0800
Message-ID: <cover.1560760310.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] pkgdata: fix test_find_path to consider multilib
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
X-List-Received-Date: Mon, 17 Jun 2019 08:20:59 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit 27d60c5a812774f0e5c43161e5b514c4aebdf301:

  gstreamer1.0-libav: disable API documentation (2019-06-15 13:46:38 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/oeqa-pkgdata
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/oeqa-pkgdata

Chen Qi (1):
  pkgdata: fix test_find_path to consider multilib

 meta/lib/oeqa/selftest/cases/pkgdata.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
1.9.1


