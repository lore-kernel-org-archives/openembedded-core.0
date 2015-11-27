Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C0AE76012A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 10:22:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tARAMqKl018825
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 02:22:52 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Fri, 27 Nov 2015 02:22:51 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Nov 2015 18:22:50 +0800
Message-ID: <cover.1448619641.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] python: Fix cross compiling issue
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
X-List-Received-Date: Fri, 27 Nov 2015 10:22:53 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Tested on qemuarm and intel-x86-64.

--
The following changes since commit 80b3974081c4a8c604e23982a6db8fb32c616058:

  sstate: Ensure siginfo and sig files are also touched (2015-11-25 08:08:51 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib jhuang0/d_python_151127-0
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/d_python_151127-0

Jackie Huang (2):
  python: Fix cross compiling issue
  python3: Fix cross compiling issue

 .../add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch | 31 ++++++++++++++++++++
 .../python3-setup.py-no-host-headers-libs.patch    | 33 ----------------------
 ...-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch |  2 +-
 meta/recipes-devtools/python/python3_3.4.3.bb      |  6 ++--
 meta/recipes-devtools/python/python_2.7.9.bb       |  1 +
 5 files changed, 35 insertions(+), 38 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python/add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
 delete mode 100644 meta/recipes-devtools/python/python3/python3-setup.py-no-host-headers-libs.patch

-- 
1.9.1


