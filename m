Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RO4UG-0001w9-6O
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 10:30:28 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 Nov 2011 01:24:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,483,1315206000"; d="scan'208";a="72180422"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by azsmga001.ch.intel.com with ESMTP; 09 Nov 2011 01:24:10 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 01:24:05 -0800
Message-Id: <9a28288f8f04d020bfda07dc65152f805a8b92c1.1320830515.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320830515.git.sgw@linux.intel.com>
References: <cover.1320830515.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320830515.git.sgw@linux.intel.com>
References: <cover.1320830515.git.sgw@linux.intel.com>
MIME-Version: 1.0
Subject: [CONSOLIDATED PULL 3/5] libarchive: Remove obsolete comment and empty line at the end
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
X-List-Received-Date: Wed, 09 Nov 2011 09:30:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Menzel <paulepanter@users.sourceforge.net>

This is a fix up for

        commit fb19df5b21e551c5dfdfa340438952560c5fa528
        Author: Xiaofeng Yan <xiaofeng.yan@windriver.com>
        Date:   Mon Nov 7 20:03:53 2011 +0800

            libarchive: update to 2.8.5

            Remove patch "0003-Patch-from-upstream-rev-2516.patch" because it has been merged
            to source codes.

            Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>

removing a now obsolete comment because the undistributable content was removed [1] from upstream’s tarball.

Also remove an empty line at the end introduced in the above commit.

[1] http://code.google.com/p/libarchive/issues/detail?id=162

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 .../libarchive/libarchive_2.8.5.bb                 |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/libarchive/libarchive_2.8.5.bb b/meta/recipes-extended/libarchive/libarchive_2.8.5.bb
index 1bc49e2..5cf13e6 100644
--- a/meta/recipes-extended/libarchive/libarchive_2.8.5.bb
+++ b/meta/recipes-extended/libarchive/libarchive_2.8.5.bb
@@ -7,8 +7,6 @@ PR = "r0"
 
 DEPENDS = "libxml2"
 
-# We need to repack the tarball due undistributable content on the upstream one.
-# More details at http://code.google.com/p/libarchive/issues/detail?id=162
 SRC_URI = "http://libarchive.googlecode.com/files/libarchive-${PV}.tar.gz \
            file://0001-Patch-from-upstream-revision-1990.patch \
            file://0002-Patch-from-upstream-revision-1991.patch \
@@ -24,4 +22,3 @@ SRC_URI[sha256sum] = "13993e0ffbd121ccda46ea226b1f8eac218de0fa8da7d8b1f998093d5c
 inherit autotools lib_package
 
 BBCLASSEXTEND = "nativesdk"
-
-- 
1.7.6.4



