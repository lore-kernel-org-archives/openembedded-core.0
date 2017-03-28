Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4D12972F43
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 03:08:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2S38iYY014470
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 20:08:45 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 27 Mar 2017 20:08:43 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Mar 2017 20:08:42 -0700
Message-ID: <cover.1490670444.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
MIME-Version: 1.0
Subject: [PATCH 0/1 V2] apt: fix libdir path for apt.systemd.daily
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
X-List-Received-Date: Tue, 28 Mar 2017 03:08:45 -0000
Content-Type: text/plain

* V2
  Also fix apt-daily.service and apt.apt-compat.cron.daily as Ross commented.

// Robert

The following changes since commit 9c948d3de08f158387e08a17cdc0cedc7d26bb54:

  oeqa/selftest: don't use cleanall in selftests (2017-03-27 20:22:43 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/apt
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/apt

Robert Yang (1):
  apt: fix libdir path for apt.systemd.daily

 meta/recipes-devtools/apt/apt-package.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.11.0.rc2.dirty


