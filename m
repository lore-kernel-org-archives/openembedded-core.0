Return-Path: <mcfrisk@kapsi.fi>
X-Greylist: delayed 2606 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 11 Apr 2019 10:32:14 UTC
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id BA3E37D706
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 10:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Q7wUbpPDoMIVAfRAc4RwlsuFdq/TwBF6e1YWhxQU3uY=;
	b=dFqp568oixuz80D/ZSpNxEPHbx
	tMm6moXJ6Wsz1ASAwgN96IqLEdY3iM9qFwz1dYqQWNrRDMJruZ6fHp6l9YG4Yq8kHEMFttr0mnBVl
	qOO6f29zyFIqSjEKWlsGym4dZ+muITq3JzJEQx8ec4pyD8WSLnbB7xEvzKSOl38oFC7SGstqpnyB2
	5Dh0AXoDCYPjoqa4ayccl97UfAC1amffp+dP2tj8KswsvqVCMEcQTJrfe4uUtZVs3CBia68STg500
	LG9atXBTl7E3Y8fcMc73sMkFOCMLq978AElyetF9BB6w0jQjhKemcosCbJN6RmxNCV0XOubqafFq/
	I7pzXlig==;
Received: from lakka.kapsi.fi ([2001:67c:1be8::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1hEWK7-0003Qd-I6; Thu, 11 Apr 2019 12:48:47 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1hEWK7-0005wT-Ez; Thu, 11 Apr 2019 12:48:47 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Apr 2019 12:48:40 +0300
Message-Id: <1554976120-21849-1-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
X-SA-Exim-Connect-IP: 2001:67c:1be8::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH] elfutils: update LICENSE to include GPLv2 for shared libraries
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
X-List-Received-Date: Thu, 11 Apr 2019 10:32:15 -0000

NEWS file in the sources says this about switch from GPLv2 to
GPLv3 license:

https://sourceware.org/git/?p=elfutils.git;a=blob;f=NEWS;h=5a06047f255e3c9a63828953759fd18a4ba9a3f3;hb=HEAD#l362

 362 The license is now GPLv2/LGPLv3+ for the libraries and GPLv3+ for stand-alone
 363 programs. There is now also a formal CONTRIBUTING document describing how to
 364 submit patches.

libasm, libdw and libelf are thus covered optionally by GPLv2 license.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/recipes-devtools/elfutils/elfutils_0.175.bb | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.175.bb b/meta/recipes-devtools/elfutils/elfutils_0.175.bb
index b0b9ddc..6d1279a 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.175.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.175.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Utilities and libraries for handling compiled object files"
 HOMEPAGE = "https://sourceware.org/elfutils"
 SECTION = "base"
-LICENSE = "(GPLv3 & Elfutils-Exception)"
+LICENSE = "(GPLv2 & LGPLv3+ & GPLv3+ & Elfutils-Exception)"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "libtool bzip2 zlib virtual/libintl"
 DEPENDS_append_libc-musl = " argp-standalone fts "
@@ -53,6 +53,18 @@ BBCLASSEXTEND = "native nativesdk"
 
 # Package utilities separately
 PACKAGES =+ "${PN}-binutils libelf libasm libdw"
+
+# shared libraries are licensed GPLv2 or GPLv3+, binaries GPLv3+
+# according to NEWS file:
+# "The license is now GPLv2/LGPLv3+ for the libraries and GPLv3+ for stand-alone
+# programs. There is now also a formal CONTRIBUTING document describing how to
+# submit patches."
+LICENSE_${PN}-binutils = "GPLv3+"
+LICENSE_${PN} = "GPLv3+"
+LICENSE_libelf = "GPLv2 | LGPLv3+"
+LICENSE_libasm = "GPLv2 | LGPLv3+"
+LICENSE_libdw = "GPLv2 | LGPLv3+"
+
 FILES_${PN}-binutils = "\
     ${bindir}/eu-addr2line \
     ${bindir}/eu-ld \
-- 
1.9.1


