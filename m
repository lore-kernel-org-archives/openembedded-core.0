Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8AAD37850C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Mar 2018 11:21:35 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id h21so7470269wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Mar 2018 04:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pFZX+Obzsx3TcDB8+Ao8Wf5WlyGZedqvn9PCiDSMHfw=;
	b=kB5YMoM1SYO8EqanwGA9okMLbYZir3b7wwm0nso4rV+QAJM5AkIqK6mE3YgcGSAxD2
	qhIcI0k+nDoIV2EvznQIY4XijvPFhAu/gdDoZ+xnCcwc2fPB6NBYugetUahcNaI/2vtp
	HlSX4x4nhzfZmdC+QNSkL9cJ91yce3hh4EsxMqFrbWfrEsgCWeuAxYwqrcj9hHogHltU
	Oj+REJmTJzGjfWGBSIoNWtltXp7KuBrit3WEx+BDQ7qxtVsAk0O8SSXy9QPb7Ur8gDty
	YTZ1RQsHzJKebX9/gpDxdSoStpPo9jiwccg6yN59J5fCUBI4kg7qVr/Ff3KTeJjEn8My
	9xeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pFZX+Obzsx3TcDB8+Ao8Wf5WlyGZedqvn9PCiDSMHfw=;
	b=qOzFGxcrHz115e0OyyB3AZXwZziMZlDYpInYi1GQWEdbe0cxbplU2AU92CA0PLORXJ
	TPwstl+tf5ZAxgiDfX6pnDgTq6DTEo6XojbXVmbN4lx7mDL5Td22oykrxPi77gKC7clD
	b430Q8mc2oDM39iKUgaYqtBP9y1Fp/eGKrq1buscwz9Uj8iY0ZW2SpcvSLmmNwkI8C+s
	ieAQ1A76dtL0ymGZmIYUdm07smkNg8EPENySQToh/t+N7G7mTCxuRQN0ejiYkiKZoA6Q
	F7ohcTKuZePxlAuVkvCw+11wVGKwF2EizNdeWX1GVZhw8Zj1ZPyx02/7vvH3P3MJv1Ei
	eYZQ==
X-Gm-Message-State: AElRT7GXTvqSygBmxRMvs/gIDVLDydziVvtPWKdfvr/JavYOLwA+05Ee
	cJydDcVFFtkIQYl/li39lmeeLQ==
X-Google-Smtp-Source: AG47ELsMV0mEXvNty4BztKHUiub8LG9hdsyToyNEF7bFR+/7+g6Tk5mfXuSIJir7NLu3CC2/K3ddKQ==
X-Received: by 10.28.87.75 with SMTP id l72mr3892389wmb.48.1521285696228;
	Sat, 17 Mar 2018 04:21:36 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	s49sm1789644wrc.95.2018.03.17.04.21.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Mar 2018 04:21:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 17 Mar 2018 11:21:30 +0000
Message-Id: <20180317112130.27032-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <CAMKF1sqfasCaxgxFV_-f1UhAeS4GnwJxSU1uz61UbOg3Rmecsg@mail.gmail.com>
References: <CAMKF1sqfasCaxgxFV_-f1UhAeS4GnwJxSU1uz61UbOg3Rmecsg@mail.gmail.com>
Subject: [PATCHv2] iputils: add PACKAGECONFIG for libidn and disable it by default
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
X-List-Received-Date: Sat, 17 Mar 2018 11:21:35 -0000

* it got enabled by default, but without the dependency on libidn in:
  commit 5997981fa2c22609a88b8cbb595dbf7758b2f7c2
  Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
  AuthorDate: Thu Feb 1 20:02:08 2018 +0200
  Subject: iputils: update to 20161105

* https://github.com/iputils/iputils/blob/master/RELNOTES.old
  mentiones that IDN was enabled by default in:
  [s20160308] and surprisingly the same in [s20150815]
  but there are no release notes for s20151218 version we were using until
  now, don't know how it really relates to [s20150815].

* but there are some issues with libidn as described in:
  https://github.com/iputils/iputils/commit/f3a461603ef4fb7512ade3bdb73fe1824e294547
  so disable it by default.

* fails with:
  | In file included from ping_common.c:1:0:
  | ping.h:39:10: fatal error: idna.h: No such file or directory
  |  #include <idna.h>
  |           ^~~~~~~~

* Easiest way to reproduce this failure is to remove libidn from gnutls
  PACKAGECONFIG or to use gnutls which doesn't have libidn PACKAGECONFIG
  at all (like the one in meta-gplv2).

* First it leads to following QA issue:
  http://errors.yoctoproject.org/Errors/Build/53212/
  ERROR: iputils-s20161105-r0 do_package_qa: QA Issue: iputils-ping rdepends on libidn, but it isn't a build dependency, missing libidn in DEPENDS or PACKAGECONFIG? [build-deps]
  ERROR: iputils-s20161105-r0 do_package_qa: QA Issue: iputils-traceroute6 rdepends on libidn, but it isn't a build dependency, missing libidn in DEPENDS or PACKAGECONFIG? [build-deps]
  ERROR: iputils-s20161105-r0 do_package_qa: QA run found fatal errors.
  Please consider fixing them.
  ERROR: iputils-s20161105-r0 do_package_qa: Function failed:
  do_package_qa
  ERROR: Logfile of failure stored in: /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/iputils/s20161105-r0/temp/log.do_package_qa.7627
  ERROR: Task (/OE/build/oe-core/openembedded-core/meta/recipes-extended/iputils/iputils_s20161105.bb:do_package_qa) failed with exit code '1'

* But if you cleansstate iputils as well (after removing libidn from
  gnutls PACKAGECONFIG) to empty iputils RSS, then you get the error about
  missing idna.h:
  http://errors.yoctoproject.org/Errors/Build/53213/

* Adding the libidn dependency explicitly in iputils recipe fixes the
  issue.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/iputils/iputils_s20161105.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/iputils/iputils_s20161105.bb b/meta/recipes-extended/iputils/iputils_s20161105.bb
index ad7dbc4d4a..dda891c7f7 100644
--- a/meta/recipes-extended/iputils/iputils_s20161105.bb
+++ b/meta/recipes-extended/iputils/iputils_s20161105.bb
@@ -23,8 +23,11 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>s\d+)"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
+PACKAGECONFIG ?= "libidn"
+PACKAGECONFIG[libidn] = "USE_IDN=yes,USE_IDN=no,libidn"
+
 do_compile () {
-	oe_runmake 'CC=${CC} -D_GNU_SOURCE' VPATH="${STAGING_LIBDIR}:${STAGING_DIR_HOST}/${base_libdir}" all
+	oe_runmake 'CC=${CC} -D_GNU_SOURCE' VPATH="${STAGING_LIBDIR}:${STAGING_DIR_HOST}/${base_libdir}" ${PACKAGECONFIG_CONFARGS} all
 }
 
 do_install () {
-- 
2.15.1


