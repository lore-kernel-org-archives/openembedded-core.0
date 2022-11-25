Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF7C9C4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 21:19:20 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.57117.1669411156591348028
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Nov 2022 13:19:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Mw62GZDb;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id cl5so8464898wrb.9
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 13:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g/3P3d1WrVlfi58CQ6XqoJn4EYiPCUwj5Tjjm+84/xM=;
        b=Mw62GZDbx6/i9T9toa57Qnkni+9pQWWhAW62XSBBdx2jcfl709gpGZlAc5VmuBJZJw
         VFx9cVHkej6ds/xv1ctlLswmqj00PN6SqnMf3E1l6Kub4RRRT8i2rShLZtqfYHv+QkF8
         fR7blhY+St5rv51ISYfX6BGvXorJQsv6WFPZ9lTBauTYITGaEJYuZ/SNFRE+MyKx5QT9
         k4+9gDixVI445YbdLcshUJjfUpYGz6GyBC+nMKUNwVFQKkAIUW4R6MkjMc78yoK0juw3
         +mAs/nclgbtJ7WueG8p+82AWp98rv4f1v52WZm7KCih94SoCCAEKa2Mh7G7vRxoXTTsA
         BSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g/3P3d1WrVlfi58CQ6XqoJn4EYiPCUwj5Tjjm+84/xM=;
        b=7o+L//G/RW6H9TXae+UlogIOFDv1r584Sh/35Vt0mKD2TnpM2cSS1SGws/3PpmMqKb
         7cJ0Ed1ye71fcDJ/QfubW/GosSwIxaOcX2a9jrFO/cKPOV7vM7qnVoFXZ1qWNCrXAjzm
         d59EYiZUyXjSmw9i0Iv53XWUvLyb23YhFVZRvY8lTASnyuKH1LfL1CSlUhxEFMEe6nwg
         woMHmHl2mBDP4RxWOfJzFEiTMgHMT5Nj4N2xSkYiOYNrTcFHeTnoMz1Hlbl1JT9jFNOI
         fDCoGL0FUJjE6Ada4o8uk0J+ZpJk5rq83pobRTuG1gclbXax4D2gJblAiqESaTBLWwbi
         +ANw==
X-Gm-Message-State: ANoB5pk+R0woD1QKTnyUZsSQDNyijinGztf15exKxE/x+lXhNrGIaliG
	bvnZawz/evAi0Aa/MmSMcWLC/ZNGiJA=
X-Google-Smtp-Source: AA0mqf4GB21RDIqk2wPpRs4HF0PtF1CDYLV4EkzPffOBdiL0Rt4DEBfGweihz7x1FiOyuYhTrIE5vg==
X-Received: by 2002:adf:de03:0:b0:236:c820:97e6 with SMTP id b3-20020adfde03000000b00236c82097e6mr24281163wrm.215.1669411155001;
        Fri, 25 Nov 2022 13:19:15 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id f10-20020a05600c154a00b003cf4d99fd2asm7429088wmg.6.2022.11.25.13.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 13:19:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2] gawk: update 5.1.1 -> 5.2.1
Date: Fri, 25 Nov 2022 22:19:11 +0100
Message-Id: <20221125211911.21159-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 21:19:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173788

Place gawkbug into a separate package, as it includes target information
which causes multilib conflicts.

Adjust ptests so they are correctly executed:
- unset LANG before starting
- do not patch /usr/local/bin into /usr/bin; this is not correct

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../gawk/gawk/remove-sensitive-tests.patch    | 35 ++++++++++++++-----
 meta/recipes-extended/gawk/gawk/run-ptest     |  2 +-
 .../gawk/{gawk_5.1.1.bb => gawk_5.2.1.bb}     |  9 +++--
 3 files changed, 35 insertions(+), 11 deletions(-)
 rename meta/recipes-extended/gawk/{gawk_5.1.1.bb => gawk_5.2.1.bb} (86%)

diff --git a/meta/recipes-extended/gawk/gawk/remove-sensitive-tests.patch b/meta/recipes-extended/gawk/gawk/remove-sensitive-tests.patch
index 167c0787ee..ffae55058b 100644
--- a/meta/recipes-extended/gawk/gawk/remove-sensitive-tests.patch
+++ b/meta/recipes-extended/gawk/gawk/remove-sensitive-tests.patch
@@ -1,24 +1,43 @@
+From 354d24baf7c51977d22ff61ad42e6a2cbd4dc8ac Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Tue, 21 Dec 2021 17:09:12 +0000
+Subject: [PATCH] gawk: remove load-sensitive tests
+
 These tests require an unloaded host as otherwise timing sensitive tests can fail
 https://bugzilla.yoctoproject.org/show_bug.cgi?id=14371
 
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 
---- a/test/Maketests~
-+++ b/test/Maketests
-@@ -2069,7 +2069,2 @@
+---
+ test/Maketests | 10 ----------
+ 1 file changed, 10 deletions(-)
 
