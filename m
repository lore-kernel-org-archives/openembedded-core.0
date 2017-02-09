Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 77B3571DAE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Feb 2017 06:46:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v196kDkn022520
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 8 Feb 2017 22:46:13 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 8 Feb 2017 22:46:12 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Thu, 9 Feb 2017 01:45:46 -0500
Message-ID: <3b61e2a10d3d3c6a56d7dd73e28c93012bd6cadf.1486622007.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1486622006.git.hongxu.jia@windriver.com>
References: <cover.1486622006.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 13/13] elfutils: update homepage and upstream souce
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Feb 2017 06:46:14 -0000
Content-Type: text/plain

In git://sourceware.org/git/elfutils.git:
----------------
commit 1700fd25e6caf26663af2bd994d1d99fab9df59f
Author: Mark Wielaard <mark@klomp.org>
Date:   Sat Dec 24 22:31:41 2016 +0100

    http://elfutils.org/ is now hosted at http://sourceware.org/elfutils/

    fedorahosted used to be our home, but we are now hosted at sourceware.

    Change the elfutils project home to http://elfutils.org/
    Point hosted services (email, release, git, bug tracker and web pages)
    to https://sourceware.org/elfutils/

    Move design notes from README to NOTES.
    Add URLs for home, releases, bugs, git and mailinglist to README.

    Make the --version output of all tools the same by using a common
    print_version function and update the publicly shown copyright holder
    to the elfutils developers.

    Signed-off-by: Mark Wielaard <mark@klomp.org>
------------------

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.168.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.168.bb b/meta/recipes-devtools/elfutils/elfutils_0.168.bb
index 96e895a..9557933 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.168.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.168.bb
@@ -1,12 +1,11 @@
 SUMMARY = "Utilities and libraries for handling compiled object files"
-HOMEPAGE = "https://fedorahosted.org/elfutils"
+HOMEPAGE = "https://sourceware.org/elfutils"
 SECTION = "base"
 LICENSE = "(GPLv3 & Elfutils-Exception)"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "libtool bzip2 zlib virtual/libintl"
 DEPENDS_append_libc-musl = " argp-standalone fts "
-
-SRC_URI = "https://fedorahosted.org/releases/e/l/elfutils/${PV}/${BP}.tar.bz2"
+SRC_URI = "ftp://sourceware.org/pub/elfutils/${PV}/${BP}.tar.bz2"
 SRC_URI[md5sum] = "52adfa40758d0d39e5d5c57689bf38d6"
 SRC_URI[sha256sum] = "b88d07893ba1373c7dd69a7855974706d05377766568a7d9002706d5de72c276"
 
-- 
2.8.1


