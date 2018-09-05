Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6FD7874C8C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 07:05:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8575R8t015913
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Sep 2018 00:05:28 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Wed, 5 Sep 2018 00:05:27 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Sep 2018 15:16:16 +0800
Message-ID: <cover.1536130313.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/2 V2] Add oe.utils.vartrue() and update BUILD_OPTIMIZATION
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
X-List-Received-Date: Wed, 05 Sep 2018 07:05:27 -0000
Content-Type: text/plain

* V2:
  - Improve readability as RP and Peter suggested.

* V1:
  Initial version

// Robert

The following changes since commit bd92ff5759809df2542ce1bcba2c45bbd11d1e10:

  openssl: Handle -conf package file conflicts (2018-09-04 11:03:31 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/debug
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/debug

Robert Yang (2):
  oe/utils.py: Add vartrue()
  bitbake.conf: Make BUILD_OPTIMIZATION respect to DEBUG_BUILD

 meta/conf/bitbake.conf | 4 ++--
 meta/lib/oe/utils.py   | 7 +++++++
 2 files changed, 9 insertions(+), 2 deletions(-)

-- 
2.7.4


