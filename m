Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0A95877000
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 07:53:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8H7r7iq021728
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 00:53:07 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 17 Sep 2015 00:53:07 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Sep 2015 00:53:05 -0700
Message-ID: <cover.1442476310.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] fix when len(TMPDIR) = 410
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
X-List-Received-Date: Thu, 17 Sep 2015 07:53:07 -0000
Content-Type: text/plain

len(TMPDIR) = 410 is supported by oe-core, the world build
will be OK after the 2 patches.

// Robert

The following changes since commit f0189829498e30231d826c9f55aad73e622d076e:

  qemu: Update to upstream patches (2015-09-14 11:22:02 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/long
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=oem

Robert Yang (2):
  ccache: fix file name too long
  bind: fix too long error from gen

 .../0001-lib-dns-gen.c-fix-too-long-error.patch    |   34 ++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.10.2-P4.bb   |    1 +
 meta/recipes-devtools/ccache/ccache_3.2.3.bb       |    4 ++-
 .../0002-dev.mk.in-fix-file-name-too-long.patch    |   32 ++++++++++++++++++
 4 files changed, 70 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/bind/bind/0001-lib-dns-gen.c-fix-too-long-error.patch
 create mode 100644 meta/recipes-devtools/ccache/files/0002-dev.mk.in-fix-file-name-too-long.patch

-- 
1.7.9.5


