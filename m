Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 096CA6FBEC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 01:50:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4T1o7mR018519
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 18:50:07 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Wed, 28 May 2014 18:50:07 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 May 2014 09:50:52 +0800
Message-ID: <cover.1401328168.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] update-rc.d: fix to handle priority numbers correctly
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
X-List-Received-Date: Thu, 29 May 2014 01:50:12 -0000
Content-Type: text/plain

The following changes since commit 32ac58819580d359e22161be1abf62215d202250:

  i2c-tools: Add i2c-tools to the core (2014-05-28 09:41:11 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/updatercd-priority
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/updatercd-priority

Chen Qi (1):
  update-rc.d: fix to handle priority numbers correctly

 .../fix-to-handle-priority-numbers-correctly.patch |   28 ++++++++++++++++++++
 meta/recipes-core/update-rc.d/update-rc.d_0.7.bb   |    1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-core/update-rc.d/update-rc.d/fix-to-handle-priority-numbers-correctly.patch

-- 
1.7.9.5


