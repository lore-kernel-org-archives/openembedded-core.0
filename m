Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 026F960124
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 18:23:12 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id t190so10582823pfb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2016 11:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=yt2ccemhWlpIoHiETZi0F6Mi+RJ+hjdy71yrSH+fAOA=;
	b=VQY1FbzelG3VJXGxaAAEJZWimoNn+JDowCJ1v1Qyd7jAB8MlnMhzvg1ccc8h73nVii
	mJkKSe4xQPSIrW7nUsmH7+FODRTbK7x8sirXrCKL63GsjtyExUU7ttneWJG208msclEI
	D3eAAamtKfavHqmlGNOQZcocRsVT8Dzh1Bo9i1VZNVS53I1GJElHWKxaJTxh/apcHe7h
	eOH+vCESinOdAzd9AIN2WwJ1JUtiiKuVGtZC3Zu6/dNoFVtfThUIsvsOV8wn6see3gpw
	pWcNfFDOn0cQa1aNit5ij5kSCUkMVClSjeocuofBY9vcvgxYSq+5sgGFo6x/CR49QJ3r
	AvjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yt2ccemhWlpIoHiETZi0F6Mi+RJ+hjdy71yrSH+fAOA=;
	b=iegUP3sbNWgs5vKdrz+nYZeDbuZ00QsaSpmRTau1F8jHaHRsunwFOgkbJ8F6VOpdYQ
	oQ49FZign7XB6WzsRF6+064LRowdEEIkvgj/JW561A2cstGXtKj5RhLbthfjyDjiMn6n
	GIk40Yt9OjcdfAIjX5azqX39dNQGnm1wKSczfVyEDuWrHIRCFrbUiZx/F+q3i1tTZck3
	DJe4r9vMJVAKwQgJ443RY4NQO9hu1XRnRtcwaVMXLDrRSayTofmrKLXnA87u40hJIfEz
	ot8ope9igrdO6s37i5lvy3Wols0V3rRczSYJzLRaUat98Uh1b9aRveFEq25gaQdDCAyC
	neNg==
X-Gm-Message-State: ALyK8tI9mdHg5zAYgnnriWeOVRDcIWzBcG555MtWvgrUMNYYdLhzOg8cw9XGi+YpvAQoKA==
X-Received: by 10.98.4.193 with SMTP id 184mr33622998pfe.98.1467397393411;
	Fri, 01 Jul 2016 11:23:13 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	zo15sm7381680pab.15.2016.07.01.11.23.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Jul 2016 11:23:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jul 2016 11:23:07 -0700
Message-Id: <20160701182307.25464-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.0
Subject: [PATCH] glibc: Upgrade to latest tip of master
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
X-List-Received-Date: Fri, 01 Jul 2016 18:23:13 -0000

Stepping towards 2.24 release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/cross-localedef-native_2.24.bb | 2 +-
 meta/recipes-core/glibc/glibc_2.24.bb                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.24.bb b/meta/recipes-core/glibc/cross-localedef-native_2.24.bb
index 79c3132..c921211 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.24.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.24.bb
@@ -22,7 +22,7 @@ GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
 SRCBRANCH ?= "master"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
 
-SRCREV_glibc ?= "1ac3eaa6bcc473a56340c24511786ff48a91293e"
+SRCREV_glibc ?= "76a0b73e8102c5bfb5cb791e34992472f5d1d33e"
 SRCREV_localedef ?= "29869b6dc11427c5bab839bdb155c85a7c644c71"
 
 SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
diff --git a/meta/recipes-core/glibc/glibc_2.24.bb b/meta/recipes-core/glibc/glibc_2.24.bb
index 77630e3..a5e1ad6 100644
--- a/meta/recipes-core/glibc/glibc_2.24.bb
+++ b/meta/recipes-core/glibc/glibc_2.24.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
 
 DEPENDS += "gperf-native"
 
-SRCREV ?= "1ac3eaa6bcc473a56340c24511786ff48a91293e"
+SRCREV ?= "76a0b73e8102c5bfb5cb791e34992472f5d1d33e"
 
 #SRCBRANCH ?= "release/${PV}/master"
 SRCBRANCH ?= "master"
-- 
2.9.0


