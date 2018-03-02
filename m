Return-Path: <matt@madison.systems>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id A1BE978A1F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 20:33:51 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id y8-v6so6320651pll.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2018 12:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GEr07TvIBNwMtWjhDkNkcJNw6R7uDAcH0KZ2P5KsmW4=;
	b=kRvfJ9OaEIkHwZCxDByouJd0aCL80+8jOQyXBugO/HxPEbTWg0NHavdlUftXnrM2cg
	thxw8YiaqvIIs4j148x2ZPhdZx+1uI6aetSLE4GFbA5/LWmPT+0fwR//ua2EXYIRvxTi
	0g2JXM9ZDtod6YNbCM3KaGYACerA09eCDv0RXJRK9lvcmU2dfouTJf0aEsGe2WFA8ncn
	u+KH6MvMlwMl6Lvio+aUSdKL4EB6l5Bx2aNhV0pvHBFfiVzt4bJJr5LDA/LnBuTD0cKw
	w3ngyTzDca94v/CYpkngUWAzncvhU+WIQMSTT/bW0l/+a+JxgV6kYeCn2aAAkCliIrkD
	ateA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GEr07TvIBNwMtWjhDkNkcJNw6R7uDAcH0KZ2P5KsmW4=;
	b=dGPsl5dgsikrhjnEWDrH5IYwDlSqdwpuj/SRYqTKVYh3vSS3JbLMyQb1XkBUiuDtKg
	hgNeijpvJvd5ECfOS6Xwh28C8g5cT+y+/wRwc29OdOgEHziGH1UP0lktMjR8P1uPtoOE
	GsXj9CX2Mi1ogBdmgK75f39eo6OsbEPvAOb4bU8a9Re0by5qk3USjA9rUh+4Z4kwZqyX
	qXqJ45hkAeSo65PD/eU5h5NVlxUq3Uo9rqlDBmILXAeuOcvWaABzOn9nQHjGpHs+4hTi
	EzEI/jyeBwFw6X0Qyl1WSqhFDNj4oGJBXV/QTW/4tomq4dfJ7T58xWLP2uch+I3TrnJy
	gZTg==
X-Gm-Message-State: AElRT7Fy1vQr2NxAIbw3CecyxfWLLJXhQNYqHkRcouxiTFJSHusSd/sB
	SSco/A/joCn0Clxckb9dHENeo7Dr
X-Google-Smtp-Source: AG47ELu6/Lqb/AQRtTET6Lqjpy15sjB/3CpMDQREtR/81/J3dklFpglahb0ddWb5EyzPGp4KdMGFmQ==
X-Received: by 2002:a17:902:901:: with SMTP id
	1-v6mr6382028plm.404.1520022832955; 
	Fri, 02 Mar 2018 12:33:52 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	m12sm11193338pgr.35.2018.03.02.12.33.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Mar 2018 12:33:51 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Mar 2018 12:33:14 -0800
Message-Id: <20180302203314.32737-14-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180302203314.32737-1-matt@madison.systems>
References: <20180302203314.32737-1-matt@madison.systems>
Subject: [PATCH v4 13/13] go-cross-canadian: remove verbosity setting from GO_LDFLAGS
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
X-List-Received-Date: Fri, 02 Mar 2018 20:33:51 -0000

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


