Return-Path: <andrew.shadura@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id BA7E8730D6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 14:31:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: andrewsh) with ESMTPSA id CBD46264D1C
From: Andrew Shadura <andrew.shadura@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Mar 2017 15:31:38 +0100
Message-Id: <20170309143139.2785-1-andrew.shadura@collabora.co.uk>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH v3 1/2] security_flags: disable -pie for ghostscript
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
X-List-Received-Date: Thu, 09 Mar 2017 14:31:47 -0000

Otherwise ghostscript fails to build the libraries:

relocation R_X86_64_PC32 against symbol `st_ttfInterpreter'
can not be used when making a shared object; recompile
with -fPIC

Signed-off-by: Andrew Shadura <andrew.shadura@collabora.co.uk>
---
 meta/conf/distro/include/security_flags.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 5a1cbb1..cb8b696 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -33,6 +33,7 @@ SECURITY_CFLAGS_pn-coreutils = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-cups = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-db = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-directfb = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-ghostscript = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-glibc = ""
 SECURITY_CFLAGS_pn-glibc-initial = ""
 SECURITY_CFLAGS_pn-elfutils = "${SECURITY_NO_PIE_CFLAGS}"
-- 
1.8.3.1


