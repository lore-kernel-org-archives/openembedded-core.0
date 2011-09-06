Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1R0zEu-0002r2-KY
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Sep 2011 19:15:13 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-146-223.ottawa.windriver.com [128.224.146.223])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p86H9aRU009030;
	Tue, 6 Sep 2011 10:09:37 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue,  6 Sep 2011 13:09:27 -0400
Message-Id: <cover.1315328841.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/2] linux-yocto: re-enable systemtap and utrace
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
X-List-Received-Date: Tue, 06 Sep 2011 17:15:13 -0000

Richard/Saul,

Just a couple of changes from Tom in this request. Updated support
for utrace and systemtap that went mysteriously missing when I
did the bulk update.

I did my own round of build testing and everything is fine from
my end.

Cheers,

Bruce

The following changes since commit dbff56238e083d0110eb13c1f5a07716340fdfe4:

  icu-3.6: fix building with big make -j (2011-09-06 16:37:02 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel-oe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-oe

Bruce Ashfield (2):
  linux-yocto: re-enable systemtap
  linux-yocto: re-enable utrace

 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |   14 +++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

-- 
1.7.4.1



