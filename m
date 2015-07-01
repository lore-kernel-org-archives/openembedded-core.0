Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7AE4E75C1B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 18:25:06 +0000 (UTC)
Received: by iecuq6 with SMTP id uq6so40527164iec.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jul 2015 11:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=9jtAD3TU6MBFfZLC+yK0MoWkQAJ51N4akK/yEm2rJqo=;
	b=0+7N3SU7nCzQTyGcVGzfrH5DVIhfEULP2euvs5TVuUx2Qqn2KxEDWUKYBHvwrcZi8e
	7EgQEGmyDBuVL4yyJmVmnxxrulXxTDmhYgA3OO14Cok56B7C3KQHu+F0NcnQtH7/O+im
	yoVoxv31Jx07ZcIRJZTp/OrELFaLb1B0AXoe+FjUQE6Du2JAVFHG0C3mMY4hMZlRSnn7
	PE59k6HnVPCkhZatAnyjjcKxycG64W86fOXivbzKQopWDXbX8L1G31dFbHT/eA/FTvst
	gcBwJdN8TOB1ZEXVxuvi6Lri+fGOxTCIBnX2VIAFtXROMjz2lEHQpTU16k72GSdH2K41
	7p+Q==
X-Received: by 10.50.13.10 with SMTP id d10mr35450750igc.20.1435775106363;
	Wed, 01 Jul 2015 11:25:06 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id p4sm2229179igg.20.2015.07.01.11.25.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Jul 2015 11:25:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jul 2015 11:24:57 -0700
Message-Id: <3c1c53be8908edda0a95c715c82ece1bc5012997.1435774899.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <4ce9590460509b82d8fec5b0423049b1be8912b2.1435774899.git.raj.khem@gmail.com>
References: <4ce9590460509b82d8fec5b0423049b1be8912b2.1435774899.git.raj.khem@gmail.com>
In-Reply-To: <cover.1435774899.git.raj.khem@gmail.com>
References: <cover.1435774899.git.raj.khem@gmail.com>
Subject: [PATCH 6/6] gdb: Disable lttng support for musl
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
X-List-Received-Date: Wed, 01 Jul 2015 18:25:08 -0000

lttng-ust is too much dependent on glibc dlfcn code
disable it for musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-common.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 81af42f..166ba8e 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -14,6 +14,7 @@ LTTNGUST_mips64el = ""
 LTTNGUST_mips64n32 = ""
 LTTNGUST_mips64eln32 = ""
 LTTNGUST_sh4 = ""
+LTTNGUST_libc-musl = ""
 
 INC_PR = "r0"
 
-- 
2.1.4


