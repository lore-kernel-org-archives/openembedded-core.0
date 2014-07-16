Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AA9F2705E1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 16:37:11 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6GGQTjS011065; Wed, 16 Jul 2014 17:26:32 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vv8RjsNJmAxh; Wed, 16 Jul 2014 17:26:31 +0100 (BST)
Received: from ted (bebox.config [87.81.244.161] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6GGQRMe011048
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 16 Jul 2014 17:26:29 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1X7S2A-0004Nr-Kb; Wed, 16 Jul 2014 17:26:22 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jul 2014 17:26:11 +0100
Message-Id: <a0274efacb99ecbf105a3bd1bb360b1d625726b0.1405527926.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <381d8ad7d600a74e21c8f8590dde2db0cdbd9584.1405527926.git.richard.purdie@linuxfoundation.org>
References: <381d8ad7d600a74e21c8f8590dde2db0cdbd9584.1405527926.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1405527926.git.richard.purdie@linuxfoundation.org>
References: <cover.1405527926.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 12/19] libconvert-asn1-perl: Upgrade 0.26 -> 0.27
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
X-List-Received-Date: Wed, 16 Jul 2014 16:37:12 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{libconvert-asn1-perl_0.26.bb => libconvert-asn1-perl_0.27.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/perl/{libconvert-asn1-perl_0.26.bb => libconvert-asn1-perl_0.27.bb} (76%)

diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.26.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb
similarity index 76%
rename from meta/recipes-extended/perl/libconvert-asn1-perl_0.26.bb
rename to meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb
index 9c2c9d5..ebe0422 100644
--- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.26.bb
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://README.md;beginline=91;endline=97;md5=ceff7fd286eb6d8
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/Convert-ASN1-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "1c846c8c1125e6a075444abe65d99b63"
-SRC_URI[sha256sum] = "5db8b62fa0d036bd0cabc869ffe17941ad587d9a2af1ff030d554872adbc1ca1"
+SRC_URI[md5sum] = "68723e96be0b258a9e20480276e8a62c"
+SRC_URI[sha256sum] = "74a4a78ae0c5e973100ac0a8f203a110f76fb047b79dae4fc1fd7d6814d3d58a"
 
 S = "${WORKDIR}/Convert-ASN1-${PV}"
 
-- 
1.9.2


