Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id C991A72FC5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 12:47:02 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id 89so221795wrr.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 04:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=D+3VwW+ytK25s6x7hPH63p+TF83UTnUsZxnkY9JvuyA=;
	b=PpyyuXpHjEH/owFV7UbNFOgk1SWw39HuKpnBOuw/vPJwsccxXNO49Xi0TvkkmOSIeB
	Cg3URJ4nPBvnv7+mZNCXiUWFp66pSdZvuZ1yZIq+S8yF+XpJLdHwISnTpZwF60mDV4Xc
	stMIKQvo9WcrieEVfZmsL2mlLqmYEDrj0zkXcZmQARx/dV7zpEuBvfp/rGrV4uNhyVHC
	aABvIeFFCILS9G0C4BOBQvgDUFR7GBdJZfUICUIoL/Vb3C6zaaBkt+e8Ju9281v3zYwy
	sEtv9e8b2qwy8bnfc8LxS15rJ44UVyqF8riIkQJjzINMRPNWQL4Wki0m3d1v530JiMd4
	QB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=D+3VwW+ytK25s6x7hPH63p+TF83UTnUsZxnkY9JvuyA=;
	b=BCLfc4GULTsMTnLBzHYS1LWkzecF09Ns14KrxT45O6IWnYp1mtZZSfHNZ2+KpFu4fZ
	IuLPXPFmtS9ULtvqHIESxeI5J3kpyrCslqarFf9HVjk7ROEWQ8xTq5I4jQSfRZ3Tw9+z
	VPv+uedhuqWCGCxEJlMLPaYkyWg9at86tRpDPzCXyMoMm/FOLjKu7Bl7z/hErOeqNetE
	ZC2pWkCCrmw7cxLQu/w/OZBLCtMlPT993NZ8wOjpPbWZ7hdsQZ+Q0kAj9q3VbDKSRvnj
	3S48iOdfzCtY/aFNt17IjW5fgQpXD2Y0dLw8aYNtaFrGScKar80jpjSr0dpKHKTVwwUP
	/Sog==
X-Gm-Message-State: AMke39kPew/wwoDZfpEmPHzPL8bFg98ZT/uKbBOfIBokAlFNJtYlYaleA5qRNXjiCTALSg==
X-Received: by 10.223.150.73 with SMTP id c9mr27348166wra.19.1487767623288;
	Wed, 22 Feb 2017 04:47:03 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([117.136.38.175]) by smtp.gmail.com with ESMTPSA id
	y145sm2421922wmc.17.2017.02.22.04.47.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Feb 2017 04:47:02 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 13:46:53 +0100
Message-Id: <1487767613-15437-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] python-ptyprocess: BBCLASSEXTEND to native
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
X-List-Received-Date: Wed, 22 Feb 2017 12:47:03 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Some developers might need it.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/recipes-devtools/python/python-ptyprocess_0.5.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-ptyprocess_0.5.1.bb b/meta/recipes-devtools/python/python-ptyprocess_0.5.1.bb
index 931e5a7..eed24ad 100644
--- a/meta/recipes-devtools/python/python-ptyprocess_0.5.1.bb
+++ b/meta/recipes-devtools/python/python-ptyprocess_0.5.1.bb
@@ -20,4 +20,4 @@ RDEPENDS_${PN} = "\
     python-core \
 "
 
-BBCLASSEXTEND = "nativesdk"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


