Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5DD80797D5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Sep 2018 13:38:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w87DchEG028842
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 7 Sep 2018 06:38:43 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Fri, 7 Sep 2018 06:38:42 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 7 Sep 2018 09:38:39 -0400
Message-ID: <cover.1536327277.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] kernel-yocto: kconfig audit warning fixes
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
X-List-Received-Date: Fri, 07 Sep 2018 13:38:44 -0000
Content-Type: text/plain

Hi all,

These two patches should address a lot of the kconfig audit warnings that
are popping up against 4.14/4.18.  We have tweaks to the configs
themselves, but also some improvement in the tooling to allow some
warnings to be inhibited.

Cheers,

Bruce

The following changes since commit c710430aa1a5a30d3087c3102485d4621e8d179e:

  Revert "prelink: Fix SRC_URI and branch" (2018-09-06 14:49:28 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (2):
  kern-tools: improve kernel config audit output
  linux-yocto/4.14/4.18: address kernel configuration warnings

 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb        | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb        | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.14.bb           | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.18.bb           | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.5.0


