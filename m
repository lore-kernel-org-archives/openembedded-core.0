Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6A90678210
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 13:48:28 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id i14so1547579qke.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 06:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=mT6AVgZz9OrEhAzSQ5qF+xJAtM/i+bdwco/6pnHbe5A=;
	b=kmBFX03SrJCEpctprFKJy+38V93ObrHeClkB1U9i4bc/ypgohK3IvVjT43sxArImci
	wNRdeZriI+u6ddDlTW8vTaZhxKY8X0xBSLBbKMb7LnkmM93iIZTG7ZXRE4NKtT2jpBur
	lfKrlTzwhXdigQ704w9u6iS53QrNGBTrCCnZhKC2co3EsWXUKxiIFmoXaeAQDVXywS+c
	c28brF0hti18GXi8FDaiIOWJuafzJxeVFy13jWC4RPxiKOYvZoTwXzG4NrkNym6gZFfD
	KI6TPwDkrD6bUknIzQtMgpB9w0beT00zyOjI6mZboa1ovlftDR6FAwijYKvkYCE7bPnV
	BqRQ==
X-Gm-Message-State: AHPjjUhcMoI6wTm568MNPlN0HpUcNudahKCZc20Zboxrf7jnO50toLSB
	FH8fmNetSxFyJbxu
X-Google-Smtp-Source: AOwi7QCDtKQXBj+lQ15ReFNoRkAXDMm5Ot0D/ev9Re2oe2ilBTCaSARA4CIQTgRBcBIflqhQEU5R4w==
X-Received: by 10.55.127.7 with SMTP id a7mr3662008qkd.329.1504878509334;
	Fri, 08 Sep 2017 06:48:29 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id n3sm1213562qte.75.2017.09.08.06.48.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 06:48:28 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 10:48:22 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 10:47:50 -0300
Message-Id: <20170908134758.7570-4-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908134758.7570-1-otavio@ossystems.com.br>
References: <20170908134758.7570-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v3 03/11] go-dep: Add 0.3.0 release
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
X-List-Received-Date: Fri, 08 Sep 2017 13:48:28 -0000

This is the Golang dependency management tool under development; it is
ready for production use and intended to be merged onto Golang
1.10. Until that, projects are starting to use it and making it
available on OE-Core reduces the Golang integration work for new
recipes.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v3: None
Changes in v2:
- New patch

 meta/recipes-devtools/go/go-dep_0.3.0.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-dep_0.3.0.bb

diff --git a/meta/recipes-devtools/go/go-dep_0.3.0.bb b/meta/recipes-devtools/go/go-dep_0.3.0.bb
new file mode 100644
index 0000000000..66e30acbd3
--- /dev/null
+++ b/meta/recipes-devtools/go/go-dep_0.3.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Dependency management tool for Golang"
+HOMEPAGE = "https://github.com/golang/dep"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=1bad315647751fab0007812f70d42c0d"
+
+GO_IMPORT = "github.com/golang/dep"
+SRC_URI = "git://${GO_IMPORT};destsuffix=${BPN}-${PV}/src/${GO_IMPORT};nobranch=1"
+
+# Points to 0.3.0 tag
+SRCREV = "7a91b794bbfbf1f3b8b79823799316451127801b"
+
+inherit go
+
+GO_INSTALL = "${GO_IMPORT}/cmd/dep"
+
+INSANE_SKIP_${PN} += "ldflags"
+
+BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS_${PN}-staticdev += "bash"
-- 
2.14.1


