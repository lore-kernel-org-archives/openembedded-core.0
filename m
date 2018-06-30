Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id A636174581
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jun 2018 09:52:14 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id z74-v6so6290594qkb.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jun 2018 02:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YBsM1YoqbXTC1apAp4Yr9SKVm0Cg+fejZWgxeK5Yj4c=;
	b=UvAqKKSoPEu85yZxj7cUB0A0uIMp7C7gTOs2v4B3QTVBpzZnBmWKWD18fqPkAtaHOZ
	8bbNc2LYh/eWT4BWcXQadIu56pO6zzQms42zhGBJz0oarE2eniMZiDAsGtmcp1mffoyJ
	D3lYeB24dPxgaHpMqjnLdcaqAJcawHhQVxJ2FHjio+Zgh51YZpDXu/HU0GWJ3YghNjn3
	/xCzuIIjBR6hGetS5qToklbDU3jK8l6l0ugloqNzl+HZU+UgyDBWmp0Wc0Sa6ytgCIQn
	obn8x2wk2WFydcsgjmcRFjkGR2zcCRWNIn6z2hTYyZs41FhIYKIiIOt3ub6l/rtgw9cz
	pZAQ==
X-Gm-Message-State: APt69E2M+Y4CplOJ86SRos0lCM4nDk5yaYo7ePVRdqkqtpdXGd0npo+y
	3Ufu14SOLBhOLoMVxcmRPnqVzvLk
X-Google-Smtp-Source: AAOMgpfppVO6wTTF6zlzDCmQRZnLfAcfmL86N0Goq9u982p8OU1zUCXPXt9+XQFwSK1IyfM+ftFnWg==
X-Received: by 2002:a37:5704:: with SMTP id
	l4-v6mr15727556qkb.53.1530352335172; 
	Sat, 30 Jun 2018 02:52:15 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-100-33-240-84.nycmny.fios.verizon.net. [100.33.240.84])
	by smtp.gmail.com with ESMTPSA id
	t30-v6sm4439898qtt.88.2018.06.30.02.52.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 30 Jun 2018 02:52:14 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Sat, 30 Jun 2018 05:52:04 -0400
Message-Id: <1530352324-15981-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python-numpy: update to 1.14.5
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
X-List-Received-Date: Sat, 30 Jun 2018 09:52:14 -0000

Update to the latest stable release

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta/recipes-devtools/python-numpy/python-numpy.inc                   | 4 ++--
 .../python-numpy/{python-numpy_1.14.2.bb => python-numpy_1.14.5.bb}   | 0
 .../python-numpy/{python3-numpy_1.14.2.bb => python3-numpy_1.14.5.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python-numpy/{python-numpy_1.14.2.bb => python-numpy_1.14.5.bb} (100%)
 rename meta/recipes-devtools/python-numpy/{python3-numpy_1.14.2.bb => python3-numpy_1.14.5.bb} (100%)

diff --git a/meta/recipes-devtools/python-numpy/python-numpy.inc b/meta/recipes-devtools/python-numpy/python-numpy.inc
index 284f213..1d822fa 100644
--- a/meta/recipes-devtools/python-numpy/python-numpy.inc
+++ b/meta/recipes-devtools/python-numpy/python-numpy.inc
@@ -10,8 +10,8 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
            file://fix_shebang_f2py.patch \
            file://0001-npy_cpu-Add-riscv-support.patch \
            ${CONFIGFILESURI} "
-SRC_URI[md5sum] = "e39878fafb11828983aeec583dda4a06"
-SRC_URI[sha256sum] = "ddbcda194f49e0cf0663fa8131cb9d7a3b876d14dea0047d3c5fdfaf20adbb40"
+SRC_URI[md5sum] = "e3189ee851c3a0e2e6e4c6e80a711ec8"
+SRC_URI[sha256sum] = "1b4a02758fb68a65ea986d808867f1d6383219c234aef553a8741818e795b529"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/python-numpy/python-numpy_1.14.2.bb b/meta/recipes-devtools/python-numpy/python-numpy_1.14.5.bb
similarity index 100%
rename from meta/recipes-devtools/python-numpy/python-numpy_1.14.2.bb
rename to meta/recipes-devtools/python-numpy/python-numpy_1.14.5.bb
diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.14.2.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.14.5.bb
similarity index 100%
rename from meta/recipes-devtools/python-numpy/python3-numpy_1.14.2.bb
rename to meta/recipes-devtools/python-numpy/python3-numpy_1.14.5.bb
-- 
2.7.4


