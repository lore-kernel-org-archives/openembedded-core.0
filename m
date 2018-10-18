Return-Path: <Jonathan.Haigh@arm.com>
X-Greylist: delayed 7152 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 18 Oct 2018 13:35:05 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0065.outbound.protection.outlook.com [104.47.2.65])
	by mail.openembedded.org (Postfix) with ESMTP id 67A2E79B85
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 13:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
	s=selector1-arm-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=tRg/M7DK9H54oIJ++C3JaRrt89VoSh+ytVVHaNnfUvk=;
	b=qnLv5nyVt1VmN36hLv1YDm7lv05zWUKm7nHhLGAaY6k2KscAbCnCOe5RPNLgcSK2xS7jNVNAKL++x0rQ6qYuvRm7EjswQAKQmOpXt7+zmDosnbQsnhDvBAkgZNTx8voK2/ILzkjfwdiBfcxXetDgY07UCYXDGPasHuFxRd9oXho=
Received: from DB5PR08MB0888.eurprd08.prod.outlook.com (10.164.43.30) by
	DB5PR08MB0678.eurprd08.prod.outlook.com (10.169.33.16) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1250.21; Thu, 18 Oct 2018 08:01:56 +0000
Received: from DB5PR08MB0888.eurprd08.prod.outlook.com
	([fe80::e866:a2e1:4c3f:95fa]) by
	DB5PR08MB0888.eurprd08.prod.outlook.com
	([fe80::e866:a2e1:4c3f:95fa%3]) with mapi id 15.20.1250.020;
	Thu, 18 Oct 2018 08:01:56 +0000
From: Jonathan Haigh <Jonathan.Haigh@arm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Missing venv module in Python 3
Thread-Index: AQHUZfpUmN96RPBjFkCZKlJz3pSGm6Uko5lwgAAAGGo=
Date: Thu, 18 Oct 2018 08:01:56 +0000
Message-ID: <DB5PR08MB08880A125ED651AD16C50FE993F80@DB5PR08MB0888.eurprd08.prod.outlook.com>
References: <VI1PR08MB3631013765027F3C7E24415098FF0@VI1PR08MB3631.eurprd08.prod.outlook.com>,
	<VI1PR08MB3631FF25AFA7A73D6814C71998F80@VI1PR08MB3631.eurprd08.prod.outlook.com>
In-Reply-To: <VI1PR08MB3631FF25AFA7A73D6814C71998F80@VI1PR08MB3631.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Jonathan.Haigh@arm.com; 
x-originating-ip: [217.140.106.51]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB5PR08MB0678;
	6:HQvzX0J1jbpHhyn6QN7tWhbWoq1RKa5Nd/D5OHLRO2bcWZyDjIMXg51Vl4pE7cmQ+iKJzduk/FpRMDzZxbE768bWQ+1stJblUFRkJ2ugMXbY+TZwfwKe8TmW5dOKIxxW9lT5Cegk9UkrLt9Fnp7U2ZqZ8R/0kHkBB4mhuT3HB8Ifsfd6hOzDr/87dgRwp9j+bJj4su1Z2y4FpboSCQ3fuEoMmJs+idaFtKXXYKf0FUYwfVKIlMubJQmTbPJQuDLcWMoHx4YJCc59LqtD+3VDphrDJc7jbn3LZq3iaq9GJ3bmx1qdVTQl7v4PhjB3+sYj3lS+69p7UIla6RLb1h46k2JCQ1VufD113ZuoX0QuSTnXBnQ9vG83UIEn0F2X/4JpRMOM+lQnbD4+MF2I2jo95kvoQegmaqWCBiXXed+a3b76RNxeO39xcnGC6pALQdTYd/Be+gdyQ5tA4Mgzh0SWaw==;
	5:2tByyQ7pH+g5qlCeXkj5ZrLM4jnTPHMyqI3c7UpRcfTCTMV+odxY89tibhpE/gifR+vIByEgBK1CKSMEoGoOP8WUc8tPupD0J2/T7aqOFPocVzojT9MAWW4LKf3GyR7yr2mBTG9MAW9W0NzBVpxnvYaGSsD5pKHSms8SgYxFOJU=;
	7:V53ZMy/z1Fm1W5pW1Tgr/rVN1552X1Quc+ydG9W2Qlw1lKVS4jAxC4m9vQo0Qv5l6IlX9ofvAS1zbgGLm/JgjvcGzMBZT5IhaYCgdJN/YWaqOBS2BWR4tbpDnokYLJUwlwo73Lb1zC7vwlyETVHefipW0yd1XQ8/OkBwRUQJpqNPSY3AkWs2m5gykrkT5O9X7Iuaf6onShuodE4lDVIegK/jlxyvGBA/44jN2eTOjgmy0WIXxnlaPKGXHDICQ2uC
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-correlation-id: 4c5f100b-7107-4f0e-9771-08d634cff920
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(49563074)(7193020);
	SRVR:DB5PR08MB0678; 
