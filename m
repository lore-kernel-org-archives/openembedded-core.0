Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1S2vtM-0006Qv-DB
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 03:37:16 +0100
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q212SgAp027205;
	Wed, 29 Feb 2012 18:28:42 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 29 Feb 2012 21:27:06 -0500
Message-Id: <cover.1330568367.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 0/1] linux-libc-headers-yocto: bump to 3.22 and fix validation
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
X-List-Received-Date: Thu, 01 Mar 2012 02:37:16 -0000

Richard/Saul,

This is a second fix for YOCTO 2032. BSPs that want the bleeding edge kernel
headers were still seeing some branch validation errors with the yocto libc
headers recipe.

There were two reasons:

    - we were pointing at an old tree, which introduced some branch naming
      issues
    - there were some new routines in the base yocto kernel class that
      should just be overriden

This change bumps the linux-yocto based libc headers to v3.2.8, indicates
that 'standard/base' should be used for those headers and stubs out 
validation and configuration tasks we don't need for header generation.

Both Darren and myself have tested this one.

cc: Darren Hart <dvhart@linux.intel.com>

Cheers,

Bruce

The following changes since commit 8f07bdc0a42dd7a7c3acf5d1b13220dbc98c8017:
  Richard Purdie (1):
        image_types_uboot: Update to work after recent image_types changes

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/yocto-libc-headers
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/yocto-libc-headers

Bruce Ashfield (1):
  linux-libc-headers-yocto: bump to v3.2.8

 .../linux-libc-headers-yocto_git.bb                |   29 +++++++++++++-------
 1 files changed, 19 insertions(+), 10 deletions(-)



