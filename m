Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 54A4A7D543
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 06:37:53 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id y197so5904137wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2019 23:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=feVpArV/DGsCksPve2l5xtLcEdOf0A/3NWWlb2AHUYI=;
	b=gymfEOhXtJ18XTFG2heEJa0sEZinhuskgvmvApWExoCF977B0b/ki0cTqnCO0/j/lP
	vnPShYNKnIh2F8VXZQVImSTzPLoybgpmISi4h4ceJp+ZSAJyynV/nB86NMVlfG1E3Fnl
	Y9vecv6jALA6PdUFmEe/2t8JxcJHVorYKmZw6WSK4y/xOzKvrB49wh0JctGWZpQIJhBA
	DMp05SOl2enn8t9cC7rRELHagpQfLAJKKEq8caQ8JsuQEn5/7JpKRTYtWw9qLNd+Y0tR
	K1u+qag4pZ/lv5BKYhTrRu+yI+S4VQnUmkD9H2BK1lgohiq4AwR7JD5AKllKWX1xftYO
	8Ydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=feVpArV/DGsCksPve2l5xtLcEdOf0A/3NWWlb2AHUYI=;
	b=BbEY1eBcrQkfYb3ImFyuNabpDjaToe1I/DNaH1l3Q3XtLGj8KYs/CL4TMi4eOzhzuZ
	I6pBaWKXB4x2KY18tUYbQs6B/eJUe6tONxcodvEITCI0itsrbM7EhPuxaL374sB4V4Ls
	IY9WSatbOYyvX0lHlPPcJRm7S/yu5t5VCBeGJFWfw6sVuTS8tW4Eb/ewgpUhQqzKx9m2
	LTc3WUIWurQoyaVCwTQf+RvG5fIam57Dj9wUVBczNxwcD9ETWfUtkcGYmnAG2e5x7nLU
	1CEiiVz48UNIkKQzdKyZL3BVwz4Y+z3PfMYH1mC64ROJI3pJeWsc2x/Jhh67ERdwQstB
	dSbA==
X-Gm-Message-State: APjAAAWWjFh4pzonYMF83lUClGKR0LH6a6ArC0MTyO4M7Va091rigTrx
	A9dGb0MA91u0KWWPIEfNqZXkxDwL
X-Google-Smtp-Source: APXvYqzIA0lQZT6A7mmAhXsZonwH1dKGym/l0rGq1mqvPHDQO2rmjARIa7PK8UxgN5Qg8F+yorV47w==
X-Received: by 2002:a7b:cd07:: with SMTP id f7mr6796409wmj.43.1554446273977;
	Thu, 04 Apr 2019 23:37:53 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F05D917A4978A6EAA704508.dip0.t-ipconnect.de.
	[2003:f0:7f05:d917:a497:8a6e:aa70:4508])
	by smtp.gmail.com with ESMTPSA id
	g132sm1185443wme.3.2019.04.04.23.37.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 04 Apr 2019 23:37:53 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Date: Fri,  5 Apr 2019 08:37:30 +0200
Message-Id: <20190405063736.29750-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190405063736.29750-1-schnitzeltony@gmail.com>
References: <20190405063736.29750-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 07/13] clutter-gtk-1.0: use gobject-introspection.bbclass on/off mechanism
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
X-List-Received-Date: Fri, 05 Apr 2019 06:37:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-graphics/clutter/clutter-gtk-1.0.inc | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc b/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
index 4e82f56605..5f7daf8124 100644
--- a/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
@@ -16,16 +16,7 @@ PACKAGES  =+ "${PN}-examples"
 GTKDOC_ENABLE_FLAG = "-Denable_docs=true"
 GTKDOC_DISABLE_FLAG = "-Denable_docs=false"
 
-GI_ENABLE_FLAG = "-Denable_gi=true"
-GI_DISABLE_FLAG = "-Denable_gi=false"
-
-EXTRA_OEMESON_append_class-nativesdk = " ${GI_DISABLE_FLAG}"
-
-EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '${GI_ENABLE_FLAG}', \
-                                                                                       '${GI_DISABLE_FLAG}', d)} "
-
 EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GTKDOC_ENABLED', 'True', '${GTKDOC_ENABLE_FLAG}', \
                                                                                      '${GTKDOC_DISABLE_FLAG}', d)} "
 
-
-
+GIR_MESON_OPTION = 'enable_gi'
-- 
2.20.1


