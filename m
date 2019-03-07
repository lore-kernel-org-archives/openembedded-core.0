Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7E45D7C7D3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 03:22:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x273M9gx010808
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Mar 2019 19:22:09 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.439.0; Wed, 6 Mar 2019 19:22:08 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Mar 2019 11:41:20 +0800
Message-ID: <cover.1551929817.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/2] insane.bbclass: Fixes for do_qa_configure and qa_check_staged.
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
X-List-Received-Date: Thu, 07 Mar 2019 03:22:08 -0000
Content-Type: text/plain

The following changes since commit 0a306d4f706b55f64228c7a0a14ff1ad127d7df9:

  scripts: Add oe-pylint (2019-03-06 23:12:06 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/qa
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/qa

Robert Yang (2):
  insane.bbclass: Make INSANE_SKIP work for qa pkgconfig and la
  insane.bbclass: Add configure-unsafe and configure-gettext

 meta/classes/insane.bbclass | 48 +++++++++++++++++++++++++++++++++------------
 1 file changed, 36 insertions(+), 12 deletions(-)

-- 
2.7.4


