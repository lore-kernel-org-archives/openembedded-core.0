Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 22FD37386A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 21:36:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t22LagiD012107
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 2 Mar 2015 13:36:42 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Mon, 2 Mar 2015 13:36:41 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 2 Mar 2015 16:36:37 -0500
Message-ID: <cover.1425331960.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Mon, 02 Mar 2015 21:36:46 -0000
Content-Type: text/plain

Richard,

Here's my next round of incremental fixes and updates. All are relatively
minor, so there's no sense sitting on them while I work on some other
changes.

These two are tweaks to the Kconfig audit warnings that went into M3, and
will remove a config warning and the other will not uncessarily warn people
who've done nothing wrong :)

  linux-yocto: fix qemux86-64 config warning
  kernel-yocto: inhibit BSP description warnings for custom linux-yocto kernels

I also have some OcteonIII support additions to linux-yocto-3.14, and finally
a minor patch performance improvement. We aren't done on this front, but again,
no sense sitting on changes.

Cheers,

Bruce


The following changes since commit bf1a68e97f2069a4f66664c351d4bafd416358eb:

  taglib: Fix cmake floating dependency on boost (2015-03-02 18:06:53 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto: fix qemux86-64 config warning
  kernel-yocto: inhibit BSP description warnings for custom linux-yocto kernels
  linux-yocto/3.14: OcteonIII support
  kern-tools: improve patch application performance

 meta/classes/kernel-yocto.bbclass                       | 13 +++++++------
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb        |  5 +++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb      |  3 ++-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb      |  3 ++-
 meta/recipes-kernel/linux/linux-yocto.inc               |  1 +
 meta/recipes-kernel/linux/linux-yocto_3.14.bb           | 17 +++++++++--------
 meta/recipes-kernel/linux/linux-yocto_3.19.bb           |  3 ++-
 8 files changed, 27 insertions(+), 20 deletions(-)

-- 
2.1.0


