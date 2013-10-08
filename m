Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5095C6CBAA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2013 21:04:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r98L4GDa015348
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 8 Oct 2013 14:04:16 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 8 Oct 2013 14:04:16 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 8 Oct 2013 17:04:12 -0400
Message-ID: <cover.1381266137.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] linux-yocto: config changes
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
X-List-Received-Date: Tue, 08 Oct 2013 21:04:16 -0000
Content-Type: text/plain

Richard/Saul,

This series contains three configuration changes. Two for 3.10
and one for 3.8.

They are all minor, but would still be nice to have merged. There's
no impact on existing support, since the are all either optional
or additional functionality.

Cheers,

Bruce

p.s. I'm out of the office for the next week, so use my gmail
address if there are issues.

The following changes since commit 102bf5e0f640fe85068452a42b85077f1c81e0c9:

  build-appliance: Update SRCREV for release (2013-10-08 16:33:43 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  linux-yocto/3.8: re-use common-pc-64 for hasswell-wc
  linux-yocto/3.10:  boot-live.cfg: Add CONFIG_ZISO=y
  linux-yocto/3.10: integrate lxc kernel feature and 32 bit x86 config

 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb    | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb | 3 ++-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb  | 2 +-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_3.8.bb       | 2 +-
 6 files changed, 7 insertions(+), 6 deletions(-)

-- 
1.8.1.2


