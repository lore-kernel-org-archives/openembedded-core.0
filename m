Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 1B32873192
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:31:52 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3qQnm45SwZz3hjPX;
	Thu, 17 Mar 2016 13:31:48 +0100 (CET)
X-Auth-Info: lZBvzagA92eKysLGN7xy+1nHj7/P4O300dkln18SAnY=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3qQnm41qz5zvhTg;
	Thu, 17 Mar 2016 13:31:48 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2016 13:31:36 +0100
Message-Id: <1458217899-5542-4-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1458217899-5542-1-git-send-email-marex@denx.de>
References: <1458217899-5542-1-git-send-email-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>, Thomas Chou <thomas@wytron.com.tw>,
	Ley Foon Tan <lftan@altera.com>, Walter Goossens <waltergoossens@home.nl>
Subject: [PATCH 4/7] kexec: Disable on nios2
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
X-List-Received-Date: Thu, 17 Mar 2016 12:31:53 -0000

kexec is not supported on nios2, so disable it.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Ley Foon Tan <lftan@altera.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Thomas Chou <thomas@wytron.com.tw>
Cc: Walter Goossens <waltergoossens@home.nl>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index acbae11..e8d585e 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -11,9 +11,10 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
-# kexec-tools doesn't work on e5500-64b yet
+# kexec-tools doesn't work on e5500-64b and nios2 yet
 KEXECTOOLS ?= "kexec"
 KEXECTOOLS_e5500-64b ?= ""
+KEXECTOOLS_nios2 ?= ""
 
 X11GLTOOLS = "\
     mesa-demos \
-- 
2.7.0


