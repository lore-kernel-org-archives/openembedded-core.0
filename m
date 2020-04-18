Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.47])
 by mx.groups.io with SMTP id smtpd.web11.1900.1587229691066469637
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Apr 2020 10:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector2 header.b=PQP3cydF;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.243.47, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lCnApiWJl3dpOaumDCUe+m4rdaJS2qnW3K2/WqJfDIlNPl+hIY1CtQLKATxGyABTYTNXWEiFsTUBxpMabJJSpSieT66eDVJkUfia8F8eEtg11+vU0cz3Lcn/WcLURi5In4oLlRPD4UUUZA6sFG4BE8XUix43MQeQM9NtBwmScrfsT/07HLllGcGHg2ua5yEfcyoMhF3NzqrFPfP6QlE4QwTw+4HBlNccLp0ocqtSrMY5CHpP2J17HVvczEUbNm2EGXJtheSbQSNQQgjip20wdES3gTwY5Qvo7H9ICeaR2Z2E1rTcqS7IVA1BfIb0q5G1IkmRjnxJNVC4DyYlAtfI7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHKL65mc9hZNibTqMQcVGhaEwvswYdUBhKpeGV1D0Gw=;
 b=mv1yJYm9GzcaKpCVOh/V9j44D5d0aqfNujrY78arcreC72zMUck986/2t2iPYhwn7NwH0ePvhIiUtTl1tzO4ZyrHYqH97Z+OrQjSKq0XDXNPuuuNb3+GS66CZ6AbVqAPg8u1qbFLwRKjA73R4lM4VWkhyeEcm0YCvWFVZ0RDvt3op+hLjYYMOZdiNNClnKf4/q80kbG/2Gr0/Tb3RBQWZj8IoOZ/H10YsUejjwzHdrrW56dcRAhqcwW4Qgz7GzfE0eGDDVfDQk/Qo3M4fLVjlrKI1uwa6MLGUHZVlTzKojLD1s++ZFvz4+Vsj1nKjMWxJ2zx3WateaYEUuC8SLnLKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHKL65mc9hZNibTqMQcVGhaEwvswYdUBhKpeGV1D0Gw=;
 b=PQP3cydFLnGnoHJ5JyIA6o/MYDH2y/EhBsSb42OTCWvAZQviRaYCuCBFkWQmfSjLtUhTh1wLhFLgfhslypUnI4XMXNQtmZwDqs/X8MB7nBTZglint7v2/O9NkLiQV1p7IjbxeDgpBrNBotzTMrIDXjBaDph1pOT4IsML0pdMJlo=
Received: from DM5PR12MB2471.namprd12.prod.outlook.com (2603:10b6:4:b5::10) by
 DM5PR12MB1243.namprd12.prod.outlook.com (2603:10b6:3:74::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.27; Sat, 18 Apr 2020 17:08:09 +0000
Received: from DM5PR12MB2471.namprd12.prod.outlook.com
 ([fe80::a135:cafb:783f:f1ab]) by DM5PR12MB2471.namprd12.prod.outlook.com
 ([fe80::a135:cafb:783f:f1ab%5]) with mapi id 15.20.2921.027; Sat, 18 Apr 2020
 17:08:09 +0000
From: "Chris Laplante" <chris.laplante@agilent.com>
To: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
CC: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] why does oe-buildenv-internal check for -z "$BDIR"?
Thread-Topic: [OE-core] why does oe-buildenv-internal check for -z "$BDIR"?
Thread-Index: AQHWFZsKeMuSaePOtkml5istbzX9aah/EkQAgAADb4CAAAVVIA==
Date: Sat, 18 Apr 2020 17:08:09 +0000
Message-ID: 
 <DM5PR12MB24711A9EF9D90BB86E95EDAA8BD60@DM5PR12MB2471.namprd12.prod.outlook.com>
References: <alpine.LFD.2.21.2004181159130.1300328@localhost.localdomain>
 <e610ad1ecb7cd084ab61fe4bcf56b01568c5edc7.camel@linuxfoundation.org>
 <alpine.LFD.2.21.2004181235160.1301461@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.21.2004181235160.1301461@localhost.localdomain>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=chris.laplante@agilent.com; 
x-originating-ip: [76.99.179.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f31f0d6f-3610-4926-3f71-08d7e3bb11e3
x-ms-traffictypediagnostic: DM5PR12MB1243:
x-microsoft-antispam-prvs: 
 <DM5PR12MB12433659C9FDE3F215F0CA6F8BD60@DM5PR12MB1243.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0377802854
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB2471.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(376002)(136003)(346002)(366004)(39860400002)(396003)(29502001)(7696005)(9686003)(8676002)(81156014)(316002)(8936002)(6506007)(186003)(478600001)(55016002)(110136005)(26005)(52536014)(71200400001)(76116006)(2906002)(4744005)(66446008)(66556008)(64756008)(66476007)(5660300002)(33656002)(86362001)(4326008)(66946007);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: agilent.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 KUvQuJpzkqbBrp2q8DJS05V6167PQHetT22wMV+iC/8c1P2kWFc9w2Nx+hZk4HE+X2tuQNY9s/Hqzcgyx47wm5eKOfCn99Re8NsCpTNe1IvsH6n/FV5E130I4UFycXeilj0ZSoFO42AD3oBxixfIDN4wHNg6KTxRjuKhBxoAuGCV0KzNrKLCakwVdtzA2/YbWPCJPrS27xT3y6ys0kl25Lygje4Qt52Om2wxhv0hVmsx3Fskc6GZx4iOxCs5nu0/isSWvob9jKHCikJebjjkwgjE6pQRS4ugv0M0y+8HbujU9BXAtmlHh58TA3FF1fygdFPJudJqKx2+/M5kGaxsVwNGZasU4gdSe1BMYWtJJk2gdETdZKgc6rZTWNbQxyYzE7rz5f72YuXiqQaQgRsjMUBYDj080XHECRBStP0yKaHhE0IXyFdw3sS6fv97eNkJem+2usa0IJhqGr5T2SiM64nfNhCxZQ9GgKT+mSwYAppy0TXykHf3Yv5lOtxOML+g
x-ms-exchange-antispam-messagedata: 
 QqLeh3yCbg2LI+5cAyKnOBRBdOWZjBy6oD742E8uEFTL5/oftu1DyAV2tQqunirIR+cwA5Xb9YekxYWApjZpBwYmztrIGGxYWDEMKc072zJQK2Wajw2HeK+y1pErqdYg2OymVpK21Lxry/ePI2ueWw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f31f0d6f-3610-4926-3f71-08d7e3bb11e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2020 17:08:09.3760
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q9HWPhUVU3bVfRM3+dij/gH8TPvtMwnAJrGri2DEOgHUgq+U+Nnko6bb4HflZnFF4LuUb5FdAVHfHAHmkQpKlJNNWwbYcbrBSHSS4WxDePU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1243
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>   i know that -- in fact, it's the only way i use it -- the question
> is the purpose for checking if $BDIR is zero length first. that is,
> under what circumstances could it *not* be? even invoking the way you
> demonstrate, that variable is empty when tested, and i see nothing
> that could cause it to have a value before that test.

FWIW I was curious/bored and looked to see if 'BDIR' was ever used in poky =
(outside of the script of course), and I found no results.

git rev-list --all | xargs git grep -w BDIR -- './*' ':!scripts/oe-buildenv=
-internal'


Chris =20
