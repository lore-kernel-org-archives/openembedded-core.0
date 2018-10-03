Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7778971C42
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Oct 2018 11:52:29 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 143-v6so5400427wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Oct 2018 04:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=yW7iEH2wxFJtyNQew3VXpeufMzMKIh8+C5H6ZAQrLSE=;
	b=ycNRd0kOrO3Y2q2ER1gL5otfD4y9CtfadpuOFp5rB4tVkwwSusrFG4lGpGuVcdqixO
	pdYi3SBM/J0F274yOnkWcMpYpsZfgM9RNgHSrBPApO+JV9C0Km+m2ujSFejtDNBF9VxG
	2i2SsSFCHMmm41/dA0oSA3A3rXU6V4SDxzLTnyI71mV1Iho6n9hddq0tEov0+4/wgxBV
	DswuZ2cRhiUKNbPHPMdlD8L3Xn0DK9j34Rgwf42kmFaFB6J4VeDH7cw66W3LjdtklOfy
	OXH1r+83rfpqRx1hmf9yYCUTK7f+ef8O9SilVwbYxGwhgpowUhBxh/8GO3panteSJqEE
	fKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=yW7iEH2wxFJtyNQew3VXpeufMzMKIh8+C5H6ZAQrLSE=;
	b=sP57vpNa4a6usWrFydYZ4/JbIRZaRjBM1Qqju0SwAjYiMRxR2Xj8GhnqIjYmydT1BR
	iCrspCEkEDfaDetgljV9DZIunusT9GFxggOdtdjs59Ppb6/NXfxw65DZW3hOKT9KOZyY
	bhHUnhpX44atlr4rbYeES4KxA8xS3iUSke1nUGZdGi2aEcpRZonF94jyG1jzyuNKwv1H
	kN2jS8EPAddQ9b5yZQ1nCfrWt9xvgABA46MoHKhUTW9jxv7DzdSMIFbQ5yqdeAfZEc10
	54TK52B3dLuWKSQuKtGovVdYRg/0HkROR6IiVaAkh4bK2Xh2TwYa088SGSBdbBaJhvGV
	78zw==
X-Gm-Message-State: ABuFfojCe6az/hHxFCylYrll4j2x21tqstoeaGh1+0EMDTM+Db5pvfXn
	i6f7OeOV8XTmJ+tdn60Tfnx6vs38sOo=
X-Google-Smtp-Source: ACcGV60perBgPctjV8inUk+gaq9diivmQtTQU1D+UsD/axFWpdYk6dSfVWoazsrN6NFv8/pLluuL1g==
X-Received: by 2002:a1c:6504:: with SMTP id
	z4-v6mr1177451wmb.130.1538567549734; 
	Wed, 03 Oct 2018 04:52:29 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z10-v6sm1199022wrv.22.2018.10.03.04.52.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 04:52:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Oct 2018 12:52:26 +0100
Message-Id: <20181003115226.20823-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] connman: neaten patches
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
X-List-Received-Date: Wed, 03 Oct 2018 11:52:29 -0000

The upstreamable include-tweaking patches contained fragments that should be in
the not-upstreamable musl-specific res_ninit replacement, so move them to the
right patch.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../0002-resolve-musl-does-not-implement-res_ninit.patch     |  8 ++++++++
 meta/recipes-connectivity/connman/connman/includes.patch     | 12 +++---------
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch b/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
index 05934277105..639ccfa2a20 100644
--- a/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
+++ b/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
@@ -17,6 +17,14 @@ diff --git a/gweb/gresolv.c b/gweb/gresolv.c
 index 5cf7a9a..3ad8e70 100644
 --- a/gweb/gresolv.c
 +++ b/gweb/gresolv.c
+@@ -36,6 +36,7 @@
+ #include <arpa/inet.h>
+ #include <arpa/nameser.h>
+ #include <net/if.h>
++#include <ctype.h>
+ 
+ #include "gresolv.h"
+ 
 @@ -875,8 +875,6 @@ GResolv *g_resolv_new(int index)
  	resolv->index = index;
  	resolv->nameserver_list = NULL;
diff --git a/meta/recipes-connectivity/connman/connman/includes.patch b/meta/recipes-connectivity/connman/connman/includes.patch
index 55cb187931b..dcce5bea122 100644
--- a/meta/recipes-connectivity/connman/connman/includes.patch
+++ b/meta/recipes-connectivity/connman/connman/includes.patch
@@ -300,20 +300,14 @@ diff --git a/gweb/gresolv.c b/gweb/gresolv.c
 index 8a51a9f..d55027c 100644
 --- a/gweb/gresolv.c
 +++ b/gweb/gresolv.c
-@@ -23,11 +23,13 @@
- #include <config.h>
- #endif
- 
-+#include <ctype.h>
- #include <errno.h>
- #include <unistd.h>
- #include <stdarg.h>
+@@ -29,6 +29,7 @@
  #include <string.h>
  #include <stdlib.h>
-+#include <stdio.h>
  #include <resolv.h>
++#include <stdio.h>
  #include <sys/types.h>
  #include <sys/socket.h>
+ #include <netdb.h>
 diff --git a/plugins/wifi.c b/plugins/wifi.c
 index 9d56671..148131d 100644
 --- a/plugins/wifi.c
-- 
2.11.0


