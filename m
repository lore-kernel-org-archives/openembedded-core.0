Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 13AAA6FFA1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:31:51 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3qQnm43FHMz3hjNn;
	Thu, 17 Mar 2016 13:31:48 +0100 (CET)
X-Auth-Info: A2/E3WM+uVP+CGSeZ5cJ8extZbg6uv0l2c0mMaUGZc0=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3qQnm35Wy1zvhTZ;
	Thu, 17 Mar 2016 13:31:47 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2016 13:31:35 +0100
Message-Id: <1458217899-5542-3-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1458217899-5542-1-git-send-email-marex@denx.de>
References: <1458217899-5542-1-git-send-email-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>, Thomas Chou <thomas@wytron.com.tw>,
	Ley Foon Tan <lftan@altera.com>, Walter Goossens <waltergoossens@home.nl>
Subject: [PATCH 3/7] packagegroup-core-sdk: Disable sanitizers for nios2
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
X-List-Received-Date: Thu, 17 Mar 2016 12:31:52 -0000

These are not available on nios2 yet, so disable them.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Ley Foon Tan <lftan@altera.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Thomas Chou <thomas@wytron.com.tw>
Cc: Walter Goossens <waltergoossens@home.nl>
---
 meta/recipes-core/packagegroups/packagegroup-core-sdk.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index 46cb6ee..bee1665 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -32,6 +32,7 @@ SANITIZERS_aarch64 = ""
 SANITIZERS_mips = ""
 SANITIZERS_mips64 = ""
 SANITIZERS_mips64n32 = ""
+SANITIZERS_nios2 = ""
 SANITIZERS_powerpc64 = ""
 SANITIZERS_sparc = ""
 SANITIZERS_libc-musl = ""
-- 
2.7.0


