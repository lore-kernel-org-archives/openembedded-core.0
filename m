Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 46F2D65CBD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 07:15:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6A7F19g007639
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 00:15:01 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Jul 2015 00:15:01 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Jul 2015 00:14:52 -0700
Message-ID: <89fa23bde68d834a9b9770a69747a22ade5b416c.1436512030.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1436512030.git.liezhi.yang@windriver.com>
References: <cover.1436512030.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 06/12] mdadm: remove do_configure_prepend
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
X-List-Received-Date: Fri, 10 Jul 2015 07:15:02 -0000
Content-Type: text/plain

There is no '.*ansidecl.h.*/d' in sha1.h any more.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/mdadm/mdadm_3.3.2.bb |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_3.3.2.bb b/meta/recipes-extended/mdadm/mdadm_3.3.2.bb
index 87e06f5..b2fbe4a 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.3.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.3.2.bb
@@ -23,11 +23,6 @@ CFLAGS += "-fno-strict-aliasing"
 
 inherit autotools-brokensep
 
-# We don't DEPEND on binutils for ansidecl.h so ensure we don't use the header
-do_configure_prepend () {
-	sed -i -e '/.*ansidecl.h.*/d' ${S}/sha1.h
-}
-
 EXTRA_OEMAKE = "CHECK_RUN_DIR=0"
 # PPC64 and MIPS64 uses long long for u64 in the kernel, but powerpc's asm/types.h
 # prevents 64-bit userland from seeing this definition, instead defaulting
-- 
1.7.9.5


