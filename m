Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id D2C657F8F3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2019 21:15:28 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id d199so2104108pfd.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2019 13:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=LO3K/NxxuI8kEifRugV+AQykK2cxK2bM0QOwJZqD2/w=;
	b=Dt4HmOkwHkdJC2jRu8mMI6ZB3BVg94ioMCZMd2/9FgokQ3v4uKg+GQ6BN0Hvn2WBoi
	hj3k2fldWIAem6t0eRfZwCeoamgfWXKwo2q8jlVl+/ulwoewq8zSimmRXUWx7/+fusjE
	s0QzARnOwPdyCYPE3HaLnSZvsYlCxM1huX595u/77rmeWUCbEOThQqYXroXBPG49fPIc
	1w4Yn7i3DAqfgfskWnjefgZYitq43C/SEUCDFt+eqDnD8UChs7gPKjTUOzr8Sm9PISxw
	+8aJ6EQUG9F4iZohIEnNXezCvcATkOIZ3VmUn6qhu0T1uH+4GxG07A+uqrVpYav44q95
	/5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=LO3K/NxxuI8kEifRugV+AQykK2cxK2bM0QOwJZqD2/w=;
	b=i191G6+bJlay6jtg3E0H76V1AvReQSOA7wMY2g9UkTbDYVN+fEP/Np52v60CaotZf+
	LwApNpSXY7SnrMayplC2yb+tC/0PMEJUqdSF6bYuzW9yYOY0sbeE7PLKyC4JPlHtBaJo
	wlAvG2SLjR6NGIdVuIyHzB+pgyCLOwwDpDDJAjZ4jy0nMALLwhL1VIW2ZGv5lx2p9RyE
	rehg+DbVIpVTuDSq9y4zDL5LtxeazFPyq5AeyiBCNOVGF0hsDtXA12gXyUdQAuRgbBWm
	VjFvwPvEWsPSsDpJaQlPumqO/LV/Hbf3tTFPT+S9RK7TG4KhY+/JOnVNqL0kPsSkG1sJ
	i5/w==
X-Gm-Message-State: APjAAAXsMNMOhzCDITnIkBKzLaTNoFm7fzsjwG5poRnUbVFLHLp8XY7n
	9/esZbdHAd5TJ2bTCb2r4iosYxjt69g=
X-Google-Smtp-Source: APXvYqy/rDbdVa/mJnPTm0w+vGqoIoPDtkMDxedpXn+u5ewvKG8pTee11g7lV4hCGwCnCPuPox1Upw==
X-Received: by 2002:a63:1a19:: with SMTP id a25mr1690245pga.447.1576271729516; 
	Fri, 13 Dec 2019 13:15:29 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::6d2c])
	by smtp.gmail.com with ESMTPSA id
	y23sm11671441pfo.110.2019.12.13.13.15.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Dec 2019 13:15:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Dec 2019 13:15:02 -0800
Message-Id: <20191213211502.3144020-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191213211502.3144020-1-raj.khem@gmail.com>
References: <20191213211502.3144020-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] Revert "go: Reset unneeded GOARCH variables for native recipe"
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
X-List-Received-Date: Fri, 13 Dec 2019 21:15:30 -0000
Content-Transfer-Encoding: 8bit

This reverts commit 4825eede606b075d0d529b38d6162999f1dec506.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/go/go-common.inc | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
index aa2482d356..f18d928c70 100644
--- a/meta/recipes-devtools/go/go-common.inc
+++ b/meta/recipes-devtools/go/go-common.inc
@@ -37,16 +37,6 @@ export GO386 ?= "${TARGET_GO386}"
 export GOMIPS ?= "${TARGET_GOMIPS}"
 export GOROOT_FINAL ?= "${libdir}/go"
 
-GOEXPORTVARS = "1"
-GOEXPORTVARS_class-native = "0"
-
-GOARM[export] = "${GOEXPORTVARS}"
-GO386[export] = "${GOEXPORTVARS}"
-GOMIPS[export] = "${GOEXPORTVARS}"
-HOST_GOARM[export] = "${GOEXPORTVARS}"
-HOST_GO386[export] = "${GOEXPORTVARS}"
-HOST_GOMIPS[export] = "${GOEXPORTVARS}"
-
 do_compile_prepend() {
 	BUILD_CC=${BUILD_CC}
 }
-- 
2.24.1


