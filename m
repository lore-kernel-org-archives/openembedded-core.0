Return-Path: <Aditya.Tayade@kpit.com>
X-Greylist: delayed 21704 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 25 Mar 2019 22:03:42 UTC
Received: from IND01-MA1-obe.outbound.protection.outlook.com
	(mail-eopbgr1380057.outbound.protection.outlook.com [40.107.138.57])
	by mail.openembedded.org (Postfix) with ESMTP id 4C2106C45E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 22:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=jGgSgOGC1Zz/befqxLaBQL3E9JhrH3d0cl1lDcrkogQ=;
	b=IaSQf8Yp1WUQ21ej68JAtlzTKLj2jEQqHAoiBDXlMtqTQiHr+EcsJuH1fqOjulyWfGkRJOibmy4Vvz+xdsA4K5NXs0C6RrL1jEyhxe/rvR1wLeCyn9GUl8ymXA2iysQL9YNZDHgn/drpUySTBPwO68+IZIR7xKYoL/2bkHTu0zU=
Received: from BMXPR01MB0854.INDPRD01.PROD.OUTLOOK.COM (10.174.216.146) by
	BMXPR01MB2984.INDPRD01.PROD.OUTLOOK.COM (20.178.168.141) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1730.18; Mon, 25 Mar 2019 15:27:11 +0000
Received: from BMXPR01MB0854.INDPRD01.PROD.OUTLOOK.COM
	([fe80::fd31:8a8e:b35e:2c6]) by BMXPR01MB0854.INDPRD01.PROD.OUTLOOK.COM
	([fe80::fd31:8a8e:b35e:2c6%6]) with mapi id 15.20.1730.019;
	Mon, 25 Mar 2019 15:27:11 +0000
From: Aditya Tayade <Aditya.Tayade@kpit.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][meta][PATCH] run-ptest: use error handling for useradd
	and userdel
Thread-Index: AQHU4x83HIah9Ig+i0qb4cdPRSUqcw==
Date: Mon, 25 Mar 2019 15:27:11 +0000
Message-ID: <1553527601-14538-1-git-send-email-Aditya.Tayade@kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P193CA0008.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::18)
	To BMXPR01MB0854.INDPRD01.PROD.OUTLOOK.COM
	(2603:1096:b00:11::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Aditya.Tayade@kpit.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [115.112.39.238]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3f7de57a-bbb0-47dc-3480-08d6b13659b4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BMXPR01MB2984; 
x-ms-traffictypediagnostic: BMXPR01MB2984:
x-microsoft-antispam-prvs: <BMXPR01MB2984232CED6A13F6F9044847915E0@BMXPR01MB2984.INDPRD01.PROD.OUTLOOK.COM>
x-forefront-prvs: 0987ACA2E2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(396003)(39860400002)(136003)(376002)(346002)(189003)(199004)(25786009)(4326008)(52116002)(66574012)(2501003)(2351001)(3846002)(186003)(6116002)(106356001)(55236004)(2906002)(486006)(53936002)(6486002)(107886003)(68736007)(316002)(105586002)(6436002)(6512007)(71190400001)(5640700003)(8676002)(36756003)(2616005)(71200400001)(14444005)(97736004)(256004)(5660300002)(14454004)(66066001)(50226002)(7736002)(305945005)(8936002)(476003)(99286004)(6916009)(86362001)(386003)(6506007)(478600001)(81156014)(26005)(72206003)(81166006)(102836004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BMXPR01MB2984;
	H:BMXPR01MB0854.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: kpit.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SWhltFID3AboO29J9/+0f2CriggUflF/seVrCkSOgUH/M2L+dnWOkPeobH+k5q/0NuUPzhKHsBYlbcW9zYAwzMNTzpPbYze/UlkqvlFdAypNNpGJc6PXuZJqfxU1Cj5HtV67dvatEFH62qVIHSaSZcPCJFlwwrjyISPCMrBNuNmxFuV/BqkmoD+pkQKQdQoAHRbsKtlbSgrqLk9YLGUYDP4c3eTZmfSsl2AyS4+Ae2N7ukxh0Tlb5Zy7xL6DMOgbSnD/3jQTOFnQoTnWmETb2QT5u/sxU2mucUEWn6xRxLcsB8G8NGK1Jl1eGuVIGDZO00UUxO/AdiZLMobYthiOCWzTsLeq3vQW4RqH+Pu7Xd2ymIp4gs2YQWFodBiQpKO8m02a8Rvt658xh3h1pE/+EeXf6V23Am7vfFgH+fGdIBo=
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f7de57a-bbb0-47dc-3480-08d6b13659b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2019 15:27:11.6310 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB2984
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>
Subject: [meta][PATCH] run-ptest: use error handling for useradd and userdel
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
X-List-Received-Date: Mon, 25 Mar 2019 22:03:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Error handling in shell scripts is too easy to forget and
get wrong. It is possible to check every external command
for return values but it is better to use a generic setting
which halts execution of the script on any failures.

Upstream-Status: Pending
Signed-off-by: Aditya Tayade <Aditya.Tayade@kpit.com>
---
 meta/recipes-core/glib-2.0/glib-2.0/run-ptest | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/run-ptest b/meta/recipes-c=
ore/glib-2.0/glib-2.0/run-ptest
index 5b85e8f..8f082d3 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
+++ b/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
@@ -1,5 +1,6 @@
 #! /bin/sh

+set -eux
 useradd glib2-test
 su glib2-test -c gnome-desktop-testing-runner glib
 userdel glib2-test
--
2.7.4

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

