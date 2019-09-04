Return-Path: <dzagorui@cisco.com>
X-Greylist: delayed 425 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 04 Sep 2019 10:48:53 UTC
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
	by mail.openembedded.org (Postfix) with ESMTP id 5ECED7F284
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 10:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=652; q=dns/txt; s=iport;
	t=1567594135; x=1568803735; h=from:to:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=++KxDKDmxdjB+bPbVJH+bu0U4PagAsexlzo/5deIvTo=;
	b=Dqq4Adq6eR5DQFowFAx1n+FOQU7l5aUq7JmG8MfXbexjKRk7tz5R6hbR
	gKf4RmasKApAd0NAi/aB9Emh/adWcAeiWVkDzWP6BAm8W6I7zQcd6z+pz
	dRhsRNJpUirgyHZAr+0KnLBbDC4iu9hlgRRhjfbFA9cekSyZ78rprmZoh g=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0ANAACUlG9d/51dJa1lGwEBAQEDAQE?=
	=?us-ascii?q?BBwMBAQGBUwYBAQELAYIXbYEFKgqMM4ZvmymBewkBAQEMAQEbFAEBhnMjNAk?=
	=?us-ascii?q?OAgMBAgIDAQEEAQEBAgEGBG2FLwuGXAGBACcEE4MiAYIKqyiFSoR+gTQBi3c?=
	=?us-ascii?q?YgUA/hGGEDYYaBJVLllYKHYIChnSNXAwbgiSWRQGNd5hMAhEVgTAgOIFYcBW?=
	=?us-ascii?q?DJwlHEBSQE0IxjTOBMYEjAQE?=
X-IronPort-AV: E=Sophos;i="5.64,466,1559520000"; d="scan'208";a="330467731"
Received: from rcdn-core-6.cisco.com ([173.37.93.157])
	by alln-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	04 Sep 2019 10:41:49 +0000
Received: from XCH-RTP-003.cisco.com (xch-rtp-003.cisco.com [64.101.220.143])
	by rcdn-core-6.cisco.com (8.15.2/8.15.2) with ESMTPS id
	x84Afnpl017732
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Sep 2019 10:41:49 GMT
Received: from xch-rtp-004.cisco.com (64.101.220.144) by XCH-RTP-003.cisco.com
	(64.101.220.143) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Wed, 4 Sep 2019 06:41:48 -0400
Received: from xch-rtp-004.cisco.com ([64.101.220.144]) by
	XCH-RTP-004.cisco.com ([64.101.220.144]) with mapi id 15.00.1473.003;
	Wed, 4 Sep 2019 06:41:48 -0400
From: "Denys Zagorui -X (dzagorui - GLOBALLOGIC INC@Cisco)" <dzagorui@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] gzip: add nativesdk support
Thread-Index: AQHVYw1aELT+f76HykisLUjU3Zo2oQ==
Date: Wed, 4 Sep 2019 10:41:48 +0000
Message-ID: <20190904104144.3530-1-dzagorui@cisco.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.63.15.140]
MIME-Version: 1.0
X-Outbound-SMTP-Client: 64.101.220.143, xch-rtp-003.cisco.com
X-Outbound-Node: rcdn-core-6.cisco.com
Subject: [PATCH] gzip: add nativesdk support
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
X-List-Received-Date: Wed, 04 Sep 2019 10:48:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Denys Zagorui <dzagorui@cisco.com>
---
 meta/recipes-extended/gzip/gzip_1.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/gzip/gzip_1.10.bb b/meta/recipes-extende=
d/gzip/gzip_1.10.bb
index 5ab99d0b1d..50dad7bf58 100644
--- a/meta/recipes-extended/gzip/gzip_1.10.bb
+++ b/meta/recipes-extended/gzip/gzip_1.10.bb
@@ -14,7 +14,7 @@ PROVIDES_append_class-native =3D " gzip-replacement-nativ=
e"
=20
 RDEPENDS_${PN}-ptest +=3D "make perl perl-ptest grep diffutils"
=20
-BBCLASSEXTEND =3D "native"
+BBCLASSEXTEND =3D "native nativesdk"
=20
 inherit ptest
=20
--=20
2.11.0

