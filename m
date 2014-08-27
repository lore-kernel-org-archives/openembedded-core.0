Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E267E65E94
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 14:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7REoP1O004671 for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 15:50:25 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id asxub5fvA_q0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 15:50:25 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7REoKXc004665
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 15:50:21 +0100
Message-ID: <1409151022.29296.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Aug 2014 15:50:22 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] patchelf: Add patchelf recipe
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
X-List-Received-Date: Wed, 27 Aug 2014 14:50:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This is useful since it allows us to edit the RPATH and interpreter fields 
in ELF binaries. This is potentially particularly useful in improving the way
we can use the SDK and also potentially making native binaries more relocatable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/patchelf/patchelf_0.8.bb b/meta/recipes-devtools/patchelf/patchelf_0.8.bb
new file mode 100644
index 0000000..446e013
--- /dev/null
+++ b/meta/recipes-devtools/patchelf/patchelf_0.8.bb
@@ -0,0 +1,12 @@
+SRC_URI = "http://nixos.org/releases/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.bz2"
+LICENSE = "GPLv3"
+SUMMARY = "Tool to allow editing of RPATH and interpreter fields in ELF binaries"
+
+SRC_URI[md5sum] = "5b151e3c83b31f5931b4a9fc01635bfd"
+SRC_URI[sha256sum] = "c99f84d124347340c36707089ec8f70530abd56e7827c54d506eb4cc097a17e7"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+inherit autotools
+
+BBCLASSEXTEND = "native"