+diff --git a/test/Maketests b/test/Maketests
+index 3a667af..f117697 100644
+--- a/test/Maketests
++++ b/test/Maketests
+@@ -2137,11 +2137,6 @@ symtab12:
+ 	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
+ 	@-$(CMP) "$(srcdir)"/$@.ok _$@ && rm -f _$@
+ 
 -timeout:
 -	@echo $@ $(ZOS_FAIL)
--	@AWKPATH="$(srcdir)" $(AWK) -f $@.awk  >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
+-	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
 -	@-$(CMP) "$(srcdir)"/$@.ok _$@ && rm -f _$@
 -
  typedregex1:
-@@ -2297,7 +2292,2 @@
+ 	@echo $@
+ 	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
+@@ -2371,11 +2366,6 @@ rwarray:
+ 	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  < "$(srcdir)"/$@.in >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
  	@-$(CMP) "$(srcdir)"/$@.ok _$@ && rm -f _$@
--
+ 
 -time:
 -	@echo $@
--	@AWKPATH="$(srcdir)" $(AWK) -f $@.awk  >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
+-	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
 -	@-$(CMP) "$(srcdir)"/$@.ok _$@ && rm -f _$@
-
+-
+ mpfrbigint:
+ 	@echo $@
+ 	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  -M >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
diff --git a/meta/recipes-extended/gawk/gawk/run-ptest b/meta/recipes-extended/gawk/gawk/run-ptest
index f67a95874f..2675650600 100644
--- a/meta/recipes-extended/gawk/gawk/run-ptest
+++ b/meta/recipes-extended/gawk/gawk/run-ptest
@@ -2,7 +2,7 @@
 
 cd test
 for i in `grep -E "^[a-z0-9_-]*:$" Maketests |awk -F: '{print $1}'`; do
-  #LC_ALL=${GAWKLOCALE:-C} LANG=${GAWKLOCALE:-C} 
+  unset LANG
   srcdir=`pwd` AWKPROG=gawk AWK=gawk CMP=cmp make -f Maketests $i >$i.tmp 2>&1
   if [ -e _$i ]; then
     cat _$i
diff --git a/meta/recipes-extended/gawk/gawk_5.1.1.bb b/meta/recipes-extended/gawk/gawk_5.2.1.bb
similarity index 86%
rename from meta/recipes-extended/gawk/gawk_5.1.1.bb
rename to meta/recipes-extended/gawk/gawk_5.2.1.bb
index fe339805d0..fbe6e7040b 100644
--- a/meta/recipes-extended/gawk/gawk_5.1.1.bb
+++ b/meta/recipes-extended/gawk/gawk_5.2.1.bb
@@ -20,13 +20,16 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "6168d8d1dc8f74bd17d9dc22fa9634c49070f232343b744901da15fb4f06bffd"
+SRC_URI[sha256sum] = "529e7c8c6acf21ff3a6183f4d763c632810908989c24675c77995d51ac37b79c"
 
 inherit autotools gettext texinfo update-alternatives
 
 FILES:${PN} += "${datadir}/awk"
 FILES:${PN}-dev += "${libdir}/${BPN}/*.la"
 
+PACKAGES =+ "${PN}-gawkbug"
+FILES:${PN}-gawkbug += "${bindir}/gawkbug"
+
 ALTERNATIVE:${PN} = "awk"
 ALTERNATIVE_TARGET[awk] = "${bindir}/gawk"
 ALTERNATIVE_PRIORITY = "100"
@@ -34,6 +37,8 @@ ALTERNATIVE_PRIORITY = "100"
 do_install:append() {
 	# remove the link since we don't package it
 	rm ${D}${bindir}/awk
+	# Strip non-reproducible build flags (containing build paths)
+	sed -i -e 's|^CC.*|CC=""|g' -e 's|^CFLAGS.*|CFLAGS=""|g' ${D}${bindir}/gawkbug
 }
 
 inherit ptest
@@ -46,7 +51,7 @@ do_install_ptest() {
 	for i in $TESTS Maketests inclib.awk; do
 		cp ${S}/test/$i* ${D}${PTEST_PATH}/test
 	done
-	sed -i -e 's|/usr/local/bin|${bindir}|g' \
+	sed -i \
 	    -e 's|#!${base_bindir}/awk|#!${bindir}/awk|g' ${D}${PTEST_PATH}/test/*.awk
 
 	sed -i -e "s|GAWKLOCALE|LANG|g" ${D}${PTEST_PATH}/test/Maketests
-- 
2.30.2


