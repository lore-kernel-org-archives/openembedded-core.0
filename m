Return-Path: <alban.bedel@aerq.com>
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr140127.outbound.protection.outlook.com [40.107.14.127])
	by mail.openembedded.org (Postfix) with ESMTP id A07447C5F0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 12:37:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Zis93sn7DUZn9Mj5RGG4tpeIvuqdeP1zdAFSYKNMDCnHaDB/4wIUOxP2tX36NH2iKeUTTIYoqGKai1zVaHRa37ELWB4WZkirz1IO7i1OxsrbPX9bf4Vnl0R8pcfylt6qeZRai/5O7WaAElZhs8WXXaF4yl8tEIURGvUl2UwnP5wNwCpskMvjg+mJP6A76jEbxlqGFjgEXnxZE60Zk2A/JpzptNxAK46aZlw6D/uo8md2UoEoxtTD4/FpIgsCc3m39oGnojTEDuqgPddjSA+uvhkm996T7BhlY03ZIkvYnm+HvxCleTDqZ4qeeanLwfyu92gJpmt0wfNZS5CopT08nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=3AXxYKPNVrisvsg1T6g3bPU6V62GEsJbYsg5yQR35fE=;
	b=k93M2bqVI+24qPROdu9Y8Fp5mZEzdRvQtIo+TezgxHjE526VLLrzJTAxuXjjmKm+NeflvME5eNDQnGuhz9+EqGEOhw31kLTFPX6xOjKm+iNvihdf4mag3HUgborj1jzQ6c01YxOZbND+6eIaEbuhsOQQiI6Qgjete6NVvjoBr9debTFRcRPl49CUyxqSse9aVnD0UxnlWPdC8hf0FKMFFVltPMVE+6sFnuqht9KWEIWM4Xs5bK34DXajgvDWuMX05yqTemEIBRdwHoL+He/nL/GyU67I5wP83XH5/lzSqHIUgT5A4Vwv9dQNpjmamrU41KaTAd6KO6P1PbrVZKLNtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=aerq.com; dmarc=pass action=none header.from=aerq.com;
	dkim=pass header.d=aerq.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=3AXxYKPNVrisvsg1T6g3bPU6V62GEsJbYsg5yQR35fE=;
	b=F0PGM9vi42iicRVWPp1tbrZCALTCektdUMlCe0rDg3uoVz1LFtyO23Ui949nI7rvOqKc4OxSGvDIDRTDaiwvV3BHQRkHaahTFDmyNOk46/0lTaIdiucqU+c/WUy45Cm3dVr7W3XZU6/6YdQKmZvqaZfaMKBTffErRp/R4x6pwzM=
Received: from AM6PR10MB2038.EURPRD10.PROD.OUTLOOK.COM (52.134.115.151) by
	AM6PR10MB2005.EURPRD10.PROD.OUTLOOK.COM (52.134.114.25) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2157.20; Thu, 15 Aug 2019 12:37:28 +0000
Received: from AM6PR10MB2038.EURPRD10.PROD.OUTLOOK.COM
	([fe80::7115:a2ae:b3b5:2fd4]) by
	AM6PR10MB2038.EURPRD10.PROD.OUTLOOK.COM
	([fe80::7115:a2ae:b3b5:2fd4%6]) with mapi id 15.20.2178.016;
	Thu, 15 Aug 2019 12:37:28 +0000
From: "Bedel, Alban" <alban.bedel@aerq.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [warrior][PATCH] boost: Fix build and enable context and
	coroutines on aarch64
Thread-Index: AQHVU2YyxC10bMO8SkWOn9X1DEPVlA==
Date: Thu, 15 Aug 2019 12:37:28 +0000
Message-ID: <20190815123713.24133-1-alban.bedel@aerq.com>
Accept-Language: en-DE, de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0142.FRAP264.PROD.OUTLOOK.COM
	(2603:10a6:100:1a::34) To AM6PR10MB2038.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:209:31::23)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=alban.bedel@aerq.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [213.61.153.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28414485-a80d-426e-efaf-08d7217d554d
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(7168020)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:AM6PR10MB2005; 
x-ms-traffictypediagnostic: AM6PR10MB2005:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR10MB2005FCA6234013484EDBA73796AC0@AM6PR10MB2005.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(136003)(366004)(346002)(39840400004)(396003)(199004)(189003)(256004)(476003)(7736002)(26005)(36756003)(81156014)(53936002)(55236004)(486006)(6506007)(2616005)(107886003)(8676002)(81166006)(102836004)(6486002)(6512007)(14444005)(5660300002)(386003)(186003)(6436002)(2906002)(1076003)(52116002)(305945005)(2351001)(14454004)(5640700003)(6116002)(66946007)(508600001)(3846002)(86362001)(316002)(6916009)(8936002)(66446008)(2501003)(66556008)(66476007)(66066001)(71190400001)(99286004)(71200400001)(64756008)(50226002)(25786009)(4326008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR10MB2005;
	H:AM6PR10MB2038.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: aerq.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Lyz2II5vywrL/5ZGEBZOok1TnBQ3qNNIplnATAnFk9NGFz2KaNcSK4fNhHZkfYpV/dVU/IqUAUsJ9XEXXtxVNMyeCUsUdXc4FTXLLZWBzACrivN/J8vxmdJvJp+lg9/ciKhtAbKmJtNOWh1hILbv0nccT1TJv+vRiDyPESWDPUhNKqV/r4sYpX/gB+tKqaZkRV14AL/JDUapahcb52VEnABQtRfTOuEAO15AEX0VwP7Uhm9JHPp7rj3W8TO6Hdw0uRxAvC0Fh2n3cG356ZuodLghhD59mDcDzmU9laMn/VbOqctL4j9E/EHmNcC8tLQXkCnv1T6tHP7eD3/qr87iB5Jcq5HkOFvQihrAx2mn+gjaumAL6TTBFzuQMtHT7590L+w9dW0jAtzCzEzZmX2Tto1Ft2E+6qEvCAaL6rXDdc0=
MIME-Version: 1.0
X-OriginatorOrg: aerq.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28414485-a80d-426e-efaf-08d7217d554d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 12:37:28.3763 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bf24ff3e-ad0a-4c79-a44a-df7092489e22
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DvVqaH1I6kXEfk00v7bqULc8HO911Iom608qFFLWJafQ5CKZDbRPOm41PPHDsrp1aH1ZEWd/4QaGlru8EYTedw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2005
Cc: "Bedel, Alban" <alban.bedel@aerq.com>
Subject: [warrior][PATCH] boost: Fix build and enable context and coroutines on aarch64
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
X-List-Received-Date: Thu, 15 Aug 2019 12:37:30 -0000
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
2.20.1


