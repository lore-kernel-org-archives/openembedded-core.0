Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1C62365CED
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 08:25:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAC8PnYV016889
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 00:25:49 -0800 (PST)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 12 Nov 2014 00:25:49 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Nov 2014 03:25:47 -0500
Message-ID: <cover.1415780321.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] python: Fix CVE-2014-7185
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
X-List-Received-Date: Wed, 12 Nov 2014 08:25:51 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Integer overflow in bufferobject.c in Python before 2.7.8 allows
context-dependent attackers to obtain sensitive information from
process memory via a large size and offset in a "buffer" function.

This back-ported patch fixes CVE-2014-7185

The following changes since commit 3c741a8d33acbf4b3d5eecc04533bc76e2f37253:

  oprofile: 0.9.9 -> 1.0.0 (2014-11-09 10:21:24 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/cve-python
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/cve-python

Wenzong Fan (1):
  python: Fix CVE-2014-7185

 .../python/python/python-2.7.3-CVE-2014-7185.patch |   75 ++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.3.bb       |    1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/python-2.7.3-CVE-2014-7185.patch

-- 
1.7.9.5


