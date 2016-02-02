Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f196.google.com (mail-ob0-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1BF48771B3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 22:12:47 +0000 (UTC)
Received: by mail-ob0-f196.google.com with SMTP id n6so143160obv.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 14:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9BE3nLbNC9zCgDG0pDqixgSSbdNhf+simobsDgiI8qE=;
	b=b/WGfDw2qjJrsMADUdCiSPlOcFQyguKGDOGHAe0aE/yRE0k3Kzmnf+83xptCmkJDR9
	RKhnkekdptGr21h+gsWVJRi7FcYD+eYCBReHGH4IV0R1EKs+77f+FLvrYYwRCZRMtd9I
	EnnToCm/46XDK1TzP7f2FY6vVQ+MkOTSc19HEZHHkpSyC6kawSL1Iomfrp0t+IjjUvOs
	/FfETFQyzEL0eFHkmM9h7kX1mSJ5ZUdtQiwfubm3kK5PZdhqHBgU2EyNub1BzDOKiCee
	tPASp8HETjZkp/vGqxUx85/OSBWsLbWlE7/Ey6HP/WRSI1dLLFmeimidZY4006GAKH6B
	qMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9BE3nLbNC9zCgDG0pDqixgSSbdNhf+simobsDgiI8qE=;
	b=JqERLwKxznlPb0BdQsl+YEJ4e1yrpp/6RVCVvKLMsHKhBsCJ2rLsLNUymmN0uoy4m2
	YD4NDnPgM+eiZjW2mdTMfcnTU9tfFgMACTUy0UUXR+rJ7ATMA9wA2UlA+EP2I0ifc4P0
	OgrFH2OpJbThHz6C1moZ7/3NAZ6XoMpBYFAc0AsPJdbVZnkYQHBDq1L6x+hgabT79zpT
	Ms7+tMd3Ew7ggffb2DRpTOdzsqstrX/qL/ZSadqsx5kCs9J54xypVChJuCetI22yhD6+
	j2WUJmaf0CBKebAPf2WlC7vzEx5/cAKd3wSY0UVHsPCTiNhmXknCVFWG5nwMRqjYYTXZ
	nsDg==
X-Gm-Message-State: AG10YOT5z8VKRAhBItB+FCvuhWZvwdXFVGr0PqrUH2kblNFMBt4kP1t79Mea+3XdjABubw==
X-Received: by 10.182.114.232 with SMTP id jj8mr25978323obb.19.1454451168481; 
	Tue, 02 Feb 2016 14:12:48 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id q10sm1726245obg.1.2016.02.02.14.12.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Feb 2016 14:12:47 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 14:12:32 -0800
Message-Id: <1454451153-19783-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454451153-19783-1-git-send-email-armccurdy@gmail.com>
References: <1454451153-19783-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/3] gnutls.inc: add gmp to DEPENDS
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
X-List-Received-Date: Tue, 02 Feb 2016 22:12:48 -0000

GnuTLS depends on gmp. The dependency is usually satisfied indirectly
via nettle, but for correctness make it explicit in the gnutls recipe.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/gnutls/gnutls.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index f2d29eb..2c6a8da 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -11,7 +11,7 @@ LICENSE_${PN}-openssl = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.LESSER;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
-DEPENDS = "nettle libidn virtual/libiconv"
+DEPENDS = "nettle gmp libidn virtual/libiconv"
 DEPENDS_append_libc-musl = " argp-standalone"
 
 SHRT_VER = "${@d.getVar('PV', True).split('.')[0]}.${@d.getVar('PV', True).split('.')[1]}"
-- 
1.9.1


