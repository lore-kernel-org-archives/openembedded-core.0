Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7D99F77E99
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 21:06:27 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id h21so1017735qth.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 14:06:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=rprjtoRWuI2CORe27ibIOSKG/IU88NOd9zQyY5MbiJI=;
	b=KUy6qmqjsT7bKgZS/F9rEuQp66ipzoC8vtZkWR10emOSxQexiB7jNpxEhvgAMjJb5h
	0BPgXOy7xu4sBNyMimK0CRZUZcx1b1A0jXOiZZGKpsf0yhe4qqw3348hgJG6RDgdHnii
	MyEKItF4H4ya1YYj00CDKrhVt3yTHGXTV71YVmmkDIIH/3Cn6NWnRp8B5wVIOWp22XLQ
	wsOUx8qRx8SMbB4/F0zSCA1fQKqwgOOHSPzdeBjHz2Lh52/nTQSK9x0vMBiDsTJ+RbhO
	Gw2gL/ocXU955ZujL/r6TmfFox4Jm81yJQAqkGb0D9ejdpC3iKlor2xGJpexYo/I56S9
	dqWg==
X-Gm-Message-State: AHPjjUhycowSBhehV2uThRpwSBA7ThgjCuE/rGkSYesuWx0SlJkSqR8g
	6/Qy5xQQs2Bg97sq
X-Google-Smtp-Source: ADKCNb4uweORmabMWMoCngn+y8xnps6v9Y2fEUr507cU1EmSbEvGRQlXyknnqgfEtdVwmsjlI0V7dw==
X-Received: by 10.200.40.35 with SMTP id 32mr2576071qtq.148.1504559188214;
	Mon, 04 Sep 2017 14:06:28 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	o13sm5551991qtg.47.2017.09.04.14.06.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 04 Sep 2017 14:06:27 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 04 Sep 2017 18:06:21 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon,  4 Sep 2017 18:06:02 -0300
Message-Id: <20170904210608.23764-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170904210608.23764-1-otavio@ossystems.com.br>
References: <20170904210608.23764-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/7] goarch.bbclass: Stop passing True as second argument of d.getVar
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
X-List-Received-Date: Mon, 04 Sep 2017 21:06:27 -0000

The d.getVar has the second argument as True by default, avoid passing
it here.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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


