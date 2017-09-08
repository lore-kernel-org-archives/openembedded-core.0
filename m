Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id C83CB7821F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 14:45:29 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id k2so1669108qte.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 07:45:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=Ie1bnpVQtYdO/uBNnCswAmXTT6bWslZAtkgV8o7m7ek=;
	b=h1F/Np1OAXnTqbW/Uvltd0xo/oF+nqWDtNwTWhk8B1WzisLfdpUKXLCp0V+dHYbkFY
	DKDdmJ7LlzcoU36L8B0WO9sbhGxcT5+ofTGAvIBqibA7iJ2Dq+XfyssHCjOoW2+YN/4M
	XjetAiTuzkuUH1FCSfm3limj89gL1DyQn0nfUNTqxOXOGwWnjho8p6kaCaGxMt+BGzUb
	vPpSU3dD+yz8MmE4j1S1TrNXp6ntl3VJlk1jE+/rMYeGBpLiZxb4I6BceVCBt+IGjqVE
	YeP4uKCwIoAeyF8oY462R5ku73NCVe32xTcxnkdVYKH4O7eP6GmKAskKVctL1nWkCCya
	I+3w==
X-Gm-Message-State: AHPjjUh/wM1Yg/lSLH6RZ+OUROG3r4uuS1Ygw7RPCm8EMXLEcwbyQyZ4
	cThLm2e9fC7usKZ6
X-Google-Smtp-Source: AOwi7QB+Y4wUVf/NlHiLrAm3+G5kHoxXnvfUvICrMveUcOdlGpdUy7fZ/4z5MPHW/4owmmy/fTYmUA==
X-Received: by 10.200.47.80 with SMTP id k16mr4389699qta.258.1504881930598;
	Fri, 08 Sep 2017 07:45:30 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	e64sm1288342qkc.15.2017.09.08.07.45.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 07:45:29 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 11:45:23 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 11:44:45 -0300
Message-Id: <20170908144454.14308-4-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908144454.14308-1-otavio@ossystems.com.br>
References: <20170908144454.14308-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v4 03/12] go-dep: Add 0.3.0 release
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
X-List-Received-Date: Fri, 08 Sep 2017 14:45:29 -0000

This is the Golang dependency management tool under development; it is
ready for production use and intended to be merged onto Golang
1.10. Until that, projects are starting to use it and making it
available on OE-Core reduces the Golang integration work for new
recipes.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v4: None
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


