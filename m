Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RH7LY-00040A-Eh
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 07:08:44 +0200
Received: by gyc15 with SMTP id 15so3406188gyc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 22:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=PZKcOB+3KjtEN/tG6qFrgWz5haIGicptGEOzZD4yP7M=;
	b=o6k7+6jYLNDtXrQ+NsiZhZawBjvvMYRMBTnHYGng2C4TETClZg4ihj7PwniMcOZIMs
	HgJ2V2mllhziUBTOk8GczMN1j7x5kiFdDQjI4BJY/tdh26TjELFGS7KvgsMWI7fCvwC9
	BsSa+Nwa9kI40ExP9dzkSHi2U+8/zswNM8Yaw=
Received: by 10.68.7.166 with SMTP id k6mr25335367pba.128.1319173370790;
	Thu, 20 Oct 2011 22:02:50 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id w4sm26362890pbf.6.2011.10.20.22.02.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Oct 2011 22:02:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Oct 2011 22:02:39 -0700
Message-Id: <1319173361-11527-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 1/3] tcmode-default.inc: Add TRANSLATED_TARGET_ARCH suffix to binutils-cross-canadian
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
X-List-Received-Date: Fri, 21 Oct 2011 05:08:44 -0000

PN for binutils-cross-canadian is
binutils-cross-canadian-${TRANSLATED_TARGET_ARCH}
so thats what we should use for PREFERRED_VERSION

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 86562be..2bf1beb 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -45,7 +45,7 @@ PREFERRED_VERSION_libgcc-nativesdk ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
 PREFERRED_VERSION_binutils-cross ?= "${BINUVERSION}"
 PREFERRED_VERSION_binutils-crosssdk ?= "${BINUVERSION}"
-PREFERRED_VERSION_binutils-cross-canadian ?= "${BINUVERSION}"
+PREFERRED_VERSION_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${BINUVERSION}"
 PREFERRED_VERSION_linux-libc-headers ?= "${LINUXLIBCVERSION}"
 PREFERRED_VERSION_linux-libc-headers-nativesdk ?= "${LINUXLIBCVERSION}"
 PREFERRED_VERSION_eglibc                   ?= "${EGLIBCVERSION}"
-- 
1.7.5.4



