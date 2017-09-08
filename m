Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id AE05978246
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 21:06:48 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id k2so2235798qte.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 14:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=SwSwKjbD28O7WebpO8TM7/WPmDjflU+boqiGLvXQy8o=;
	b=eRQiFQOrKbpTDUFtVJVcDwIcdod6wGIbaxYnESQfRkjdLDbQQKWuDnQvgMXRw+b5lu
	2j8dHiiwmJ9GWtqd0R5p7WZQ+ALOVsVxt9QQ0F5rjLS9zsDgvnj3G4Pt7Xzows+Stq42
	I+U2hfsNNu9C9bIgmeNF7Q3y5k/Vu+Qw4vhDf0D/g+WR84ThbUuA8M9uUf7QQeGcwX7O
	POQsOGOssdmnm9I2A1uVTp2UIV9WM+HbcqHGK3VvjSHNAvjIsTUy6g8f8w+0U1coiDem
	hUymapyim9/eKMSJdbHbLZH/athjZAb/lkguYE5FvI/NLK/CoRZzcoSN7/5CXEBOqnDu
	cwPQ==
X-Gm-Message-State: AHPjjUhWQwrYZRZBnhlqtVSWQfZZxEni302JqctdHpVUMWXgmW47TA6R
	lpT+kdmWQ2IfcAfb
X-Google-Smtp-Source: AOwi7QC/3giIWm0VdfOsrALSDHSlTIVksasp4Awi1BQnh5nXVXCFAJgq4upDEGFU18IllRyAGxhECA==
X-Received: by 10.237.34.25 with SMTP id n25mr6028568qtc.144.1504904809812;
	Fri, 08 Sep 2017 14:06:49 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id d5sm1952516qtd.43.2017.09.08.14.06.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 14:06:47 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 18:06:41 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 18:04:43 -0300
Message-Id: <20170908210444.25763-14-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908210444.25763-1-otavio@ossystems.com.br>
References: <20170908210444.25763-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 13/14] go-dep: Add 0.3.0 release
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
X-List-Received-Date: Fri, 08 Sep 2017 21:06:49 -0000

This is the Golang dependency management tool under development; it is
ready for production use and intended to be merged onto Golang
1.10. Until that, projects are starting to use it and making it
available on OE-Core reduces the Golang integration work for new
recipes.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v5:
- use new unpack support

Changes in v4: None
Changes in v3: None
Changes in v2:
- new patch

 meta/recipes-devtools/go/go-dep_0.3.0.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-dep_0.3.0.bb

diff --git a/meta/recipes-devtools/go/go-dep_0.3.0.bb b/meta/recipes-devtools/go/go-dep_0.3.0.bb
new file mode 100644
index 0000000000..c65b4f7cb5
--- /dev/null
+++ b/meta/recipes-devtools/go/go-dep_0.3.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Dependency management tool for Golang"
+HOMEPAGE = "https://github.com/golang/dep"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=1bad315647751fab0007812f70d42c0d"
+
+GO_IMPORT = "github.com/golang/dep"
+SRC_URI = "git://${GO_IMPORT}"
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
+RDEPENDS_${PN}-staticdev += "bash"
-- 
2.14.1


