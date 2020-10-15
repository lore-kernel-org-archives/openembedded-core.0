Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.13134.1602771336276777650
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2020 07:15:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=tZeuna2c;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id 144so2120692pfb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2020 07:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=YPAtokz5Lf4CIP9iZcRr3VHiUy5zQgL2X//kvnjKhXc=;
        b=tZeuna2cGZqQFaJRzVeCwZY0jEAwYWIH7n1oEtxlcZfw560p76wfEom3GHMggbM+hv
         GGF7AN7jjpT+7kKMOxbxbFPAdE3Dv+IkBII4ndPvn93jNljtdr5bWxGaVPyQ34awPEbk
         zwurb66vF4PCHrUbWxA9XHblTZtHVZKewPh11678CbJHJPIOa64jdSJZyWVDmQEOXp+I
         gwDS4ccrs0eIT9YoBTtlD9QhwfTMBV0ULbw1CImGQFjm93dHk9VMBZA/dpAEWe3XFg5J
         ili1TCV5Wf5dQWPk3H0jwHhOxJVLKFQOZXADBx8+4QmCNLGGu60ZRgv0sVhuWo9X17cN
         X9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=YPAtokz5Lf4CIP9iZcRr3VHiUy5zQgL2X//kvnjKhXc=;
        b=YBR7iCgE7E1H5piIpeu+G+EH4WJBcqSX+xiVc8rREThXiWcVsEkQsXP8pAKH5WA9qj
         sHzMGvSPXb7/+sPoOZD6A0uaEqPifYcj/L6AQyxMPBqwDAZAK5jifhr9uVeppKWliz0n
         Se0jP9/7IV2TNkzX/SK/s93DL+eTQjWYL5rg8uZzRo4rb9k9T4fKvSJyZj0jW6KwDBuz
         mSUvkhJfNxd7asMDwtd/2qhIOH0nxx2A4E3Pm+C/Gp8wFCWQFDsODCVd4kNMPf1rg9Zr
         YmRDKlkh1ToepZHl/Bw/clKS4kNq1dlsirejKH/PW4ATT10INk0J6No/uz2zZOwZcwuB
         xcxw==
X-Gm-Message-State: AOAM531JPCmOXgraT0NFfOcPxuNRONKZbQMCm3EQfVKKu7thvbwCS3F6
	nr6hEKPpwZEHEzpbug+FvjsDPXxJlnURQIgm
X-Google-Smtp-Source: ABdhPJw90OXMf3GdVwD8LtUizOtNGeOBzmcJ7S7PPzbED+b18PUwTdlI1L3yF6p+hFKZGPNjDDKOVQ==
X-Received: by 2002:a63:3fc7:: with SMTP id m190mr3444115pga.293.1602771335093;
        Thu, 15 Oct 2020 07:15:35 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i9sm3565138pgc.71.2020.10.15.07.15.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 07:15:34 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/8] timezone: update to 2020b
Date: Thu, 15 Oct 2020 04:15:06 -1000
Message-Id: <691e2c99d0ed2850adcbfe80973d2b8691829cb5.1602771116.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1602771116.git.steve@sakoman.com>
References: <cover.1602771116.git.steve@sakoman.com>

From: Armin Kuster <akuster@mvista.com>

For more info see: https://github.com/eggert/tz/blob/master/NEWS

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b19bc7ae71a59673bd725e1de3251667c2026ed5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/timezone.inc | 8 +++-----
 meta/recipes-extended/timezone/tzdata.bb    | 8 ++++----
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 32723f3dec..8eb17c5eaf 100644
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
index 1e2b440fb0..e6a0655afe 100644
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

