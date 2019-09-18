Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 589E37F844
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 13:27:52 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id v17so45475wml.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 06:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=LaKYlsZeFit4Rnry+G4uN9eA+GeZSeVyhiiQRwOVX6g=;
	b=czsU6N/8abg9FSzWNZCwQ8oyxb9h8wrQXOyFXPSIMp/ci7pQ1Qj/IFO692K754OEAF
	8DLKsJrbNjDikLN/aeu22F1YT5TmDQGw8qjqTq2qwAgQeFeDWTgjdYHSB3zOGyGbTtTC
	wYwZBHVKPF3wbHcHRYOvrv1VM/Z3avgXrd1XrgN2Zbh7WwytxzeM0NB0ZdSU0TTo/Kz1
	bD74UUkDrHOaE8osDoMPwdISwdO7iyJfgBK3dacLimRV9GqqSGdiSfSRSr7JdGmJBE7p
	AdBMMg2ZtJiFkVQBhdNJvDzRSmSsE6Oo+cJtY8AD0vEk7Tlx7i7uRM9+s8NhRdye/DQz
	ItlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=LaKYlsZeFit4Rnry+G4uN9eA+GeZSeVyhiiQRwOVX6g=;
	b=RPM+9oJ0Ba0AKaagspCUr2QwHkAv/4w+mm5vArDhQe0rmS9AJK9r8NpO91YyVkwdsC
	frdqJogkWEYXzNIvpaTuO/nNt3X9He855EnBzsASFx+zh5KfgY63vLc9EKAOruiB14Zd
	qx2tuFQi57pF7P7aa8sJcc409dsaTOMqwjjuTeIUSpXJ0Jha91xOuVbqa7LjVLrv+g0Y
	A1xGHJ6It3eV97+SLiyk9sDHf5pomc11nZQ6mzt/RoaMLAJ8JiWoK3K9ducsw6C8a49/
	5MQ4dtVPlSd6kRq0UN0Zbdy77fgzl0UoRu0jjmJ4lMdNXfH4Ezwj0n5mz66pRi2zee2A
	JVAw==
X-Gm-Message-State: APjAAAUt/3Tz//HXC4vG8ncHVf4XyQCIVirE0i+gpFZ4/Fpk5UT2q172
	aKMWcvlWjTs7QpOyAF76LROxZ/GPPoM=
X-Google-Smtp-Source: APXvYqw71HnYFsH/oVMp+pkoDhUxEKRCc5zUpvSQHMeSvKkz42UkcIeKx1KSO0x4Q/+aKSUAvtKzDw==
X-Received: by 2002:a1c:a404:: with SMTP id n4mr2844561wme.41.1568813272814;
	Wed, 18 Sep 2019 06:27:52 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id d9sm7812207wrf.62.2019.09.18.06.27.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Sep 2019 06:27:52 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Sep 2019 14:27:43 +0100
Message-Id: <20190918132744.11195-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190918132744.11195-1-ross.burton@intel.com>
References: <20190918132744.11195-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] gdk-pixbuf: upgrade 2.38.1 -> 2.38.2
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
X-List-Received-Date: Wed, 18 Sep 2019 13:27:52 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gdk-pixbuf/{gdk-pixbuf_2.38.1.bb => gdk-pixbuf_2.38.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.38.1.bb => gdk-pixbuf_2.38.2.bb} (96%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.2.bb
similarity index 96%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.1.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.2.bb
index eb1adb50504..0f3a63d8911 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.1.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.2.bb
@@ -29,8 +29,8 @@ SRC_URI_append_class-nativesdk = " \
            file://0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch \
            "
 
-SRC_URI[md5sum] = "f6ba2195acd18c5c9555421f30c31cc1"
-SRC_URI[sha256sum] = "f19ff836ba991031610dcc53774e8ca436160f7d981867c8c3a37acfe493ab3a"
+SRC_URI[md5sum] = "cc1d712a1643b92ff0904d589963971f"
+SRC_URI[sha256sum] = "73fa651ec0d89d73dd3070b129ce2203a66171dfc0bd2caa3570a9c93d2d0781"
 
 inherit meson pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gtk-doc lib_package
 
-- 
2.20.1


