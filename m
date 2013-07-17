Return-Path: <Sen.Zhang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D6A6F6B215
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 08:38:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6H8cAZ5021259
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 01:38:10 -0700 (PDT)
Received: from jesse-wrs-desktop.corp.ad.wrs.com (128.224.162.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Wed, 17 Jul 2013 01:38:08 -0700
From: Jesse Zhang <sen.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jul 2013 16:40:45 +0800
Message-ID: <cover.1374050133.git.sen.zhang@windriver.com>
X-Mailer: git-send-email 1.7.11.7
MIME-Version: 1.0
Subject: [PATCH 0/2] two bug fixes for tremor and libatomics-ops
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
X-List-Received-Date: Wed, 17 Jul 2013 08:38:08 -0000
Content-Type: text/plain

The following changes since commit 3dee534f1e25109e0bdb681de0746c336f4b8840:

  lib/oeqa: fix dependecy check (2013-07-16 10:04:17 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib szhang/bugs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=szhang/bugs

Jesse Zhang (2):
  tremor: add a patch to build with arm thumb
  libatomics-ops: force omit frame pointer for x86 builds

 .../pulseaudio/libatomics-ops_7.2.bb               |   4 +
 .../tremor/tremor-20120314/tremor-arm-thumb2.patch | 104 +++++++++++++++++++++
 meta/recipes-multimedia/tremor/tremor_20120314.bb  |   1 +
 3 files changed, 109 insertions(+)
 create mode 100644 meta/recipes-multimedia/tremor/tremor-20120314/tremor-arm-thumb2.patch

-- 
1.7.11.7


