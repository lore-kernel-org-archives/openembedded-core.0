Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 25B4161EF6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Oct 2013 19:15:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r92JFUog012246
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 2 Oct 2013 12:15:30 -0700 (PDT)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.130.112) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 2 Oct 2013 12:15:29 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 2 Oct 2013 15:15:25 -0400
Message-ID: <cover.1380741229.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] linux-yocto: enable CONFIG_INPUT_EVDEV as standard policy
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
X-List-Received-Date: Wed, 02 Oct 2013 19:15:33 -0000
Content-Type: text/plain

We have a number (in fact most) BSPs that require INPUT_EVDEV for basic
functionality. The size increase is minimal, so we'll add it to the
standard configuration for all platforms.

[YOCTO #5279]

Cheers,

Bruce

The following changes since commit 56f39bcf2237c11508d82238b6292e4bfbfed764:

  bitbake: lib/bb/monitordisk.py: fix spelling in error text (2013-10-02 15:41:21 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  linux-yocto: enable CONFIG_INPUT_EVDEV as standard policy

 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb    | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb  | 2 +-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_3.8.bb       | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

-- 
1.8.1.2


