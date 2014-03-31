Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f48.google.com (mail-yh0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id E62016F61F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 14:03:18 +0000 (UTC)
Received: by mail-yh0-f48.google.com with SMTP id z6so7581526yhz.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 07:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=AC82Blv0panGIFEt9bWSob7apU7aI+X30N4ST5wuglk=;
	b=EneMB9xdAp3aC0j+rjZ97rilWib49tdSEDsOBh7KAp+UDPwnr2LIGMK+zhTys6yz5r
	O/Rhq0W2aOS/Pxs/zRvLVBhOU6CfmbU7BeR9ItJWXA3X4OD5aHM7vLF6VoHTHZ1KDZlR
	z8+O5IjRm3B2mmCicu/AFPrnidEzxa56hzV88J9LkzTulwGRChfWWHizCh2B562nUjrp
	tzBBhO59LMfpFI0utbBVcV3L2so5WwUo7z6WjxrL245d+oCkqCvHCt7FlXBahKS+2ZgZ
	piOgXbdgyFle8maG/J9lvd65oF3xr3gBGkUDcl0yDvzcECmXPaY+B6gA00hS48nuHx+i
	ZvaQ==
X-Received: by 10.236.150.205 with SMTP id z53mr36648202yhj.75.1396274599015; 
	Mon, 31 Mar 2014 07:03:19 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id
	u63sm24726220yhf.31.2014.03.31.07.03.15 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Mar 2014 07:03:16 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 3A83B19EC5379; Mon, 31 Mar 2014 11:03:12 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 31 Mar 2014 11:03:09 -0300
Message-Id: <1396274589-1858-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.9.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v3] packagegroup-core-tools-testapps: Move GLTOOLS to X11GLTOOLS
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
X-List-Received-Date: Mon, 31 Mar 2014 14:03:21 -0000

piglit and mesa-demos are not buildable in x11-less distros so we must
to add those only when opengl and x11 DISTRO_FEATURES are available.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index d8a7306..952fbd0 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -24,7 +24,7 @@ KEXECTOOLS_powerpc ?= ""
 KEXECTOOLS_e5500-64b ?= ""
 KEXECTOOLS_aarch64 ?= ""
 
-GLTOOLS = "\
+X11GLTOOLS = "\
     mesa-demos \
     piglit \
     "
@@ -58,6 +58,6 @@ RDEPENDS_${PN} = "\
     connman-tests \
     connman-client \
     ${@base_contains('DISTRO_FEATURES', 'x11', "${X11TOOLS}", "", d)} \
-    ${@base_contains('DISTRO_FEATURES', 'opengl', "${GLTOOLS}", "", d)} \
+    ${@base_contains('DISTRO_FEATURES', 'x11 opengl', "${X11GLTOOLS}", "", d)} \
     ${@base_contains('DISTRO_FEATURES', '3g', "${3GTOOLS}", "", d)} \
     "
-- 
1.9.1


