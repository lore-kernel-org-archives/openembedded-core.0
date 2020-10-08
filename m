Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com [209.85.167.193])
 by mx.groups.io with SMTP id smtpd.web12.939.1602181136205294221
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2020 11:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=B66aiv8g;
 spf=pass (domain: gmail.com, ip: 209.85.167.193, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f193.google.com with SMTP id c13so7286019oiy.6
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2020 11:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=y/50U0/+FpMJJrHAQb2vBf3+xsDwqqj6mBUHnSARD0U=;
        b=B66aiv8g4OkYLwlYI80yyZM/3/fM+2ca5VRtUs7yUov6mQ+NTTQVfDLh8bIQ1wQuCC
         ALdICdUvpJAmGdXiVnCKEJ2MmamKyyenn4oroCcfmeGz62C5bdlB4SKBr6zeZ4qa50dm
         NUuIRYkMnuZ17cPc/rZA1yZ72n3cjUXLeUDeCcAHX3WKH6GtEP7DEvNtb0maC0AcOdU5
         vsam+1SSvtHsyA2CQNFhCSeLiFzNG5z4OSYSs07VU1QuowesIyUn5ycYR7BDBh8GGd5S
         yYBAocoMUYMKEtiE4U7PEm79XymBH2uGwK43OdOrc94IUe70la+UnfAvGP9P1ibqx5MU
         jivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=y/50U0/+FpMJJrHAQb2vBf3+xsDwqqj6mBUHnSARD0U=;
        b=eTPBanXGSW5PiJjp6J/JiqS0JFAOYX4D0o5lQW7Wq6ft3Fy67fhEJCbYDpNZiYlL+C
         MzEb0Mb/YdgVin+M9kPTBXU3RWFqwCGeLdFXseO6s7Lo1XQfrPBC2RAY7npFI8f7bymt
         j71DUl/niwO2+0KIaKWTkym9NGxRyACTzB8gBPpiBAwPemajriC7UYJts97g56AzijS7
         O26yYqK7f1WMjvWqdRpMbyYqE4bxeZf3COao1+ZLrWb/3mSPFIYYqu+jHttNYv86Tp67
         wD3mr8gi9PYLveAU2JJL2uih27jRKaY/JcVuVvpLBdPaf3B2kJLPW5btZjeF559DxGP9
         /F8w==
X-Gm-Message-State: AOAM532H0FyAcalQUu7GyIB1OhIGkA6l9/68Ut5Tc1z8LEdGN5mQyUi9
	f3A/GreOSM7+4iTDjTGdZCAtnrgGRjI=
X-Google-Smtp-Source: ABdhPJyarUJ22QlHZ/1eJEYV0Za+ru45BW5R8SO/fC9ofWNIeD8K6xO1eT/NRL8X9Xci+EeYzrFmpQ==
X-Received: by 2002:a05:6808:14f:: with SMTP id h15mr57610oie.119.1602181135346;
        Thu, 08 Oct 2020 11:18:55 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:f1c6:e45a:6950:664b])
        by smtp.gmail.com with ESMTPSA id g124sm5372602oia.58.2020.10.08.11.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 11:18:54 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH] timezone: update to 2020b
Date: Thu,  8 Oct 2020 11:18:52 -0700
Message-Id: <20201008181852.9115-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Armin Kuster <akuster@mvista.com>

For more info see: https://github.com/eggert/tz/blob/master/NEWS

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-extended/timezone/timezone.inc | 8 +++-----
 meta/recipes-extended/timezone/tzdata.bb    | 8 ++++----
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 32723f3deca..8eb17c5eafe 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2020a"
+PV = "2020b"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,7 +14,5 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.md5sum] = "f87c3477e85a5c4b00df0def6c6a0055"
-SRC_URI[tzcode.sha256sum] = "7d2af7120ee03df71fbca24031ccaf42404752e639196fe93c79a41b38a6d669"
-SRC_URI[tzdata.md5sum] = "96a985bb8eeab535fb8aa2132296763a"
-SRC_URI[tzdata.sha256sum] = "547161eca24d344e0b5f96aff6a76b454da295dc14ed4ca50c2355043fb899a2"
+SRC_URI[tzcode.sha256sum] = "47eff8944de4a64f7629b851e4a32338ab12c9b73edd62063795167ff1fe43da"
+SRC_URI[tzdata.sha256sum] = "9b053f951d245ce89d850b96ee4711d82d833559b1fc96ba19f90bc4d745e809"
diff --git a/meta/recipes-extended/timezone/tzdata.bb b/meta/recipes-extended/timezone/tzdata.bb
index 6aac516f694..f8443110d59 100644
--- a/meta/recipes-extended/timezone/tzdata.bb
+++ b/meta/recipes-extended/timezone/tzdata.bb
@@ -15,18 +15,18 @@ DEFAULT_TIMEZONE ?= "Universal"
 INSTALL_TIMEZONE_FILE ?= "1"
 
 TZONES= "africa antarctica asia australasia europe northamerica southamerica  \
-         factory etcetera backward systemv \
+         factory etcetera backward \
         "
 # pacificnew 
 
 do_compile () {
         for zone in ${TZONES}; do \
             ${STAGING_BINDIR_NATIVE}/zic -d ${WORKDIR}${datadir}/zoneinfo -L /dev/null \
-                -y ${S}/yearistype.sh ${S}/${zone} ; \
+                ${S}/${zone} ; \
             ${STAGING_BINDIR_NATIVE}/zic -d ${WORKDIR}${datadir}/zoneinfo/posix -L /dev/null \
-                -y ${S}/yearistype.sh ${S}/${zone} ; \
+                ${S}/${zone} ; \
             ${STAGING_BINDIR_NATIVE}/zic -d ${WORKDIR}${datadir}/zoneinfo/right -L ${S}/leapseconds \
-                -y ${S}/yearistype.sh ${S}/${zone} ; \
+                ${S}/${zone} ; \
         done
 }
 
-- 
2.17.1

