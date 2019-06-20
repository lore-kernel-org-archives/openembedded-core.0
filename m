Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1DCA47D274
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 07:52:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5K7qmw1019255
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 00:52:48 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.439.0; Thu, 20 Jun 2019 00:52:47 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Jun 2019 16:15:22 +0800
Message-ID: <cover.1561018476.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
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
X-List-Received-Date: Thu, 20 Jun 2019 07:52:47 -0000
Content-Type: text/plain

The following changes since commit 2106a567820bad438ff78d54a49e3d87da428dcf:

  python3: python3: Fix build error x86->x86 (2019-06-19 13:15:55 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/4fixes
  http://cgit.openembedded.org//log/?h=rbt/4fixes

Robert Yang (4):
  linux-dummy: Add do_compile_kernelmodules
  make-mod-scripts: Depends on bison-native
  update-alternatives.bbclass: run update-alternatives firstly in
    postinst script
  gtk-icon-cache.bbclass: Depends on gtk+3

 meta/classes/gtk-icon-cache.bbclass                        | 14 ++++++++++----
 meta/classes/update-alternatives.bbclass                   |  7 +++++--
 meta/recipes-kernel/linux/linux-dummy.bb                   |  5 +++++
 .../make-mod-scripts/make-mod-scripts_1.0.bb               |  2 +-
 4 files changed, 21 insertions(+), 7 deletions(-)

-- 
2.7.4


