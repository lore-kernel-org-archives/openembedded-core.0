Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SuSc9-0006c6-14
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 20:16:45 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6QI5BVD016900;
	Thu, 26 Jul 2012 11:05:11 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 26 Jul 2012 14:04:30 -0400
Message-Id: <cover.1343325569.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 0/1] kernel.bbclass: remove default module_autoload and module_conf values
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jul 2012 18:16:45 -0000

Richard,

This is just what the subject implies, a RFC patch. While working
on some updates and docs, I (once gain) ran across the module_autoload
and module_conf default values in kernel.bbclass.

I've always wondered if that was the best place for these, since the
kernel.bbclass builds many different kernel versions. 

I've simply removed them here, without relocating them to any other
recipe, since I can't see that they are really all that useful for
most targest.

This is a RFC, because I haven't done any research into what this
may or may not break outside of oe-core and reference boards.

Cheers,

Bruce

The following changes since commit fb53d69d9c726e6a663ea276cc440676e20f8326:

  documentation/dev-manual/dev-manual-intro.xml: typo fixed. (2012-07-26 18:53:04 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel-rfc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-rfc

Bruce Ashfield (1):
  kernel.bbclass: remove default module_autoload and module_conf values

 meta/classes/kernel.bbclass |   19 -------------------
 1 files changed, 0 insertions(+), 19 deletions(-)

-- 
1.7.5.4



