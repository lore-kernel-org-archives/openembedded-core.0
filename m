Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 74E846BE2D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 06:37:54 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id o25so5434898wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2019 23:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=JlsEW8KcSEbCpK4mVhY0An/6bB92qFW6JKZOpW8jh84=;
	b=E0OLr02K1QMsPTn0U+qquBGCpB3M5g8dB/p6DiSLNJUDJyP6nTDsoD5Z8Vl0jgiVu+
	EHiqitSW5lo55Zv55TCUQMBYRmmoK2+QjX8Ig5oda6p0RbUuBkYSA1kALeerg47xw4oD
	lEwvhdsifzA4bCtlno8bvM2eLWAbP2ryTsL0BKLk89++fElKV5c9sTS9Eu2G98tsBAcH
	VqRF36n5ABzpCcrgnsuoQoBGD1ARp6Zk2WdXku/qRQxo7bU+gHSmELpBQhLYcPuPpBaY
	vF6cZpFfxhkeZifreaBjBpmpsPNgjlU8I98MV739phkGvJ+BmxpCrtGHcAJoK8NZGquW
	O82A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JlsEW8KcSEbCpK4mVhY0An/6bB92qFW6JKZOpW8jh84=;
	b=CS7hDDGEJFidT3A9+t1ibo8NniFUnNnijVeXfmgVmfLkC37P/EhRsWmJOoys6DqHDE
	ugClrUgNb2BCranzn19NU8WZnPFExUJWbXoxL+GKwoEJ06sfXM+FX87qdqVqJ91O3J7m
	YJXeZhRh+l7rNBy9Z9g0j6iRLDZcAyCWPXt0UmQ+dC3JCRfrxL6Wj851qH52Kf5mjkhW
	Iu28OUxbPUFNNWynF3SFQol9oPs0r3HdjqTQpMqopFZoHOw+oPxMUaSxp9+23ZCMDBpJ
	g0Bq2qg+SoJBQhVM5+BjoxypnsaX4WrCA76dEoH9l/t1CuLQcMDk7ON2IWdYCh2qq9ul
	62iA==
X-Gm-Message-State: APjAAAUhAqUcCkAkM7j7N2stdMTpnGEQBK2KypRZ8FWKWWcHqX2rYRtE
	fqqDIK6eeebHo6UET6uD6dBy20t7
X-Google-Smtp-Source: APXvYqxKSklxcFyhivcsNWJCa5Oq+BQ7nZqwqZ5Oggw6eRRG6NL4HxYd0uJ4jm5wOnYq45X3M9cbLQ==
X-Received: by 2002:a7b:ce1a:: with SMTP id m26mr6703151wmc.131.1554446275075; 
	Thu, 04 Apr 2019 23:37:55 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F05D917A4978A6EAA704508.dip0.t-ipconnect.de.
	[2003:f0:7f05:d917:a497:8a6e:aa70:4508])
	by smtp.gmail.com with ESMTPSA id
	g132sm1185443wme.3.2019.04.04.23.37.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 04 Apr 2019 23:37:54 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Date: Fri,  5 Apr 2019 08:37:31 +0200
Message-Id: <20190405063736.29750-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190405063736.29750-1-schnitzeltony@gmail.com>
References: <20190405063736.29750-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 08/13] pango: use gobject-introspection.bbclass on/off mechanism
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
X-List-Received-Date: Fri, 05 Apr 2019 06:37:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-graphics/pango/pango_1.42.4.bb | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta/recipes-graphics/pango/pango_1.42.4.bb b/meta/recipes-graphics/pango/pango_1.42.4.bb
index d3357f82de..f3be9f44e1 100644
--- a/meta/recipes-graphics/pango/pango_1.42.4.bb
+++ b/meta/recipes-graphics/pango/pango_1.42.4.bb
@@ -28,17 +28,9 @@ PACKAGECONFIG[x11] = ",,virtual/libx11 libxft"
 
 GTKDOC_ENABLE_FLAG = "-Denable_docs=true"
 GTKDOC_DISABLE_FLAG = "-Denable_docs=false"
-
-GI_ENABLE_FLAG = "-Dgir=true"
-GI_DISABLE_FLAG = "-Dgir=false"
-
-EXTRA_OEMESON_append_class-nativesdk = " ${GI_DISABLE_FLAG}"
-
-EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '${GI_ENABLE_FLAG}', \
-                                                                                       '${GI_DISABLE_FLAG}', d)} "
-
 EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GTKDOC_ENABLED', 'True', '${GTKDOC_ENABLE_FLAG}', \
                                                                                      '${GTKDOC_DISABLE_FLAG}', d)} "
+GIR_MESON_OPTION = 'gir'
 
 LEAD_SONAME = "libpango-1.0*"
 LIBV = "1.8.0"
-- 
2.20.1


