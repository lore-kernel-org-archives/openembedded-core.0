Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1ShMJo-000089-Oi
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 16:55:41 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.wrs.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5KEipgo024307;
	Wed, 20 Jun 2012 07:44:51 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 20 Jun 2012 10:54:53 -0400
Message-Id: <cover.1340202895.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/1] linux-libc-headers: use kernel-arch for ARCH
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
X-List-Received-Date: Wed, 20 Jun 2012 14:55:41 -0000

Richard/Saul,

While working on the standalone perf support, I used kernel-arch
to get ARCH properly set for the build. 

Richard mentioned this ages (2years+) ago that the libc-headers
code really shouldn't do it's own ARCH mapping. So I converted
the .inc file to inherit kernel-arch and pickup the ARCH defition.

This worked here on some core-image-minimal builds. I'll make the
same change in other layers once I know if this is ok or not :)

Cheers,

Bruce

The following changes since commit b440f989fd72e5cbb8f6ea222edc0bc7cdedbba2:
  Bruce Ashfield (1):
        recipes-kernel: remove linux-tools.inc

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/libc-headers
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/libc-headers

Bruce Ashfield (1):
  linux-libc-headers: use kernel-arch to set ARCH

 .../linux-libc-headers/linux-libc-headers.inc      |   30 ++-----------------
 1 files changed, 4 insertions(+), 26 deletions(-)



