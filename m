Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6D4FD7E732
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 01:06:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5L15p9g027780
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 18:06:06 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Thu, 20 Jun 2019 18:05:54 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Jun 2019 09:18:01 +0800
Message-ID: <cover.1561023072.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] oeqa: two fixes regarding skipping tests
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
X-List-Received-Date: Fri, 21 Jun 2019 01:06:15 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit 1d60af733cc28018ce95789191986e3ce6c3b86d:

  python3: python3: Fix build error x86->x86 (2019-06-19 22:13:42 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/oeqa-skip-class
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/oeqa-skip-class

Chen Qi (2):
  context.py: avoid skipping tests by meaningless command argument
  oeqa: avoid class setup method to run when skipping the whole class

 meta/lib/oeqa/core/case.py    |  2 ++
 meta/lib/oeqa/core/context.py | 10 +++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

-- 
1.9.1


