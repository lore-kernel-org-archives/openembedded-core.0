Return-Path: <matt@madison.systems>
Received: from mail-pl0-f51.google.com (mail-pl0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id AD75A78947
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 23:17:21 +0000 (UTC)
Received: by mail-pl0-f51.google.com with SMTP id m22-v6so1031474pls.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 15:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FAfT375EnHNO9DHHKjKvVrlEabPcyOGrnpyE+QTBddQ=;
	b=Wh8vX0KePdg7V6dssn28KTBxg+rtLjaz7SzDZfQhrRhLL6x255EMqplikwJ2Jx1WOT
	hv82scWsgitKu2nI+O5VXi1+Y/rFLdBh6Vvq6czEa0CM3xk73L7F61jxviJAJ6CsHBwi
	rwGosGUhTyZ8OFAxxxF4p/QUyUG4BcOxsg7I+ggITd9xeb4SPEM66SWftonNFuSnpNly
	/RFICo4zRnUWm9Tf4yIGopetbWgf7NdcL4nJwCq3heKUcZRfjJlkbotNgJqKYFeP+WoZ
	SMoM8jHUgLDqL9hdJDSnkpHL+OTa6yj3hjAgxgwI0WhlaDmQC5hafg5mbsUb2/2lnL2/
	Kbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FAfT375EnHNO9DHHKjKvVrlEabPcyOGrnpyE+QTBddQ=;
	b=XiEXBhNDj4w5z+kue6SqZ6owJwxWe/99zHrqyjJNlaz/R3KkGVrEGBi0ZwxXNdweDH
	RNoA+4uygBT8H8OsUOUR2ozdePgBJuRae4XqJxVljXhPQgpmsv70iZxEwH7st9edBA0x
	oUkaEeUx6XcAOESvyEIliDDeIJSKzw/PcIa7UY/9zo9PaRi9q3yOBggstLJmnRyqxREt
	TO3+c2mfBwaoFwXT8kOpwVNQBUpDydRKNytSQDAF6qYFmWJI1GXCi8IOsa03LkBav/YF
	+04R5qByXFop1KxwAb/yM5gS4nGs6IIc4Odu2VNC8ngf8DbYPL8WsqSXQJVdN++oFzKQ
	J7gw==
X-Gm-Message-State: APf1xPCdLrifcxW5SNbp92A9dE8j5KFXQue6Rmp8naj0Xa6sWir9YhPF
	81BUH6eDFOHzgqkxeFlf/3cqjOQj
X-Google-Smtp-Source: AG47ELvQ5gPfPI2gLjl6Lznm5E65AdpZXG0oIEesxbTTfi22QKl0i+z5AJiuN6GsgUFUAS1inHvlgw==
X-Received: by 2002:a17:902:5609:: with SMTP id
	h9-v6mr3379662pli.302.1519946242572; 
	Thu, 01 Mar 2018 15:17:22 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	p128sm7853503pga.45.2018.03.01.15.17.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 15:17:21 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 15:16:53 -0800
Message-Id: <20180301231654.24018-13-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180301231654.24018-1-matt@madison.systems>
References: <20180301231654.24018-1-matt@madison.systems>
Subject: [PATCH v3 12/13] go-runtime: remove unneeded nativesdk override, rename variable
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
X-List-Received-Date: Thu, 01 Mar 2018 23:17:22 -0000

since GO_LDFLAGS is also used by the dist tool, and it's confusing
to use a variable with the same name (but not exported, so unused
by make.bash/dist).
---
 meta/recipes-devtools/go/go-runtime.inc | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-devtools/go/go-runtime.inc
index a79295df47..0041e8afab 100644
--- a/meta/recipes-devtools/go/go-runtime.inc
+++ b/meta/recipes-devtools/go/go-runtime.inc
@@ -17,9 +17,7 @@ export CGO_CXXFLAGS = "${CXXFLAGS}"
 export CGO_LDFLAGS = "${LDFLAGS}"
 
 GO_EXTLDFLAGS ?= "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${LDFLAGS}"
-GO_LINKMODE ?= ""
-GO_LINKMODE_class-nativesdk = "--linkmode=external"
-GO_LDFLAGS ?= '-ldflags="${GO_LINKMODE} -extldflags '${GO_EXTLDFLAGS}'"'
+GO_SHLIB_LDFLAGS ?= '-ldflags="--linkmode=external -extldflags '${GO_EXTLDFLAGS}'"'
 
 do_configure() {
 	:
@@ -38,7 +36,7 @@ do_compile() {
 	if [ -n "${GO_DYNLINK}" ]; then
 		export GOTOOLDIR="${B}/pkg/tool/native_native"
 		CC="$CC_FOR_${TARGET_GOOS}_${TARGET_GOARCH}" GOARCH="${TARGET_GOARCH}" GOOS="${TARGET_GOOS}" GOROOT=${B} \
-			$GOTOOLDIR/go_bootstrap install -linkshared -buildmode=shared ${GO_LDFLAGS} std
+			$GOTOOLDIR/go_bootstrap install -linkshared -buildmode=shared ${GO_SHLIB_LDFLAGS} std
 	fi
 	cd ${B}
 }
-- 
2.14.1


