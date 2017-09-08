Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9F0C1781EC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 13:48:13 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id r66so1393510qke.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 06:48:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=S7rdHvmxLE0JXt/3jwWEfurBYd/1X0kKENi39h7j9UU=;
	b=rMDDWlhhcS7qdU4M66419lN8D9DRLUxW62Th4ESJBt6sxjaV8hkfTK5mSif66NBLrN
	bdveme6NeVqD0ghyuqd8cMiRgA6sd2QY6UPFsSab+f+F/ZQyVZg8UkhGQj4wQTktADV8
	BA6yxYHK52BojFC3AJmI2i6shKKgwduf1uAOH8VmIH9cupk+fu1vnSbKtFpyM9zEYt0c
	Xyi8WwucLshXspir2uTaWcW/r/XULrkAxG+dzOyLYdJfUaiY4CH1WU9ax3TJCALHWB8A
	uEOACpBhKkL9jzvMUU7qTggy23Ad2FHjREEulLK7EWtSEcIt9DWvaVMYpuW5wTGqaS/e
	TAfg==
X-Gm-Message-State: AHPjjUjU2V9aLHbgToZQXuTKG+MRt11AxO3FWzqukt9cbTStxr7pmZFZ
	9bkJPnQF0c9a9c6Q
X-Google-Smtp-Source: ADKCNb7OWLki7hYfNuDvrhbrlQfzAYUnvJACIEfcMrXZqtOFTA+PoOBTc4kC/v7vZLuRpWDyGriLMw==
X-Received: by 10.55.141.66 with SMTP id p63mr3874982qkd.210.1504878494121;
	Fri, 08 Sep 2017 06:48:14 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id u7sm1284299qte.88.2017.09.08.06.48.10
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 06:48:13 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 10:48:07 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 10:47:48 -0300
Message-Id: <20170908134758.7570-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908134758.7570-1-otavio@ossystems.com.br>
References: <20170908134758.7570-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v3 01/11] goarch.bbclass: Stop passing True as second argument of d.getVar
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
X-List-Received-Date: Fri, 08 Sep 2017 13:48:13 -0000

The d.getVar has the second argument as True by default, avoid passing
it here.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v3: None
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


