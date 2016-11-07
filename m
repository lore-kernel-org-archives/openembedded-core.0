Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp01.imgtec.com [195.59.15.196])
	by mail.openembedded.org (Postfix) with ESMTP id BE4DF71A91
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2016 15:16:53 +0000 (UTC)
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id 8CCBD980AC555;
	Mon,  7 Nov 2016 15:01:38 +0000 (GMT)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Mon, 7 Nov 2016 15:01:41 +0000
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 Nov 2016 15:01:24 +0000
Message-ID: <20161107150135.40266-3-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161107150135.40266-1-Zubair.Kakakhel@imgtec.com>
References: <20161107150135.40266-1-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [Patch 02/13] bitbake.conf: Reduce duplication in MIPS variants
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
 meta/conf/bitbake.conf | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9f445bb..1472e8f 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -533,16 +533,7 @@ BUILDSDK_LDFLAGS = "-Wl,-O1"
 
 LINKER_HASH_STYLE ??= "gnu"
 # mips does not support GNU hash style therefore we override
-LINKER_HASH_STYLE_mips = "sysv"
-LINKER_HASH_STYLE_mipsel = "sysv"
-LINKER_HASH_STYLE_mips64 = "sysv"
-LINKER_HASH_STYLE_mips64el = "sysv"
-LINKER_HASH_STYLE_mips64n32 = "sysv"
-LINKER_HASH_STYLE_mips64eln32 = "sysv"
-LINKER_HASH_STYLE_mipsisa32r6 = "sysv"
-LINKER_HASH_STYLE_mipsisa32r6el = "sysv"
-LINKER_HASH_STYLE_mipsisa64r6 = "sysv"
-LINKER_HASH_STYLE_mipsisa64r6el = "sysv"
+LINKER_HASH_STYLE_mipsarch = "sysv"
 
 TARGET_LINK_HASH_STYLE ?= "${@['-Wl,--hash-style=gnu',''][d.getVar('LINKER_HASH_STYLE', True) != 'gnu']}"
 
-- 
2.10.2


