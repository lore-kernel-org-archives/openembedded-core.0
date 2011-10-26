Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1RJ8Gf-0000bP-NA
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Oct 2011 20:32:02 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9QIPtdp024379;
	Wed, 26 Oct 2011 11:25:56 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 26 Oct 2011 14:25:41 -0400
Message-Id: <cover.1319652972.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/1] RFC: provide 3.0.x and 3.1 libc headers
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
X-List-Received-Date: Wed, 26 Oct 2011 18:32:02 -0000

Hi all,

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

  git://git.pokylinux.org/poky-contrib zedd/libc-headers
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/libc-headers

Bruce Ashfield (1):
  linux-libc-headers: provide 3.0.x and 3.1 headers

 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 .../linux-libc-headers/linux-libc-headers.inc      |   15 +++++-
 .../linux-libc-headers/linux-libc-headers_3.0.8.bb |   53 ++++++++++++++++++++
 .../linux-libc-headers/linux-libc-headers_3.1.bb   |   53 ++++++++++++++++++++
 4 files changed, 120 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.0.8.bb
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.1.bb



