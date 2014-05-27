Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4E9466FA52
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 01:43:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4R1hbW6020447
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 May 2014 18:43:37 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 26 May 2014 18:43:37 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 May 2014 09:43:35 +0800
Message-ID: <cover.1401154906.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1][V2] ethtool: fix ptest execution failure
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
X-List-Received-Date: Tue, 27 May 2014 01:43:39 -0000
Content-Type: text/plain

Change since v1:
Remove bash and gawk dependency.

The following changes since commit 894df445fa71a170397c6e0b4960a89ef20a4230:

  guile: Update to 2.0.11 version (2014-05-21 19:50:21 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/ethtool
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/ethtool

Chong Lu (1):
  ethtool: fix ptest execution failure

 meta/recipes-extended/ethtool/ethtool/run-ptest |  2 +-
 meta/recipes-extended/ethtool/ethtool_3.14.bb   | 16 +++++++++++-----
 2 files changed, 12 insertions(+), 6 deletions(-)

-- 
1.8.1.2


