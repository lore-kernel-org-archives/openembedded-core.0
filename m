Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SRzd3-00065a-HT
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 07:40:01 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 May 2012 22:30:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="141721075"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.218])
	by orsmga002.jf.intel.com with ESMTP; 08 May 2012 22:30:02 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 May 2012 22:29:56 -0700
Message-Id: <ce03f6651ef18c8588da335faccd8156e4b84bf5.1336516205.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1336516205.git.sgw@linux.intel.com>
References: <cover.1336516205.git.sgw@linux.intel.com>
In-Reply-To: <cover.1336516205.git.sgw@linux.intel.com>
References: <cover.1336516205.git.sgw@linux.intel.com>
MIME-Version: 1.0
Subject: [CONSOLIDATED PULL 11/12] zlib: upgrade to 1.2.7
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
X-List-Received-Date: Wed, 09 May 2012 05:40:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Eric Bénard <eric@eukrea.com>

1.2.6 is no more fetchable and 1.2.7 fix some bugs, full changelog is
available here : http://zlib.net/ChangeLog.txt

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 .../remove.ldconfig.call.patch                     |    0
 .../zlib/{zlib_1.2.6.bb => zlib_1.2.7.bb}          |    6 ++----
 2 files changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-core/zlib/{zlib-1.2.6 => zlib-1.2.7}/remove.ldconfig.call.patch (100%)
 rename meta/recipes-core/zlib/{zlib_1.2.6.bb => zlib_1.2.7.bb} (80%)

diff --git a/meta/recipes-core/zlib/zlib-1.2.6/remove.ldconfig.call.patch b/meta/recipes-core/zlib/zlib-1.2.7/remove.ldconfig.call.patch
similarity index 100%
rename from meta/recipes-core/zlib/zlib-1.2.6/remove.ldconfig.call.patch
rename to meta/recipes-core/zlib/zlib-1.2.7/remove.ldconfig.call.patch
diff --git a/meta/recipes-core/zlib/zlib_1.2.6.bb b/meta/recipes-core/zlib/zlib_1.2.7.bb
similarity index 80%
rename from meta/recipes-core/zlib/zlib_1.2.6.bb
rename to meta/recipes-core/zlib/zlib_1.2.7.bb
index 54f8abf..803fec3 100644
--- a/meta/recipes-core/zlib/zlib_1.2.6.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.7.bb
@@ -6,13 +6,11 @@ SECTION = "libs"
 LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://zlib.h;beginline=4;endline=23;md5=94d1b5a40dadd127f3351471727e66a9"
 
-PR = "r1"
-
 SRC_URI = "http://www.zlib.net/${BPN}-${PV}.tar.bz2 \
            file://remove.ldconfig.call.patch \
            "
-SRC_URI[md5sum] = "dc2cfa0d2313ca77224b4d932b2911e9"
-SRC_URI[sha256sum] = "fa3e3e4881fa5810b8903f2c7e0dcd5a0a673535f0438021c4bbb5db1b918c8e"
+SRC_URI[md5sum] = "2ab442d169156f34c379c968f3f482dd"
+SRC_URI[sha256sum] = "49e2e9658dfb036900da6ea0267a737fa3c4eee6666776d378c79d52e9334934"
 
 do_configure (){
 	./configure --prefix=${prefix} --shared --libdir=${libdir}
-- 
1.7.7.6



