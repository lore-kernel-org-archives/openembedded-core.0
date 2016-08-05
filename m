Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1714C77028
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 20:19:34 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id y134so20643351pfg.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2016 13:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Y8ecw38egfnHuikCMAcnXP0e8260Roy/9yiB/blytX0=;
	b=hHw5EUnNf3sj9r9yOu1qPiG4+CkfZtAsfXRpBjFH6ba6olNiUlcLwywukhi0o+Th12
	n1nh3zclsBtKWR7A6n8bFVolRAlzfgN5MouZUbutO1aQoej77qNEC30H8lQMlJDQraMW
	YV428v8PzEydpEt//h6EEVsKvDFrgxfEn+I7UPpMik2n99wxDksLDgz6AA1NwfHAIXRH
	dCI3cP/GbF0dB49hwUZwsXSW1rVurentdN7neqHfGaFKdcpMdycJTxDaV5k2HJ+I5rtj
	Ifx5LmSD2GB3J9Nc6HiMMAwvJ6brc4duCQP97sd3o9bt2X0/OB5nYR1c07+rWYJ4drIB
	LBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Y8ecw38egfnHuikCMAcnXP0e8260Roy/9yiB/blytX0=;
	b=Wwyz6DWG0h7lrc4a2aTLsUlF4RHiN5Rs5+kc3dULfKxjNtypw/n3bUd6/OxP2rRiEq
	TGr7gyz4gKZZ8hjw+P4yD4DSA7DOSIuqS0ezquN4ROpHYVJ2XJOZ4GWAOxFUXy8RZneG
	N6OjykmlA02k3gQohf1b5PKph6Te8+ZyGwE5RyMOAISAsA3VHn7GOnA5aZNK5yFaCH3f
	Zi0uUKYZGO/6+pb4nkH0ATPNXYnsDZJUgOYQ0AS6F5eW4H+1q39B4+ikkEW0NvwuZhoM
	ZJZ4fTP26TyOXjn2lkM5Gpgll0nKjMq2Nfg3E2dkqoIcik5E+VD3kRAUhLtD/syEG1y+
	DG8A==
X-Gm-Message-State: AEkoouuTK5UqX/IZO4O3/U6qTkFTBnuEvTCmJJANW0I82paUfa2qoUevllcQoaUcG7Yodw==
X-Received: by 10.98.30.133 with SMTP id e127mr139439686pfe.104.1470428375476; 
	Fri, 05 Aug 2016 13:19:35 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	q14sm29984246pfi.76.2016.08.05.13.19.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Aug 2016 13:19:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2016 13:19:27 -0700
Message-Id: <20160805201927.32633-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.0
Subject: [PATCH] glibc: Switch to 2.24 release branch
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
X-List-Received-Date: Fri, 05 Aug 2016 20:19:35 -0000

glibc 2.24 is released now
https://www.sourceware.org/ml/libc-alpha/2016-08/msg00212.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/cross-localedef-native_2.24.bb | 5 ++---
 meta/recipes-core/glibc/glibc_2.24.bb                  | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.24.bb b/meta/recipes-core/glibc/cross-localedef-native_2.24.bb
index 650c6c3..d4ccced 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.24.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.24.bb
@@ -17,12 +17,11 @@ inherit autotools
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${PN}:${FILE_DIRNAME}/glibc:"
 
-#SRCBRANCH ?= "release/${PV}/master"
+SRCBRANCH ?= "release/${PV}/master"
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-SRCBRANCH ?= "master"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
 
-SRCREV_glibc ?= "d957c4d3fa48d685ff2726c605c988127ef99395"
+SRCREV_glibc ?= "ea23815a795f72035262953dad5beb03e09c17dd"
 SRCREV_localedef ?= "29869b6dc11427c5bab839bdb155c85a7c644c71"
 
 SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
diff --git a/meta/recipes-core/glibc/glibc_2.24.bb b/meta/recipes-core/glibc/glibc_2.24.bb
index f023272..e446e7a 100644
--- a/meta/recipes-core/glibc/glibc_2.24.bb
+++ b/meta/recipes-core/glibc/glibc_2.24.bb
@@ -7,10 +7,9 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
 
 DEPENDS += "gperf-native"
 
-SRCREV ?= "d957c4d3fa48d685ff2726c605c988127ef99395"
+SRCREV ?= "ea23815a795f72035262953dad5beb03e09c17dd"
 
-#SRCBRANCH ?= "release/${PV}/master"
-SRCBRANCH ?= "master"
+SRCBRANCH ?= "release/${PV}/master"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
-- 
2.9.0


