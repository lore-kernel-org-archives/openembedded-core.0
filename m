Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3CDBF6C0C5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2018 03:21:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wAU3Lh7r024434
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 19:21:44 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Thu, 29 Nov 2018 19:21:43 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Nov 2018 11:39:07 +0800
Message-ID: <cover.1543548740.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] cooker: simplify BB_DANGLINGAPPENDS_WARNONLY
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
X-List-Received-Date: Fri, 30 Nov 2018 03:21:45 -0000
Content-Type: text/plain

Hi RP,

I'd like to change the fatal message to be an event, the benefits are:
- Things like report-error.bbclass can catch the error
- It's easier to get bbappends list from an event message than from console log.

What's your opinion, please ?

// Robert

The following changes since commit 41d89552620bfbc94031d314e6b3d0324f7a330e:

  bitbake: fetch2: Avoid warning about incorrect character escaping in regex (2018-11-27 22:15:34 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib rbt/append
  http://git.pokylinux.org/cgit.cgi//log/?h=rbt/append

Robert Yang (1):
  cooker: simplify BB_DANGLINGAPPENDS_WARNONLY

 bitbake/lib/bb/cooker.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

-- 
2.7.4


