Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.49])
 by mx.groups.io with SMTP id smtpd.web12.4891.1620202636154813503
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 01:17:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@spinetix.com header.s=selector2 header.b=mxCvgXQr;
 spf=pass (domain: spinetix.com, ip: 40.107.21.49, mailfrom: diego.santacruz@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e8Qf1fZa7ZATkSzmkzAG/elcFwuAtt/zcIKIZr28X2YcIBvLn6XfLl+v8qqXjPiKPrvESN221rF2T/feuza1uzrW/s6hUQqUAPFJYDTICmD23FdI2I2AE3nCk6exyYWCTC2DSJ0MoraEDiOb2o+h3VmRKXms23JTiXleSLi/P+b1Zg85v71g2kFOg6I6guHmuVQJtfywYScxEWDqKrKMD7U9+SWYJUThnjcGIgZj1YWbEiUL8iqe93P2KlkHWeSHX+tXfOc79b4oD7ywQ7WOHdZRAcb7uaM52bIIdlqghbEudd3q0klvg+IyCc/YPn8UlGwEIo78boX0yxo8wPhdyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JnXTpVc8+VVNVZj/1DH42OiHHTToxWcu4uM6nPnwx8A=;
 b=a8Q6Ve9XZaxQV13fd8BhdXs/awuB8cQWIXhgLwV3IN8sQwvQSBcEmygFm8Bw8F+DM8dZLmkzOANudkWshQ62lIzu7WRPnSnIQ2ScLFWYq6AnpRDPqSlGueq54KpdLd2NlCwmI4/avyMj1eHr8AszNxIUgnG+76EpNMx+avmoL/xTPl7SW/w2VTrsTcGFtXTSISl8s8rTCJoxDdYAYliiL9t3oRpXc6p6vgREwno2bPBEiRKUoNv4BDAu2jV1yLCfNI4LbLnb+q0+rphN3bsQfWuwDm9cS35JJRzEd1SsKHVQhTgJ9ISMs7mqNo0g9NTemrF43skLVBv/dEP4rhT44g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JnXTpVc8+VVNVZj/1DH42OiHHTToxWcu4uM6nPnwx8A=;
 b=mxCvgXQrlSr8cn+nXXJLD0MCgF17bkACCFOxtEQdfj7ToF0CQf3P99HqHdFbSMjSxiq/GL5njVmWI3nZS2L7q816uyIYtbFrjGw9Dk+ni8iRHhqrBsJqljdvhih/YNRrj+MynnwZoHRLN4EXbmpisKKFBQrvYM7hdLSFkJX5saM=
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19) by DBAPR01MB6677.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:181::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25; Wed, 5 May
 2021 08:17:11 +0000
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::d4be:af2c:d43:bcc9]) by
 DB6PR0102MB2630.eurprd01.prod.exchangelabs.com ([fe80::d4be:af2c:d43:bcc9%7])
 with mapi id 15.20.4108.025; Wed, 5 May 2021 08:17:11 +0000
From: "Diego Santa Cruz" <diego.santacruz@spinetix.com>
To: Steve Sakoman <sakoman@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Mark Hatle
	<mark.hatle@kernel.crashing.org>
Subject: Re: [OE-core] Unihash warning building kernels in Yocto 3.1.7
Thread-Topic: [OE-core] Unihash warning building kernels in Yocto 3.1.7
Thread-Index: Adc94keMh2EjTyR0Qb2I9MEwyjYHOwADn9mAAAAPM4AA5WHzsA==
Date: Wed, 5 May 2021 08:17:10 +0000
Message-ID: 
 <DB6PR0102MB26301A3BB6E92C6EAFE8200788599@DB6PR0102MB2630.eurprd01.prod.exchangelabs.com>
References: 
 <DB6PR0102MB26302BA4C54F13FC351F8C0A885E9@DB6PR0102MB2630.eurprd01.prod.exchangelabs.com>
 <CAGDS+nk51u31+-NR2k1u-y375RL0TyCEkm9L=7Va7eQcuRQwCA@mail.gmail.com>
 <CAGDS+nkq70RdM5SRVTabnsY5i4aB-VuDeeFraA9kyc=1HoCREw@mail.gmail.com>
In-Reply-To: 
 <CAGDS+nkq70RdM5SRVTabnsY5i4aB-VuDeeFraA9kyc=1HoCREw@mail.gmail.com>
