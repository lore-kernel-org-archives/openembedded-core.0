Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 621F278414
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 15:38:40 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id j16so7392962pgn.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 07:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8ORAo1s/ryNivmU0V3oQ7aK9HUjgJTv5FM66UL3/9wk=;
	b=VOiwKRWhC1ioYS9UlYo0tbH8IqXESXhZYeyvsLsDqYMU3S/71J10+sikcVm8BlbNsJ
	zC/5WL9P+q5KkBAZzoX35maVfU+d3CeYioBKp0OOujISqElOFVMnZuK8l/Vh0JXG/hj6
	O2HkacUAy6HXjOcdJoZXF+SbxKRaxu5pF8WtP2j1OPAkcTqKzeBwuYH1sP02s/Pk88nO
	WkQBlt3tNUERX4ES7QU4mimGx2XD5ziz6pNowHLBVNT5eaDgGdJEvJxITJpqk2MoZoWd
	AWYHr7FurTJsGFJWGhrf0lxlGhALUo6dwVPBDenZ5vn1XMogbtvAE7o2jZV6JoGjLkMI
	q/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8ORAo1s/ryNivmU0V3oQ7aK9HUjgJTv5FM66UL3/9wk=;
	b=RhyOLmamID6KTYEDfhDThXFomQwTbPzLWsBTg6VwW1/eerCw9rRDpKC9QBmkLe87f4
	eoL2aS130VCG1ETprPpVnOFmlydx4RnYZue/eI1ZFy2QtdOEDTVxfqWJrrMBvG+HpRjc
	Uj7GMI2/MeY3oeIcfRvHfVSAT72wFmn651OXxRPTQhOsvv688zBDmkbKHr4b1zi2Pe92
	Pc/MCMVZ15PGRlRFIwqoKoaG7cKQmPfG2/tR2cw5zPgqf+A9ddg7aab3UmjjlJ0kQwjQ
	A0rPdCo0U2BvTHr8XtP4v1+urvmLNKIiQyQSdRIgvtNeT3oYONQSGJ/HfTp0j+la9K9J
	JBaA==
X-Gm-Message-State: AJaThX4ibUUJq0J6iCQj9NLzONFZwhioLXcPOVuujg1l7moqZXWgFjMy
	GGvaQ2f0BZ1WLH6rNZVe1OOGCQ==
X-Google-Smtp-Source: AGs4zMYnQ+8ymaXS+gl0J3ZX9zmB9Z+C9J/7wWz0+dmGCTbDL1wzY2fxGc0fx61YIcrnoB6rcBiFYA==
X-Received: by 10.98.207.71 with SMTP id b68mr10265632pfg.125.1510587521327;
	Mon, 13 Nov 2017 07:38:41 -0800 (PST)
Received: from ip-172-31-1-64.ap-northeast-2.compute.internal
	(ec2-13-124-121-69.ap-northeast-2.compute.amazonaws.com.
	[13.124.121.69]) by smtp.gmail.com with ESMTPSA id
	n72sm38257984pfi.92.2017.11.13.07.38.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Nov 2017 07:38:40 -0800 (PST)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Nov 2017 15:38:34 +0000
Message-Id: <1510587514-43641-1-git-send-email-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] ethtool: upgrade to 4.13
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
X-List-Received-Date: Mon, 13 Nov 2017 15:38:40 -0000

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 meta/recipes-extended/ethtool/{ethtool_4.11.bb => ethtool_4.13.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_4.11.bb => ethtool_4.13.bb} (88%)

diff --git a/meta/recipes-extended/ethtool/ethtool_4.11.bb b/meta/recipes-extended/ethtool/ethtool_4.13.bb
similarity index 88%
rename from meta/recipes-extended/ethtool/ethtool_4.11.bb
rename to meta/recipes-extended/ethtool/ethtool_4.13.bb
index befe9b9..c862a57 100644
--- a/meta/recipes-extended/ethtool/ethtool_4.11.bb
+++ b/meta/recipes-extended/ethtool/ethtool_4.13.bb
@@ -11,8 +11,8 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[md5sum] = "8f1072679888c9335e49b17efb798b4c"
-SRC_URI[sha256sum] = "af2fd9692f3159d3ab1e41e6f9b7d8db2a4693f1cb22348c88ba89f70f0e6503"
+SRC_URI[md5sum] = "2ba44eb0ca96752392e9bf8dc83ba302"
+SRC_URI[sha256sum] = "d311c4b557c44c5248ac5436b9e19c391a60d8e4830b6a7f41be16d89c0556de"
 
 inherit autotools ptest
 RDEPENDS_${PN}-ptest += "make"
-- 
2.7.4


