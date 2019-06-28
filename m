Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 55AA37EA86
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 12:00:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5SBxaAe023772
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 04:59:56 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.439.0; Fri, 28 Jun 2019 04:59:26 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Jun 2019 20:23:36 +0800
Message-ID: <cover.1561724553.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/6] meta: Cleanup python2
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
X-List-Received-Date: Fri, 28 Jun 2019 12:00:05 -0000
Content-Type: text/plain

The following changes since commit 9f674a88c781c7092d5b3460922a1579b9fe4bf9:

  busybox: Fix typo in syslog initscript (2019-06-27 13:27:54 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/py3
  http://cgit.openembedded.org//log/?h=rbt/py3

Robert Yang (6):
  ksum.py: python -> python3
  wic: python2 -> python3
  ext-sdk-prepare.py: python2 -> python3
  oeqa: Cleanup /usr/bin/env python
  package_rpm.bbclass: python2 -> python3
  waf: python2 -> python3

 meta/classes/package_rpm.bbclass        |  2 +-
 meta/files/ext-sdk-prepare.py           |  2 +-
 meta/lib/oeqa/selftest/cases/wic.py     |  1 -
 meta/lib/oeqa/utils/logparser.py        |  1 -
 meta/recipes-graphics/eglinfo/files/waf |  4 +--
 scripts/lib/wic/__init__.py             |  2 +-
 scripts/lib/wic/ksparser.py             |  2 +-
 scripts/lib/wic/pluginbase.py           |  2 +-
 scripts/tiny/ksum.py                    | 44 ++++++++++++++++-----------------
 9 files changed, 29 insertions(+), 31 deletions(-)

-- 
2.7.4


