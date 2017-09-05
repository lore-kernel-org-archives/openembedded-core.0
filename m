Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id AD3B177E99
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 14:55:53 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id d70so2271861qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Sep 2017 07:55:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=XGkqM9ef2XgamhQRyFUTjkLLUL/PoUkKhX2H/ETGkGE=;
	b=Um/pmPAxo/qltf/WryDh4Jm3zgV9BkMqToO4kRFAxGB+e4ix4dBZ0YonMFax+p4d+O
	f7IKEoBnmdCe39YPanPi8XUQNVnbK93K9/IQERdgVo77jLQIbsQaEaf3ErMAOy0w0Z2X
	X3y55598A5FJYdUeqFB+tbtL5JR60JtAHObAo7/hB5CnFvzHXsuWoRSAzNzI+EgZFrPL
	7teFHOYTI2l1bMy6GPA/WtSv+t88jm8JwWXJOVappaqqWA+gBdfq/v+OErEtqVJq3R5Q
	2wHU9ieJtO1gmx5Db7FMef9Lt3oartCXKYrTrniYyuES8/cf1oNHtSPy3POat324itfG
	gcrw==
X-Gm-Message-State: AHPjjUgALVtQm/9EL74NwJDqitzYYVLYuXT55Abr1zAUAxANUY8jIMz5
	JacrJVaP/VpzE5qP
X-Google-Smtp-Source: ADKCNb4p2aMKU77ysOxdHa61PO8FaG//hoyoq96QLQgqsg5gFp9qZXEMfoh8ddVOgQHamWtzwQHqiA==
X-Received: by 10.55.209.16 with SMTP id s16mr5840176qki.46.1504623354577;
	Tue, 05 Sep 2017 07:55:54 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id w63sm495015qtd.22.2017.09.05.07.55.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 05 Sep 2017 07:55:53 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 05 Sep 2017 11:55:47 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  5 Sep 2017 11:55:29 -0300
Message-Id: <20170905145536.21149-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170905145536.21149-1-otavio@ossystems.com.br>
References: <20170905145536.21149-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 1/8] goarch.bbclass: Stop passing True as second argument of d.getVar
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
X-List-Received-Date: Tue, 05 Sep 2017 14:55:54 -0000

The d.getVar has the second argument as True by default, avoid passing
it here.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2: None

 meta/classes/goarch.bbclass | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 9cd38b8c48..7960ac5f9e 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -1,15 +1,15 @@
-BUILD_GOOS = "${@go_map_os(d.getVar('BUILD_OS', True), d)}"
-BUILD_GOARCH = "${@go_map_arch(d.getVar('BUILD_ARCH', True), d)}"
+BUILD_GOOS = "${@go_map_os(d.getVar('BUILD_OS'), d)}"
+BUILD_GOARCH = "${@go_map_arch(d.getVar('BUILD_ARCH'), d)}"
 BUILD_GOTUPLE = "${BUILD_GOOS}_${BUILD_GOARCH}"
-HOST_GOOS = "${@go_map_os(d.getVar('HOST_OS', True), d)}"
-HOST_GOARCH = "${@go_map_arch(d.getVar('HOST_ARCH', True), d)}"
-HOST_GOARM = "${@go_map_arm(d.getVar('HOST_ARCH', True), d.getVar('TUNE_FEATURES', True), d)}"
+HOST_GOOS = "${@go_map_os(d.getVar('HOST_OS'), d)}"
+HOST_GOARCH = "${@go_map_arch(d.getVar('HOST_ARCH'), d)}"
+HOST_GOARM = "${@go_map_arm(d.getVar('HOST_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
 HOST_GOTUPLE = "${HOST_GOOS}_${HOST_GOARCH}"
-TARGET_GOOS = "${@go_map_os(d.getVar('TARGET_OS', True), d)}"
-TARGET_GOARCH = "${@go_map_arch(d.getVar('TARGET_ARCH', True), d)}"
-TARGET_GOARM = "${@go_map_arm(d.getVar('TARGET_ARCH', True), d.getVar('TUNE_FEATURES', True), d)}"
+TARGET_GOOS = "${@go_map_os(d.getVar('TARGET_OS'), d)}"
+TARGET_GOARCH = "${@go_map_arch(d.getVar('TARGET_ARCH'), d)}"
+TARGET_GOARM = "${@go_map_arm(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
 TARGET_GOTUPLE = "${TARGET_GOOS}_${TARGET_GOARCH}"
-GO_BUILD_BINDIR = "${@['bin/${HOST_GOTUPLE}','bin'][d.getVar('BUILD_GOTUPLE',True) == d.getVar('HOST_GOTUPLE',True)]}"
+GO_BUILD_BINDIR = "${@['bin/${HOST_GOTUPLE}','bin'][d.getVar('BUILD_GOTUPLE') == d.getVar('HOST_GOTUPLE')]}"
 
 # define here because everybody inherits this class
 #
-- 
2.14.1


