Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1RJR6x-0002cW-IT
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Oct 2011 16:39:15 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9REX3p1001648;
	Thu, 27 Oct 2011 07:33:03 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 27 Oct 2011 10:32:46 -0400
Message-Id: <cover.1319725711.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/3] RFC v3: provide 3.0.x and 3.1 libc headers
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
X-List-Received-Date: Thu, 27 Oct 2011 14:39:16 -0000

Richard,

Here's v3 of the series, the details are below.

Changes since v2:

 - moved more code into the .inc file
 - modifed the python code to not import unnecessary functions and
   to use d.get/setVar. 
 - Included an optional patch 3/3 to remove 2.6 based header recipes.
   Whether you want this or not .. is up to you!

Changes since v1:
 
 - factored common code out into the .inc file. Captured in patch 1/2
 - patch 2/2 is the introduction of the new headers

v1 Email is included below:

Here's a RFC patch for updating the toolchain linux-libc headers to 3.x
variants.

The reason I'm calling it a RFC is:

  - I wrote some anonymous python code (and I'm no python coder) to
    deal with 2.6 / 3.0 tgz location differences. This could have
    also been done with a variable set in the recipes and used by
    the .inc. I wasn't sure of the preferred approach, hence the RFC.
    I'll take no offense corrections here.

  - I changed the .inc, but didn't bump the PR of the existing recipes
    and didn't remove the existing 2.6 variants. If either of these
    should have been done, let me know and I'll respin.

  - I bumped the default to be 3.1. If that's too agressive for the
    default, and we'd prefer 3.0.8, let me know and I'll respin.

I built and booted all the qemu machines with the 3.1 kernel headers.  So
from the testing I was able to do, this looks to be safe and ready to go.

This is based on my yocto repo, I also did the changes in my oe-core
repository, but I don't have a oe-core contrib branch that I could push to,
so I chose to send the yocto variant. If someone points me to who I email for
an oe-core contrib branch, I can push that variant as well.

Cheers,

Bruce


The following changes since commit fc94f925e848684244a38dcffe15cb1192dfbed8:
  Martin Jansa (1):
        libxml-parser-perl, libxml-simple-perl, expat, sgmlspl-native, git: bump PR to rebuild after perl upgrade

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/libc-headers-v3
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/libc-headers-v3

Bruce Ashfield (3):
  linux-libc-headers: factor common code into linux-libc-headers.inc
  linux-libc-headers: provide 3.0.x and 3.1 headers
  linux-libc-headers: remove older recipes

 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 .../linux-libc-headers/linux-libc-headers.inc      |   62 +++++++++++++++++++-
 .../linux-libc-headers_2.6.37.2.bb                 |   53 -----------------
 .../linux-libc-headers_2.6.39.bb                   |   54 -----------------
 .../linux-libc-headers/linux-libc-headers_3.0.8.bb |    7 ++
 .../linux-libc-headers/linux-libc-headers_3.1.bb   |    7 ++
 6 files changed, 74 insertions(+), 111 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.39.bb
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.0.8.bb
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.1.bb



