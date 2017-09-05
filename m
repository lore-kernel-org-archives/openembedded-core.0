Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4B6C777F79
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 14:56:08 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id p12so2265197qkl.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Sep 2017 07:56:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=0aNn7QZK2Oi/VTk4RRwqDj1sUkd2Pb0BOwL8Abc7aZY=;
	b=eY4RMhYgSP5YpgAmjsMZ34bFVJgmCimX3Ap7aOVsZIRGaXUDqz+mNrg3vyMqVdsBS+
	Ej9didqp1nIDnmO6/8tLNv2NIlp6YuubWIUdv6bepQWB4+cOSrMR1+JWehXhZktN3rep
	LL9Cz89h7E9TbPg3uzjtGFFENFq8sbBKl2LQBJmGc2iewh0USYvrxXdlyWo2xqMNtgQn
	If8288nOf+qH9Kr+pSJLR2JRxV1eimjoVUO0D1FjcNglHPIxMTdrwmDjZL43hLLpYuLl
	0+UtY4txKf5/DfghGRRjTMo0mZqx7iezRjtskiHbHE7KTGLOGMwghq5u9aRfvZJspwBe
	NHvQ==
X-Gm-Message-State: AHPjjUj6Sr+q+07cZDj44zLQWy68r+HpAgQN6O4vxi3uOeRiwBBdIdUO
	50piZ5EQy9ZjzNOK
X-Google-Smtp-Source: ADKCNb75zfyv43dbWdisjFv6Ug6RqgronLboBA+EV9kfjO+Q9UZ0EabCFskIPli58C5LRYMIJNtYzw==
X-Received: by 10.55.27.3 with SMTP id b3mr6054808qkb.25.1504623369943;
	Tue, 05 Sep 2017 07:56:09 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id w59sm478328qte.0.2017.09.05.07.56.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 05 Sep 2017 07:56:09 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 05 Sep 2017 11:56:02 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  5 Sep 2017 11:55:31 -0300
Message-Id: <20170905145536.21149-4-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170905145536.21149-1-otavio@ossystems.com.br>
References: <20170905145536.21149-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 3/8] go-dep: Add 0.3.0 release
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
X-List-Received-Date: Tue, 05 Sep 2017 14:56:09 -0000

This is the Golang dependency management tool under development; it is
ready for production use and intended to be merged onto Golang
1.10. Until that, projects are starting to use it and making it
available on OE-Core reduces the Golang integration work for new
recipes.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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


