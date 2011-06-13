Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QW166-0002Fr-BC
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 08:58:06 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 12 Jun 2011 23:54:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,356,1304319600"; d="scan'208";a="17500612"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.216])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jun 2011 23:54:38 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Jun 2011 23:54:22 -0700
Message-Id: <a99140cfb8cb1b2f0a4ebe69317fe89fd5c4b0bd.1307947593.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307947593.git.sgw@linux.intel.com>
References: <cover.1307947593.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307947593.git.sgw@linux.intel.com>
References: <cover.1307947593.git.sgw@linux.intel.com>
Subject: [*RFC CONSOLIDATED PULL RFC* 12/23] uclibc.inc: libsegfault is only RPROVIDED by uclibc
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
X-List-Received-Date: Mon, 13 Jun 2011 06:58:06 -0000

From: Khem Raj <raj.khem@gmail.com>

Using ${PN} also means that uclibc-initial gets to provide it
which we do not want

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index c1bc422..0f8c6c2 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -99,7 +99,7 @@ RPROVIDES_uclibc-dev += "libc-dev virtual-libc-dev"
 # uclibc does not really have libsegfault but then using the one from glibc is also not
 # going to work. So we pretend that we have it to make bitbake not pull other recipes
 # to satisfy this dependency for the images/tasks
-RPROVIDES_${PN} += "libsegfault"
+RPROVIDES_uclibc += "libsegfault"
 
 SRC_URI = "\
         http://www.uclibc.org/downloads/uClibc-${PV}.tar.bz2;name=uClibc-${PV} \
-- 
1.7.3.4



