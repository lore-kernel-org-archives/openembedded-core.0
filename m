Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9B64260628
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 13:38:23 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id f129so4268321wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 05:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=JhUCykz77kJK1eSEYRTbbk7auGWzHPq761vr9GPKjWA=;
	b=a8HQPZ6ouRbD0qybLiJY+vONt8FqU6Duq034pdQ+NpF+Q38xyC5RzxHvi8wKEhssvL
	hbt9+E3qAPNTXmElUN3m8/Ae/G+niODo9lMsc9RkFC+vsTKp8IW8u9IJTEUyckzZ0OwI
	8Lnj0pAlanDNBo4hDQjD81GK5RQ1wAY0SzYbRIiHCwl/R07bfCMMPRX95OOmZE2eHoMx
	iMUMBEA9A0LXL/ZXijrWGyelssKi4jQaaTLc4/DgcfJ6JxEpd9HdBEYgYeGjVPSOY+q6
	ddj3GJE1iI4QXIDiNh7Z3qNTYWn0pgtirY/XYrAsPmMBhkyKId0BrH2f3SHa8Xb+MoLV
	jptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JhUCykz77kJK1eSEYRTbbk7auGWzHPq761vr9GPKjWA=;
	b=Jk3z+GFN0a8xssNCspZrpPm38hLuMnM+Rcw1CGe8YDLHA4lG5U8jx8xOMNc3Uq4wV8
	ekOFVqRk8kzMpz9CsnehqrB6dR4rcdrYQ9Zy7QjNG7Md98yYwZ28XGCdF0uATQflfTxe
	1qW6NMQ7OTW5C9SFnFDihrXpZpoQy61NkayNd0vUIRRbp9Jt1Y+DD/+57cJ6XuaxdrHE
	xUXFypASRT2hK2VtWJCBsY54GPzEG+960EuB8BkNC3zZHU8HAVfBX0xY1Do7s3ZxQsm9
	kSWghptWGBgYLkCXIFthZ547Ikd+Zk4b1lVdo7v3jcDSP5HXLz7CFD16LYJieNj+GaRU
	pfBw==
X-Gm-Message-State: APjAAAWi1mslvrgG4akOJ3THOBSUkWv2dXr+KMI+cr3qlRiZO8TPIwMa
	9/FEiYwvgfU2bKaV4l7F7wcKt1gv
X-Google-Smtp-Source: APXvYqy2dQxTdErrLvbC1I0RfFUuU7Bt13TGP1LyFRJYD0iV6dTFB+DzTgDpeCs0k2oz7kmxp/ibDQ==
X-Received: by 2002:a1c:7c08:: with SMTP id x8mr10719131wmc.106.1580288899246; 
	Wed, 29 Jan 2020 01:08:19 -0800 (PST)
Received: from linux-f9zs.box (cable-95-168-152-69.cust.telecolumbus.net.
	[95.168.152.69]) by smtp.gmail.com with ESMTPSA id
	a62sm1550224wmh.33.2020.01.29.01.08.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 29 Jan 2020 01:08:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2020 10:07:30 +0100
Message-Id: <20200129090738.1398-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129090738.1398-1-alex.kanavin@gmail.com>
References: <20200129090738.1398-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 16/24] libedit: upgrade 20191025-3.1 -> 20191231-3.1
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
X-List-Received-Date: Thu, 30 Jan 2020 13:38:24 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{libedit_20191025-3.1.bb => libedit_20191231-3.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/libedit/{libedit_20191025-3.1.bb => libedit_20191231-3.1.bb} (78%)

diff --git a/meta/recipes-devtools/libedit/libedit_20191025-3.1.bb b/meta/recipes-devtools/libedit/libedit_20191231-3.1.bb
similarity index 78%
rename from meta/recipes-devtools/libedit/libedit_20191025-3.1.bb
rename to meta/recipes-devtools/libedit/libedit_20191231-3.1.bb
index f810013a680..7116c9ddbc0 100644
--- a/meta/recipes-devtools/libedit/libedit_20191025-3.1.bb
+++ b/meta/recipes-devtools/libedit/libedit_20191231-3.1.bb
@@ -13,7 +13,7 @@ inherit autotools
 SRC_URI = "http://www.thrysoee.dk/editline/${BP}.tar.gz \
            file://stdc-predef.patch \
           "
-SRC_URI[md5sum] = "2d6568467080cfd75e715d045102b544"
-SRC_URI[sha256sum] = "6dff036660d478bfaa14e407fc5de26d22da1087118c897b1a3ad2e90cb7bf39"
+SRC_URI[md5sum] = "2e22a51131de94ff2df24901f7cfe416"
+SRC_URI[sha256sum] = "dbb82cb7e116a5f8025d35ef5b4f7d4a3cdd0a3909a146a39112095a2d229071"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.0


