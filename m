Return-Path: <alban.bedel@aerq.com>
X-Greylist: delayed 22708 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 18 Jul 2019 10:54:23 UTC
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
	(mail-eopbgr60114.outbound.protection.outlook.com [40.107.6.114])
	by mail.openembedded.org (Postfix) with ESMTP id BC5306B076
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 10:54:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=l7mP1nPqgnHQSmA3iaC74ReqTyLdfvH570iqzK+N6Hpb+bOPIqJDjVIZVjSvSM7T0IWrU54Xf7EC99hdlfi1KWDM37jBzaQrES9GlllIW7IMkV1upRpZAj6RGvl1c+hVVdU9siWQiG4snWsUZsIZi3gSdNxe7w308zoOxSXW2EcgGBe/lANK3iY8HW00afZS5W1AncdkYhflAsCysFpdUijE8y+GlTYxx12IXNY7o5Yv2N2V/GAyv14X0R8U7RMKg0D2cSShRbr99ADq+sNlvw6xG3EYb971EZuNukmykCiHX1+nm+ERc+ML3UwMhY8kKPyzPFx5AhN9z9JeAuV6Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=jeix7BxVRNPKr4xDJc1XlkJgQ0jhvYbrFI6TTp+BVac=;
	b=W+yy6aPYU46PEZ8CRkpsrm8DTRKBwWAdwyJGjEj6pf+sSs25czpq5HtqMJbOaaSTfv3VFVu4TVWtZII152ALJXCcPpE6SjAy4Lff4MCEIuYEqVH026CT08hjwK4RYs/2daluVoErnWhsVIZWJXsOEDlhCP4R02RjEAaxdb9kLByhqqDKE9/VbTAjkkSPiFYPbdiDA0KEoFuOR/m15bIoP0ApznYXM16ZI4v07kzfEvLRek1eePx6GrUOe2ttItRn1DPMtZVBUtfzpn2IdBo1jvLPyZQvYwLj+an3GL7Mh9opf0NDzgyJQJgVPd/v87kaa9fhuli9KvnrHIHWzLVoyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=aerq.com; dmarc=pass action=none header.from=aerq.com;
	dkim=pass header.d=aerq.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=jeix7BxVRNPKr4xDJc1XlkJgQ0jhvYbrFI6TTp+BVac=;
	b=pW4IbHdiHH7ILpIvibLYIPRWoYFmYKby/qCluEduSGwLVQItvCKjD93Q0oTjXSed/Wb6wWApUIVB24mvtfZsz5g2kEsNBPl9FdTJaxthmIt2hndS1yFezbV+8kCL8z16Zm3a/9sE9VDZqjoByyvKhO9owr31hlCsBSSCSAEFkX4=
Received: from VI1PR10MB2045.EURPRD10.PROD.OUTLOOK.COM (52.134.28.150) by
	VI1PR10MB1901.EURPRD10.PROD.OUTLOOK.COM (52.134.26.31) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2073.11; Wed, 17 Jul 2019 14:20:44 +0000
Received: from VI1PR10MB2045.EURPRD10.PROD.OUTLOOK.COM
	([fe80::d1d5:b8e:3ccc:cd06]) by VI1PR10MB2045.EURPRD10.PROD.OUTLOOK.COM
	([fe80::d1d5:b8e:3ccc:cd06%4]) with mapi id 15.20.2073.012;
	Wed, 17 Jul 2019 14:20:44 +0000
From: "Bedel, Alban" <alban.bedel@aerq.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] boost: Fix build and enable context and coroutines on
	aarch64
