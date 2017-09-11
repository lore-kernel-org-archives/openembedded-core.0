Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7818A78229
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 12:47:25 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id b1so3142119qtc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 05:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=UGZO/F7isAQPtloz0kDiqQFacCTI0rIS94CDUXougys=;
	b=P0X4zyfMDuLpNGafuHWMWWqMPPf0YAEgRdHBgt9f0jNorwcu+ZjkHcMJcEmxVDq/5H
	y3MNqCuNa1rNrJ/N9ZDIc+tYudpmcKI2sZj9eH7fJj1bXPWmPxJjHLnkj/pwSheQOAkF
	YUkMo/PLb6O7WOcOPgQ7yOdMURaV6jgehqhpf6QnfCu7U504GMYKh0uczej6hWSre/Xp
	wDuoAZmXSARAIU15Nq2bahClymMc/dgZgzAfNNL52JSpxJQcmudSfDePMHW9dWTNZNma
	awG6hGr9OGLT48B2Zwaz1/ywS36b1MAzbXN2M5+xgzmAWFkxLEtJ2hA5JtADcvtyhUuf
	vC0g==
X-Gm-Message-State: AHPjjUgdQtxobUDs5HStAjg67+KKROhT70cJblQT+u6iz7qvps3jeB03
	AuE4VYLq3oHOjicC
X-Google-Smtp-Source: AOwi7QDOWXm4vWvDEhVSXNLT64lnDnrTSKYI4e2jxDb8zy0zW+Z/KyZ8nEdhyEaWJrJk/xPeGF/OUQ==
X-Received: by 10.200.25.246 with SMTP id s51mr15378930qtk.70.1505134046384;
	Mon, 11 Sep 2017 05:47:26 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id 48sm6159074qty.29.2017.09.11.05.47.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Sep 2017 05:47:25 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 11 Sep 2017 09:47:21 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Sep 2017 09:45:45 -0300
Message-Id: <20170911124558.2863-14-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170911124558.2863-1-otavio@ossystems.com.br>
References: <20170911124558.2863-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 13/26] go-dep: Add 0.3.0 release
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
X-List-Received-Date: Mon, 11 Sep 2017 12:47:25 -0000

This is the Golang dependency management tool under development; it is
ready for production use and intended to be merged onto Golang
1.10. Until that, projects are starting to use it and making it
available on OE-Core reduces the Golang integration work for new
recipes.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v6: None
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


