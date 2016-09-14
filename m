Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2F80D731DB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 09:45:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8E9jwHE016357
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 02:45:58 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 14 Sep 2016 02:45:57 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Sep 2016 02:45:56 -0700
Message-ID: <cover.1473846326.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH 0/1] runqemu: fix a race issue on lockdir
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
X-List-Received-Date: Wed, 14 Sep 2016 09:45:59 -0000
Content-Type: text/plain

The following changes since commit 4d268abc2fc892c5d34449f78c8e9f2b1a9d6bac:

  oeqa.runtime.smart: work around smart race issues (2016-09-09 12:12:17 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/rq
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/rq

Robert Yang (1):
  runqemu: fix a race issue on lockdir

 scripts/runqemu | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

-- 
2.9.0


