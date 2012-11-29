Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Te9IG-0006XS-Lm
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 19:57:05 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qATIge1R007078;
	Thu, 29 Nov 2012 10:42:40 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 29 Nov 2012 13:42:21 -0500
Message-Id: <cover.1354214034.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1 master/for-danny] kernel-yocto: validate branches fix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Nov 2012 18:57:06 -0000

Richard/Saul/Ross,

This is a fix for YOCTO #3478, and it fixes a problem that was
being seen when BSPs created by yocto-bsp. It turned out to be
triggered by meta branch SRCREVs that triggered a branch reset,
which then prevented the tools from doing the rest of their job.

The fix is both for master and for danny, I've tested it, TomZ
has tested it, and so has the bug submitter, we are all happy 
with the results.

Cheers,

Bruce


The following changes since commit 247b6a3754c2c50318e2a73d79981ba0e9cb560b:

  gstreamer, gst-plugins*: fix localdata (2012-11-28 15:25:33 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel-fixes
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-fixes

Bruce Ashfield (1):
  kernel-yocto: checkout known branch before leaving
    do_validate_branches

 meta/classes/kernel-yocto.bbclass |    2 ++
 1 file changed, 2 insertions(+)

-- 
1.7.10.4



