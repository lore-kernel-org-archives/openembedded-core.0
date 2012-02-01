Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RsOeL-0001hv-SK
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 02:06:14 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 Jan 2012 16:58:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="118835785"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.14.149])
	by fmsmga002.fm.intel.com with ESMTP; 31 Jan 2012 16:58:17 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2012 16:58:13 -0800
Message-Id: <0de11fff1e41291501f20a26e4611142aa17a94d.1328057677.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1328057677.git.josh@linux.intel.com>
References: <cover.1328057677.git.josh@linux.intel.com>
In-Reply-To: <cover.1328057677.git.josh@linux.intel.com>
References: <cover.1328057677.git.josh@linux.intel.com>
Subject: [PATCH 1/3] pciutils: fix configure script for dash
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
X-List-Received-Date: Wed, 01 Feb 2012 01:06:14 -0000

configure.patch was missing a closing quote in a sed expression which
causes script execution to error on less forgiving shells such as dash.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../pciutils/pciutils-3.1.9/configure.patch        |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-bsp/pciutils/pciutils-3.1.9/configure.patch b/meta/recipes-bsp/pciutils/pciutils-3.1.9/configure.patch
index 658e597..66c9f91 100644
--- a/meta/recipes-bsp/pciutils/pciutils-3.1.9/configure.patch
+++ b/meta/recipes-bsp/pciutils/pciutils-3.1.9/configure.patch
@@ -67,7 +67,7 @@ diff -r af2b10cc3c14 lib/configure
  		cpu=`/usr/sbin/lsattr -F value -l $proc -a type | sed 's/_.*//'`
  	else
 -		cpu=`uname -m | sed 's/^i.86$/i386/;s/^sun4u$/sparc64/;s/^i86pc$/i386/;s/^BePC$/i386/;s/^BeMac$/powerpc/;s/^BeBox$/powerpc/'`
-+		cpu=${4:-`uname -m | sed 's/^i.86$/i386/;s/^sun4u$/sparc64/;s/^i86pc$/i386/;s/^BePC$/i386/;s/^BeMac$/powerpc/;s/^BeBox$/powerpc/`}
++		cpu=${4:-`uname -m | sed 's/^i.86$/i386/;s/^sun4u$/sparc64/;s/^i86pc$/i386/;s/^BePC$/i386/;s/^BeMac$/powerpc/;s/^BeBox$/powerpc/'`}
  	fi
  	if [ "$sys" = "GNU/kFreeBSD" -o "$sys" = "DragonFly" ]
  	then
-- 
1.7.7.6



