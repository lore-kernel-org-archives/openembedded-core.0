Received: from c-71-193-189-117.hsd1.wa.comcast.net ([71.193.189.117]
	helo=yujin.bigsur.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@yujin.bigsur.com>) id 1SkisQ-00087L-TS
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 23:37:19 +0200
Received: from yujin.bigsur.com (localhost [127.0.0.1])
	by yujin.bigsur.com (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	q5TLLQhs028230 for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 14:21:26 -0700
Received: (from sgw@localhost)
	by yujin.bigsur.com (8.14.4/8.14.4/Submit) id q5TLLQZb028229
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 14:21:26 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jun 2012 14:21:19 -0700
Message-Id: <dacb77db3fcf7dd283cf60361ca156e322dd466f.1341004548.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1341004548.git.sgw@linux.intel.com>
References: <cover.1341004548.git.sgw@linux.intel.com>
In-Reply-To: <cover.1341004548.git.sgw@linux.intel.com>
References: <cover.1341004548.git.sgw@linux.intel.com>
Subject: [PATCH 7/7] speex: use lib_package bbclass
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
X-List-Received-Date: Fri, 29 Jun 2012 21:37:19 -0000

This is a clean-up following the recent addition of PN-bin
to bitbake.conf and lib_package

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-multimedia/speex/speex_1.2rc1.bb |    8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-multimedia/speex/speex_1.2rc1.bb b/meta/recipes-multimedia/speex/speex_1.2rc1.bb
index 7370134..faf63b0 100644
--- a/meta/recipes-multimedia/speex/speex_1.2rc1.bb
+++ b/meta/recipes-multimedia/speex/speex_1.2rc1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=314649d8ba9dd7045dfb6683f298d0a8 \
                     file://include/speex/speex.h;beginline=1;endline=34;md5=a68129f78d7fe66e07163f73aba143b3"
 DEPENDS = "libogg"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://downloads.us.xiph.org/releases/speex/speex-1.2rc1.tar.gz"
 
@@ -16,12 +16,8 @@ SRC_URI[sha256sum] = "342f30dc57bd4a6dad41398365baaa690429660b10d866b7d508e8f117
 
 PARALLEL_MAKE = ""
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig lib_package
 
 EXTRA_OECONF = " --enable-fixed-point --with-ogg-libraries=${STAGING_LIBDIR} \
                  --disable-float-api --disable-vbr \
                  --with-ogg-includes=${STAGING_INCDIR} --disable-oggtest"
-
-PACKAGES += "${PN}-bin"
-FILES_${PN} = "${libdir}/lib*.so.*"
-FILES_${PN}-bin = "${bindir}"
-- 
1.7.10.4