Accept-Language: en-GB, fr-CH, fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=spinetix.com;
x-originating-ip: [2a02:120b:2c6f:c0:8d32:1256:b046:e275]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 864fa1c0-7fd2-4a55-39eb-08d90f9e2ea7
x-ms-traffictypediagnostic: DBAPR01MB6677:
x-microsoft-antispam-prvs: 
 <DBAPR01MB6677041819AAC4DC8862C5A688599@DBAPR01MB6677.eurprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:119;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Y3c2bOhxLZRC39x7wvyi3v29+kB84aFS2QPc+BhS2g7LuQB2CMqT9S19fCWMGIu7WPk/8E61jSsVL2rrwVM7y1r7y37UWhyMEnIWkNqZrZKI905mdaWIGDLdJLUD2opQEXorgBuT9FunNuOlJA8Rz/1+XMrQJ0QnBK0mdCm65j/kgv3HERLlkVpU4uWL0xVy5qkuUBMt9IPnLzNS+jatQipaFr+ynVE/Azqua5S7PGGRWhLHy4WSYii9uR7ezxXPMdUdM1+/v0yR+Xm5/82va3vjV1sPXzGdks3pj6wQu49uq2GakAZ98/WrKkePLp7aSUnZIdwAZy+RXQPcm7mAe+kdzkUWscPxWqIOZs0ImgnzP6NlklhIF3gssmJKp7b521Bb8wli+S76nwGyRx6SrvXLyq6ftFy4RZPKTraPTZvrt7kLLktO1oDYUDrSmn4oCHDe999q2W0IUAuSZUjLe3BTxdVqlgzZwKB0s0RKraV28DvoeX0tjRy5sLQe0qeUNIPQinqV+b7m/kj+53SOX/kS/WK62CJfGugit7A7FA9gMITOSmAkVey1ChAJlR8Z/54VbeFg0rR0SBC0wisHQ5S8pby9aQEmUfkDc8xRzlJ+S0417wevBR8eg4WETTQH63bt/ll9XOUxSBGgYkftnIgvElW37pY5DVg3VUNCKGAvf0mI3TotVxxMQxvrXZzb
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0102MB2630.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(64756008)(66556008)(83380400001)(9686003)(38100700002)(186003)(6506007)(52536014)(86362001)(5660300002)(53546011)(66446008)(66476007)(45080400002)(122000001)(33656002)(6916009)(8936002)(7696005)(8676002)(316002)(966005)(76116006)(71200400001)(55016002)(478600001)(4326008)(2906002)(66946007)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?hpM8PjMozkFouZ6Yw0W/YJu4dXOf5HRoXl1ABMVYVYG3AUKwdHrnX4WVUDoH?=
 =?us-ascii?Q?8kmm8786UJgmcOiOA083wE729nNbYpMP2MxD6uo2PI61jnxd1l/lmfvtsfqo?=
 =?us-ascii?Q?z7q4Gc7Tmenr6BlbH/U9c7jJFjycS8fSZ78iAKSQWOgBKBoNWPMZfWcXam+8?=
 =?us-ascii?Q?uTKKNwtWac9EMGlyBRaS/O/uunN80cRhw5l+OHsdrUfwvb3EnZsIndyxoGxO?=
 =?us-ascii?Q?GvI4xtGhLyws4mdlSQ5X8HKWonuGBETb4kaPUHmqWeLA0cSsL3TQHw1mmnsv?=
 =?us-ascii?Q?0OY/OqGZmh84QE7yxpc3U/m/W9RlKgpDdNVxn8MV/bCLKZFZTPG4q2qDka88?=
 =?us-ascii?Q?O7TVGOvmB/reRwkhPkndx9dP5eqwMiUX71O02yv5xK01a5/y18p5ONxahwXy?=
 =?us-ascii?Q?jqhSaIVI9BEZ0ugguseLgVgWoUT+6um6tpqgjwUBrdVoyIQXx532/XqrjEq5?=
 =?us-ascii?Q?++LPp2yzPh9X2cut20akXpZWe8us8OfsD1wzL0SUMjR8GWZ+iPNtc3otHUiP?=
 =?us-ascii?Q?hV0HaHJZ4+9RqO+aeeF9AB6HtXpU02s2cBL8D5f2gobZtQrwG/2CxQoV2ibe?=
 =?us-ascii?Q?+ZW/AeCvCuxg9digpjrsjWyP1cbtyhdvjaYBuZOYUUmEPRifrOfXUuZWX+R7?=
 =?us-ascii?Q?LKzsxF5ZR2YGXZNJ2xEaovVzMl9K+JvaV/+bJsvQUQb+wkvC/ASmoLykUk5K?=
 =?us-ascii?Q?XLfow05k1dfgcOkL5gYMQtPyDNoN3/JRrgYhgHpQ7ETyYGu/pN7QeC6vxBIz?=
 =?us-ascii?Q?Bhl+yqC8J+4NtIVH+6xrXf0+uEZZPgTy2ovPV7/hkeyBk2aCefNdttJtd4EI?=
 =?us-ascii?Q?vwlVXVsShzv+Hl5bg1PF9tedYedQEMIEh6j9Dv6gMhCOg+MG6b+BkSZZd+UU?=
 =?us-ascii?Q?8u5svxrZSrXd3CaXsnuh7LU+YreTLrLLCmFA9BlOA0ykKUNqEvwGaDwgWhiW?=
 =?us-ascii?Q?DEPnuRFX7MIWJoJOeGtG0eiNN038WAVLAIiMXUmLWQxg/Sl0VDCyQAF0HuH+?=
 =?us-ascii?Q?tslgg1iUAzdI5SBsL5auIPw5z2CLPwschPscnBoJw+KSwqiA/aYq4ocgEAZ8?=
 =?us-ascii?Q?ABhgU+vgSlrdIlUTDpBZIvL4JjH9/AWWSwDhmPsb50LgkyFZJBMYg0jA45kX?=
 =?us-ascii?Q?TP2zhjkrklqqoKXnVSaIKONRnD/AgKDopHArfnFCKmRvvDJpIcUf+b8XuTk/?=
 =?us-ascii?Q?aJe7PD554ZNDIJdFNVEMACbJteUhBidgJJrC3bejkvmUYpeUjEfgsGgv6w4Y?=
 =?us-ascii?Q?EGJRYVtM7HgVEvQ5fwx2qOZH+iIS6nU87IlrjxhLT7VbOyYpnF7gKOKBWqa5?=
 =?us-ascii?Q?oC9p18SbuOgUYrBuo/FlSq/2a2VVhYnfJfU+ukfSlgcVY7yxj2UTEeeSRPLd?=
 =?us-ascii?Q?TbS8d3waD738xaIe8bBYfhn70GpY?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 864fa1c0-7fd2-4a55-39eb-08d90f9e2ea7
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2021 08:17:10.9797
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PYi336cFyGSDcrUZS50V1wYGAD3vhxeWemH5fVC++uj+usc2uE8g6QZR7WFYOiyMOje6WZj187KeAP57MQXEtDkPoLPU5c0soogHaijsXuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR01MB6677
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Steve, Mark,

