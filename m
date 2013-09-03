Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 847FC6BEF5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 15:16:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r83FGm2d010274
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Sep 2013 08:16:48 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 3 Sep 2013 08:16:47 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 3 Sep 2013 11:16:42 -0400
Message-ID: <cover.1378221277.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] linux-yocto/3.10: consolidated pull update
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
X-List-Received-Date: Tue, 03 Sep 2013 15:16:48 -0000
Content-Type: text/plain

Richard/Saul,

Now that 3.10 is getting some more eyes on it, we are getting a 
few bug reports. I've collected up this series of fixes and bumped
to 3.10.10 to pick up more upstream fixes.

Of note, there's a 3.11 fix for the ssh problem, so once it makes
3.10 stable, I'll do more updates.

Cheers,

Bruce

The following changes since commit 755f7d9afaab4e7424f5f57587aa45df3807acf0:

  pulseaudio: disable GTK+ by default (2013-09-02 18:04:59 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  kernel-yocto: improve error checking on non-git repos
  linux-yocto/3.10: fix YAFFS2 build issues
  linux-yocto/3.10: update to v3.10.10

 meta/classes/kernel-yocto.bbclass                  |   13 ++++++++++++-
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |    6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |    4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      |   16 ++++++++--------
 4 files changed, 25 insertions(+), 14 deletions(-)

-- 
1.7.10.4


