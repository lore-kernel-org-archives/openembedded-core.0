Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 326786059E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 06:21:18 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id u26so11575514pfd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Jun 2017 23:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Ze1PeT0c5BHoHO/TsjMq+biV8uEbLDqmFdqPjdXa3kc=;
	b=rnUUyi5RFkgHALDZDhdugua043/QHGkNS4kI9TviM13G+inOAhSF8J0SDsEsp066hQ
	0gz7jcjCDT+Kiv32LBbdEZsldbKfFasaJ0y4Z9TRorkEvmQY97cSuswuSkWpUXESro/T
	B4tasYrptaIxkM3qmdUGHnzgcYrl3slhZ+0ziDxyr85/l3x3SnFMOR9XOSHeLwSKgX0/
	MA/dzt+ZzOziaa6n/xR+onyszzeQc1CLFpmXPx37D8UBpJmbCOtIVz9zNsJF+8bkFnJj
	j2LrVvlykLgk5CzYnX8L97QYZmJnGfdoV7Tvp2C9JOyDAMQutwxF2Qgt59qj1QDEsxcg
	zGUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ze1PeT0c5BHoHO/TsjMq+biV8uEbLDqmFdqPjdXa3kc=;
	b=Io81rVUYpG2C8tS/yhUF5/wtIDBj47XIDQrRFBajt1HNNXbYc63f3wMM0kpD1g0CFs
	EOFS12ouGAtTBDVchHagf9TpgkMC+Z3UfQAdX5TR0ff9rOH1VdOBTLZzvp2Z/zN5xBky
	qgbfoWIkZbr7++eA8Qbo2pIJD8+8UiMAELwBMJxr6CQNRpdpEfkrZLHDta5Hnbw9DmgJ
	88eLpd8ad6DV3lV/PTWXtnw3bTAomDbWRL9MkbuG9rgk0iTlnpvgifNhN/1Ssv3eehZV
	4m2kzHLVKCpRw4pVXEVhBU2D8WyqEh9PzdzU4wTal9ab5NJrUhaCPSiC1W5iIBVJTxoh
	YN+Q==
X-Gm-Message-State: AODbwcDIxYY1nxPMQg5ihryZA9i8gFISjjzhUlvfL5oKDNxgs/e6ADC2
	rsh15iSWdyTaEg==
X-Received: by 10.84.150.129 with SMTP id h1mr11594666plh.149.1496384480114;
	Thu, 01 Jun 2017 23:21:20 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::cf4])
	by smtp.gmail.com with ESMTPSA id
	o89sm39796844pfj.88.2017.06.01.23.21.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Jun 2017 23:21:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Jun 2017 23:21:08 -0700
Message-Id: <20170602062108.34496-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
Subject: [PATCH] tcf-agent: Add missing leading space to CFLAGS appends
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
X-List-Received-Date: Fri, 02 Jun 2017 06:21:19 -0000

Its a typo, that we see when building with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index 1dad825fda..de627e09e8 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -36,13 +36,13 @@ MAKE_OS = "`echo ${TARGET_OS} | sed s,^linux.*,GNU/Linux,`"
 EXTRA_OEMAKE = "MACHINE=${MAKE_ARCH} OPSYS=${MAKE_OS} 'CC=${CC}' 'AR=${AR}'"
 
 # These features don't compile on mips and libc-musl
-CFLAGS_mips_append = "-DSERVICE_RunControl=0 -DSERVICE_Breakpoints=0 \
+CFLAGS_mips_append = " -DSERVICE_RunControl=0 -DSERVICE_Breakpoints=0 \
     -DSERVICE_Memory=0 -DSERVICE_Registers=0 -DSERVICE_MemoryMap=0 \
     -DSERVICE_StackTrace=0 -DSERVICE_Expressions=0"
-CFLAGS_mips64_append = "-DSERVICE_RunControl=0 -DSERVICE_Breakpoints=0 \
+CFLAGS_mips64_append = " -DSERVICE_RunControl=0 -DSERVICE_Breakpoints=0 \
     -DSERVICE_Memory=0 -DSERVICE_Registers=0 -DSERVICE_MemoryMap=0 \
     -DSERVICE_StackTrace=0 -DSERVICE_Expressions=0"
-CFLAGS_append_libc-musl = "-DSERVICE_RunControl=0 -DSERVICE_Breakpoints=0 \
+CFLAGS_append_libc-musl = " -DSERVICE_RunControl=0 -DSERVICE_Breakpoints=0 \
     -DSERVICE_Memory=0 -DSERVICE_Registers=0 -DSERVICE_MemoryMap=0 \
     -DSERVICE_StackTrace=0 -DSERVICE_Expressions=0"
 
-- 
2.13.0


