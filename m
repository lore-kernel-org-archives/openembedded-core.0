Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6762171D9F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 07:24:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uBE7Obcx015205
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 23:24:37 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 13 Dec 2016 23:24:36 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Dec 2016 23:24:28 -0800
Message-ID: <cover.1481700149.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH V2 0/8] Fixes for eSDK and testsdkext
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
X-List-Received-Date: Wed, 14 Dec 2016 07:24:39 -0000
Content-Type: text/plain

* V2
  1) Fix Paul's comments:
     - Drop "don't reset when the test is failed"
     - Update bug id for "oe-publish-sdk: add pyshtables.py to .gitignore"
     - Split "install multilib targets as populate_sdk does" into 2 commits:
       "break the long lines"
       "install multilib SDKs"
  2) Use shorter subject lines

* V1
  Initial version

// Robert

The following changes since commit 4e412234c37efec42b3962c11d44903c0c58c92e:

  libpcap: Disable exposed bits of WinPCAP remote capture support (2016-12-13 22:47:35 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/eSDK
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/eSDK

Robert Yang (8):
  populate_sdk_ext.bbclass: break the long lines
  populate_sdk_ext.bbclass: install multilib SDKs
  oeqa/sdkext/devtool.py: remove sources before run test cases
  oe-publish-sdk: make cmd easier to read
  oe-publish-sdk: add pyshtables.py to .gitignore
  oeqa/oetest.py: add hasLockedSig()
  oeqa/sdkext/devtool.py: skip a testcase when no libxml2
  oe/copy_buildsystem.py: add SDK_LAYERS_EXCLUDE_PATTERN

 meta/classes/populate_sdk_ext.bbclass | 63 ++++++++++++++++++++++++-----------
 meta/lib/oe/copy_buildsystem.py       | 18 ++++++++++
 meta/lib/oeqa/oetest.py               | 13 ++++++++
 meta/lib/oeqa/sdkext/devtool.py       |  8 ++++-
 scripts/oe-publish-sdk                | 19 +++++++++--
 5 files changed, 98 insertions(+), 23 deletions(-)

-- 
2.10.2


