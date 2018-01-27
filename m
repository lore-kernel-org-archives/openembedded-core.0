Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0080.outbound.protection.outlook.com [104.47.33.80])
	by mail.openembedded.org (Postfix) with ESMTP id 98768787C1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jan 2018 20:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=wvJhYFaKGPH5fLshZ2NsFoRqL5aO4bAE7F1HUIkzlc8=;
	b=Bsg1XC9W7gKHHz5C1NE3qCKFb7w95OQ4lbRkMDJUNmbLyx8bihWvdGmPVLNwPzQGRAcLvgymvb/bL1gc3UD1A7lOtdmubNy+97jnL/3HkCQWH75/cpQEpS90W2444KpmuxGtF84+1j8OYJcxgwbJ5euX/s+lMyihfOuL1/a0rVE=
Received: from BY2PR02MB347.namprd02.prod.outlook.com (10.141.140.149) by
	BY2PR02MB139.namprd02.prod.outlook.com (10.242.45.140) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.428.17; Sat, 27 Jan 2018 16:59:35 +0000
Received: from BY2PR02MB347.namprd02.prod.outlook.com ([10.141.140.149]) by
	BY2PR02MB347.namprd02.prod.outlook.com ([10.141.140.149]) with mapi id
	15.20.0428.025; Sat, 27 Jan 2018 16:59:35 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Yocto Project, Spectre and Meltdown
Thread-Index: AQHTjr6G9035m9uNU0avbzZdNA66WqOH/E0AgAAFwMA=
Date: Sat, 27 Jan 2018 16:59:34 +0000
Message-ID: <BY2PR02MB347BCA749C4415BE91A11E3B9E70@BY2PR02MB347.namprd02.prod.outlook.com>
References: <1516102686.29722.267.camel@linuxfoundation.org>
	<1517070952.756.40.camel@linuxfoundation.org>
In-Reply-To: <1517070952.756.40.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-originating-ip: [149.199.62.254]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BY2PR02MB139;
	7:9QCcfjNWo5JWUOw3QvRXOj/uqGHUnVJfJ753s742+3GGfbCPG1D0GpVamypjSXnCgEZP4VFeWuZvZAPeYuJ+EcXPwsRwPbzg1PX079zNhHADYnWLRFljhHsTQFo3ZukgIazVQwsu5WiwBFASWPHt0xZP1TvE9jB//ZSFVuBUeWlzQwgH6oOWzvoV60JwcaiRHOWuq17BHR86p6yXCCNDmnZTBtnh6qqc7S+BgDK4XTovlZ/1vrz0/5c5BRod99L8
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: be20d007-743a-448a-cedb-08d565a757e4
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(48565401081)(5600026)(4604075)(3008032)(2017052603307)(7153060)(7193020);
	SRVR:BY2PR02MB139; 
x-ms-traffictypediagnostic: BY2PR02MB139:
x-microsoft-antispam-prvs: <BY2PR02MB1397E0FB43D2DE658B8771BB9E70@BY2PR02MB139.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(192374486261705)(264703809997249);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(8121501046)(5005006)(93006095)(93001095)(3231090)(2400081)(944501161)(3002001)(10201501046)(6055026)(6041288)(20161123560045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(6072148)(201708071742011);
	SRVR:BY2PR02MB139; BCL:0; PCL:0; RULEID:; SRVR:BY2PR02MB139; 
x-forefront-prvs: 056544FBEE
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39380400002)(366004)(346002)(376002)(396003)(39840400004)(377424004)(189003)(199004)(13464003)(6116002)(3846002)(110136005)(316002)(97736004)(105586002)(59450400001)(5660300001)(66066001)(99286004)(102836004)(305945005)(2906002)(7736002)(76176011)(86362001)(7696005)(25786009)(8936002)(6436002)(106356001)(9686003)(6246003)(55016002)(53936002)(478600001)(229853002)(8676002)(81156014)(81166006)(72206003)(74316002)(26005)(3280700002)(77096007)(3660700001)(33656002)(53546011)(6506007)(2950100002)(2900100001)(186003)(68736007)(14454004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB139;
	H:BY2PR02MB347.namprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: NFLqO7cjanJAFn3yRPiKcCgQTOAipooKH4SelqvqaegmfDPqgPWsR2qzOzwMgoajHk1q6ghLwqU7TRLslNf9ww==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be20d007-743a-448a-cedb-08d565a757e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2018 16:59:34.8849 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB139
Subject: Re: Yocto Project, Spectre and Meltdown
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
X-List-Received-Date: Sat, 27 Jan 2018 20:35:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi RP,

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Richard Purdie
> Sent: Saturday, January 27, 2018 8:36 AM
> To: openembedded-core <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] Yocto Project, Spectre and Meltdown
>=20
> On Tue, 2018-01-16 at 11:38 +0000, Richard Purdie wrote:
> > I just wanted to give people an update on where the project stands
> > with these issues.
>=20
> Master now contains gcc and kernel fixes (in linux-yocto). meta-yocto- bs=
p updates
> are still pending.
>=20
> rocko-next also has those fixes and is undergoing testing which if it pas=
ses, will get
> pushed to rocko.
>=20

I see that rocko-next branch is upgrading the GCC version to 7.3 from 7.2 ,=
 is there a reason to do so?
I was under the impression that we would backport the security fixes to 7.2=
 version.

Thanks,
Manju

