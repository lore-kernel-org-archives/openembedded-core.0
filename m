Return-Path: <henning.schild@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 189D67F32F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 13:43:52 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x83DhqHH025356
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Sep 2019 15:43:52 +0200
Received: from md1za8fc.ad001.siemens.net ([139.25.69.169])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x83DhpL1008645;
	Tue, 3 Sep 2019 15:43:51 +0200
From: Henning Schild <henning.schild@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Sep 2019 15:43:44 +0200
Message-Id: <20190903134350.21512-1-henning.schild@siemens.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Henning Schild <henning.schild@siemens.com>
Subject: [PATCHv2 0/6] solve several issues in oe-git-proxy
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
X-List-Received-Date: Tue, 03 Sep 2019 13:43:53 -0000
Content-Transfer-Encoding: 8bit

From: Henning Schild <henning.schild@siemens.com>

Change to v1:
 - fix comment in p4
 - move "set -f" all the way up in p4, that was the intention in the
   first place

Henning Schild (6):
  oe-git-proxy: allow setting SOCAT from outside
  oeqa: add case for oe-git-proxy
  Revert "oe-git-proxy: Avoid resolving NO_PROXY against local files"
  oe-git-proxy: disable shell pathname expansion for the whole script
  oe-git-proxy: NO_PROXY suffix matching without wildcard for match_host
  oe-git-proxy: fix dash "Bad substitution"

 meta/lib/oeqa/selftest/cases/oescripts.py | 58 +++++++++++++++++++++++
 scripts/oe-git-proxy                      | 21 ++++----
 2 files changed, 71 insertions(+), 8 deletions(-)

-- 
2.21.0


