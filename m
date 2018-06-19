Return-Path: <TOl@hms.se>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0076.outbound.protection.outlook.com [104.47.2.76])
	by mail.openembedded.org (Postfix) with ESMTP id 8EE7775517
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 15:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hms.se; s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=5qB9LKnWBuz2uXrk1vlDMY/MAFuxKG7XnhDdwm/KWFo=;
	b=i/CVu7vsgU8qVvFO6plJc/5kOD+rJFFPMVp1YjDKOsznvN869sr9zaguHSBKhF/BEmGXIZTWDgSc7OKnks81HNo6D7zEgZszf4UfxEJz/G+xjyuJgQh2I136+zgExUoxoRiSbvwtMYJ0naJEhPm6qjr7LlFFC/82/LTSK3FU9FA=
Received: from DB6PR0601MB2133.eurprd06.prod.outlook.com (10.168.57.16) by
	DB6PR0601MB2248.eurprd06.prod.outlook.com (10.169.212.20) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.863.14; Tue, 19 Jun 2018 15:09:24 +0000
Received: from DB6PR0601MB2133.eurprd06.prod.outlook.com
	([fe80::41fb:ec8e:a48:574d]) by
	DB6PR0601MB2133.eurprd06.prod.outlook.com
	([fe80::41fb:ec8e:a48:574d%2]) with mapi id 15.20.0863.016;
	Tue, 19 Jun 2018 15:09:24 +0000
From: Tobias Olausson <TOl@hms.se>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [oe-core][PATCHv4] image_types.bbclass: add optional size to ubi
	vols
Thread-Index: AQHUB99xVjrN9KN5CUagy9txV8XV+Q==
Date: Tue, 19 Jun 2018 15:09:24 +0000
Message-ID: <DB6PR0601MB2133CEC1B8D8FAB2DFC46118C3700@DB6PR0601MB2133.eurprd06.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is ) smtp.mailfrom=TOl@hms.se; 
x-originating-ip: [88.131.56.168]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB6PR0601MB2248;
	7:m4e+dX3+cfV4Ml/Sd6Q75y/HkGiU9vpdXs3u+B1rKKZkPMGNKY3Z5+oymG6QWDA5N1jJCe+WRXvJchrxIEnfmFW6WlpGv8An+AJ+MIvEhp1tSzYGPO8IBzWY54S5oa944ZtEAqOth7hCoVZZ+3eVFNHRZfg8ZTAvOpZb+JT/pxF2jMzS1zaF/QjHBpo1WjbBhFAlCCa9+7ocksq/ki98FiQVm0Kv4DBIdVI4QwwzRrtjQoEd9HJRrCMLiZwScdQO
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: b6cc6963-cc68-49cb-e29a-08d5d5f6a48d
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DB6PR0601MB2248; 
x-ms-traffictypediagnostic: DB6PR0601MB2248:
x-microsoft-antispam-prvs: <DB6PR0601MB2248A22874C0A78C37AA0CB3C3700@DB6PR0601MB2248.eurprd06.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(10201501046)(3231254)(944501410)(52105095)(93006095)(93001095)(3002001)(149027)(150027)(6041310)(20161123564045)(20161123558120)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:DB6PR0601MB2248; BCL:0; PCL:0; RULEID:;
	SRVR:DB6PR0601MB2248; 
x-forefront-prvs: 07083FF734
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(39850400004)(39380400002)(396003)(376002)(346002)(189003)(199004)(26005)(106356001)(476003)(305945005)(74316002)(6116002)(3846002)(74482002)(186003)(25786009)(1857600001)(2501003)(97736004)(3660700001)(53936002)(2906002)(7736002)(66066001)(3280700002)(486006)(2900100001)(9686003)(105586002)(53546011)(316002)(6436002)(68736007)(14454004)(33656002)(2351001)(6506007)(72206003)(55016002)(5660300001)(7696005)(102836004)(86362001)(5250100002)(575784001)(6916009)(99286004)(5640700003)(8676002)(478600001)(81166006)(81156014)(8936002)(42262002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0601MB2248;
	H:DB6PR0601MB2133.eurprd06.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: hms.se does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: DbsbWIBBZAdtiAcpVxar7MJRtocDtesW8ueGCV+owrKwo7rGKrC6lhUPjbgQnV/KKM56WNVQkDAYzICJKkzbT2cfOOyJ3OwQT4dYL3gUjuTLtJadYa4IM3MCZtG9JJ6KHyMOQQ06WC5Gf7ENBKhqIBBoP7D9QWDCD+hXdZjwg0KBaPfx9xWtCGkpdNGftmEKjWeFPARtr8wDOXC3GKujzdTbXW3hNvNz/3cOQhhzzcRl+lpySWuQH05PEKw4nj+5FN3w6p6R0lAg4IcRI4S+qkY3YqN/GtBnHNAjnLZ0XDm7emSFej2+lnnHJgu6UGJcKAgJnNuIqx6GMPk6CeYoXA==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: hms.se
X-MS-Exchange-CrossTenant-Network-Message-Id: b6cc6963-cc68-49cb-e29a-08d5d5f6a48d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2018 15:09:24.0976 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7c1590-4488-4e42-bc9c-15218f8ac994
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0601MB2248
Subject: [PATCHv4] image_types.bbclass: add optional size to ubi vols
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
X-List-Received-Date: Tue, 19 Jun 2018 15:23:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From 1d15f0d3c516351e6540a912367bcb22f9c25bbf Mon Sep 17 00:00:00 2001
From: Tobias Olausson <tol@hms.se>
Date: Mon, 18 Jun 2018 15:01:53 +0200
Subject: [oe-core][PATCHv4] image_types.bbclass: add optional size to ubi v=
ols

Instead of hard coding the ubi volume to be just large enough to fit the
root file system, one can use a variable to set a preferred size.

Signed-off-by: Tobias Olausson <tol@hms.se>
---
 meta/classes/image_types.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bb=
class
index 00a00d318f..2a0a7994c9 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -164,10 +164,22 @@ multiubi_mkfs() {
 		local vname=3D"_$3"
 	fi
=20
+	# Set UBI_VOL_SIZE (for regular ubi) or UBI_VOL_SIZE_vname for multiubi
+	if [ -z "${vname}" ]; then
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


