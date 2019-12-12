Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 98FAA7FAAE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 18:15:05 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id d139so4193177wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 10:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=liFikwp7FhZVftBZ0YMHvllmvYl9fMf+J4OPd+AQJSs=;
	b=PYOyZC3lT3ld0xLNMt/uAJZJQDvQ9EVuXXeD58mUdy7+IB0YG7zBBH7Ew4e1CJhv0Y
	NdTNvnWQ/BwdrVV/UO1CB3bj+Olo6dRu4hf1Fzo6Hf9TOAc5Mg7Nhbp0ULexqHCxlIyo
	o5a3+YsV5u2+Fx+Onr+hD98WrpBjRjRcSbB1UyY48RaI07caAFwhXefdlYOEBq5XKDa0
	XYHouDmQrPAyoANLIBn7E0tsw5wwPNwNWpPJdhn3pq6fbvT90O+X0VpsJ70u2fNJfeBm
	545uZUSQCGO20ighJCWzhQKmAS+j3DKdDy8pM+qukEES6a+xxiJDIHtwbOV5BjtTjdBh
	IfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=liFikwp7FhZVftBZ0YMHvllmvYl9fMf+J4OPd+AQJSs=;
	b=acod+eoZxG/ViwokELzUBjR9BE6R9ZNiGQopKsBN9540T+NVG3b4UNU4axqaPH4oI8
	qEQv8TD26SNsoVDoXOdWfu+iB0iXNft0RlRHI5ZsSAgIFLoz76ry0anqwHyxEMdk8RPD
	OdXYjSzPoHCj/0QGEvEReOftuAoAhvBBxXV7RAB8yq/X43vwoIztbEJWutCOAcXxrJCY
	/IEpE5E8PE/e35w1CZkrZCZRvE3dvg7dd49fi44wCm6IKESJ+zVEROnCK9ZX4zS32N8Y
	U32iwwM96xhZOS7Fpk9hVdstR7W1hx6+AXEEp9fsY2rCt7/ExzTHxchXmbmOuDHeb75y
	hf7A==
X-Gm-Message-State: APjAAAV/1aDm9+ISW+we31KxxAl7ylS45dy8aOVV7D9fMVwuGZuoGSdW
	CWWCwXIo9HOu6f7j5g6fayiOMShd
X-Google-Smtp-Source: APXvYqzZruHK9ORVnQADorUw2pMeY2dPx6b07UPsgxPNQam14ZnUAvrgtNs46KBEfysdY/2LoZMRzw==
X-Received: by 2002:a1c:638a:: with SMTP id x132mr8701233wmb.43.1576174506249; 
	Thu, 12 Dec 2019 10:15:06 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	o66sm3147571wmo.20.2019.12.12.10.15.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Dec 2019 10:15:05 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Dec 2019 19:14:30 +0100
Message-Id: <20191212181436.1322-24-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212181436.1322-1-alex.kanavin@gmail.com>
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
Subject: [PATCH 24/30] man-pages: update to 5.04
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
X-List-Received-Date: Thu, 12 Dec 2019 18:15:05 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../man-pages/{man-pages_5.03.bb => man-pages_5.04.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_5.03.bb => man-pages_5.04.bb} (87%)

diff --git a/meta/recipes-extended/man-pages/man-pages_5.03.bb b/meta/recipes-extended/man-pages/man-pages_5.04.bb
similarity index 87%
rename from meta/recipes-extended/man-pages/man-pages_5.03.bb
rename to meta/recipes-extended/man-pages/man-pages_5.04.bb
index 2381ba4348b..be456759fc4 100644
--- a/meta/recipes-extended/man-pages/man-pages_5.03.bb
+++ b/meta/recipes-extended/man-pages/man-pages_5.04.bb
@@ -7,8 +7,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://README;md5=794f701617cc03fe50c53257660d8ec4"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "d1da6babb99cbd269233a35de9d8718e"
-SRC_URI[sha256sum] = "e8bab0b10c6fb3a6d69615edb488f8a27020f3625c4cf43b8451ba206acbb1b8"
+SRC_URI[md5sum] = "14d33d3fe02577a33aab26eb75df39cb"
+SRC_URI[sha256sum] = "8c6ab56b654a6dd00e3759279954a25fc68b258b8f493a75af55ea7b6401fdb2"
 
 inherit manpages
 
-- 
2.17.1


