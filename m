Return-Path: <matt@madison.systems>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6290978A19
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 20:33:49 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id 93-v6so6321711plc.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2018 12:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TTwENY7ULODRxCn2+4X6imfIO/W47PqIS8EbZAMn+YA=;
	b=Xdilj5rH0jtYk7I7dENNi2YD8YveLYkayxxnxh7AHZ0VdM5OkBICyu0gotQEPXqt3C
	lxmewkM1J19MksIi8p0Zv2N8+jTIll0PuGFKrFBphZfVSySo+TngYWmrYzRYbDkKSwJ0
	osUNcnAPAIFqnVVhOHcwkawrTqdIXxbTOk0ym2j1/KS5BY7P0ooCYxD4JGwPlaBMxTOI
	jntv3jv6ToB3VkLo6zX8YfdfSw1OpPSzZyYbvX6RB5actchFDvMpLltk124bUYNYys0T
	7BHuCcaaaZdCO6YyERzpzLKrGxNlj9ziRFh2AFy4dzelNGoxzoIqqKWQS/APdPzkDS5W
	OkAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TTwENY7ULODRxCn2+4X6imfIO/W47PqIS8EbZAMn+YA=;
	b=K9KDN/tBtnCctgPx7yKn+Z1qzoCBbo/FA1/NK+a95xkzDzXIeisR0DglI55QTc/mHt
	gDq5nqLnxiaGeoVeEGaxTfQXw3iTY6GcuJuiivGGB4saS9/A08TcYT9D33nAtQVvfo4O
	99wJdt18vHmtMjWw2hdrcEVK7yYvNBUrZsffeI4s7Ot7IYsSpJp8ugxQnDavh9SNlmjq
	+gvYP7fPdT60pRBR0jve/jEfchmymSE+ATZGX+kxhOceHhsmpGJihMNZICdGRlQHLHKd
	khfXfSjeyGfzolvp0makfIAivaZHfs/hZhq7Nfr2ifMqeDNR3t2bTdpDRNEaf+BJEyRG
	HWfA==
X-Gm-Message-State: APf1xPC2LKk3p80YDUhrZT5lquXiw5cFhX7HlRy94Cz/ZTMZvDHb6PYO
	fkO7NJ2ALoHfZ5TmOeDAwC2GhBtw
X-Google-Smtp-Source: AG47ELsXflQZfbaKUsYxw7xaENmZJ84K3zATVUrlWU7tENQPbYA5kzS+lVZxY9lLF60ANyUGmzboag==
X-Received: by 2002:a17:902:a705:: with SMTP id
	w5-v6mr6192166plq.299.1520022831183; 
	Fri, 02 Mar 2018 12:33:51 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	m12sm11193338pgr.35.2018.03.02.12.33.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Mar 2018 12:33:50 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Mar 2018 12:33:13 -0800
Message-Id: <20180302203314.32737-13-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180302203314.32737-1-matt@madison.systems>
References: <20180302203314.32737-1-matt@madison.systems>
Subject: [PATCH v4 12/13] go-runtime: remove unneeded nativesdk override, rename variable
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
X-List-Received-Date: Fri, 02 Mar 2018 20:33:50 -0000

since GO_LDFLAGS is also used by the dist tool, and it's confusing
to use a variable with the same name (but not exported, so unused
by make.bash/dist).

Signed-off-by: Matt Madison <matt@madison.systems>
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


