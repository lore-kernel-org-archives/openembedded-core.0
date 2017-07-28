Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 50C87784FF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 18:07:43 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id a77so4382443qkb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 11:07:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=9dbQDF/OIpZzIm5A51GMiZjJZrmXJwS8Dss2CkporOY=;
	b=sjlSN1qfXxI7K4r8NNR7rHrCtEpEXpgVQ4zuxd6NCJVZ/Y38lO8zukfQZOMARStUu1
	YHM3TfqQsCz64sC4zG29ydfPeoP6MBxfhKyaUMEZzbc1dEfk7xs9Z72utnxp6+JX6RKh
	x9fvpIprTwB4h9EIa36EPM76mEy1DMRHyyb241CeSjqy8laPF24bEg3ibNMRhA+3g+GL
	K+NjWHIgcTs4yBkjpIBPDOXkG3BCFIFUF/D5j6gcY4rFDMylskPBKnQCz6k0p0PO6Yct
	Q2BYo1X2prNJLL717hb80YLWt/RZVYY0VeudiWeFrFFLUL0PXjX5E8x4FzxJg1Xt4ucT
	f0aw==
X-Gm-Message-State: AIVw113faUrcPaobVc6OYjLs9mOKqIIxoLehy9aALvN9412rGtO4J6Md
	+qGsV/e2pP7dBPsc
X-Received: by 10.55.43.144 with SMTP id r16mr11095815qkr.59.1501265264559;
	Fri, 28 Jul 2017 11:07:44 -0700 (PDT)
Received: from localhost.localdomain ([181.220.72.143])
	by smtp.gmail.com with ESMTPSA id
	k138sm15313489qke.41.2017.07.28.11.07.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 28 Jul 2017 11:07:43 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 28 Jul 2017 15:07:34 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Jul 2017 15:07:33 -0300
Message-Id: <20170728180734.1920-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.13.3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] go-dep: Add 0.2.0 release
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
X-List-Received-Date: Fri, 28 Jul 2017 18:07:44 -0000

This is the Golang dependency management tool under development; it is
ready for production use and intended to be merged onto Golang
1.10. Until that, projects are starting to use it and making it
available on OE-Core reduces the Golang integration work for new
recipes.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-devtools/go/go-dep_0.2.0.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-dep_0.2.0.bb

diff --git a/meta/recipes-devtools/go/go-dep_0.2.0.bb b/meta/recipes-devtools/go/go-dep_0.2.0.bb
new file mode 100644
index 0000000000..2b116c9af2
--- /dev/null
+++ b/meta/recipes-devtools/go/go-dep_0.2.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Dependency management tool for Golang"
+HOMEPAGE = "https://github.com/golang/dep"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=1bad315647751fab0007812f70d42c0d"
+
+GO_IMPORT = "github.com/golang/dep"
+SRC_URI = "git://${GO_IMPORT};destsuffix=${BPN}-${PV}/src/${GO_IMPORT};nobranch=1"
+
+# Points to 0.2.0 tag
+SRCREV = "6a17782ed25ba4ccd2adf191990cc32e65c3934c"
+
+inherit go
+
+GO_INSTALL = "${GO_IMPORT}/cmd/dep"
+
+INSANE_SKIP_${PN} += "ldflags"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.13.3


