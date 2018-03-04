Return-Path: <matt@madison.systems>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 22DAD78A99
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 21:10:01 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id y8-v6so8528117pll.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2018 13:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TTwENY7ULODRxCn2+4X6imfIO/W47PqIS8EbZAMn+YA=;
	b=qYt9wkw58RLdkh1Mr/Pv0JW88Ty2aieTNWDchf4lPIRIwW7J0h2EN0wEU3ykBq9oJ7
	l18Vuj5P02cW+pry9IoY8JdbxihRb/wzAHBm9Io3SlAJ0SyFqdWKjS/XAdKzkGQRH/O7
	T3sdVOctLy94qGeYpwyPIUXqBpThdSVA6q0YnU1T9H+fcI88YZU5pgnDgXds62b498+b
	tTIFzDdYFi9E8iq5IjcOTWITbyx+TFCfrdAGnG+aFt2aJ8rEPYZs5t4meMnwaAlnldoL
	i4EpCxihhIeYFJCt3B60lHtWNgB7BlY95s02SatCuInSCYxaSvBk/TOnKBb2itaaiFQ3
	BzHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TTwENY7ULODRxCn2+4X6imfIO/W47PqIS8EbZAMn+YA=;
	b=LK/xMKDloPufUzzvsynSYLo6bIwZvevL5c/cl9Q8A0txr9g9iMevkJ6RbRORKDpeeV
	OgDa9FK+QgOVJsR6kuXTpl4mCmx+gxO2uPeIa8wMnFhqxqzH1AEdLufCj+i1VDM3XuLr
	PG0lay3TCOmwYin3sO5yLPLzRpx7rl8om0+foU7SXxyjJIP32DhYGsvcDtt3HgotSxj+
	ZXm6PEVGygDglYbgBp2W4KdTHWV/Rhg0VRQFeUNT2RW399IVdun4uuijD1+5pDjlOrfm
	20cRn1VnVVDXNJiKc+TqGofGCkV3BuuV3cwN1GrNEQqCwcu4rsmBRNrAH3oLiqRGyPHi
	pAsQ==
X-Gm-Message-State: APf1xPAABHttmOcJ6F/JQkRf5v8yKBwlyxq7Mx0I/BF4AqvNwRP+Ecba
	xYYrn2z/NyWdnJic0DwUUhQqW9ly
X-Google-Smtp-Source: AG47ELt7RG3P2SWWubxHcUchf3h3nN6FneFp+wsp7n+FJKATb3WoS4X2442j0wHQDXavxTPSKT5EMQ==
X-Received: by 2002:a17:902:2b84:: with SMTP id
	l4-v6mr11128019plb.338.1520197802369; 
	Sun, 04 Mar 2018 13:10:02 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	x123sm18594829pgb.5.2018.03.04.13.10.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Mar 2018 13:10:01 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Mar 2018 13:09:36 -0800
Message-Id: <20180304210937.29727-13-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180304210937.29727-1-matt@madison.systems>
References: <20180304210937.29727-1-matt@madison.systems>
Subject: [PATCH v5 12/13] go-runtime: remove unneeded nativesdk override, rename variable
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
X-List-Received-Date: Sun, 04 Mar 2018 21:10:01 -0000

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


