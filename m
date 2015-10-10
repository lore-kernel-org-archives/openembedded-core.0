Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4270A77054
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Oct 2015 07:01:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9A71KBn010928
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Oct 2015 00:01:20 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sat, 10 Oct 2015 00:01:20 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 10 Oct 2015 00:01:15 -0700
Message-ID: <cover.1444460443.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/5] meta: fix ALTERNATIVE_PRIORITY conflicts
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
X-List-Received-Date: Sat, 10 Oct 2015 07:01:24 -0000
Content-Type: text/plain

The following changes since commit 4038970f8ce27ac0d7a0afe2cdaa9a65108dfff5:

  os-release: fix do_compile() when RPM signing is enabled (2015-10-07 00:08:07 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/alternatives
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/alternatives

Robert Yang (5):
  debianutils: fix ALTERNATIVE_PRIORITY conflict with which
  console-tools: fix ALTERNATIVE_PRIORITY conflict with kbd
  util-linux: fix ALTERNATIVE_PRIORITY conflict with ncurses procps and
    e2fsprogs
  coreutils: fix ALTERNATIVE_PRIORITY conflict with procps and mktemp
  gtk+3: fix ALTERNATIVE_PRIORITY conflict with gtk+

 .../console-tools/console-tools_0.3.2.bb           |    2 +-
 meta/recipes-core/coreutils/coreutils_8.24.bb      |    2 +-
 meta/recipes-core/util-linux/util-linux.inc        |    2 +-
 meta/recipes-gnome/gtk+/gtk+3.inc                  |    1 +
 .../debianutils/debianutils_4.5.1.bb               |    2 +-
 5 files changed, 5 insertions(+), 4 deletions(-)

-- 
1.7.9.5


