Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2D4516BD1C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 07:31:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0A7VcLw006916
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Jan 2019 23:31:38 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Wed, 9 Jan 2019 23:31:38 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Jan 2019 15:49:48 +0800
Message-ID: <cover.1547106548.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] oeqa: make it work for multiple users
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
X-List-Received-Date: Thu, 10 Jan 2019 07:31:38 -0000
Content-Type: text/plain

The following changes since commit 237ed166f48b0e32684a5307d3b47b9485238ed9:

  oeqa/sdk: add test to exercise Meson (2019-01-07 17:45:44 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/oeqa
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/oeqa

Robert Yang (1):
  oeqa: make it work for multiple users

 meta/classes/testimage.bbclass   | 3 ++-
 meta/lib/oeqa/runtime/context.py | 5 +----
 meta/lib/oeqa/targetcontrol.py   | 2 ++
 meta/lib/oeqa/utils/dump.py      | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.7.4


