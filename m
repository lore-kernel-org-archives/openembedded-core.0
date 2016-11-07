Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7620D6078E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2016 08:16:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uA78GPbc026309
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Nov 2016 00:16:25 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 7 Nov 2016 00:16:24 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 Nov 2016 16:15:41 +0800
Message-ID: <20161107081541.14964-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [PATCH] packagegroup-core-sdk: Disable sanitizers for mips64el
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
X-List-Received-Date: Mon, 07 Nov 2016 08:16:24 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

These are not available on mips64el yet, so disable them.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-sdk.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index aceba78..9c4ea9b 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -31,6 +31,7 @@ SANITIZERS_aarch64 = ""
 SANITIZERS_mips = ""
 SANITIZERS_mipsel = ""
 SANITIZERS_mips64 = ""
+SANITIZERS_mips64el = ""
 SANITIZERS_mips64n32 = ""
 SANITIZERS_nios2 = ""
 SANITIZERS_powerpc64 = ""
-- 
2.8.3