Any news on this one? I have been doing our own builds with the equivalent=
 of that patch for our BSPs with a linux-intel derived kernel recipe plus a=
nother internal kernel recipe (both using kernel.bbclass) and I have not fo=
und any issues with it.

Best,

Diego

--
Diego Santa Cruz, PhD
Technology Architect
T +41 21 341 15 50
diego.santacruz@spinetix.com | Subscribe to our Newlsetter
spinetix.com




> -----Original Message-----
> From: Steve Sakoman <sakoman@gmail.com>
> Sent: 30 April 2021 20:46
> To: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
> Cc: openembedded-core@lists.openembedded.org; Mark Hatle
> <mark.hatle@kernel.crashing.org>
> Subject: Re: [OE-core] Unihash warning building kernels in Yocto 3.1.7
>=20
> Trying again with Mark's correct email address!
>=20
> On Fri, Apr 30, 2021 at 8:43 AM Steve Sakoman <sakoman@gmail.com>
> wrote:
> >
> > On Fri, Apr 30, 2021 at 7:00 AM Diego Santa Cruz via
> > lists.openembedded.org
> > <diego.santacruz=3Dspinetix.com@lists.openembedded.org> wrote:
> > >
> > > Hello,
> > >
> > >
> > >
> > > I just updated to Yocto 3.1.7 (from 3.1.5) and I got the following w=
arning
> while building a kernel recipe.
> > >
> > >
> > >
> > >   do_install: Task do_install requested do_package unihash, but it w=
as not
> available
> > >
> > >
> > >
> > > I tracked this down to OE-Core commit
> 0c28edf4bf0d2f92bf3a47406041c63acd90bacf ("package.bbclass: hash
> equivalency and pr service") and it makes sense since do_package runs af=
ter
> do_install and in dunfell we can find the following in kernel.bbclass
> > >
> > >
> > >
> > >   do_install[prefuncs] +=3D "package_get_auto_pr"
> > >
> > >
> > >
> > > Merging OE-Core commit 36fe4db8ae827a93abe9fce6740459d215411965
> ("kernel.bbclass: Remove do_install[prefunc] no longer needed") should
> normally solve this warning by removing the above line, but I do not kno=
w if
> that change is safe in dunfell.
> > >
> > >
> > >
> > > Could that be merged in? Or is there something else that could be do=
ne
> to avoid the warning?
> >
> > I can do some testing with that patch.  cc-ing Mark to see if he has
> > any comments since he is the patch author.
> >
> > Steve
> >
> >
> > > Our build system flags a production build as bad if there is a warni=
ng, so
> this is kind of annoying.
> > >
> > >
> > >
> > > Best,
> > >
> > >
> > >
> > > Diego
> > >
> > > --
> > > Diego Santa Cruz, PhD
> > > Technology Architect
> > > spinetix.com
> > >
> > >
> > >
> > >
> > >=20
> > >
