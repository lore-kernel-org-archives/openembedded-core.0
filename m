Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.74])
 by mx.groups.io with SMTP id smtpd.web09.5497.1605095404626448410
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2020 03:50:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@spinetix.com header.s=selector2 header.b=JesOtZJr;
 spf=pass (domain: spinetix.com, ip: 40.107.7.74, mailfrom: diego.santacruz@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X8U+tH3YBpoMR7AVMcV+6pXDTcSO4d+TRYC1+MlEavbyLUjA1ppMy13ltoqyL3Rh+AZXg4iRPq/yH9SA9c7LsXGfQKdcmWMRzLzCp1K6HzYs2eIFAP46ZFVLFaivnwrvZCnS9hjtBC5vVQlRKI/0qoLMG4e4Am0+gLbhAGiDdSxUUjH/mp6vJz0+slrUgtolMWRnLKggbMLKo7EfLJYMMryVE+Fom1lAqn9k0p1U/6hV+HWTmXWjSqddWW4kJh0RZsqf2E8olNiu9HSx1G601+1TKXrJJBFCxxgcTBg8TQJiB0dnP+E+9rRaYePtn/14fLVXbTQNr/EUheZzj2dLfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sexx6+SpeWUaVx867GT/ssVPeLYS1ACdEgf+yyQqRfc=;
 b=nMFjW9UdMdNxlUcfeVA5q2PRo2yyW3tLlAXJ6mApav5G6TEpYWjLYL/4EzTTNBvSMUkGrnL0DH4+YQH9A/yhY10qNfO2vPfyzBksqSqzyqvUcBPekw8PH48auZlxE0yZareLJZhrS9obtVrstfBJe9668fRzEnP/Kn8nP6D4PTU4wnU0SBvysN3fKWjmL3R2350S3v5jQYihkH7T5ItatV2odaIeOvSPXR4Gs39rELKY25UC+iQGPCb6R4hJZvCTz1xnHRmNcbKeA2eUSIhM/6P8IK58B1Ikwflp6OedrmpMU757KWVrGNJHofUfkhXKhA+tiCD+QG0vOBmM4lzM0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sexx6+SpeWUaVx867GT/ssVPeLYS1ACdEgf+yyQqRfc=;
 b=JesOtZJr2PVraVidNuUYMXmyYIciLtAsDjiTt+y1y2ofUI+3VZhzH1uKhPWRwvHomTxTosGa/SLOCCmq4PeOQx8cPGxS+NgVCCbsk1JYT9FI0g5OpAAqabUPJ7/sL9EZ490oOyzXb9H0t4JXwoE8QJtFhuM2E55ALqTp+ODapfk=
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19) by DBBPR01MB7611.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1ed::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Wed, 11 Nov
 2020 11:50:01 +0000
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::c14b:724a:501b:411c]) by
 DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::c14b:724a:501b:411c%7]) with mapi id 15.20.3499.034; Wed, 11 Nov 2020
 11:50:01 +0000
From: "Diego Santa Cruz" <diego.santacruz@spinetix.com>
To: Ross Burton <ross@burtonini.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] FreeType CVE-2020-15999
Thread-Topic: [OE-core] FreeType CVE-2020-15999
Thread-Index: Ada3/yfZgI6So/CPS5+iqCvl+/ICCAAGLHWAAAI1sYA=
Date: Wed, 11 Nov 2020 11:50:01 +0000
Message-ID: 
 <DB6PR0102MB2630C81022C68C5850D9AD9E88E80@DB6PR0102MB2630.eurprd01.prod.exchangelabs.com>
References: 
 <DB6PR0102MB2630314CC44CCB6400F59C4E88E80@DB6PR0102MB2630.eurprd01.prod.exchangelabs.com>
 <CAAnfSTtqCwkWbVYiD5614NW3Z4ch+Xh1KEdPvwAvVCH3SmPUmA@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTtqCwkWbVYiD5614NW3Z4ch+Xh1KEdPvwAvVCH3SmPUmA@mail.gmail.com>
Accept-Language: en-GB, fr-CH, fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: burtonini.com; dkim=none (message not signed)
 header.d=none;burtonini.com; dmarc=none action=none header.from=spinetix.com;
