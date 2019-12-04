Return-Path: <anibal.limon@linaro.org>
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
	[209.85.210.44])
	by mail.openembedded.org (Postfix) with ESMTP id 727D87CDE4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 19:04:41 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id 66so226209otd.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2019 11:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qbnlww6DlcWymaux2Sqj1IYbozkC476Whp9Nv3+Nj+Q=;
	b=sqivVMXbAKWD589hR8Se9v5OGKHl4xZtiAJYLbhyZTPGzkEdpYLPzWfqZTrQDAvqc6
	7+ZSBL4EZfWMoHi9iBLXBhlJsfC6ksAqJzFyRDa3SmVPc3Kep6MHSEYAah1i92tU4MAR
	ixT4ioIF+fWErnuC2WgfboFZqkB+GthWDARyCQWIurz4qnQyPYHA4VBQM1kwC0ShKhw+
	HU83BZErAPzMzOTIR4g4X29us7RCsG1QAASWDLK1cTQNrZdROhyvAS+hjFNnlwefkktp
	bLqQKc55pHfhFk5W26qG5wh9R3M2kpmuihzqRc5jwnCyLxHdVm0ZyPsGw0Awx5QcGXQL
	sgqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qbnlww6DlcWymaux2Sqj1IYbozkC476Whp9Nv3+Nj+Q=;
	b=B8Oy2wh74I37SOSVRlcWUErw1VWjsCsMnnEZ8v5Hz5Dp2y7FgxtUb+a06pbqFE0cIk
	8D8izIq2ZZWaBQ6CYHEPTNVcj5rpNt2z+cCcK1Dncunm7YHtpBDwbFTt0aKQO6T+iMEi
	V6+SV8y6DxRnZMXBC/a4p9q8Ar6DzU/zKLLKzLXNJP013k6eIUcXXt73Rc/3bVxGCDNi
	SZOhP8JN/G+fMFwYeTu3dRONiS1pYkwarfsXNRreSzq0WGk11gMAA8Au/aTdMDSq06k3
	3CIVO85rOfL29zJpHAuSOPP1se+CVSNUj6LyctR3uEgSnhbznS91B2SVRYaPGKm5UF8t
	1PMA==
X-Gm-Message-State: APjAAAWD/OUYZSEs6wRDW1QeCq6DI4+UopiLbqP8DVytBzCuG08n58yu
	ZuxsfH229UUKYSfsSDaqVXJZFH1tjVo=
X-Google-Smtp-Source: APXvYqwCLRe0KXw/tgc+zhRwGhmZjCanUVbiiBdS1zFiHyiyrLK7GmJ9iN1/AEPur+XLxdWK+D6wZQ==
X-Received: by 2002:a05:6830:11d3:: with SMTP id
	v19mr3782207otq.322.1575486282043; 
	Wed, 04 Dec 2019 11:04:42 -0800 (PST)
Received: from blackbox.rga.ip ([2806:109f:4:db29:908a:c7ff:fe6a:e9f5])
	by smtp.gmail.com with ESMTPSA id s4sm2469205otq.56.2019.12.04.11.04.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Dec 2019 11:04:41 -0800 (PST)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2019 12:40:28 -0600
Message-Id: <20191204184028.14813-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCHv2] meta/recipes-graphics/waffle: Add inherit setuptools
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
X-List-Received-Date: Wed, 04 Dec 2019 19:04:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes,

...
| Program python3 found: YES (/home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work/aarch64-linaro-linux/waffle/1.6.0-r0/recipe-sysroot-native/usr/bin/python3-native/python3)
|
| meson.build:36:0: ERROR: <ExternalProgram 'python3' -> ['/home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work/aarch64-linaro-linux/waffle/1.6.0-r0/recipe-sysroot-native/usr/bin/python3-native/python3']> is not a valid python or it is missing setuptools
|
| A full log can be found at /home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work/aarch64-linaro-linux/waffle/1.6.0-r0/build/meson-logs/meson-log.txt
| WARNING: exit code 1 from a shell command.
...

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 meta/recipes-graphics/waffle/waffle_1.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/waffle/waffle_1.6.0.bb b/meta/recipes-graphics/waffle/waffle_1.6.0.bb
index 52cb1df899..48caf207c3 100644
--- a/meta/recipes-graphics/waffle/waffle_1.6.0.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.6.0.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "d9c899f710c50cfdd00f5f4cdfeaef0687d8497362239bdde93bed6c90
 
 UPSTREAM_CHECK_URI = "http://www.waffle-gl.org/releases.html"
 
-inherit meson features_check lib_package bash-completion
+inherit meson setuptools3 features_check lib_package bash-completion
 
 # This should be overridden per-machine to reflect the capabilities of the GL
 # stack.
-- 
2.24.0


