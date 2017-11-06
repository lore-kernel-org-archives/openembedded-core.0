Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id B930C78435
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Nov 2017 18:15:40 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id f8so12086586qta.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Nov 2017 10:15:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=WWi2QQy1XgXcc/3HyqxGWcyLeRrT0efbCkA+MTtE18Y=;
	b=loOcnts72EHhfg4czgom0Q313c7QWdz0qSsNArwk/Rnn+AIvWKOvsxq6bJ8qWsbQRE
	rcCZcIUwLNKGnqLB36BpeeSE3cACrtNEblHo+24ozp6CMihs91kVa4jdB/jSWyPkzbig
	p8tBuFcFfGwkHs8fPm3/y1Nkw74Lr9nnnI12SkY0uhw0sYYiDE80n9D53jSw1KQTm67I
	wB5dhQWtzqy4CLCUubimioiTEtixJV9x/UwVQHm4oX09aw5x7c0z+S4i6w/UTYn+9Rqi
	xFBe1p2rRbO2hPu+4unKoL0F/8qjgLcOtPmWDY/immnU9b7rjpSGJNRUGdZYneq8vu0q
	/45g==
X-Gm-Message-State: AMCzsaX+uSvjDLyVPHRPMQQqU+MsCsHkKXMlGNHDNc34H43Ww55u0MBz
	ML+ZEy23y1YTB/6N68LILLpg1Q==
X-Google-Smtp-Source: ABhQp+RVX8CmYKJxnyHIlBSkKOgJDXqsoMmR4agulfEWKg3PeWVd7ZoISXo90Denj3df7fHmn4kpJg==
X-Received: by 10.200.3.8 with SMTP id q8mr23944671qtg.57.1509992141932;
	Mon, 06 Nov 2017 10:15:41 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	l207sm8476427qke.97.2017.11.06.10.15.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Nov 2017 10:15:41 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 06 Nov 2017 16:13:12 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon,  6 Nov 2017 16:12:52 -0200
Message-Id: <20171106181253.2081-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171106181253.2081-1-otavio@ossystems.com.br>
References: <20171106181253.2081-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v6 2/3] libdrm: upgrade to 2.4.84
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
X-List-Received-Date: Mon, 06 Nov 2017 18:15:40 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v6: None
Changes in v5:
 - new patch

Changes in v4: None
Changes in v3: None
Changes in v2: None

 meta/recipes-graphics/drm/{libdrm_2.4.83.bb => libdrm_2.4.84.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.83.bb => libdrm_2.4.84.bb} (93%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.83.bb b/meta/recipes-graphics/drm/libdrm_2.4.84.bb
similarity index 93%
rename from meta/recipes-graphics/drm/libdrm_2.4.83.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.84.bb
index a5cb75c266..95f72adae5 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.83.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.84.bb
@@ -16,8 +16,8 @@ SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
            file://0001-configure.ac-Allow-explicit-enabling-of-cunit-tests.patch \
           "
 
-SRC_URI[md5sum] = "23800953ed7564988872e1e8c61fde31"
-SRC_URI[sha256sum] = "03a52669da60ead62548a35bc430aafb6c2d8dd21ec9dba3a90f96eff5fe36d6"
+SRC_URI[md5sum] = "35b9544bc2ad864acd1abaa1a2b99092"
+SRC_URI[sha256sum] = "7ae9c24d91139ac9a2cdee06fe46dbe1c401a1eda1c0bd2a6d1ecf72f479e0aa"
 
 inherit autotools pkgconfig manpages
 
-- 
2.15.0


