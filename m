Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 863877250A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 05:55:29 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Dec 2014 21:55:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,550,1413270000"; d="scan'208";a="635378098"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.161])
	by fmsmga001.fm.intel.com with ESMTP; 09 Dec 2014 21:55:23 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Dec 2014 21:55:16 -0800
Message-Id: <c8997af552975afe2ee2ca532dc701e5a604c8ed.1418190513.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1418190513.git.sgw@linux.intel.com>
References: <cover.1418190513.git.sgw@linux.intel.com>
In-Reply-To: <cover.1418190513.git.sgw@linux.intel.com>
References: <cover.1418190513.git.sgw@linux.intel.com>
Subject: [PATCH 4/6] libdaemon: Convert to git
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
X-List-Received-Date: Wed, 10 Dec 2014 05:55:31 -0000

The upstream tarball is no longer available, but the git repo still is, so use it instead
The license was changed to MIT, so reflect that change in LICENSE and CHKSUMs

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/libdaemon/libdaemon_0.14.bb | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-support/libdaemon/libdaemon_0.14.bb b/meta/recipes-support/libdaemon/libdaemon_0.14.bb
index e928781..92ae5eb 100644
--- a/meta/recipes-support/libdaemon/libdaemon_0.14.bb
+++ b/meta/recipes-support/libdaemon/libdaemon_0.14.bb
@@ -2,14 +2,15 @@ SUMMARY = "Lightweight C library which eases the writing of UNIX daemons"
 SECTION = "libs"
 AUTHOR = "Lennart Poettering <lennart@poettering.net>"
 HOMEPAGE = "http://0pointer.de/lennart/projects/libdaemon/"
-LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://libdaemon/daemon.h;beginline=9;endline=21;md5=bd9fbe57cd96d1a5848a8ba12d9a6bf4"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3f160358b580634d8dd2904c9f575c1d \
+                    file://libdaemon/daemon.h;beginline=6;endline=26;md5=6e104f268341f13ffbb7f0b2f409cf0f"
 
-SRC_URI = "http://0pointer.de/lennart/projects/libdaemon/libdaemon-${PV}.tar.gz"
+SRCREV = "0630da04e575213229f695bdc3dc90aa92ca4f55"
+PV = "0.14+git${SRCPV}"
+SRC_URI = "git://git.0pointer.net/libdaemon.git"
 
-SRC_URI[md5sum] = "509dc27107c21bcd9fbf2f95f5669563"
-SRC_URI[sha256sum] = "fd23eb5f6f986dcc7e708307355ba3289abe03cc381fc47a80bca4a50aa6b834"
+S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
 
-- 
1.8.3.1


