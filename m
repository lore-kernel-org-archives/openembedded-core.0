Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1S9gvE-0008QW-Pt
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 19:03:09 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-d3.ottawa.windriver.com [128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2JHsCYV011320;
	Mon, 19 Mar 2012 10:54:12 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 19 Mar 2012 13:53:56 -0400
Message-Id: <cover.1332179433.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/1] lttng-2.0: fix compiliation error
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
X-List-Received-Date: Mon, 19 Mar 2012 18:03:09 -0000

Richard/Saul,

Here's a fix for the recent lttng-2.0 modules build error that
was reported. The recent -stable update created a collision with
is_compat_task() that was already being defined as a fallback
within lttng 2.0.

I've made a patch fix, versus updating lttng-2.0 .. since churning
this package would be a good idea right now.

Cheers,

Bruce

The following changes since commit a9873f12e5ba11e1307440901d07e9642e9f53bf:

  pigz: Ensure DEPENDS on zlib exists for native and target versions (2012-03-19 14:37:46 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
 compliation error with 3.2.x -stable kernels

 ...ls-protect-is_compat_task-from-redefiniti.patch |   41 ++++++++++++++++++++
 .../lttng-2.0/lttng-modules_2.0.pre11.bb           |    3 +-
 2 files changed, 43 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_compat_task-from-redefiniti.patch

-- 
1.7.5.4



