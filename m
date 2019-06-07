Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7C1117E263
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2019 12:42:03 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id r6so1132038qkc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2019 05:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version:organization
	:content-transfer-encoding;
	bh=/Uw2FZ24KAuCaGEYiPaPn6eVWQX2ljiYmE4e3EPibWY=;
	b=Nar+p4+JSB+QNysUlHkLPq/xo8chfG9gKBokXnwbHokcL3fKCxXZ4pJB9wpF8Qh/99
	QJdazfOGhorsn8GeRXki8D6LWYIL3hD1Rh8c7jgKBywW9DX/xI9XT7RHpqzjWXOqJfJs
	KjT79/3lmEHDaSGehkAnz/UbDnZW1ANjWw3qe7rQQvUtz9kUfIcrrG+Q7kb0f6Ua7Eaf
	ZiaTybl8IKGzsc6H1x5H44wTpL09qBdyFAb85qProp8KVhY6MgaxUuqhfkQvAznYsEiz
	OfyO1nKVQGrQTt6SdbxuoV/ZDJjCezXAAncmGvwB/LFIEAoQbHSckBoG5gLCdmU/XiFP
	X7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=/Uw2FZ24KAuCaGEYiPaPn6eVWQX2ljiYmE4e3EPibWY=;
	b=qoE4uFY9nwxPtW91q0TIaFlDKh8M6I0Dtki1rMFejE5u/K3Funsaj04+esyzDUMVgg
	nrJOT6JZo9NhRs23tBtW05VeUh5DdtjbiEYClzuYrL4TBoVXJpYSYLBW+ErwDZCKQ3PH
	eCUZHDTwTP53s+fQBkj+UyDMKptpYlJRedOkPv0XmciH6i7RS8Yyq4glsRv6HMuGPH2T
	UDdEC1VA8OvquAPAbWahsMNBMeFtvmz7DPmbxF5TqC60c52FZ4Z05FaeaNXRQhWNssED
	C0M2HnY6cwp+3eMwB40L7e/hnNoMJe+oHjYrjuYiyAB8utOVp/ZG997+XWfyJ/X/iMaP
	Msfg==
X-Gm-Message-State: APjAAAUBRJpbzXLxs5a286cHhGvwdKf4OHFnz9UQnGDq1p0YX/bcDMob
	wh07UmxZ23Rc+c9EQW7K1XJh9JcVDMDHLg==
X-Google-Smtp-Source: APXvYqwnL4m6uW1neGTRTKNJ0PWvSkzCLaXSpcIPEZYGpthZQj3FPTps6uD3dnB6svxmsay+8NouCw==
X-Received: by 2002:a05:620a:1456:: with SMTP id
	i22mr19148664qkl.170.1559911324140; 
	Fri, 07 Jun 2019 05:42:04 -0700 (PDT)
Received: from centrium.lab.ossystems ([181.220.86.53])
	by smtp.gmail.com with ESMTPSA id
	m27sm1087151qtc.16.2019.06.07.05.42.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 07 Jun 2019 05:42:03 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jun 2019 09:41:50 -0300
Message-Id: <20190607124150.24695-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [PATCH] mesa: Update 19.0.5 -> 19.0.6
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
X-List-Received-Date: Fri, 07 Jun 2019 12:42:03 -0000
Content-Transfer-Encoding: 8bit

Mesa 19.0.6 is a bug fix release which fixes bugs found since the
19.0.5 release.

For full log see:
  - https://www.mesa3d.org/relnotes/19.0.6.html

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../mesa/{mesa-gl_19.0.5.bb => mesa-gl_19.0.6.bb}             | 0
 meta/recipes-graphics/mesa/{mesa_19.0.5.bb => mesa_19.0.6.bb} | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_19.0.5.bb => mesa-gl_19.0.6.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_19.0.5.bb => mesa_19.0.6.bb} (84%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_19.0.5.bb b/meta/recipes-graphics/mesa/mesa-gl_19.0.6.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_19.0.5.bb
rename to meta/recipes-graphics/mesa/mesa-gl_19.0.6.bb
diff --git a/meta/recipes-graphics/mesa/mesa_19.0.5.bb b/meta/recipes-graphics/mesa/mesa_19.0.6.bb
similarity index 84%
rename from meta/recipes-graphics/mesa/mesa_19.0.5.bb
rename to meta/recipes-graphics/mesa/mesa_19.0.6.bb
index 51cba4e47c..02e2c86dde 100644
--- a/meta/recipes-graphics/mesa/mesa_19.0.5.bb
+++ b/meta/recipes-graphics/mesa/mesa_19.0.6.bb
@@ -6,8 +6,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-Allow-enable-DRI-without-DRI-drivers.patch \
            "
 
-SRC_URI[md5sum] = "1509a3251d459fd8b6fadf9329669dc1"
-SRC_URI[sha256sum] = "6aecb7f67c136768692fb3c33a54196186c6c4fcafab7973516a355e1a54f831"
+SRC_URI[md5sum] = "b97159690eba564311d88a818bdbd64d"
+SRC_URI[sha256sum] = "2db2f2fcaa4048b16e066fad76b8a93944f7d06d329972b0f5fd5ce692ce3d24"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.20.1


