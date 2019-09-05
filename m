Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5CFB57F2E2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 15:19:15 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id q21so1947121pfn.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2019 08:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KIypmHm8Z54QEM2fpfii5FzVMtjCWIOvJGaoicL6sH4=;
	b=QM5PMz/YFS+OmE7sjCy0gQP8ni1akEV56m2/jCGVmcWLTrwY+pDY4yOBHVw/GNF3Tk
	E1VolbwJJk1mJ7DvfDsuM4/vnn4dQumeAAkJRJKm1DJOnaIsmln0XGN7sOgefGdkLV7j
	MId3ewdT59SXYKvOiGMwVWgtQPgNK4g7ApRX1D2xnCAIcAwagvPUABHGksaDI4qabfhs
	J2sG4EM2d17GM/iwGp0WW1/EJCMKi83JyeKeYaTtUSdwsANeoRcMOf+oL0MVdlo271Wd
	M7a4dpsFOuHRhVuYxA/KEBl1HI0vpW9LryVC4YRX38aSZHjHri1Sz1IAYgsX0CbZsMOA
	yoeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KIypmHm8Z54QEM2fpfii5FzVMtjCWIOvJGaoicL6sH4=;
	b=nrY06NHSS23uaPBXgmQ6hDkuyxh8sA75q2sfxOd4xl1amOyfdWfOrsKFs1FYA+rm9P
	vYhACo8v1Pr9heDMtXx8CbHPoX5Bh2Ux/d3/toPB+l/BJqdELECVE6/7nuqPdfy0dcMc
	BU6C2Dnj9aIaEcznSP0u+gcQ+KcSIJFwfgdxQhLsMqr92dR/CmkJDFQXHeM2c3pTyzoA
	iZU+sDugH0rjKU8NUtznXgQ9dk/Udu3EBW+w4HTbxkKCrQRuIX97Ba4EOUPQwgsDFNQI
	UAeVQhGPLgawFZPQdv5VwWhzdDvl+9dbGnA+0iVm3yGWMAmZtYD9A9P7w/6kljylaOIE
	h3eg==
X-Gm-Message-State: APjAAAWJIrWChsHVV0NKy2KeEMMYEOWgDlh+vKBQyTyYQ96LYtYAszpO
	Z7JfU2vUpVoQJ9ZPcm9jwk9qw1dr
X-Google-Smtp-Source: APXvYqxbds2Up5eQZYu8JHkuhT49b9xtN6CtL/sp20Njsba+7brylo5+qjfWHdjdUUjxxIUU6pe4PQ==
X-Received: by 2002:a63:2bd2:: with SMTP id r201mr3589802pgr.193.1567696756155;
	Thu, 05 Sep 2019 08:19:16 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:811a:fbd5:24bc:2160])
	by smtp.gmail.com with ESMTPSA id
	o129sm3125712pfg.1.2019.09.05.08.19.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Sep 2019 08:19:15 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Sep 2019 08:19:10 -0700
Message-Id: <1567696751-26950-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567696751-26950-1-git-send-email-akuster808@gmail.com>
References: <1567696751-26950-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>, Adrian Bunk <bunk@stusta.de>
Subject: [thud][PATCH 2/3] bind: upgrade 9.11.5 -> 9.11.5-P4
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
X-List-Received-Date: Thu, 05 Sep 2019 15:19:15 -0000

From: Adrian Bunk <bunk@stusta.de>

Source: OE.org
MR: 99751, 99752, 99753
Type: Security Fix
Disposition: Backport from https://git.openembedded.org/openembedded-core/commit/meta/recipes-connectivity/bind?h=warrior&id=5d286da0fbe1a7ded2f84eec990e49d221bdeab4
ChangeID: ce3719ea11bd03af3baeca51a22115badf84be01
Description:

Bugfix-only compared to 9.11.5, mostly CVE fixes.

COPYRIGHT checksum changed due to 2018 -> 2019.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[Included cves:
CVE-2018-5744
CVE-2018-5745
CVE-2019-6465
]
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-connectivity/bind/{bind_9.11.5.bb => bind_9.11.5-P4.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.11.5.bb => bind_9.11.5-P4.bb} (96%)

diff --git a/meta/recipes-connectivity/bind/bind_9.11.5.bb b/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
similarity index 96%
rename from meta/recipes-connectivity/bind/bind_9.11.5.bb
rename to meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
index 21e979f..432bad0 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.5.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.isc.org/sw/bind/"
 SECTION = "console/network"
 
 LICENSE = "ISC & BSD"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=6ba7c9fe0c888a943c79c93e6de744fb"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=8f17f64e47e83b60cd920a1e4b54419e"
 
 DEPENDS = "openssl libcap zlib"
 
@@ -22,8 +22,8 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-avoid-start-failure-with-bind-user.patch \
 "
 
-SRC_URI[md5sum] = "17a0d02102117c9a221e857cf2cc8157"
-SRC_URI[sha256sum] = "a4cae11dad954bdd4eb592178f875bfec09fcc7e29fe0f6b7a4e5b5c6bc61322"
+SRC_URI[md5sum] = "8ddab4b61fa4516fe404679c74e37960"
+SRC_URI[sha256sum] = "7e8c08192bcbaeb6e9f2391a70e67583b027b90e8c4bc1605da6eb126edde434"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>9(\.\d+)+(-P\d+)*)/"
-- 
2.7.4


