Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6FB6560111
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 12:35:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5QCZIbQ008601
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 05:35:38 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.439.0; Wed, 26 Jun 2019 05:35:19 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Jun 2019 20:59:33 +0800
Message-ID: <cover.1561553919.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] multilib.bbclass: Reduce ALTERNATIVE_PRIORITY for extended recipes
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
X-List-Received-Date: Wed, 26 Jun 2019 12:35:47 -0000
Content-Type: text/plain

The following changes since commit 4bb3e8f98e2bbfcb20f1b32d2b7674d1a6cb47be:

  local.conf.sample.extended: remove redundant RUNTIMETARGET assignment (2019-06-24 17:32:37 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/multilib
  http://cgit.openembedded.org//log/?h=rbt/multilib

Robert Yang (1):
  multilib.bbclass: Reduce ALTERNATIVE_PRIORITY for extended recipes

 meta/classes/multilib.bbclass | 47 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

-- 
2.7.4


