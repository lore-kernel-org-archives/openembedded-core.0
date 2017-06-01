Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8EFF177E83
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 08:11:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v518BOpo008183
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Jun 2017 01:11:24 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 1 Jun 2017 01:11:22 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 1 Jun 2017 04:11:20 -0400
Message-ID: <cover.1496304334.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/1] ltp: upgrade to 20170516
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
X-List-Received-Date: Thu, 01 Jun 2017 08:11:23 -0000
Content-Type: text/plain

The following changes since commit bd063fa288b49b6e3ea77982d0ccc46610feb1ad:

  tune-mips32*.inc: use consistent comments across all three .inc files (2017-05-30 10:15:20 +0100)

are available in the git repository at:

  https://github.com/DengkeDu/openembedded-core.git dengke/ltp20170516

Dengke Du (1):
  ltp: upgrade to 20170516

 .../ltp/ltp/0034-periodic_output.patch             | 32 +++++++++++++++-------
 ...0039-fcntl-fix-the-time-def-to-use-time_t.patch | 29 --------------------
 .../ltp/{ltp_20170116.bb => ltp_20170516.bb}       |  5 ++--
 3 files changed, 24 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0039-fcntl-fix-the-time-def-to-use-time_t.patch
 rename meta/recipes-extended/ltp/{ltp_20170116.bb => ltp_20170516.bb} (96%)

-- 
2.8.1


