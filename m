Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 182517846C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 01:32:32 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id y19so857301lfd.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Feb 2018 17:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=rUJaZOrjhaNG9M/QDGTMR9MekIwm5ZHJ/mQo6OZDdsc=;
	b=zbaKqPxs85qfJdwJn06xvepuwda7nDONV/GLctZkE50ta2vZ+oZQtS22wNjVVnpEjf
	8F2Vt3AEqn2MdIFfAxtzwnqGNCJPTTxyFzXbiy0IhkyFK1ZgiGQmVYpLElYGXqAqyyZ0
	Q/mjPOdk5YNnX9e06IBzoTFv2q898pe5jmk1R4RZMFdagdc85B8UyS70vyADWYhtsabv
	Vsr40yZH6tmDBSoZXKXws6M+cltrVCNEGwu8n49FMAfAXJoU/44fy+jIm2J0qphByKxE
	ncwvibbMXJqKQfhJQokwWngbioeB13iQ6okN9wF6vewEPw0qUlkqaY/AnFe2WF8rGmru
	xnww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rUJaZOrjhaNG9M/QDGTMR9MekIwm5ZHJ/mQo6OZDdsc=;
	b=HRvIsgAGgCqGgLMsuCqyO4UFXkm8HZwk1AdebvYgWUh5HVV4gQ9olF23pUcG0LCLoJ
	lOXY4t+44f5Mre7JQmFDTrPYJ2ZxHk6FzakdZT6NReZUslfme5mXYtK+ugVJE6TTsmEw
	RMvyRiXm0I1zeCw+rre4U9iBLgNJJKNutnzBMQx4+wsj1ZZ3OqtKdOpvnRFD3zQUxlPJ
	dmNGK+CmUOPkuZ1sd7srA/AXey4itjVMfQlu3xYuHoHICeWFTTCcUSOsd/z+hYZRGqo+
	FUnYvtTILIRHSAcVxIi+gcvj2EV5tcZbBGIP0TMRJE3B7Kq7RUr0S56qpFpGFJ9zxpUE
	q3Sw==
X-Gm-Message-State: APf1xPD3MATyGNkCTl2aXv0R6mM6jbvnSHYvU/nZmwt+8NfVwEvxwOgh
	IvH/yocD5ykkCoLK164kZxTyTUx8hv4=
X-Google-Smtp-Source: AH8x2253SP9mOeuOSPcx3dTdndwENZhu8TpCx0KSUHx5tUzSgHxeIVZoYDr3oDUavZE+nCOif3T1Kw==
X-Received: by 10.25.216.74 with SMTP id p71mr9048320lfg.11.1519003953119;
	Sun, 18 Feb 2018 17:32:33 -0800 (PST)
Received: from localhost.localdomain ([2a04:ae08:1403:ff00:80ad:a8be:d6c:2b2c])
	by smtp.gmail.com with ESMTPSA id 5sm4671501ljv.29.2018.02.18.17.32.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Feb 2018 17:32:32 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Feb 2018 02:32:08 +0100
Message-Id: <20180219013209.21401-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.14.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH 1/2] libmpc: fix SRC_URI
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
X-List-Received-Date: Mon, 19 Feb 2018 01:32:34 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-support/libmpc/libmpc_1.0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libmpc/libmpc_1.0.3.bb b/meta/recipes-support/libmpc/libmpc_1.0.3.bb
index 9c8c5f643f..d37de3831a 100644
--- a/meta/recipes-support/libmpc/libmpc_1.0.3.bb
+++ b/meta/recipes-support/libmpc/libmpc_1.0.3.bb
@@ -3,7 +3,7 @@ require libmpc.inc
 DEPENDS = "gmp mpfr"
 
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02"
-SRC_URI = "http://www.multiprecision.org/mpc/download/mpc-${PV}.tar.gz"
+SRC_URI = "https://ftp.gnu.org/gnu/mpc/mpc-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "d6a1d5f8ddea3abd2cc3e98f58352d26"
 SRC_URI[sha256sum] = "617decc6ea09889fb08ede330917a00b16809b8db88c29c31bfbb49cbf88ecc3"
-- 
2.14.1


