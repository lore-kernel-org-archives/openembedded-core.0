Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1E046780F3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Nov 2017 21:32:57 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 17so9131737pfn.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Nov 2017 13:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=L5LByyEMjTygOkLKypE6aGMDOM1p6fa+obueUO1B814=;
	b=cQcXlz0Tybzm1kr4vCxt1lhi2wG66n6BHWTuhzS2r90b4qcFcAwhV4H6mrlLeMDrRp
	ibd0aTT/TxPbzSPHULabGiL/vk4Sl81mnKR1DLpuemtswaw0gWaGXrMcaxAVGfa2KZyH
	U7JbydI7muGTtNwUPTzQoz+IPmqj0PWajtadjtvoW5jyQBemhHC7jgy1Dz0okCRuCwtN
	ytmA2xSuzFlPQCeN6DKhWtVQGvsW9+rZmMlD7LCAoy7g3hnVKBGhxweCoYkUycsksiA6
	7H5uQwD/u3sZfoQ92ChiCQoGh+TVH9Evv4gwmSbQkQC41RjYx0OUW1XZHtW9SbqyjJQu
	JsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=L5LByyEMjTygOkLKypE6aGMDOM1p6fa+obueUO1B814=;
	b=U+BbzZOHSlIMHWM/h64UOFdECShPIe4RQsb89lwg7DmmbbsAsygukvqZUV7aS3mzOD
	x9Jf4NklCGo5TjR4qm2V4uF8uTEoWsDWJgHuQAt2mL5IvSTf5v1J/dOhMlge3VxFWRWQ
	YL+XQsYzbuKG3l9sG4gCF1OQK45TlN0wa/tnSTXPb73ecMe2KTF82yhpba+XbETNbI3L
	CxemwAHf1MSe4sgJOYk4+2BOzhbQbj1EQ34WEk+A/v2wxUiTL/M+h06ZemZK0/jjyB/2
	868AZFNQxDQBh89mXi9jUeuDYsJFlDwYuC6FuanacBQym4VsyD2+q7q1rrgxyMQjHhrf
	hFKA==
X-Gm-Message-State: AJaThX64HdZ6sHSq3izrXZPDWvzFXIdRXTfL1GeOmrcPlw+qAJxeppkS
	8TOfgH20uj0+izXUjdbjxv1gCg==
X-Google-Smtp-Source: AGs4zMYLyjnk8vXIkhjYde1x+LRNr3L/4a+Wxg8Aq52Es/dxkZafK3bidx8xlPCzYIYEzhQGl7OvFA==
X-Received: by 10.101.70.130 with SMTP id h2mr4460366pgr.238.1510435979262;
	Sat, 11 Nov 2017 13:32:59 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:f5ba:3289:44cf:7633])
	by smtp.gmail.com with ESMTPSA id
	w9sm25208899pfk.16.2017.11.11.13.32.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 11 Nov 2017 13:32:58 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sat, 11 Nov 2017 13:32:56 -0800
Message-Id: <1510435976-10490-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510435976-10490-1-git-send-email-akuster808@gmail.com>
References: <1510435976-10490-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH] binutils: update to 2.29.1
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
X-List-Received-Date: Sat, 11 Nov 2017 21:32:58 -0000

From: Armin Kuster <akuster@mvista.com>

update to 2.29.1 to fix the following missing CVE's

CVE-2017-15939, CVE-2017-15938, CVE-2017-15225, CVE-2017-15025,
CVE-2017-15024, CVE-2017-15023, CVE-2017-15022, CVE-2017-15021,
CVE-2017-15020, CVE-2017-14974, CVE-2017-14940, CVE-2017-14939,
CVE-2017-14938, CVE-2017-14934, CVE-2017-14933, CVE-2017-14932,
CVE-2017-14930, CVE-2017-14745, CVE-2017-14729, CVE-2017-14529,
CVE-2017-14333, CVE-2017-14130, CVE-2017-14129, CVE-2017-14128,
CVE-2017-13757, CVE-2017-13716, CVE-2017-13710, CVE-2017-12967,
CVE-2017-12799, CVE-2017-12459, CVE-2017-12458, CVE-2017-12457,
CVE-2017-12456, CVE-2017-12455, CVE-2017-12454, CVE-2017-12453,
CVE-2017-12452, CVE-2017-12451, CVE-2017-12450, CVE-2017-12449,
CVE-2017-12448

see Changelogs for additional information

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../binutils/{binutils-2.29.inc => binutils-2.29.1.inc}                 | 2 +-
 ...inutils-cross-canadian_2.29.bb => binutils-cross-canadian_2.29.1.bb} | 0
 .../binutils/{binutils-cross_2.29.bb => binutils-cross_2.29.1.bb}       | 0
 .../binutils/{binutils-crosssdk_2.29.bb => binutils-crosssdk_2.29.1.bb} | 0
 meta/recipes-devtools/binutils/{binutils_2.29.bb => binutils_2.29.1.bb} | 0
 5 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/binutils/{binutils-2.29.inc => binutils-2.29.1.inc} (97%)
 rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.29.bb => binutils-cross-canadian_2.29.1.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross_2.29.bb => binutils-cross_2.29.1.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.29.bb => binutils-crosssdk_2.29.1.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils_2.29.bb => binutils_2.29.1.bb} (100%)

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
similarity index 97%
rename from meta/recipes-devtools/binutils/binutils-2.29.inc
rename to meta/recipes-devtools/binutils/binutils-2.29.1.inc
index 27d46eb..d92bbbc 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -18,7 +18,7 @@ BINUPV = "${@binutils_branch_version(d)}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV = "37e991bb143ca2106330bcdc625590d53838b7a1"
+SRCREV = "90276f15379d380761fc499da2ba24cfb3c12a94"
 SRC_URI = "\
      git://sourceware.org/git/binutils-gdb.git;branch=binutils-${BINUPV}-branch;protocol=git \
      file://0003-configure-widen-the-regexp-for-SH-architectures.patch \
diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.29.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.29.1.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross-canadian_2.29.bb
rename to meta/recipes-devtools/binutils/binutils-cross-canadian_2.29.1.bb
diff --git a/meta/recipes-devtools/binutils/binutils-cross_2.29.bb b/meta/recipes-devtools/binutils/binutils-cross_2.29.1.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross_2.29.bb
rename to meta/recipes-devtools/binutils/binutils-cross_2.29.1.bb
diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.29.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.29.1.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-crosssdk_2.29.bb
rename to meta/recipes-devtools/binutils/binutils-crosssdk_2.29.1.bb
diff --git a/meta/recipes-devtools/binutils/binutils_2.29.bb b/meta/recipes-devtools/binutils/binutils_2.29.1.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils_2.29.bb
rename to meta/recipes-devtools/binutils/binutils_2.29.1.bb
-- 
2.7.4


