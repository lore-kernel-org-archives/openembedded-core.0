Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 831A86E688
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 02:45:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3J2jXuj001264
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 19:45:33 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 18 Apr 2016 19:45:32 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Apr 2016 19:45:29 -0700
Message-ID: <cover.1461033288.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/3] create-pull-request: 3 improvements (master branch only)
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
X-List-Received-Date: Tue, 19 Apr 2016 02:45:34 -0000
Content-Type: text/plain

The following changes since commit e003ef038819c10f351bb8268b377626c95bb077:

  toasterconf.json: Update for krogoth release (2016-04-18 16:48:58 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/cpr
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/cpr

Robert Yang (3):
  create-pull-request: create branch on remote if not found
  create-pull-request: read remote from env var CONTRIB_REMOTE
  create-pull-request: set subject automatically for cover latter

 scripts/create-pull-request | 78 +++++++++++++++++++++++++--------------------
 1 file changed, 43 insertions(+), 35 deletions(-)

-- 
2.7.4


