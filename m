Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EAF62731AF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 05:50:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u3M5ofsS011152
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 22:50:41 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 21 Apr 2016 22:50:41 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Apr 2016 22:50:37 -0700
Message-ID: <0024e209ee398278253e35ff9ceba173b9faaa4b.1461304177.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1461304177.git.liezhi.yang@windriver.com>
References: <cover.1461304177.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] cogl-1.0: set COMPATIBLE_HOST_armv4 to null
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
X-List-Received-Date: Fri, 22 Apr 2016 05:50:41 -0000
Content-Type: text/plain

It doesn't build with armv4:
cogl-texture-deprecated.c  -fPIC -DPIC -o deprecated/.libs/cogl-texture-deprecated.o
{standard input}: Assembler messages:
{standard input}:831: Error: selected processor does not support `clz r3,r0' in ARM mode
make[4]: *** [deprecated/cogl-fixed.lo] Error 1
[snip]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-graphics/cogl/cogl-1.0.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
index 690ea3b..7a79aa7 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0.inc
+++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
@@ -73,3 +73,5 @@ FILES_libcogl-path = "${libdir}/libcogl-path${SOLIBS}"
 RPROVIDES_libcogl = "cogl-1.0"
 RCONFLICTS_libcogl = "cogl-1.0"
 RREPLACES_libcogl = "cogl-1.0"
+
+COMPATIBLE_HOST_armv4 = 'null'
-- 
2.8.0


