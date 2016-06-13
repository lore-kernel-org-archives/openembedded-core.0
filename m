Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 685606010B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 08:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u5D8B394031123 for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 09:11:03 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id goVVVAQe6t-5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 09:11:03 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u5D8B0SQ031118
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 09:11:02 +0100
Message-ID: <1465805460.13979.196.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Jun 2016 09:11:00 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] testexport-tarball: Add default value for TEST_EXPORT_SDK_PACKAGES
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
X-List-Received-Date: Mon, 13 Jun 2016 08:11:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Otherwise we see parsing failures in the default configuration:

'''
Nothing RPROVIDES '${TEST_EXPORT_SDK_PACKAGES}' (but
/media/build1/poky/meta/recipes-core/meta/testexport-tarball.bb
RDEPENDS on or otherwise requires it)
'''

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-core/meta/testexport-tarball.bb b/meta/recipes-core/meta/testexport-tarball.bb
index 951d3be..d9861c4 100644
--- a/meta/recipes-core/meta/testexport-tarball.bb
+++ b/meta/recipes-core/meta/testexport-tarball.bb
@@ -6,6 +6,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
+TEST_EXPORT_SDK_PACKAGES ??= ""
+
 TOOLCHAIN_TARGET_TASK ?= ""
 
 TOOLCHAIN_HOST_TASK ?= "${TEST_EXPORT_SDK_PACKAGES}"