Thread-Index: AQHVPKrSxWBHd8wo50CHpQH5oVhPCg==
Date: Wed, 17 Jul 2019 14:20:44 +0000
Message-ID: <20190717141953.8267-1-alban.bedel@aerq.com>
Accept-Language: en-DE, de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0064.FRAP264.PROD.OUTLOOK.COM
	(2603:10a6:100:1d::28) To VI1PR10MB2045.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:803:39::22)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=alban.bedel@aerq.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [213.61.153.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c153fcba-fa5b-4104-323c-08d70ac1f49d
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(7168020)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:VI1PR10MB1901; 
x-ms-traffictypediagnostic: VI1PR10MB1901:
x-microsoft-antispam-prvs: <VI1PR10MB1901B2AAD4D6A4940C60E25896C90@VI1PR10MB1901.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39840400004)(136003)(34096005)(346002)(376002)(366004)(396003)(189003)(199004)(81166006)(81156014)(8676002)(66066001)(68736007)(5640700003)(52116002)(508600001)(486006)(6486002)(66446008)(2616005)(66556008)(64756008)(66476007)(316002)(6512007)(36756003)(14454004)(50226002)(305945005)(5660300002)(6436002)(102836004)(53936002)(25786009)(2906002)(476003)(107886003)(55236004)(2501003)(6916009)(71200400001)(71190400001)(8936002)(26005)(66946007)(186003)(2351001)(3846002)(256004)(6116002)(99286004)(1076003)(86362001)(14444005)(6506007)(386003)(7736002)(4326008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB1901;
	H:VI1PR10MB2045.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: aerq.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /RH6mjhOmLw+KP9EtscD//XR1GNiI19L3BLZ1Un8D2IlyPg1hZv2wQjZQBYiNN6kGHeZlPWIgJA1sGb1ue6N7bPtv9YMVsbYQy9GYRCynsaK9BwBGvhSXuD/CcoFKskTcYL/PSHT8ECL6yhq2XlTaAhmwyXKPRi5HZEY+WR8CcTAjCknc+xtEhS3Nt3ykDZmWZJZn1oYv8WkpGjaXZMJKuhiuj+e8trPgwYozhBAwWVKe8i1KOH6bv7+z6+jirBj1Hu34Chfax3DtuCUmvyTJZ8M+YK5569D7tNmJSfUoKuW5h52X6vP3JYvm5eHr2aIHluhsuHyg74q6pjczRO2ZJANQjPS3BU3hrDkE+bYDbG1tVfjQQ9Q7tYAlaJIZXafhZ3v/jVMDWd6GiTxcq3HVNG+MOFKwJnQ849ObUVVQGE=
MIME-Version: 1.0
X-OriginatorOrg: aerq.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c153fcba-fa5b-4104-323c-08d70ac1f49d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 14:20:44.7321 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bf24ff3e-ad0a-4c79-a44a-df7092489e22
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: alban.bedel@aerq.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB1901
Cc: "Bedel, Alban" <alban.bedel@aerq.com>
Subject: [PATCH] boost: Fix build and enable context and coroutines on aarch64
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
X-List-Received-Date: Thu, 18 Jul 2019 10:54:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Like for ARM bjam need some hints about the ABI to properly build on
aarch64. While at it also enable context and coroutine as these are
supported on aarch64.

Signed-off-by: Alban Bedel <alban.bedel@aerq.com>
---
 meta/recipes-support/boost/boost.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/bo=
ost/boost.inc
index 9be3717fd6..c2e2cbb352 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -33,6 +33,7 @@ BOOST_LIBS_append_x86 =3D " context coroutine"
 BOOST_LIBS_append_x86-64 =3D " context coroutine"
 BOOST_LIBS_append_powerpc =3D " context coroutine"
 BOOST_LIBS_append_arm =3D " context coroutine"
+BOOST_LIBS_append_aarch64 =3D " context coroutine"
 # need consistent settings for native builds (x86 override not applied for=
 native)
 BOOST_LIBS_remove_class-native =3D " context coroutine"
 # does not compile
@@ -151,6 +152,7 @@ BJAM_OPTS_append_x86-x32 =3D " abi=3Dx32 address-model=
=3D64"
=20
 # cross compiling for arm fails to detect abi, so provide some help
 BJAM_OPTS_append_arm =3D " abi=3Daapcs architecture=3Darm"
+BJAM_OPTS_append_aarch64 =3D " abi=3Daapcs address-model=3D64 architecture=
=3Darm"
=20
 do_configure() {
 	cp -f ${S}/boost/config/platform/linux.hpp ${S}/boost/config/platform/lin=
ux-gnueabi.hpp
--=20
2.17.1


