Return-Path: <alexey.brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (us01smtprelay-2.synopsys.com
	[198.182.47.9])
	by mail.openembedded.org (Postfix) with ESMTP id 570B06C1B8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2018 13:09:43 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost2.synopsys.com [10.13.184.66])
	by smtprelay.synopsys.com (Postfix) with ESMTP id 204AE24E11EC;
	Mon, 12 Nov 2018 05:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1542028184; bh=Z6uKk/F5IkKa5mRvRMjbDJbRUISLOnf1cCgSMAYeJVc=;
	h=From:To:Cc:Subject:Date:From;
	b=D1nZ3ZLZrybjgXaOIqbu/Efi0OSml0lS5PpatjMZ3qk857ZcJ9aRz/jOG3Q2/MUsN
	q8UaZyBi7unY0Krchw/d3G1wKR2xqF5ZghYtlWrTW0V9iTO8D+QRUcv+Mj20rABJn+
	+K7gRIkHa2ZDyK2i0Ka94VUcGl8qTjHXKP3Lp+eXzRINvMMCwMHELdlhS2xosAsGvM
	P8Kwy/ZowjFJzD7uyxuA9+gLozGWNU37hfWR++v0g6xBSWyAcy7sBVljjgvA1Clrn2
	D+rouaQgzX5CIQhTBBQVys65bpzt7zOXnGjyzrgrQrh6RICSdIolHNnuy/hUI9HFA8
	Uz1WeNtVGH7Fg==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id 7AE91392B;
	Mon, 12 Nov 2018 05:09:42 -0800 (PST)
From: Alexey Brodkin <alexey.brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Nov 2018 16:09:38 +0300
Message-Id: <20181112130938.7781-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
Cc: linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <alexey.brodkin@synopsys.com>
Subject: [PATCH] packagegroup-core-sdk: Disable SANITIZERS for ARC
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
X-List-Received-Date: Mon, 12 Nov 2018 13:09:43 -0000

Sanitizers are not yet supported on ARC.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-sdk.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index 45e8c13585..15d0989b76 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -27,6 +27,7 @@ RDEPENDS_packagegroup-core-sdk = "\
     tcl"
 
 SANITIZERS = "libasan-dev libubsan-dev"
+SANITIZERS_arc = ""
 SANITIZERS_microblaze = ""
 SANITIZERS_mipsarch = ""
 SANITIZERS_nios2 = ""
-- 
2.16.2


