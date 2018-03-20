Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 80560783C9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 05:21:22 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id a19so224769pgw.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 22:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=571+ivtsKkbQCtmcUw5LIEbEdzoEyK6khd/8AgJpeYo=;
	b=Oyu04lPRxjU5catrN8KOdK1Dtq3wuPJpkbV30fXmYtWBxmbk+icxCFZkyMmJ5308ch
	JavenL09ESRD9TfbG/eUKEA4NXpBfQNHEvksSz5jHXc4LZIJF/1qSeNeL/IKSFKqS5GM
	Iy56X4gLiGPcCQtmIzzRoc7reAM1o9yxPivnnToMsVG/H2lszm+dKxN58i6xy+TMoWz0
	IivB1tEtwC30w+++kIeqAHgvV1Oz/jMKW+1GfLQ6uwxrZU9P2KCaJXUE6oSZ1MKbLoVp
	RnxZM+2LcTxvfevJiQGx1+4njpGrJ2AyJ//bfCcrldT+aKZ+KsuxALs+w7ARlfFXUCKf
	yhgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=571+ivtsKkbQCtmcUw5LIEbEdzoEyK6khd/8AgJpeYo=;
	b=iKb9Z/9GcPlMHnPph8az7kdMREuQK1Bc+SOx5SIa+rwUizIju+NXU2wZQfCK0n4Dkn
	/90yYps2s2hU+j3qOH+/5im9ws+YordiFhUM3FDOBZ/yNUnA58q97jUCcUR3AwTwOPaf
	a6b4PsJiGrjMMN0QvcBdT9AGQSbu8W86k3nqpXEwi6Zxsu7p1xB087yQJp2zXvTKCm8y
	9lu7I1L68Y+aivVyg8ZGQrgf3LhgWqKP++Bk+/8/icyuVpDI6NsnqIFsVp6ZzJxZv3AH
	GbaqT8gHT1T3HOQgAljcJ+wy8RGqD2eDBPue6V8IdyCEWYJ1/IZ+agMRcVdrh5wahMz9
	Nxvw==
X-Gm-Message-State: AElRT7GHtzG1EWA2nx2NpUNtADwq81mJNINRO2ixyVf9RmE1hGGvCG1r
	Dhm8gdAgvPITBRBwhR9KAzP7vQ==
X-Google-Smtp-Source: AG47ELvK/I2bH35IIZgezvXqW86IoKlJ5w6Tr3WbCfL/bpVVpd7yqT6f9Mrx2A6wVrzou1ae5mtvkw==
X-Received: by 10.101.82.139 with SMTP id y11mr11159769pgp.68.1521523283534;
	Mon, 19 Mar 2018 22:21:23 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	q2sm1029469pgp.70.2018.03.19.22.21.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Mar 2018 22:21:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Mar 2018 22:21:14 -0700
Message-Id: <20180320052114.32323-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
Subject: [PATCH] glibc-2.27: Update to bring in 2.27 bug fixes since release
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
X-List-Received-Date: Tue, 20 Mar 2018 05:21:22 -0000

Here is full list of fixes

https://sourceware.org/git/?p=glibc.git;a=shortlog;h=df3ff4e49d4ee3cbbdaeb0b1cb5dc2344c08be98;hp=23158b08a0908f381459f273a984c6fd328363cb

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/cross-localedef-native_2.27.bb | 2 +-
 meta/recipes-core/glibc/glibc_2.27.bb                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.27.bb b/meta/recipes-core/glibc/cross-localedef-native_2.27.bb
index f1e4a657cf..d80c8c2a55 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.27.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.27.bb
@@ -21,7 +21,7 @@ SRCBRANCH ?= "release/${PV}/master"
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
 
-SRCREV_glibc ?= "23158b08a0908f381459f273a984c6fd328363cb"
+SRCREV_glibc ?= "df3ff4e49d4ee3cbbdaeb0b1cb5dc2344c08be98"
 SRCREV_localedef ?= "de5bdbd5e76b5403a4151b9b9f958b6cca36b3e7"
 
 SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
diff --git a/meta/recipes-core/glibc/glibc_2.27.bb b/meta/recipes-core/glibc/glibc_2.27.bb
index c4042d16fe..326804d6d5 100644
--- a/meta/recipes-core/glibc/glibc_2.27.bb
+++ b/meta/recipes-core/glibc/glibc_2.27.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
 
 DEPENDS += "gperf-native bison-native"
 
-SRCREV ?= "23158b08a0908f381459f273a984c6fd328363cb"
+SRCREV ?= "df3ff4e49d4ee3cbbdaeb0b1cb5dc2344c08be98"
 
 SRCBRANCH ?= "release/${PV}/master"
 
-- 
2.16.2


