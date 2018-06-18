Return-Path: <TOl@hms.se>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0045.outbound.protection.outlook.com [104.47.2.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7E13C75401
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 21:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hms.se; s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Cjf+rH1vXLhFI3rdY4Bu9r/zuYzkX4nyfY+VUKuuP7E=;
	b=UXVz+olsit/Z9pN3Mgx3qq5YMAPgpqeQf/fUpfedxg37QNFfjo4AIKdehqX88gBtfkdTdLr0Xz/5q+APW4niPy+EpvARLkNz5uW91kroHQZMumryFdd1jAEs1du5WaaJ6gamZbXHZUe1PB1gwJMay6ASVuJB4rnSFvWD6GZ2nXY=
Received: from DB6PR0601MB2133.eurprd06.prod.outlook.com (10.168.57.16) by
	DB6PR0601MB2725.eurprd06.prod.outlook.com (10.168.82.144) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.863.14; Mon, 18 Jun 2018 13:15:00 +0000
Received: from DB6PR0601MB2133.eurprd06.prod.outlook.com
	([fe80::41fb:ec8e:a48:574d]) by
	DB6PR0601MB2133.eurprd06.prod.outlook.com
	([fe80::41fb:ec8e:a48:574d%2]) with mapi id 15.20.0863.016;
	Mon, 18 Jun 2018 13:14:59 +0000
From: Tobias Olausson <TOl@hms.se>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [oe-core][PATCHv2] image_types.bbclass: add optional size to ubi
	vols
Thread-Index: AQHUBwX/TM0e1JetPUGfVR8UUJPqUw==
Date: Mon, 18 Jun 2018 13:14:59 +0000
Message-ID: <DB6PR0601MB2133BF1D24EEC8F080A25DF8C3710@DB6PR0601MB2133.eurprd06.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is ) smtp.mailfrom=TOl@hms.se; 
x-originating-ip: [88.131.56.168]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB6PR0601MB2725;
	7:uZz0wip2n3MZyWcXxNAwIm9vdgOYwNKFjPobzqSANtRvWWoypbHkKGMHITlMvau3ihSdRGsPtOe7dn7fHgo4TxdNtde8QNX7LKdaWQx8SmhDOkJz9+xeh27b7VgMTobU1/ywOfoqn8ZpwWvCHUJJr2EIcP1GIjGyxvdbqutbMmcXR59BLwGuUiFaRpEAJQFYUi5iQ9HMbkvSY8hzt3jdw0byU60hjK9d6yf2/x3+FoDyaZhf8E95GKBxdSbMvkWu
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
	SFS:(10009020)(366004)(39850400004)(396003)(39380400002)(376002)(346002)(199004)(189003)(25786009)(97736004)(3660700001)(316002)(8936002)(2900100001)(2351001)(2906002)(7736002)(8676002)(81156014)(81166006)(86362001)(9686003)(2501003)(33656002)(5250100002)(7696005)(3280700002)(26005)(6506007)(53546011)(1857600001)(305945005)(74316002)(3846002)(53936002)(99286004)(102836004)(6116002)(55016002)(5660300001)(74482002)(14454004)(6916009)(486006)(476003)(5640700003)(4326008)(72206003)(66066001)(106356001)(105586002)(6436002)(478600001)(68736007)(42262002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0601MB2725;
	H:DB6PR0601MB2133.eurprd06.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-office365-filtering-correlation-id: 7108156e-6d8f-4374-8292-08d5d51d7eaf
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DB6PR0601MB2725; 
x-ms-traffictypediagnostic: DB6PR0601MB2725:
x-microsoft-antispam-prvs: <DB6PR0601MB27251647E4103C7AAAA476F7C3710@DB6PR0601MB2725.eurprd06.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(3231254)(944501410)(52105095)(149027)(150027)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(20161123558120)(6072148)(201708071742011)(7699016);
	SRVR:DB6PR0601MB2725; BCL:0; PCL:0; RULEID:;
	SRVR:DB6PR0601MB2725; 
x-forefront-prvs: 0707248B64
received-spf: None (protection.outlook.com: hms.se does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: /YB8UuNvhgzLf+ToDN2zlq7QRvk6NzCo5ZPfw8LUvPu9z0PDGTWIf98ogLnQGJpDml4gqzmO3PF8E2R1ZFiWRMOKesQWrQI4j4CFuG7CBye0lgwgQKAklFp07XCb8q1YY5XSfDEFzVVPLvHuuffvUBbwGlXDY7phgE2jri6RLcXBH9ldU4H23sBVaazDVo0xUKeLCmmHcNGU97UM2XJcl6Tu1vE5ZzGsf842xwwRtnYR6pRrlJrfSagSFaJWaUoD3RXwRJyGZfQqXXHoThz3tUg0VqPZumnZOqrQMslgYaTxC1uWL2xvUw+JC4iAUsCqphcONhv8k64nNfeggOAfiA==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: hms.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 7108156e-6d8f-4374-8292-08d5d51d7eaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2018 13:14:59.7898 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7c1590-4488-4e42-bc9c-15218f8ac994
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0601MB2725
Cc: Magnus Olsson <Mago@hms.se>
Subject: [PATCHv2] image_types.bbclass: add optional size to ubi vols
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
X-List-Received-Date: Mon, 18 Jun 2018 21:46:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From 6bd1c95cc26aebe820e3d83a97601e4057ef8db5 Mon Sep 17 00:00:00 2001
From: Tobias Olausson <tol@hms.se>
Date: Mon, 18 Jun 2018 15:01:53 +0200
Subject: [oe-core][PATCHv2] image_types.bbclass: add optional size to ubi v=
ols

Instead of hard coding the ubi volume to be just large enough to fit the
root file system, one can use a variable to set a preferred size.

Signed-off-by: Tobias Olausson <tol@hms.se>
---
 meta/classes/image_types.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bb=
class
index 00a00d318f..c53fb1fce4 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -164,10 +164,22 @@ multiubi_mkfs() {
 		local vname=3D"_$3"
 	fi
=20
+	# Set UBI_VOL_SIZE (for regular ubi) or UBI_VOL_SIZE_vname for multiubi
+	if [ -n ${vname} ]; then
+		local ubi_vol_size=3D${UBI_VOL_SIZE}
+	else
+		eval local ubi_vol_size=3D\"\$UBI_VOL_SIZE${vname}\"
+	fi
+
 	echo \[ubifs\] > ubinize${vname}-${IMAGE_NAME}.cfg
 	echo mode=3Dubi >> ubinize${vname}-${IMAGE_NAME}.cfg
 	echo image=3D${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ub=
ifs >> ubinize${vname}-${IMAGE_NAME}.cfg
 	echo vol_id=3D0 >> ubinize${vname}-${IMAGE_NAME}.cfg
+
+	if [ -n "${ubi_vol_size}" ]; then
+		echo "vol_size=3D${ubi_vol_size}" >> ubinize${vname}-${IMAGE_NAME}.cfg
+	fi
+
 	echo vol_type=3Ddynamic >> ubinize${vname}-${IMAGE_NAME}.cfg
 	echo vol_name=3D${UBI_VOLNAME} >> ubinize${vname}-${IMAGE_NAME}.cfg
 	echo vol_flags=3Dautoresize >> ubinize${vname}-${IMAGE_NAME}.cfg
--=20
2.17.1

