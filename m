Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp01.imgtec.com [195.59.15.196])
	by mail.openembedded.org (Postfix) with ESMTP id 62B2D71A8E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 17:12:43 +0000 (UTC)
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id 1DA0C817A1EDE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 17:12:40 +0000 (GMT)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Tue, 8 Nov 2016 17:12:43 +0000
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Nov 2016 17:12:25 +0000
Message-ID: <20161108171235.41837-5-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161108171235.41837-1-Zubair.Kakakhel@imgtec.com>
References: <20161108171235.41837-1-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [Patch v2 04/14] fts: Reduce duplication in MIPS variants.
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
X-List-Received-Date: Tue, 08 Nov 2016 17:12:43 -0000
Content-Type: text/plain

Reduce duplication in MIPS variants now that the MACHINEOVERRIDES
variable is defined

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 meta/recipes-core/fts/fts.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-core/fts/fts.bb b/meta/recipes-core/fts/fts.bb
index 9d8230f..de9297e 100644
--- a/meta/recipes-core/fts/fts.bb
+++ b/meta/recipes-core/fts/fts.bb
@@ -22,10 +22,7 @@ S = "${WORKDIR}/${BPN}"
 
 do_configure[noexec] = "1"
 
-HASHSTYLE_mips = "sysv"
-HASHSTYLE_mipsel = "sysv"
-HASHSTYLE_mips64 = "sysv"
-HASHSTYLE_mips64el = "sysv"
+HASHSTYLE_mipsarch = "sysv"
 HASHSTYLE = "gnu"
 
 VER = "0"
-- 
2.10.2


