Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BAAA97D200
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 07:18:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6C7IjIg011268
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 00:18:45 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Fri, 12 Jul 2019 00:18:32 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Jul 2019 15:31:12 +0800
Message-ID: <cover.1562916644.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] qemurunner.py: fix race condition at qemu startup
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
X-List-Received-Date: Fri, 12 Jul 2019 07:18:48 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit 80ab79168ede2786868cbd354f0950c949f73527:

  gnome-themes-standard: remove (2019-07-11 09:32:50 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/qemurunner-race
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/qemurunner-race

Chen Qi (1):
  qemurunner.py: fix race condition at qemu startup

 meta/lib/oeqa/utils/qemurunner.py | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

-- 
1.9.1


