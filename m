Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7CAE26011C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 05:50:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3M5oetx004604
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 22:50:40 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 21 Apr 2016 22:50:39 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Apr 2016 22:50:35 -0700
Message-ID: <bc384f220d721314dc66c998a44b7019372e84e4.1461304177.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1461304177.git.liezhi.yang@windriver.com>
References: <cover.1461304177.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] webkitgtk: set COMPATIBLE_HOST_armv4 to null
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
X-List-Received-Date: Fri, 22 Apr 2016 05:50:39 -0000
Content-Type: text/plain

It doesn't build with armv4:
{standard input}: Assembler messages:
{standard input}:52: Error: selected processor does not support `blx llint_throw_stack_overflow_error' in ARM mode
{standard input}:126: Error: selected processor does not support `bkpt #0' in ARM mode
{standard input}:128: Error: selected processor does not support `blx r0' in ARM mode
{standard input}:134: Error: selected processor does not support `bkpt #0' in ARM mode
{standard input}:185: Error: selected processor does not support `blx llint_throw_stack_overflow_error' in ARM mode
{standard input}:256: Error: selected processor does not support `blx r4' in ARM mode
{standard input}:310: Error: selected processor does not support `movw r2,#:lower16:.Lllint_op_enter-.LrelativePCBase' in ARM mode
{standard input}:311: Error: selected processor does not support `movt r2,#:upper16:.Lllint_op_enter-.LrelativePCBase' in ARM mode
{standard input}:315: Error: selected processor does not support `movw r2,#:lower16:.Lllint_op_get_scope-.LrelativePCBase' in ARM mode
{standard input}:316: Error: selected processor does not support `movt r2,#:upper16:.Lllint_op_get_scope-.LrelativePCBase' in ARM mode
[snip]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.10.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.10.7.bb b/meta/recipes-sato/webkit/webkitgtk_2.10.7.bb
index 8eb6b9f..ff26c8c 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.10.7.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.10.7.bb
@@ -86,3 +86,4 @@ ARM_INSTRUCTION_SET = "arm"
 # Segmentation fault
 EXTRA_OECMAKE_append_powerpc = " -DENABLE_INTROSPECTION=OFF "
 
+COMPATIBLE_HOST_armv4 = 'null'
-- 
2.8.0


