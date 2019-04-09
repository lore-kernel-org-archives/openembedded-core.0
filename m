Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ECDAF7D2A2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2019 08:35:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x398ZOMT009037
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Apr 2019 01:35:24 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.439.0; Tue, 9 Apr 2019 01:35:24 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Apr 2019 16:34:31 +0800
Message-ID: <cover.1554798787.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] sstate.bbclass: Use bb.utils.to_boolean() for BB_NO_NETWORK
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
X-List-Received-Date: Tue, 09 Apr 2019 08:35:24 -0000
Content-Type: text/plain

The following changes since commit d7c0e9d1800912a0f35fb554d54945b728a04a6f:

  gtk+: update for new catalog path (2019-04-05 17:27:40 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/bool
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/bool

Robert Yang (1):
  sstate.bbclass: Use bb.utils.to_boolean() for BB_NO_NETWORK

 meta/classes/sstate.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.7.4


