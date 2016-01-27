Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EE2EE731FC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 08:45:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0R8jK2w001502
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 27 Jan 2016 00:45:21 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 27 Jan 2016 00:45:20 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>
Date: Wed, 27 Jan 2016 03:45:14 -0500
Message-ID: <cover.1453882496.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/4] base/bbclass: use target path to replace build ones in debugging info
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
X-List-Received-Date: Wed, 27 Jan 2016 08:45:24 -0000
Content-Type: text/plain

Test Steps:

vim local.conf
...
MACHINE ?= "qemux86-64"
WARN_QA += "buildpaths"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "core2-32"
...

bitbake -k world

It fixed buidpath QA warning of 142 recipes (before 236, after 94) 
These newly added options does not work on native.(Which TARGET_CFLAGS
have been overrided in native.bbclass)

//Hongxu

The following changes since commit 3d2c0f5902cacf9d8544bf263b51ef0dd1a7218c:

  cmake: update to 3.4.2 (2016-01-26 22:49:40 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/fix-buildpath
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=hongxu/fix-buildpath

Hongxu Jia (4):
  base/bbclass: use target path as compile dir in debugging info
  base/bbclass: disallow appending the compile options in debugging info
  base/bbclass: use target path as include dir in debugging info
  base/bbclass: fix missing to replace build dir in debugging info

 meta/classes/base.bbclass | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

-- 
1.9.1


