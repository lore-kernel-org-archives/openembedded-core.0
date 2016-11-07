Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp01.imgtec.com [195.59.15.196])
	by mail.openembedded.org (Postfix) with ESMTP id BCF7D71A77
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2016 15:16:53 +0000 (UTC)
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id 7F3FE7E65ADBE;
	Mon,  7 Nov 2016 15:01:44 +0000 (GMT)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Mon, 7 Nov 2016 15:01:47 +0000
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 Nov 2016 15:01:32 +0000
Message-ID: <20161107150135.40266-11-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161107150135.40266-1-Zubair.Kakakhel@imgtec.com>
References: <20161107150135.40266-1-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [Patch 10/13] ghostscript: Reduce duplication in MIPS variants.
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
X-List-Received-Date: Mon, 07 Nov 2016 15:16:55 -0000
Content-Type: text/plain

Reduce duplication in MIPS variants now that the MACHINEOVERRIDES
variable is defined

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 meta/recipes-extended/ghostscript/ghostscript_9.19.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.19.bb b/meta/recipes-extended/ghostscript/ghostscript_9.19.bb
index fe2016b..52f6fe3 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.19.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.19.bb
@@ -46,8 +46,8 @@ EXTRA_OECONF = "--without-x --with-system-libtiff --without-jbig2dec \
                 --with-cups-datadir=${datadir}/cups \
                 "
 
-EXTRA_OECONF_append_mips = " --with-large_color_index=0"
-EXTRA_OECONF_append_mipsel = " --with-large_color_index=0"
+EXTRA_OECONF_append_mipsarcho32 = " --with-large_color_index=0"
+EXTRA_OECONF_append_mipsarcho32el = " --with-large_color_index=0"
 
 # Explicity disable libtiff, fontconfig,
 # freetype, cups for ghostscript-native
-- 
2.10.2


