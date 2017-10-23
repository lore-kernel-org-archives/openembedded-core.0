Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id CAE4370057
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 16:58:00 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id e64so17535035pfk.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 09:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=lih8RPcdigzR09JTqSL7NcU2mf4WVbNVfNY7KRA4xj8=;
	b=R+o80XoB/ckM1wGc2kpGpLCHkyX220x9BQLCfwPpACXc5gSY9n8BejFLKGIuq+Usiu
	inYO9CWyXJvLpRzslmiV0bgfPPxatAwxvkkj++gum78/7gRoV7E+g/9b1QTT51XVbzgN
	1DVGmxaKvNZR6alKLzKgO7+c4fJtsf4KjTCB9HXTrPMxhukAx8Ze1VeQH5/dFbOxl+nT
	pmpBcDwPgsG5tq4BoNU1is4KYsUk6tJkoYbPdHHZHLl1XKow1tuwgOu7ttINQt2jHx62
	sNRdEkC2AC45em2IvUjxdkKjGUBTnIK+FlIMFa5L3cl8d26PJR+x7t6OSY74GILVbmrJ
	sJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lih8RPcdigzR09JTqSL7NcU2mf4WVbNVfNY7KRA4xj8=;
	b=j91mg8g0/9W5ofwH5/HVmS4I0l/Ot4KxctZk8vrTtO/MF3qw6no+qF3viwbYrJp+yn
	r/FgtlnEM8HY1QrcAAIaofWKeya0sChDzYDpxv3xZSN6PQCnP5bKasKhGNxDEFl+L/dG
	gfS/YmUIm+4xhaG1weFrfcOG7lvz24mqJiKzv93noBKCphVY0MXiUi/aYlUBIUkJ411q
	DYvsy0joFvpzeijiJ2w1NbGrs9UbRJCufUnY6wPGHqwa0LTXPLaeT3b9J30I3M860U1f
	ydudqf+51wYCA8LAkjLVTyANVqJB7RajLpCFEWe7pVldXqFhefEHMUuRdkuGSHak2I7F
	PzPQ==
X-Gm-Message-State: AMCzsaVpsR3aEu+OYqBUBjViZg6J8AsydY/PxpTaKQk78iSAcVQ5geCB
	EvdvlbfEgVWhBY/WHN5+/lo56A==
X-Google-Smtp-Source: ABhQp+QsnBd+izR1KtjnRkWwZWXEwyainYfvU/NfdTxra2eGycWzgPQnFUUFlCTWiTFGW4Xi1V0Vdw==
X-Received: by 10.98.89.208 with SMTP id k77mr14030677pfj.164.1508777881818;
	Mon, 23 Oct 2017 09:58:01 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::d2ab])
	by smtp.gmail.com with ESMTPSA id
	t85sm15693750pfe.138.2017.10.23.09.58.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Oct 2017 09:58:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Oct 2017 09:57:53 -0700
Message-Id: <20171023165753.30830-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.2
Subject: [PATCH V3] libcheck: Upgrade to 0.12.0
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
X-List-Received-Date: Mon, 23 Oct 2017 16:58:00 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes in V3: Upgrade to 0.12.0 and use tarball for SRC_URI

 .../libcheck/{libcheck_0.10.0.bb => libcheck_0.12.0.bb}           | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-support/libcheck/{libcheck_0.10.0.bb => libcheck_0.12.0.bb} (69%)

diff --git a/meta/recipes-support/libcheck/libcheck_0.10.0.bb b/meta/recipes-support/libcheck/libcheck_0.12.0.bb
similarity index 69%
rename from meta/recipes-support/libcheck/libcheck_0.10.0.bb
rename to meta/recipes-support/libcheck/libcheck_0.12.0.bb
index 9d34198a96..3b72f43032 100644
--- a/meta/recipes-support/libcheck/libcheck_0.10.0.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.12.0.bb
@@ -5,11 +5,9 @@ SECTION = "devel"
 LICENSE  = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/check/check-${PV}.tar.gz \
-          "
-
-SRC_URI[md5sum] = "53c5e5c77d090e103a17f3ed7fd7d8b8"
-SRC_URI[sha256sum] = "f5f50766aa6f8fe5a2df752666ca01a950add45079aa06416b83765b1cf71052"
+SRC_URI = "https://github.com/${BPN}/check/archive/${PV}.tar.gz"
+SRC_URI[md5sum] = "4399978b4248761bf55797a5ffa795ec"
+SRC_URI[sha256sum] = "7816b4c38f6e23ff873786f18d966e552837677bfae144041e0587e7c39e04e8"
 
 S = "${WORKDIR}/check-${PV}"
 
-- 
2.14.2


