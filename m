Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1T8xDQ-00077c-Mh
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 19:47:09 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q84HYh1q028385;
	Tue, 4 Sep 2012 10:34:43 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue,  4 Sep 2012 13:34:41 -0400
Message-Id: <cover.1346779930.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] linux-yocto-rt: remaining 3.4.9-rt17 fixes
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
X-List-Received-Date: Tue, 04 Sep 2012 17:47:09 -0000

Richard/Saul,

.. and here's the predicted tweaks to my morning -rt refresh.
The exported SRCREVs were part 1/2 due to a merge conflict combined
with a force reset making me miss several files. Both -rt updates
build and boot (and the full -rt was tested), but without this, you
don't get much of a realtime kernel :)

Cheers,

Bruce

The following changes since commit 99c85ba93075a1aff789cafabbacf42e6a93bd32:

  build-appliance-image: Update to latest poky master (2012-09-04 18:04:40 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel-rt
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  linux-yocto-rt: 3.4.9-rt17 remaining changes

 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.5.4



