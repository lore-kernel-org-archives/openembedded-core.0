Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp01.imgtec.com [195.59.15.196])
	by mail.openembedded.org (Postfix) with ESMTP id CAD93770FF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2016 16:17:30 +0000 (UTC)
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id C97A533C2EB4C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2016 17:01:48 +0100 (IST)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Fri, 2 Sep 2016 17:01:51 +0100
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Sep 2016 17:01:40 +0100
Message-ID: <1472832102-8067-3-git-send-email-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1472832102-8067-1-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1472832102-8067-1-git-send-email-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [PATCH 2/4] packagegroup: Disable packages not available on mipsel
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
X-List-Received-Date: Fri, 02 Sep 2016 16:17:31 -0000
Content-Type: text/plain

These are not available on mipsel yet so disable them

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 55e9c6f..dd98445 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -37,6 +37,7 @@ SYSTEMTAP = "systemtap"
 SYSTEMTAP_libc-uclibc = ""
 SYSTEMTAP_libc-musl = ""
 SYSTEMTAP_mips = ""
+SYSTEMTAP_mipsel = ""
 SYSTEMTAP_mips64 = ""
 SYSTEMTAP_mips64n32 = ""
 SYSTEMTAP_nios2 = ""
@@ -65,6 +66,7 @@ VALGRIND = "valgrind"
 VALGRIND_libc-uclibc = ""
 VALGRIND_libc-musl = ""
 VALGRIND_mips = ""
+VALGRIND_mipsel = ""
 VALGRIND_mips64 = ""
 VALGRIND_mips64n32 = ""
 VALGRIND_nios2 = ""
-- 
1.9.1


