Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 78B07770CA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 09:25:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9K9Prb2027991
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 02:25:53 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 20 Oct 2015 02:25:52 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Oct 2015 02:25:49 -0700
Message-ID: <cover.1445333081.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/3] meta: fixes for prserver
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
X-List-Received-Date: Tue, 20 Oct 2015 09:25:55 -0000
Content-Type: text/plain

The following changes since commit 13282223b07787a92c251f89251e8a49a0e4e3eb:

  oeqa/runtime: Fix setUp and tearDown methods (2015-10-19 17:55:40 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/prserv
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/prserv

Robert Yang (3):
  prserv.bbclass: remove it since it is null
  prexport.bbclass: avoid export for native and crosssdk
  bitbake-prserv-tool: check file name

 meta/classes/package.bbclass  |    1 -
 meta/classes/prexport.bbclass |    5 +++--
 meta/classes/prserv.bbclass   |    2 --
 scripts/bitbake-prserv-tool   |    9 +++++++++
 4 files changed, 12 insertions(+), 5 deletions(-)
 delete mode 100644 meta/classes/prserv.bbclass

-- 
1.7.9.5


