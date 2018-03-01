Return-Path: <matt@madison.systems>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8F5EF7894E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 23:17:23 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id w16so2072996pgv.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 15:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GEr07TvIBNwMtWjhDkNkcJNw6R7uDAcH0KZ2P5KsmW4=;
	b=gnAwT8xnvpnX9pa6A2+2QiSpChXv/9uH1PkDdSBYBtGPibET6sSgkxaxFNxXzTKgpR
	4Ogg3ROuTYrfxwYkS+HVItfhLTzosCYfl3jplG+6LTo8Zsh6alibR4BZLFUOACFKhYxa
	MNDGfz34YGIrPPRq517Jn53qE5LdhIC2JVyw6WXaG5hzvh3VV9izleTdoq2zv7PONdkN
	APhZGNfCYwjH9Io5puctRA27PYBfCpxVmQSBXrQbe0pN93d/UCRVYNZwg1QOXISHJIfi
	09DbP3K4v6uKppNeY3BBiCpnd9YyjGKHpcv6jFa/O1rH3Z9XICYhxHqiJ+iYdqH/aJbM
	11Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GEr07TvIBNwMtWjhDkNkcJNw6R7uDAcH0KZ2P5KsmW4=;
	b=MNrKiSgjx+EPQZZXFVHjbfX+YPCz9sorWQdQjoBTCkz+3rZz6ie/Zg+dufDuuvTlQ2
	LCVitD0I3NMbOj17edpPphjka8/RuVwrr0wZ3Tln4hk89taHbif30PEgdNcbsly6Z42C
	KLt2wXcc72Kdi3S45QEO4N3mkD5bkaPmet/V4zhxG7irBMJYZ8oElH2ZeaUTmSQ7+xuz
	GPa89CnAuWfIMO4C2Lt445ObJFg8iY+ETnOwWJ5BLfEvE56tFdA92PW27ZfnoRSd8SXe
	VcLnDriaJWlDsKzqHMA7CSdQQEq/Wl31CfnrcyWk4q3Orw5KhAVYD+5GRDse23ekRBkD
	MSsw==
X-Gm-Message-State: APf1xPB5Odi4//TLhJD0eRn1/EdAgYK1o30qxf5IR0bANvGKQ+iQZaZC
	XHO4McGg46lw1Nuza0bAKm3iVOHq
X-Google-Smtp-Source: AG47ELsAFo2HKYjwELRs/0kQfo/MjctaJy0A/T+hCMCI9Rc6mxsVLSFRDrNq5i2MUIzOaGhuuxvH+w==
X-Received: by 10.98.9.130 with SMTP id 2mr3617999pfj.149.1519946244325;
	Thu, 01 Mar 2018 15:17:24 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	p128sm7853503pga.45.2018.03.01.15.17.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 15:17:23 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 15:16:54 -0800
Message-Id: <20180301231654.24018-14-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180301231654.24018-1-matt@madison.systems>
References: <20180301231654.24018-1-matt@madison.systems>
Subject: [PATCH v3 13/13] go-cross-canadian: remove verbosity setting from GO_LDFLAGS
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
X-List-Received-Date: Thu, 01 Mar 2018 23:17:23 -0000

This was another setting left over from debugging the
recipes, and isn't needed by default.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/recipes-devtools/go/go-cross-canadian.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/go/go-cross-canadian.inc b/meta/recipes-devtools/go/go-cross-canadian.inc
index 1d6453712e..ea68b8875d 100644
--- a/meta/recipes-devtools/go/go-cross-canadian.inc
+++ b/meta/recipes-devtools/go/go-cross-canadian.inc
@@ -12,7 +12,7 @@ export GOTOOLDIR_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/${HOST_SYS}/go/pkg/tool/$
 export GOROOT_FINAL = "${libdir}/go"
 export CGO_CFLAGS = "${CFLAGS}"
 export CGO_LDFLAGS = "${LDFLAGS}"
-export GO_LDFLAGS = '-v -linkmode external -extld ${HOST_PREFIX}gcc -extldflags "--sysroot=${STAGING_DIR_HOST} ${SECURITY_NOPIE_CFLAGS} ${HOST_CC_ARCH} ${LDFLAGS}"'
+export GO_LDFLAGS = '-linkmode external -extld ${HOST_PREFIX}gcc -extldflags "--sysroot=${STAGING_DIR_HOST} ${SECURITY_NOPIE_CFLAGS} ${HOST_CC_ARCH} ${LDFLAGS}"'
 
 do_configure[noexec] = "1"
 
-- 
2.14.1


