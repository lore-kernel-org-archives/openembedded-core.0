Return-Path: <prvs=9264ba6e1=Alistair.Francis@wdc.com>
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail.openembedded.org (Postfix) with ESMTP id 11C2A605C3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 17:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1548867616; x=1580403616;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=LXhDWiM9pwbv8hRWRxMt1KHyDVWdSmGxfBJNo0tOX2A=;
	b=mrxI7pVGCo9E+kKRjTX50sbuPmye0+4m8fNGeDppA2Qyqip70BZAF2Sq
	ABzZ7KmXH+ZUrzvwWrT7GwK1szN3MJYPCJJI/ZZP3fUHoZVVR+/i25bMT
	hRRUUlCG/WyciDQaOlzAs6Ju04Brt41Unn+rI3DmdV5mo2eIOTEMsDEcL
	XeE1ZpSIT13Q0PB2DIMfr5sdpDHJfD9uC3W7WjBGEEsXa843ZOkJV84os
	IAUS+W3zUaeUuXz4ePXp7yipKiNmD0BDnLTgnO8dTC3PgYyToWr27Up4a
	u06mI36Ma6R4bWsmuAp81eOSajOgIjGOh5dlDi26oD9Ike9A/QgfZxnJ8 w==;
X-IronPort-AV: E=Sophos;i="5.56,541,1539619200"; d="scan'208";a="101417153"
Received: from mail-by2nam03lp2059.outbound.protection.outlook.com (HELO
	NAM03-BY2-obe.outbound.protection.outlook.com) ([104.47.42.59])
	by ob1.hgst.iphmx.com with ESMTP; 31 Jan 2019 01:00:15 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=jKP+2OTw80sCIPPfsgFxeAQ1Zgs7TPbpRdjmt+YT0fo=;
	b=bkT+VMlJWo8u3ph8bOQfIIxg3ixH6kI1lZcyPqYYLEtZ5im9/b8ihJw6h6yHwNXvAKWviuXLZw/iNkPOJhk5bWMULjSJiV2rqAdAuGBasKw4QhHSPy3Mur6wntwj2QzVrz0/p7ZnP4mIuuu7Lk+4RwWY4Ri5tBX7Vwx+q0046Ug=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0895.namprd04.prod.outlook.com (10.174.174.141) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1558.17; Wed, 30 Jan 2019 17:00:13 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::f55c:272b:6401:1b8c]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::f55c:272b:6401:1b8c%9]) with mapi id 15.20.1558.023;
	Wed, 30 Jan 2019 17:00:13 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v2] libgpg-error: Bump to version 1.35
Thread-Index: AQHUuL1EA/uT6acXAEGdOtS2GX6pxw==
Date: Wed, 30 Jan 2019 17:00:13 +0000
Message-ID: <20190130170003.14960-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: MWHPR20CA0011.namprd20.prod.outlook.com
	(2603:10b6:300:13d::21) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.170]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0895;
	6:x1N7Twj9RTqVsXqgDFHsQ6nom4rgy5YnPfU+zm9+Fe70KEr8aI/zmCvmUSEVkHGY482iDn80fuqStgeeDSLt9SgBPWqR5EaAvWDt93ZsrZQ/l9meFyPm+9gf5aUFGtU2wVzypUAksuPqWkUOY0WS2qlCEVRhrmAHYm+Qq6A7TZ4YPWrmlZ07KR5kRaZIu32NRpQkVASg7z3BAN8Ua39NCiO58yfTxbVhhdfgwtGcR3VLmbx4yw3AfXG+JkYJfiaKTdeLm97A4JByq0G+k5RvI5uluNugBc6ULsb/iVS8/ASyEZm5+lXLM+S9ZSQeD4ixCYj5TOiLcfGMinBd4gCh6qwcP/NkvTktUGrugnO29va6fR8SlgFi7S4by0aQ84971GLf7hOXJISWbMCI3Mxmu23jVKgtx+a4YUINstOOX7WDobnsoX+TGJnRdb5wlPEahQ0iw4PIPsPcv2TDZ7e2bw==;
	5:rFnIb4VOf6cDg2zzc4GyEaq4oRqJuIcai4L7cBAYk6vFlOLMUtVn+SMpxLcTHB/FngNP43w1SNLYtfV72Rpq+wZ9hhU4vX5dl0eXgcRiV+ipVD/UY9BNA6fFqIR/t9atZ7iVaiEc5alDSVRp+PSD7/k2DYEWuWCEaHuB/FYeHsOgo0wMCV80rwQ7Oq6z7UkmKd3azi43QsgDmHq0NyomIw==;
	7:mtaRH7aD8g2nwAdZxLnBovRCFGyRnhXnceRDuz2ErD1VDDIThRkGjEOkarZr/ZCTqvNwT9xEFXep9j+9t8kqWeu1X4l+OXc3tnXv0oTDL7HvRIyHC2IVsJKgtQSNMeIHsvE9YrvaDmC+LUTG0MWVuA==
