Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B2BF16BD03
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 22:05:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7SM5NOm023382
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 28 Aug 2013 15:05:23 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 28 Aug 2013 15:05:22 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 28 Aug 2013 18:05:07 -0400
Message-ID: <cover.1377727293.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] linux-yocto/3.4: consolidated pull
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
X-List-Received-Date: Wed, 28 Aug 2013 22:05:28 -0000
Content-Type: text/plain

Richard/Saul,

Now that 3.10 is bubbling a little bit less vigorously, here's some pending 
3.4 updates. These are standard 3.4.x stable updates, and the rename of
the rangeley BSP to the mohonpeak.

Build and boot testing showed no issues here.

Cheers,

Bruce

The following changes since commit f272c7d8e790e4e47212a283fb7384617e1b5c51:

  linux-yocto/3.10: fix ssh login and restore CC_OPTIMIZE_FOR_SIZE (2013-08-28 16:04:40 -0400)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/mohonpeak
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/mohonpeak

Bruce Ashfield (1):
  linux-yocto/3.4: v3.4.59, mohonpeak

 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |   16 ++++++++--------
 3 files changed, 15 insertions(+), 15 deletions(-)

-- 
1.7.10.4