x-originating-ip: [178.198.197.47]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 793a97f2-218d-4513-ec7d-08d88637ec49
x-ms-traffictypediagnostic: DBBPR01MB7611:
x-microsoft-antispam-prvs: 
 <DBBPR01MB7611C341013A115FDF661BB188E80@DBBPR01MB7611.eurprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 CpE1h7lGNx/aT5mHe7onsX1Uoqhdme+rtt/PWXVsS5e/HJNbUu/y1T4jgFkjOLou466EBlX2+TRpZjABR4Y4kBdP5cBFQFBc51anR3Ie1Cd+bs2q/UoWOhP1PNW8knFbK8hqxwZu5/hTpvtAZvGplDzDifQaW6Fm85PDy+yZNp8rDTLCW0eo2vvy0PJIM0mFLaqRhcdvjSaeYMzrXi4K6dYn5uKMfhrrbrHeJlszF2ZO1hBtcrvamVLY9W+0cOfu4ujDSBnWvO28sdBzC+l8sRJMozp8zHlkvmhYxTWQDrb6tkBBkPEvwEwzPEz3lGcSIVLJCY7gR4dpv4tVrEwoGQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0102MB2630.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(366004)(39830400003)(396003)(376002)(346002)(136003)(4744005)(8676002)(83380400001)(33656002)(5660300002)(26005)(66446008)(478600001)(86362001)(8936002)(316002)(4326008)(64756008)(66946007)(66556008)(6506007)(66476007)(53546011)(2906002)(76116006)(71200400001)(55016002)(6916009)(7696005)(186003)(52536014)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 KtTUP48sD2y2Ekeg0HthGI+1n2hKdR6dge51Pb50CFbUkBTEqRQ6Zw0hjao8vVh9aLP6Jc9usfym4eRq+/bisKpvFvUUpKRG6ojeqV2D+FzIuC6bU5a99IMjoQOBT/wsNfGntbmPB2BBxyH+S/Jwvrbp7W33Z8we789X6HJ96WCCEwjGPKYar2l13QSjAla7g2bvhUdNTkXPFizmS8Alq16w5nIvtRR2PLHJJLlh/hJgDEFKrJk8Sx24QdfWizo9w6gpTPX0ObAynsCv9M1SUNyzWFLRlze6RTqkELJG+VBj+/iAGTxbWYPnLxv3wQotILIKMeJjvPG6xDHr/P9tprhuveYMh7VNgLl831Qc1bgP+KYEJOVAbGdcG4wuH9VJi256L0pjFKYXnhTrQygU4uc1m6VcFN2+dCfmz5NqZ/R7UkVgDBhELAVV70ep84W1YCnzr0JBo1/VukHPd31+We2IaXfd54dCO5K1/OjB6BG14pIqlQu0I99PaRotpdEJ3Lxo76knumRbdSy9agNXWi7A4U9FxQMtBoYOc6kLCQ1cIAfZM9Tgc8I3lm5RgJixG3w8mNnT+QJwcnZpYIpfJQnUcQeNKrSO+LtjlJnzdW4ypyh47vQyiUKYLx2q2dvqqp6M02MVztCmXEiwW6ru0A==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 793a97f2-218d-4513-ec7d-08d88637ec49
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2020 11:50:01.6837
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yt9Ud+2v3uFJnpF941+/Q9Rlf1nLjsTpNggznwZsZ5u5j9djoQXPWE6ip7G4VvLvgf3wm4FYhWA/1o0sHmuafnhD9uiAfQ6lh/CybhRTf1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR01MB7611
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zc0Bi
dXJ0b25pbmkuY29tPg0KPiBTZW50OiAxMSBOb3ZlbWJlciAyMDIwIDExOjQ2DQo+IFRvOiBEaWVn
byBTYW50YSBDcnV6IDxEaWVnby5TYW50YUNydXpAc3BpbmV0aXguY29tPg0KPiBDYzogb3BlbmVt
YmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNv
cmVdIEZyZWVUeXBlIENWRS0yMDIwLTE1OTk5DQo+IA0KPiBPbiBXZWQsIDExIE5vdiAyMDIwIGF0
IDA4OjA2LCBEaWVnbyBTYW50YSBDcnV6IHZpYQ0KPiBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+
IDxkaWVnby5zYW50YWNydXo9c3BpbmV0aXguY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdy
b3RlOg0KPiA+IEFsc28sIGhvdyBzaG91bGQgb25lIHJlcG9ydCBwcm9ibGVtcyBpbiB0aGUgTlZE
IGRhdGFiYXNlPw0KPiANCj4gRW1haWwgY3BlX2RpY3Rpb25hcnkgPGNwZV9kaWN0aW9uYXJ5QG5p
c3QuZ292PiBhbmQgZXhwbGFpbiB0aGUNCj4gc2l0dWF0aW9uLCBtYXRjaGluZyB0aGUgQ1BFIHZl
bmRvci9wcm9kdWN0IHRvIGV4aXN0aW5nIGZyZWV0eXBlIENWRXMNCj4gYW5kIGluY2x1ZGluZyB0
aGUgdmVyc2lvbiBpbmZvcm1hdGlvbi4NCj4gDQo+IFJvc3MNCltEaWVnbyBTYW50YSBDcnV6XSBE
b25lLCB0aGFua3MhDQoNCi0tIA0KRGllZ28gU2FudGEgQ3J1eiwgUGhEDQpUZWNobm9sb2d5IEFy
Y2hpdGVjdA0Kc3BpbmV0aXguY29tDQo=