x-ms-traffictypediagnostic: DB5PR08MB0678:
x-microsoft-antispam-prvs: <DB5PR08MB0678D0E591AAFC83322B515493F80@DB5PR08MB0678.eurprd08.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(102415395)(6040522)(2401047)(8121501046)(5005006)(3002001)(3231355)(944501410)(4983020)(52105095)(10201501046)(93006095)(93001095)(6055026)(149066)(150057)(6041310)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:DB5PR08MB0678; BCL:0; PCL:0; RULEID:; SRVR:DB5PR08MB0678; 
x-forefront-prvs: 08296C9B35
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(376002)(366004)(346002)(136003)(39860400002)(396003)(199004)(189003)(40434004)(5660300001)(76176011)(66066001)(97736004)(2900100001)(7696005)(99286004)(86362001)(4326008)(2501003)(5250100002)(316002)(106356001)(105586002)(99936001)(39060400002)(33656002)(54906003)(2351001)(26005)(53936002)(6116002)(8936002)(74316002)(446003)(71190400001)(7736002)(8676002)(6436002)(81166006)(71200400001)(25786009)(55016002)(9686003)(11346002)(5024004)(476003)(478600001)(486006)(68736007)(186003)(2906002)(5640700003)(102836004)(72206003)(256004)(6506007)(14444005)(6916009)(3846002)(14454004)(305945005)(81156014);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB5PR08MB0678;
	H:DB5PR08MB0888.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: opLFleZwNEcj+96LCo/UNnI43kATsnf9+GY5vY7vv0mFFb/+sarASxIENcqitmWR2Q0sx3I1SLyUU4gJHWS5DbDEQ990SyW9rcyyFvaecl+ZQwVXKDC75zE/nuaUDwfYSZMFPMZigTEKhPMsrxx2pysfCpBupj5pqLjFiln2Pg4VZyFzdjY51IfZ50NfNjApBeo5fyqpYLaqYzuXiRhdDStJ95Om/sODaDLRuimAh59gG5sgBJMb5S1dYM5m7gjd+C3Zw+MXWjtzJFkWpaOd9jUfff5kzbBKt4v250dzIjJbPUSr/QhWkfIR5wJiB8Dy7piaM4YJSn9Kp643dm/hyMK+/nNIF+981123KNbxXFo=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c5f100b-7107-4f0e-9771-08d634cff920
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2018 08:01:56.0870 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB0678
Cc: Jeremy Johnson <Jeremy.Johnson@arm.com>,
	"aehs29@gmail.com" <aehs29@gmail.com>, Hugues Kamba <Hugues.Kamba@arm.com>
Subject: Missing venv module in Python 3
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
X-List-Received-Date: Thu, 18 Oct 2018 13:35:05 -0000
X-Groupsio-MsgNum: 117434
Content-Language: en-GB
Content-Type: multipart/mixed;
	boundary="_003_DB5PR08MB08880A125ED651AD16C50FE993F80DB5PR08MB0888eurp_"

--_003_DB5PR08MB08880A125ED651AD16C50FE993F80DB5PR08MB0888eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

I have noticed that the venv module is not available with Python 3 in Yocto=
.
This is possibly because there is no entry for it in openembedded-core/meta=
/recipes-devtools/python/python3/python3-manifest.json

Could  you please provide guidance or a fix to make the module available?

Thank you

Jonathan Haigh on behalf of Hugues Kamba
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--_003_DB5PR08MB08880A125ED651AD16C50FE993F80DB5PR08MB0888eurp_
Content-Type: image/png; name="Outlook-o5x4232g.png"
Content-Description: Outlook-o5x4232g.png
Content-Disposition: attachment; filename="Outlook-o5x4232g.png"; size=2551;
	creation-date="Wed, 17 Oct 2018 09:19:30 GMT";
	modification-date="Thu, 18 Oct 2018 08:00:25 GMT"
Content-ID: <10ec17fb-e22d-40c2-9281-0f439e79a06d>
Content-Transfer-Encoding: base64

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

--_003_DB5PR08MB08880A125ED651AD16C50FE993F80DB5PR08MB0888eurp_
Content-Type: image/png; name="Outlook-3dhoboya.png"
Content-Description: Outlook-3dhoboya.png
Content-Disposition: attachment; filename="Outlook-3dhoboya.png"; size=2551;
	creation-date="Thu, 18 Oct 2018 07:54:25 GMT";
	modification-date="Thu, 18 Oct 2018 08:00:25 GMT"
Content-ID: <d40b8713-09f7-4833-bb76-bbdb4f544c70>
Content-Transfer-Encoding: base64

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

--_003_DB5PR08MB08880A125ED651AD16C50FE993F80DB5PR08MB0888eurp_--
