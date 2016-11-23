Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp01.imgtec.com [195.59.15.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0367D6072C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 13:47:45 +0000 (UTC)
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id 49AA1D9C435BB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 13:47:42 +0000 (GMT)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Wed, 23 Nov 2016 13:47:45 +0000
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Nov 2016 13:47:33 +0000
Message-ID: <20161123134733.38276-8-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123134733.38276-1-Zubair.Kakakhel@imgtec.com>
References: <20161123134733.38276-1-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [Patch 7/7] ghostscript: Use MIPS MACHINE_OVERRIDES for objarch.h
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
X-List-Received-Date: Wed, 23 Nov 2016 13:47:45 -0000
Content-Type: text/plain

MIPS MACHINE_OVERRIDES can be used to provide the same objarch.h
files for MIPS pre-R2 and R6 ISA versions.

Use them to reduce duplication in supporting MIPS R6 ISA

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 .../ghostscript/ghostscript/{mips64 => mipsarchn32eb}/objarch.h           | 0
 .../ghostscript/ghostscript/{mips64el => mipsarchn32el}/objarch.h         | 0
 .../ghostscript/ghostscript/{mips64n32 => mipsarchn64eb}/objarch.h        | 0
 .../ghostscript/ghostscript/{mips64eln32 => mipsarchn64el}/objarch.h      | 0
 .../ghostscript/ghostscript/{mips => mipsarcho32eb}/objarch.h             | 0
 .../ghostscript/ghostscript/{mipsel => mipsarcho32el}/objarch.h           | 0
 6 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-extended/ghostscript/ghostscript/{mips64 => mipsarchn32eb}/objarch.h (100%)
 rename meta/recipes-extended/ghostscript/ghostscript/{mips64el => mipsarchn32el}/objarch.h (100%)
 rename meta/recipes-extended/ghostscript/ghostscript/{mips64n32 => mipsarchn64eb}/objarch.h (100%)
 rename meta/recipes-extended/ghostscript/ghostscript/{mips64eln32 => mipsarchn64el}/objarch.h (100%)
 rename meta/recipes-extended/ghostscript/ghostscript/{mips => mipsarcho32eb}/objarch.h (100%)
 rename meta/recipes-extended/ghostscript/ghostscript/{mipsel => mipsarcho32el}/objarch.h (100%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/mips64/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/mipsarchn32eb/objarch.h
similarity index 100%
rename from meta/recipes-extended/ghostscript/ghostscript/mips64/objarch.h
rename to meta/recipes-extended/ghostscript/ghostscript/mipsarchn32eb/objarch.h
diff --git a/meta/recipes-extended/ghostscript/ghostscript/mips64el/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/mipsarchn32el/objarch.h
similarity index 100%
rename from meta/recipes-extended/ghostscript/ghostscript/mips64el/objarch.h
rename to meta/recipes-extended/ghostscript/ghostscript/mipsarchn32el/objarch.h
diff --git a/meta/recipes-extended/ghostscript/ghostscript/mips64n32/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/mipsarchn64eb/objarch.h
similarity index 100%
rename from meta/recipes-extended/ghostscript/ghostscript/mips64n32/objarch.h
rename to meta/recipes-extended/ghostscript/ghostscript/mipsarchn64eb/objarch.h
diff --git a/meta/recipes-extended/ghostscript/ghostscript/mips64eln32/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/mipsarchn64el/objarch.h
similarity index 100%
rename from meta/recipes-extended/ghostscript/ghostscript/mips64eln32/objarch.h
rename to meta/recipes-extended/ghostscript/ghostscript/mipsarchn64el/objarch.h
diff --git a/meta/recipes-extended/ghostscript/ghostscript/mips/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/mipsarcho32eb/objarch.h
similarity index 100%
rename from meta/recipes-extended/ghostscript/ghostscript/mips/objarch.h
rename to meta/recipes-extended/ghostscript/ghostscript/mipsarcho32eb/objarch.h
diff --git a/meta/recipes-extended/ghostscript/ghostscript/mipsel/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/mipsarcho32el/objarch.h
similarity index 100%
rename from meta/recipes-extended/ghostscript/ghostscript/mipsel/objarch.h
rename to meta/recipes-extended/ghostscript/ghostscript/mipsarcho32el/objarch.h
-- 
2.10.2


