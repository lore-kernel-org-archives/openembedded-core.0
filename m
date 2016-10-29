Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0DF9B71A5B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Oct 2016 19:46:21 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id u84so4546215pfj.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Oct 2016 12:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=6y0DxnEF77J3+4nIph3/2clgLTIUlnKyqUNOono4QXo=;
	b=Xs5SkG4ONq1fRkv71+D/18LYQNI+p+l//PU8m7YGTZlhvHBTzludpYWix/6n/Ah7OY
	aNGJ3Lj1M5eJ+zb6+mlbuxwtczmlpxS+djAHOeUVmdrf1knsw6veYWK4XpOe76NzA3Yi
	lKSvbzKKR0k1VbvM72RH01jXgO7QUIGn3JR3gRcGZd1xW+CplVX+jwv9IAzUHy94wj3V
	x76Va8Qm5HhFMML1C8NyH8siG+EWh4yOtbIrlGlAtasI5VEgnOBfc9MgJS4HUuQAKCCY
	YWVqyS0ClspyCId59ZG9JT9tT8UkkGV1CnmIkQfHQvtHyeLkdBrS0YzEJ9YJh2oh4VcO
	wHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6y0DxnEF77J3+4nIph3/2clgLTIUlnKyqUNOono4QXo=;
	b=EjNV23kw2J0DbSwYe/UjB6tNRfEC2gTWIC4ixfw/FJNdWFsj+nl8kMqnlqJHiddIC1
	MUfvU0NSn0WYUF0/Xuv77BtxuZcqlvsCkRMJ34mwNETX7WMT83zFkr/7NpLXhGAtMgWe
	lIzqIdjdrWIr7nPbEHKV9dCP1zN8cL5pcCbZT0ReZ2SW5EsASsJgeNm48VWNnpxwdf2K
	OEct3Mk0a/AYfW7L6C4SA6BnUOqa0MKO8aTYIrAFrvq9bISGfbS5urq0qSQh/2LRMP1m
	rEWd3zKQINIfUkZ1I2alhoNNDj/Njit6y7jP6vE4icNad9RcheybH2SsENP567BnvzPw
	mC2g==
X-Gm-Message-State: ABUngvf3i0kv+hCjnjbkixaDFtTcC7KrKWW1h3dySFl8TbJk0blfzbdZsPNa5McM/1rqcg==
X-Received: by 10.99.174.71 with SMTP id e7mr29831826pgp.116.1477770382681;
	Sat, 29 Oct 2016 12:46:22 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	b64sm4411162pfc.74.2016.10.29.12.46.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Oct 2016 12:46:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Oct 2016 12:46:15 -0700
Message-Id: <20161029194615.19954-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.1
Subject: [PATCH] boost: Fix SRC_URI checksums
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
X-List-Received-Date: Sat, 29 Oct 2016 19:46:22 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/boost/boost-1.62.0.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/boost/boost-1.62.0.inc b/meta/recipes-support/boost/boost-1.62.0.inc
index a097ea1..1144ac9 100644
--- a/meta/recipes-support/boost/boost-1.62.0.inc
+++ b/meta/recipes-support/boost/boost-1.62.0.inc
@@ -13,7 +13,7 @@ BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/boost/${BOOST_P}.tar.bz2"
 
-SRC_URI[md5sum] = "7ef085456c48c49a7fe8237f07e5f674"
-SRC_URI[sha256sum] = "bce80293052e2d6230f1bec9b7524b33412e4fb26e9723460a0f362ac15b7acb"
+SRC_URI[md5sum] = "21b799e5d35ba2beef75b225deaf199a"
+SRC_URI[sha256sum] = "a715dc2adff2d451719352b1e863d78cbb100a03f7ed76097c89b9016c59091e"
 
 S = "${WORKDIR}/${BOOST_P}"
-- 
2.10.1


