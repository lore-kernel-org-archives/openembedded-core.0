Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QkRD6-0007XD-Qi
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Jul 2011 03:40:56 +0200
Received: from localhost.localdomain (c-71-236-175-18.hsd1.or.comcast.net
	[71.236.175.18])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id A267D3055A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 21:36:36 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2011 18:36:28 -0700
Message-Id: <cover.1311384871.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.1
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: A267D3055A.12514
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/1] runqemu bugfix
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
X-List-Received-Date: Sat, 23 Jul 2011 01:40:57 -0000

This fixes an issue Jessica Zhang reported to me today:

Invoking runqemu outside of the build directory for an
in-tree setup results in an empty TMPDIR because bitbake -e
cannot be run to find it.

A symptom of this problem is running runqemu and getting the
following error:
    
Error: Unable to find tunctl binary in <directory>
    
Catch this case and report the error to the user.
    
This fixes [YOCTO #1278]

The following changes since commit eea4bd731ef286516ee1fb934fe2222a09c06e70:

  mpc8315e-rdb: Set TARGET_FPU correct (2011-07-22 09:02:58 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib sgarman/runqemu-fix
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/runqemu-fix

Scott Garman (1):
  runqemu: report error if TMPDIR cannot be determined

 scripts/runqemu |   27 ++++++++++++++++-----------
 1 files changed, 16 insertions(+), 11 deletions(-)



