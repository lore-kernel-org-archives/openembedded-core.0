Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp02.imgtec.com [217.156.133.132])
	by mail.openembedded.org (Postfix) with ESMTP id 54B5571A11
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 11:31:29 +0000 (UTC)
Received: from HHMAIL03.hh.imgtec.org (unknown [10.44.0.21])
	by Forcepoint Email with ESMTPS id BA58AC4B4BC21
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 12:31:27 +0100 (IST)
Received: from HHMAIL01.hh.imgtec.org (10.100.10.19) by HHMAIL03.hh.imgtec.org
	(10.44.0.21) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Tue, 4 Oct 2016 12:31:30 +0100
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Tue, 4 Oct 2016 12:31:29 +0100
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Oct 2016 12:31:15 +0100
Message-ID: <1475580681-55081-4-git-send-email-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1475580681-55081-1-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1475580681-55081-1-git-send-email-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [PATCH 3/9] libc-package.bbclass: Add mipsisa{32, 64}r6{el, } support
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
X-List-Received-Date: Tue, 04 Oct 2016 11:31:30 -0000
Content-Type: text/plain

Add support for MIPS Release 6 ISA

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 meta/classes/libc-package.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 8c99d61..84b5c94 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -249,9 +249,13 @@ python package_do_split_gconvs () {
                 "powerpc": " --uint32-align=4 --big-endian ",    \
                 "powerpc64": " --uint32-align=4 --big-endian ",  \
                 "mips":    " --uint32-align=4 --big-endian ",    \
+                "mipsisa32r6":    " --uint32-align=4 --big-endian ",    \
                 "mips64":  " --uint32-align=4 --big-endian ",    \
+                "mipsisa64r6":  " --uint32-align=4 --big-endian ",    \
                 "mipsel":  " --uint32-align=4 --little-endian ", \
+                "mipsisa32r6el":  " --uint32-align=4 --little-endian ", \
                 "mips64el":" --uint32-align=4 --little-endian ", \
+                "mipsisa64r6el":" --uint32-align=4 --little-endian ", \
                 "i586":    " --uint32-align=4 --little-endian ", \
                 "i686":    " --uint32-align=4 --little-endian ", \
                 "x86_64":  " --uint32-align=4 --little-endian "  }
-- 
1.9.1


