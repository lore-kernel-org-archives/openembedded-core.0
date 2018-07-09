Return-Path: <Jonathan.Haigh@arm.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0086.outbound.protection.outlook.com [104.47.2.86])
	by mail.openembedded.org (Postfix) with ESMTP id E3CD8606D0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jul 2018 16:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
	s=selector1-arm-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=xGP1EvgG2J4FCgXR+EPOmJjyZv9Tlb6k5P2ECqPDBgk=;
	b=nDOJmgqbcZg41N6f/6EopHyNcyGb1aIFkSSf2j0QXX+ru10PqxBhfTwYGSuLdeONAcY9VPGqwc4PAsq6B7Ut8oFojo+Na0+Ace3YNZ0Q4RH+ydtdim4nkAFerfnE0XO9MQfXNWGzesTp1OSXpkl8hJYljXX5gXu48JaFmeyr0A4=
Received: from DB5PR08MB0888.eurprd08.prod.outlook.com (10.164.43.30) by
	DB5PR08MB1238.eurprd08.prod.outlook.com (10.166.175.9) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.930.21; Mon, 9 Jul 2018 10:46:22 +0000
Received: from DB5PR08MB0888.eurprd08.prod.outlook.com
	([fe80::d004:d47f:8a18:ac18]) by
	DB5PR08MB0888.eurprd08.prod.outlook.com
	([fe80::d004:d47f:8a18:ac18%3]) with mapi id 15.20.0930.022;
	Mon, 9 Jul 2018 10:46:22 +0000
From: Jonathan Haigh <Jonathan.Haigh@arm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] kernel-devicetree.bbclass: DTB make targets may contain
	path components
Thread-Index: AQHUF3Hw7Sht+2NXYkuUbOdmaOuNdA==
Date: Mon, 9 Jul 2018 10:46:22 +0000
Message-ID: <b89ab2b5128e4d5da985606e1b81213b1531133101-27576-1-git-send-email-jonathan.haigh@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Jonathan.Haigh@arm.com; 
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB5PR08MB1238;
	7:2h1Zl/AmmoCJOC9PIz5Z/5WhIo2lkTr8bVHasT3RahVVxp8Zaq3ohwoqc05edafelovtjWRiDIGFATd+iQYurQ3Z33379sfm9Ds5E/3xqHBkz4gDYmxwZsiO8JAsRKIjAUSQcZN1nvVFLREbcyAqYXsti3Vgx43Fb7cD0wOXZWT+1BjLtp0aTgihW6WUxUI4McmE2yqB4B6QRKVhuPqDSoLK0gTFmFzkF8apnVxeOfAtnsJdap+rybCm2s2PpM8w
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-correlation-id: 638ed27f-2e4d-43c5-e67e-08d5e5893619
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600053)(711020)(48565401081)(2017052603328)(7153060)(7193020);
	SRVR:DB5PR08MB1238; 
x-ms-traffictypediagnostic: DB5PR08MB1238:
x-microsoft-antispam-prvs: <DB5PR08MB1238EAF98E761B941B7CBA4C93440@DB5PR08MB1238.eurprd08.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(180628864354917)(223705240517415);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(3231311)(944501410)(52105095)(10201501046)(6055026)(149027)(150027)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(20161123562045)(6072148)(201708071742011)(7699016);
	SRVR:DB5PR08MB1238; BCL:0; PCL:0; RULEID:; SRVR:DB5PR08MB1238; 
x-forefront-prvs: 07283408BE
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(346002)(396003)(39860400002)(136003)(376002)(199004)(189003)(40434004)(5640700003)(5024004)(97736004)(4326008)(2900100001)(2501003)(99286004)(5250100002)(316002)(478600001)(26005)(105586002)(102836004)(6512007)(106356001)(25786009)(68736007)(118296001)(1857600001)(486006)(6486002)(256004)(6506007)(476003)(6436002)(2351001)(2616005)(14444005)(66066001)(72206003)(86362001)(2906002)(81166006)(81156014)(5660300001)(305945005)(7736002)(3846002)(6116002)(14454004)(6916009)(36756003)(53936002)(8676002)(8936002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB5PR08MB1238;
	H:DB5PR08MB0888.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: pUzCy55Rfhk1WYYyHK6fKbPVG8q3KYTP2N0TLb9qVLpJAtVz9D30XTHKQuVzVL3trN6tIsvAqUidPnRr9mCh8du51s33dPbc50BJpHqOwZJt9x57XNuUnChvML0Y3nCpJgC60Nll98+wa3uSa4sCdP5n5uaY8dUDJNWK/eAmNSM8LTkMnzzofsCBP0GZ4yntPqUvsGtRLHXhVGf8Y0G0qxgDG5nn3axmfoKzqPkTdM2G3QI4NRCIx30jSjGCwGGlAfW0yIaWnXeObMRygBJMBM+Rta08MR2xkHVoKDltCCPiHVoOyzylADFVVa4RtFxi/S2cUlS8vDgWxT+wxLF6wfwRln7bw6RpOOSH/pdiBxI=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 638ed27f-2e4d-43c5-e67e-08d5e5893619
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2018 10:46:22.2749 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB1238
Subject: [PATCH] kernel-devicetree.bbclass: DTB make targets may contain path components
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
X-List-Received-Date: Mon, 09 Jul 2018 16:20:24 -0000
Content-Language: en-GB
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <6A1D68B184BD0641903E3005988B0033@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

normalize_dtb() turns DTS and DTB paths into values that can be used as
make targets. These make targets sometimes contain some directory
components so 'basename' is not suitable for turning the paths into make
targets - we should only strip off leading directory components of the
path up to and including the 'dts' directory (if it exists). For
example:
* 'overlays/at86rf233.dtbo' should not be changed.
* 'some/directory/path/dts/overlays/at86rf233.dtbo' should be changed to
  'overlays/at86rf233.dtbo' rather than just 'at86rf233.dtbo'

Signed-off-by: Jonathan Haigh <jonathan.haigh@arm.com>
---
 meta/classes/kernel-devicetree.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-d=
evicetree.bbclass
index 4f80cc6..e42b664 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -12,10 +12,10 @@ KERNEL_DEVICETREE_BUNDLE ?=3D "0"
 normalize_dtb () {
 DTB=3D"$1"
 if echo ${DTB} | grep -q '/dts/'; then
-bbwarn "${DTB} contains the full path to the the dts file, but only the dt=
b name should be used."
-DTB=3D`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
+bbwarn "${DTB} contains the full path to the the dts file, but the path sh=
ould be relative to the dts directory."
+DTB=3D`echo "${DTB}" | sed 's,^.*/dts/,,'`
 fi
-echo "${DTB}"
+echo "${DTB}" | sed 's,\.dts$,.dtb,g'
 }

 get_real_dtb_path_in_kernel () {
--
2.7.4

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