x-ms-office365-filtering-correlation-id: 64be26ed-ac81-4a49-ec50-08d686d466b9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0895; 
x-ms-traffictypediagnostic: MWHPR04MB0895:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0895EBA6497E0206ACD2CCDA90900@MWHPR04MB0895.namprd04.prod.outlook.com>
x-forefront-prvs: 0933E9FD8D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(136003)(346002)(376002)(366004)(396003)(24433001)(199004)(189003)(54906003)(6916009)(14454004)(53936002)(71200400001)(105586002)(39060400002)(36756003)(1076003)(52116002)(68736007)(86362001)(316002)(72206003)(71190400001)(99286004)(66066001)(81166006)(6486002)(81156014)(2906002)(44832011)(2616005)(3846002)(305945005)(186003)(256004)(50226002)(106356001)(25786009)(6436002)(8936002)(2501003)(8676002)(478600001)(6116002)(102836004)(26005)(97736004)(6306002)(486006)(386003)(476003)(2351001)(6512007)(4326008)(5640700003)(7736002)(6506007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0895;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /ZjDnuRS1ujn5OoTF0yJizaqHKCcPZwVZejoqjBMpkVEGO77YHpidUDyuGqEhVEV4gSifrJIzCPNw77LZD8C/CpTXL62pqAhSuUyCTcuZtECLZ2IRSNkm2XD76ppFE4yPtgHBAbiThpj92xhiLPP1flbn97N0C4UC1P8zAPR5uM8XT9oWdZ0Ttb7VeKB30IPYm0tgl7n6RGP043j7P4RQsmfORRNfZY0YDTIBqcwkCHTc2BcCBDOVmUiy9Q0P4n/m8OYDjD5zZqHdmHAlONSRXdDhJry1ZQAWL0ce6Btdvope0LicbgV3bbq/ZAGJVV2kU0G0XddKcVYghFUfLlr8OnSXrhGId4hzsx3lulm7se09q/akqQzu9fHI6LUWooPtBAjYR3Gz45zXyDiDzHWrKZSY6ev6IXLPkKK0fky9u8=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64be26ed-ac81-4a49-ec50-08d686d466b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2019 17:00:13.2892 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0895
Subject: [PATCH v2] libgpg-error: Bump to version 1.35
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
X-List-Received-Date: Wed, 30 Jan 2019 17:00:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The file src/gpg-error.h.in SHA changed as some new funtion definitions
were added to the header file and the copyright year was updated to
include 2019.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
v2:
 - Add info on why the header file SHA changed

 .../{libgpg-error_1.33.bb =3D> libgpg-error_1.35.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.33.bb =3D> libgpg=
-error_1.35.bb} (92%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.33.bb b/meta/=
recipes-support/libgpg-error/libgpg-error_1.35.bb
similarity index 92%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.33.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.35.bb
index 325529d149..9a822add32 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.33.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.35.bb
@@ -5,7 +5,7 @@ BUGTRACKER =3D "https://bugs.g10code.com/gnupg/index"
 LICENSE =3D "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f655=
2 \
                     file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f17206a5b=
0a1 \
-                    file://src/gpg-error.h.in;beginline=3D2;endline=3D18;m=
d5=3D524d4e810c4dcdc38e4fa28e70a13bf8 \
+                    file://src/gpg-error.h.in;beginline=3D2;endline=3D18;m=
d5=3Dcd91e3ad1265a0c268efad541a39345e \
                     file://src/init.c;beginline=3D2;endline=3D17;md5=3Df01=
cdfcf747af5380590cfd9bbfeaaf7"
=20
=20
@@ -16,8 +16,8 @@ SRC_URI =3D "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${=
PV}.tar.bz2 \
            file://pkgconfig.patch \
 	  "
=20
-SRC_URI[md5sum] =3D "680495572d5d4c700ea73a2f793ce531"
-SRC_URI[sha256sum] =3D "5d38826656e746c936e7742d9cde072b50baa3c4c49daa168a=
56813612bf03ff"
+SRC_URI[md5sum] =3D "2808a9e044f883f7554c5ba6a380b711"
+SRC_URI[sha256sum] =3D "cbd5ee62a8a8c88d48c158fff4fc9ead4132aacd1b4a56eb79=
1f9f997d07e067"
=20
 BINCONFIG =3D "${bindir}/gpg-error-config"
=20
--=20
2.20.1


