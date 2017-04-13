Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 56CE277DB2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 09:57:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v3D9vR7f024682
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 02:57:27 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 13 Apr 2017 02:57:26 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Apr 2017 02:57:22 -0700
Message-ID: <cover.1492077359.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH 0/4] meta: 4 fixes
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
X-List-Received-Date: Thu, 13 Apr 2017 09:57:28 -0000
Content-Type: text/plain

The following changes since commit e41c90b852167bbcb434da57b84280e855acae33:

  busybox: In defconfig enable ASH_CMDCMD for built-in 'command' (2017-04-12 15:18:42 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/4fixes
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/4fixes

Robert Yang (4):
  binconfig.bbclass: fix typo in get_binconfig_mangle()
  apt: fix libdir path for apt.systemd.daily
  autogen: update libopts.m4's patch
  grep: do_configure: fix "Argument list too long"

 meta/classes/binconfig.bbclass                                        | 2 +-
 meta/recipes-devtools/apt/apt-package.inc                             | 4 +++-
 .../0001-config-libopts.m4-regenerate-it-from-config-libopts..patch   | 2 +-
 meta/recipes-extended/grep/grep_3.0.bb                                | 3 +++
 4 files changed, 8 insertions(+), 3 deletions(-)

-- 
2.10.2


