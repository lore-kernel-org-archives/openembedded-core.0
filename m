Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id 857DF731F2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 17:43:42 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id b35so1746189qge.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 09:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=MsHUNtpX7Mlb2pTJE/7ac2SsgeXnqxx7Cy8NzSCO4bM=;
	b=xz5FXfpDFZdvig/of5tjoUA+wx8bstZPMdQQkWDvIlWDK35H8Ogka/8kTOQxor+btm
	a06cvIsapgeTpaJsVtjROE8E3NUzKzieCKgBGPfx1oHUp9ilOYWmvA0J5JBm7f74nY6C
	DZekJOHyoEa4yA69axqitwKD57URV3fZH7XyAuyxRVtdv4ZYAWIH3isTurkIElqjLVYR
	QbbmXRXb5oTYsPQ/CGdKqiVMEht/ii6jle+dtZo3Qj5WpEDBSfXxWO48uspHGb+YngVP
	ohHsnzlB7qCFHf+HxhmX2w1/ZIO5lodckuomWagbqNoErRtlBJiDaEHMyvHQAoDC26GK
	99hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=MsHUNtpX7Mlb2pTJE/7ac2SsgeXnqxx7Cy8NzSCO4bM=;
	b=glKTFoMK6neU0R5Pqrr1BiZ4mr03bETaIF6bCGF2KMPl6klYVyVBbehwjzKUNHWPI2
	pU35G611pMdFEQz3Kl7+ExuCwGRIcZfFzsLTylqMChqF+gcz3z3YF3geooF5v7mMnxOO
	sYw+3N2WayPY628U4QtK4eEDF5+Jb8tFN+r9QldM1MS2iJ34dRMXlslw6FsN5xNuPqWW
	ot+wsth0W0B3UeywegXtoifn3pZPaL8oSBYZAUWBGAfaqKPx0NQYLTLOPJ3ye5Tg6nuA
	lq3t88+dir9Z+du4Ms1K8GpK5/ZfaY5UnZn0PdxXboy72AX1lx8qPoZT+oqEjvpmMD0v
	Rpww==
X-Gm-Message-State: AG10YOSZSUSDgSCC/lt65Ryu2sIALQodNCcIbmSjD8fo42WV+Bowl/du6VTiqb/pnDbCOQ==
X-Received: by 10.140.29.202 with SMTP id b68mr49282078qgb.100.1455126222813; 
	Wed, 10 Feb 2016 09:43:42 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	a66sm1724349qkb.20.2016.02.10.09.43.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Feb 2016 09:43:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 17:43:31 +0000
Message-Id: <850e86b808fa51352203ff92c894eebbb045902a.1455126045.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <d7fb520732892e8f08f7817b7abd127b98fa6c1d.1455126045.git.raj.khem@gmail.com>
References: <d7fb520732892e8f08f7817b7abd127b98fa6c1d.1455126045.git.raj.khem@gmail.com>
In-Reply-To: <cover.1455126045.git.raj.khem@gmail.com>
References: <cover.1455126045.git.raj.khem@gmail.com>
Subject: [PATCH 4/9] uclibc-ng: Bump up to 1.0.12 release
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
X-List-Received-Date: Wed, 10 Feb 2016 17:43:43 -0000

Here are changes between 1.0.11 and 1.0.12

release 1.0.12 - Chimay Brune

Leonid Lisovskiy (5):
     libdl: dlopen() mustn't forget RTLD_NODELETE flag
     tests: Extend OMIT LDFLAGS logic to test binaries too
     Provide __adjtimex() alias, like glibc.
     ldso: Fix fail of $ORIGIN expansion in case of RTLD_NOLOAD
     ldso: Use single rtld_flags interpretation through all the calls

Waldemar Brodkorb (11):
     Suppress warning "_GNU_SOURCE" redefined
     hppa: unbreak toolchain building
     test: disable tests requiring math headers
     nios2: allow to build toolchain
     add exp10() from glibc
     Do not follow compressed items forever.
     Make sure to always terminate decoded string
     add $ORIGIN test-case
     mips64: fix memcpy, patch from glibc
     mips: fix clashing symbols
     bump version for release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc-git.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
index 490dfcb..0509a6c 100644
--- a/meta/recipes-core/uclibc/uclibc-git.inc
+++ b/meta/recipes-core/uclibc/uclibc-git.inc
@@ -1,6 +1,6 @@
-SRCREV = "94493929f674f4410c2743fa3dd82fd37b70c58f"
+SRCREV = "003b266cbeb370a8eae91dc256197f00798c6f93"
 
-PV = "1.0.11+git${SRCPV}"
+PV = "1.0.12+git${SRCPV}"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/uclibc-git:"
 
-- 
2.7.1


