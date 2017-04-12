Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A3C8377CEC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 09:26:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v3C9QWTT014271
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 02:26:35 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Apr 2017 02:26:31 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Apr 2017 02:26:30 -0700
Message-ID: <cover.1491989148.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
MIME-Version: 1.0
Subject: [PATCH 0/1] blacklist.bbclass: fix for multilib
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
X-List-Received-Date: Wed, 12 Apr 2017 09:26:35 -0000
Content-Type: text/plain

The following changes since commit 210c518ba8f8d6ec6e9d34e0df8b963a3b2e0593:

  ptest-runner: Upgrade to minor version 2.0.2 (2017-04-11 18:09:21 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/blacklist
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/blacklist

Robert Yang (1):
  blacklist.bbclass: fix for multilib

 meta/classes/blacklist.bbclass | 25 -------------------------
 meta/classes/multilib.bbclass  |  6 ++++++
 2 files changed, 6 insertions(+), 25 deletions(-)

-- 
2.11.0.rc2.dirty


