Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 003D2756D3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 09:57:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t4S9vU3r016914
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 02:57:30 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 28 May 2015 02:57:30 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 May 2015 02:57:26 -0700
Message-ID: <82e41d2eb772758c3c8838e7e640b25031348b06.1432805258.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1432805258.git.liezhi.yang@windriver.com>
References: <cover.1432805258.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 8/9] nasm: 2.11.06 -> 2.11.08
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
X-List-Received-Date: Thu, 28 May 2015 09:57:29 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../nasm/{nasm_2.11.06.bb => nasm_2.11.08.bb}      |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/nasm/{nasm_2.11.06.bb => nasm_2.11.08.bb} (81%)

diff --git a/meta/recipes-devtools/nasm/nasm_2.11.06.bb b/meta/recipes-devtools/nasm/nasm_2.11.08.bb
similarity index 81%
rename from meta/recipes-devtools/nasm/nasm_2.11.06.bb
rename to meta/recipes-devtools/nasm/nasm_2.11.08.bb
index 4a69a6a..e0724e6 100644
--- a/meta/recipes-devtools/nasm/nasm_2.11.06.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.11.08.bb
@@ -6,8 +6,9 @@ COMPATIBLE_HOST = '(x86_64|i.86).*-(linux|freebsd.*)'
 
 
 SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 "
-SRC_URI[md5sum] = "9d93e8df5f5c005567f47ed6ca3a93d4"
-SRC_URI[sha256sum] = "87b6d97d6981ca468f9dafda44cf1bb1ba122cec329d4d389af5db04fa0c3e6c"
+
+SRC_URI[md5sum] = "7aae5cb8e03fac48029c82a7470ab066"
+SRC_URI[sha256sum] = "9da3a0291a0bdc06305b7ba194f1e2c2b55ae6f11210b4af43729868149d5445"
 
 inherit autotools-brokensep
 
-- 
1.7.9.5


