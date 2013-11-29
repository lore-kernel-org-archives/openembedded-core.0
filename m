Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B28316D84F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 06:07:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAT67YNw016364
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2013 22:07:34 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Thu, 28 Nov 2013 22:07:33 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Nov 2013 14:07:33 +0800
Message-ID: <1385705253-12512-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] webkit: block to build webkit on mips64 with libn32 ABI
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
X-List-Received-Date: Fri, 29 Nov 2013 06:07:35 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

To mips64 libn32, The HOST_SYS is mips64-*-linux-gnun32, the COMPATIBLE_HOST
is mips64.*-linux, the regular expression matching both will return true. so
append the ending position word into COMPATIBLE_HOST to make match failure

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
index 3581de3..8c78b5b 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
@@ -32,7 +32,7 @@ SRC_URI[md5sum] = "dcbf9d5e2e6391f857c29a57528b32a6"
 SRC_URI[sha256sum] = "ada02d636af61aed38f142d3cded662d141ce71264f624c4eb873621a74cc9e7"
 
 # webkit-gtk can NOT be built on MIPS64 with n32 ABI
-COMPATIBLE_HOST_mips64 = "mips64.*-linux"
+COMPATIBLE_HOST_mips64 = "mips64.*-linux$"
 
 inherit autotools lib_package gtk-doc pkgconfig
 
-- 
1.7.10.4


