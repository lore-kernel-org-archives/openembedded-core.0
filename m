Return-Path: <danismostlikely@gmail.com>
Received: from mail-qa0-f49.google.com (mail-qa0-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5D6FD722E7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 03:51:23 +0000 (UTC)
Received: by mail-qa0-f49.google.com with SMTP id v8so9576482qal.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 19:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=P6THty2XghjbTuhAzIWSA1pUhOKcgd+weXRD8PW2Xtg=;
	b=jcj0MaHGvpmGFgHXPGqJQ+emsdTUi+z9bB82bP6137YKDQtIAR8F+y0TSkDwBu4KyZ
	xeomOWAGbO40wObf0njY2bezi2lTg3nnsdSCwY+gkjmK8ULt39+C/AeyYWpzkid4SkHe
	47I6sSzznkv3fwoy5BN7CYNtRzxJPO2DrR/mBuZp6CI/737iIFuBhtqgoMDDPNIYVY29
	4eUuTRCGpBxM2jka3KjvpusheYf3mrjep+CB5qILau8WFR+b0qyAPzVg9TMNxS6+qy7y
	DO7fd+Cc2lIWSqFHB0r6aoS7uNxeaAdvMwds2UDr49FsHjJrIy0ntnBZoCEuQaqxS8/a
	3PFg==
MIME-Version: 1.0
X-Received: by 10.224.103.72 with SMTP id j8mr13058277qao.19.1421293883754;
	Wed, 14 Jan 2015 19:51:23 -0800 (PST)
Received: by 10.96.35.34 with HTTP; Wed, 14 Jan 2015 19:51:23 -0800 (PST)
Date: Wed, 14 Jan 2015 21:51:23 -0600
Message-ID: <CACS+7ZTyJyWJZeuNuWzSvTX=EeffZMMZ4krZ=nF2fVLDPbKVyw@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/3] packagegroup-core-sdk: add gcc-sanitizers to core SDK
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
X-List-Received-Date: Thu, 15 Jan 2015 03:51:23 -0000
Content-Type: text/plain; charset=UTF-8

From: Dan McGregor <dan.mcgregor@usask.ca>

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-core/packagegroups/packagegroup-core-sdk.bb | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index a544bbd..cad3439 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -4,7 +4,9 @@

 SUMMARY = "Software development tools"
 LICENSE = "MIT"
-PR = "r9"
+PR = "r10"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"

 inherit packagegroup

@@ -26,9 +28,17 @@ RDEPENDS_packagegroup-core-sdk = "\
     file \
     tcl"

+SANITIZERS = "libasan-dev libubsan-dev"
+SANITIZERS_aarch64 = ""
+SANITIZERS_mips = ""
+SANITIZERS_mips64 = ""
+SANITIZERS_powerpc64 = ""
+SANITIZERS_sparc = ""
+
 RRECOMMENDS_packagegroup-core-sdk = "\
     libgomp \
-    libgomp-dev"
+    libgomp-dev \
+    ${SANITIZERS}"

 #python generate_sdk_pkgs () {
 #    poky_pkgs = read_pkgdata('packagegroup-core', d)['PACKAGES']
-- 
2.1.0

