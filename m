Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.20686.1628501607360757322
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 02:33:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1799XPS3021302
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Aug 2021 02:33:26 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1799XPWL001524
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Aug 2021 02:33:25 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 9 Aug 2021 02:33:24 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 9 Aug 2021 02:33:23 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [V2][PATCH] libconvert-asn1-perl: 0.27 -> 0.31
Date: Mon, 9 Aug 2021 17:30:41 +0800
Message-ID: <20210809093041.24064-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Old homepage is bad link, cannot be accessed. Now this project is
development on github, and the new homepage is get from
https://github.com/gbarr/perl-Convert-ASN1

Old SRC_URI is not used any more, the lastest update is in 2014.
From 0.28, the download link changed to:
https://cpan.metacpan.org/authors/id/T/TI/TIMLEGGE/

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...ert-asn1-perl_0.27.bb => libconvert-asn1-perl_0.31.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/perl/{libconvert-asn1-perl_0.27.bb => libconvert-asn1-perl_0.31.bb} (71%)

diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.31.bb
similarity index 71%
rename from meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb
rename to meta/recipes-extended/perl/libconvert-asn1-perl_0.31.bb
index 409a8f3896..2548878a2e 100644
--- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.31.bb
@@ -1,14 +1,14 @@
 SUMMARY = "Convert::ASN1 - Perl ASN.1 Encode/Decode library"
 SECTION = "libs"
-HOMEPAGE = "https://metacpan.org/source/GBARR/Convert-ASN1-0.27"
+HOMEPAGE = "http://search.cpan.org/dist/Convert-ASN1/"
 DESCRIPTION = "Convert::ASN1 is a perl library for encoding/decoding data using ASN.1 definitions."
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://README.md;beginline=91;endline=97;md5=ceff7fd286eb6d8e8e0d3d23e096a63f"
 
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/Convert-ASN1-${PV}.tar.gz"
+SRC_URI = "https://cpan.metacpan.org/authors/id/T/TI/TIMLEGGE/Convert-ASN1-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "68723e96be0b258a9e20480276e8a62c"
-SRC_URI[sha256sum] = "74a4a78ae0c5e973100ac0a8f203a110f76fb047b79dae4fc1fd7d6814d3d58a"
+SRC_URI[md5sum] = "1e12b263a5042804bb1c59ddce899876"
+SRC_URI[sha256sum] = "6fe4c1ba744c3a8212bf2c9b2703d93530acc153435cf2f93633540b439fbbeb"
 
 S = "${WORKDIR}/Convert-ASN1-${PV}"
 
-- 
2.17.1

