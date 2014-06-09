Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 70FE5660EF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 07:45:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s597jsFU003550
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Jun 2014 00:45:54 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 9 Jun 2014 00:45:53 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Jun 2014 15:45:51 +0800
Message-ID: <cover.1402299786.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] sed: enable ptest support
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
X-List-Received-Date: Mon, 09 Jun 2014 07:45:56 -0000
Content-Type: text/plain

root@qemuarm:/usr/lib/sed/ptest# ./run-ptest 
make: Entering directory '/usr/lib/sed/ptest/testsuite'
PASS: bug-regex7
PASS: bug-regex8
PASS: bug-regex9
PASS: bug-regex10
PASS: bug-regex11
PASS: bug-regex12
PASS: bug-regex13
......
PASS: file
PASS: quiet
PASS: factor
PASS: binary3
PASS: binary2
PASS: binary
PASS: dc
===================
All 86 tests passed
===================
make: Leaving directory '/usr/lib/sed/ptest/testsuite'

The following changes since commit 66d5be204fd339cc84a0ae92d3923a8c1e6f1389:

  bitbake: bitbake: show wildcard appends for bitbake-layers (2014-06-06 10:33:19 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/sed
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/sed

Chong Lu (1):
  sed: enable ptest support

 meta/recipes-extended/sed/sed-4.2.2/run-ptest      |  3 +
 .../sed/sed-4.2.2/sed-add-ptest.patch              | 66 ++++++++++++++++++++++
 meta/recipes-extended/sed/sed_4.2.2.bb             | 21 ++++++-
 3 files changed, 87 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/sed/sed-4.2.2/run-ptest
 create mode 100644 meta/recipes-extended/sed/sed-4.2.2/sed-add-ptest.patch

-- 
1.8.1.2


