Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 882096FFA1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:31:49 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3qQnm53HRTz3hjpZ;
	Thu, 17 Mar 2016 13:31:49 +0100 (CET)
X-Auth-Info: lZBvzagA92eKysLGN7xy+1nHj7/P4O300dkln18SAnY=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3qQnm50Q44zvhTk;
	Thu, 17 Mar 2016 13:31:49 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2016 13:31:37 +0100
Message-Id: <1458217899-5542-5-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1458217899-5542-1-git-send-email-marex@denx.de>
References: <1458217899-5542-1-git-send-email-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>, Thomas Chou <thomas@wytron.com.tw>,
	Ley Foon Tan <lftan@altera.com>, Walter Goossens <waltergoossens@home.nl>
Subject: [PATCH 5/7] lttng-modules: Add nios2 support
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
X-List-Received-Date: Thu, 17 Mar 2016 12:31:51 -0000

The lttng-modules are compatible with nios2, so just amend
the compatibility string.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Ley Foon Tan <lftan@altera.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Thomas Chou <thomas@wytron.com.tw>
Cc: Walter Goossens <waltergoossens@home.nl>
---
 meta/recipes-kernel/lttng/lttng-modules_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_git.bb b/meta/recipes-kernel/lttng/lttng-modules_git.bb
index 53d2482..2eb1a51 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_git.bb
@@ -11,7 +11,7 @@ inherit module
 SRCREV = "45e0ebd91f995cc73c2b0d5c60cf9d12e8c838bf"
 PV = "2.7.1+git${SRCPV}"
 
-COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|arm).*-linux'
+COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm).*-linux'
 
 SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.7"
 
-- 
2.7.0


