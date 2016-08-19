Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DDC5F755F8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 01:29:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7J1TJPH023475
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 18:29:19 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 18 Aug 2016 18:29:18 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Aug 2016 18:29:16 -0700
Message-ID: <a1444b28e89558d494b40d93eca4150c49fbe854.1471570130.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1471570130.git.liezhi.yang@windriver.com>
References: <cover.1471570130.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] kbd: remove PARALLEL_MAKEINST = ""
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
X-List-Received-Date: Fri, 19 Aug 2016 01:29:19 -0000
Content-Type: text/plain

There isn't anything wrong when looked into its Makefile, I guess that
it had been fixed during ugprade, and I've applied this patch locally
for more than 2 months, there isn't anything wrong.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/kbd/kbd_2.0.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/kbd/kbd_2.0.3.bb b/meta/recipes-core/kbd/kbd_2.0.3.bb
index 858dc05..ea1e0b4 100644
--- a/meta/recipes-core/kbd/kbd_2.0.3.bb
+++ b/meta/recipes-core/kbd/kbd_2.0.3.bb
@@ -32,4 +32,3 @@ ALTERNATIVE_${PN} = "chvt deallocvt fgconsole openvt"
 ALTERNATIVE_PRIORITY = "100"
 
 BBCLASSEXTEND = "native"
-PARALLEL_MAKEINST = ""
-- 
2.9.0


