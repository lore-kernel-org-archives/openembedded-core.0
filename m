Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.76])
 by mx.groups.io with SMTP id smtpd.web10.3849.1620806736856112468
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 01:05:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@spinetix.com header.s=selector2 header.b=sCkHOoLA;
 spf=pass (domain: spinetix.com, ip: 40.107.6.76, mailfrom: diego.santacruz@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ocxj5N+HVEL+qDckN3fSkbSll6OowbWOBGDW9Y8I3x0xGndRIJq6UbpdPrPiDdhWTAUvIlMSc5M7XQ6ExdFa4AkYzDNalKfoWNNEgoo9q8a14YcFtdDlG/3coTNSKNOLZI241lPxhlIyCjP0e+XOe2TxAkczPI0WtBIhaGGCjcfCVYCMeUu0hlIZb5A4wYd23nOrD8IYOHtoPSYBeTJxM7qYasHtEI3zGoKlYPMDLP6thyOJMoUk2gSg7uRnQhUjZ5qFINgIodSNuoQps6HjZLPZEhmYVI/cygDEVDgo0S06hJaerJIXda3ddN1AdhUqB6iaicS5VxRTec7lHYeOUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tsr39OwflnJ6031XdPflZ/mGJftYqbWbJ9G2eC8o2Yo=;
 b=JYYw2ce5Y8CayR48cIl1S/4o4vUs6FacHdq3YhAs5NOj0czwBbK67GhV60CDe7JVbWmWU0ICEoi+Yc1TCAbn8RKvWaSGj6f6I+eAQaw+c9SjRGATcPhVdahSOM4aaQYAENCq5yTTMOOz6Txoaix2ijPbW3xvS2DVYrxmVTKQeNp0z1Eogp7Bt3Ry/J0TPtwcd6zD1BJLnPnbVn0hr2RyYDS3jdMfKQJE0mseX6pROZjj8Vie5wW+/YPZSsmoIM4y177YVAtLiy341WP6oaI9w65lzFGTCBuBBYmwiWRjZauEGqfhcjNhd3a2RcqbdWB5z/eEnF6qRQSm4F/TciYyPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tsr39OwflnJ6031XdPflZ/mGJftYqbWbJ9G2eC8o2Yo=;
 b=sCkHOoLATpq316cTta2v6kOjP41LCLRB2iA+rtkqWm6bGvC9TvOqX8izL/MX6+zu7YoySkihfBrnUTAPH5ZHbiS45vyNuRCPE/oZTp2RKwels58ctc5CnAxfJH1aSpV4t3OH914z9WP1nvj4P4O3NcXxJOsv1fYE0q6OiUPK+ME=
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19) by DB7PR01MB5193.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:82::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.30; Wed, 12 May
 2021 08:05:33 +0000
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::d4be:af2c:d43:bcc9]) by
 DB6PR0102MB2630.eurprd01.prod.exchangelabs.com ([fe80::d4be:af2c:d43:bcc9%7])
 with mapi id 15.20.4129.026; Wed, 12 May 2021 08:05:33 +0000
From: "Diego Santa Cruz" <diego.santacruz@spinetix.com>
To: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] SDK question: does "-c populate_sdk" build SDK based on entire image?
Thread-Topic: [OE-core] SDK question: does "-c populate_sdk" build SDK based
 on entire image?
Thread-Index: AQHXQ0KMFRnIf3Xqb0y25JKCpwLb8arfgFKQ
Date: Wed, 12 May 2021 08:05:32 +0000
Message-ID: 
 <DB6PR0102MB2630B6451A1EA31186636ABC88529@DB6PR0102MB2630.eurprd01.prod.exchangelabs.com>
References: <36cf577f-e2e2-4c58-5cb5-37eafa42b266@crashcourse.ca>
In-Reply-To: <36cf577f-e2e2-4c58-5cb5-37eafa42b266@crashcourse.ca>
Accept-Language: en-GB, fr-CH, fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: crashcourse.ca; dkim=none (message not signed)
 header.d=none;crashcourse.ca; dmarc=none action=none
 header.from=spinetix.com;
x-originating-ip: [178.198.240.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd37f502-ab0a-442f-9aa9-08d9151cb78e
x-ms-traffictypediagnostic: DB7PR01MB5193:
x-microsoft-antispam-prvs: 
 <DB7PR01MB519360D92B1506F1E136F73488529@DB7PR01MB5193.eurprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 xnqfuVyf5UpdSU4iSr/bAfRjJHjXjMkUnbG+5KpJRmmvGqjXxFgcOtW8ZjkFqWGmbQ2YJL0Yk5SNcEjJyC5bECX1+Gqfe9yaIbk0LRCvunJWqJRv1Oy5lbfqbYBrjfHdz3wMxYG+47Ao/jAGk8Q3VwaqAyxNOj/7wT3xS0WobYYoboiMVb7a8w/1okjgo5vOwcXFbtlJwlcmhdfdtgcw6PrvF0ndzSbQpWTJUySJmLoOnlL9O7zhTIMVcafECLSElpamA74L+rtMp7vXRwKJw4w5cez2srqLS+vDqQrBkIMh1LmWQQGcMHba0h62sCtVk+AU2TB4cTqtp526kgnWRQWMGZYzquaRp+vlhnNBu0dtDmmUexg1G85SBqGMxZoz9JS/bUuX95esg42HW8U6vL2JxHoGAV0ei3BN1WjoY0DmxD2MpXCMn5R3/r8rf7JgfMwqzg0sumS+citJRnF2btWBU1IWEczALcvicNeq+Gupu3AJS6X8pF3ZfZuXPHbds6AZCTX5FIxVzMxi0iwjBQhijCtmZeP5WNKxGUXVf301ID0UtfmsuH4FQmYH2ftKqD2dtBANdW556VSWxeYiM0XzQxYL0wgXCvNt07Nj9ec=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0102MB2630.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(376002)(39830400003)(346002)(86362001)(26005)(8936002)(8676002)(186003)(9686003)(478600001)(316002)(55016002)(83380400001)(66476007)(66446008)(66946007)(71200400001)(64756008)(76116006)(2906002)(66556008)(110136005)(52536014)(122000001)(33656002)(5660300002)(7696005)(53546011)(6506007)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?+jVeY+9DRJNpbV52ozX4c99GE+Xoe0mJyZlxLCCwlrsD/VomuDLyJ5jLeNo5?=
 =?us-ascii?Q?HdgPe58r9ESNCfPsPD5I/Sx1ZgB9JtUzIyhKrZZdrzWXkT2vow7dv8YFcftD?=
 =?us-ascii?Q?ZwqQwPYqMWE/O0K/Yz6t6acSpP5BVt2MK7AHYPnCdaFzRmewzz7Zx3mk+BsM?=
 =?us-ascii?Q?hFSNlHaIXAqv6u4u+OqQLCnS/vNQ+Hb6e/yXa//X8E3lqDWOrYGXYPVvS1N9?=
 =?us-ascii?Q?4qI2NpPUYdrucTfRfemJBpsfQqwWBE6Hcv4LPVhq9fTkOooC7RhEPvDFClbq?=
 =?us-ascii?Q?XT7iVc8bPYwFJl7IbQAHVFyDELkGEV32aVYdHnYZKBAVgidxwWm5CVSxkuOU?=
 =?us-ascii?Q?ymZ30B7v6JurgLZ1PAqrrgKx4yFvjhNxbVjC3Is77hGgfK9ai+UAhbP9IrXD?=
 =?us-ascii?Q?oLu/sfO0DJQw0uiXJ1HT4iN0PZdqxANncIua5uZeKfI1XEO7Anl8Nf49dI0X?=
 =?us-ascii?Q?pw6nO1KpH6HLRFQKlRQ4zzinWFcDr93rAoEjbSOF0ARWjPYWXpp0RPVdqEnW?=
 =?us-ascii?Q?DaTau35KQGyFX0FwStB4ZA3OgTmVCiqsUGTOr1MBMOCIF590X6XktePeqJ+C?=
 =?us-ascii?Q?QTpOxy+g8gdZgUTC6fYZUfFlVWlewUnf2p3eqfSoRZebnbt+EJYGLY0nIzZt?=
 =?us-ascii?Q?4YJ0aEok5JAZZ5IGR5k2c09efCAapLuZIC9QwjzfBj4PfstAQLB0g64W3J6w?=
 =?us-ascii?Q?aU6VzrUiwEDGuN9UgURObvS98k3dEZa8GvjUme7GD+/4hKZKarghHj2SwHog?=
 =?us-ascii?Q?dTTCAU0z7J4oshjFulozfwhbxukzS4OcpzKgYgvmKyx4GFNNBn3MT5kuehBa?=
 =?us-ascii?Q?xXn5RTJeIaJXlnj2Ja2BJ8oea9Ao8k1ohedzPzfTb1emPFM/ZdkSxak/q5zi?=
 =?us-ascii?Q?me0eupS50EMkWc3Bs/eokN7i/hKwYbCX6pLbMw2AqzmMsdUVQoiMoSqHx/Tk?=
 =?us-ascii?Q?5WdA4SNiFFqE9GjTJuUSmjGaTzOSkgMWZr386PZhWJtOzyyHQClGthMN436E?=
 =?us-ascii?Q?iaZihoXS1f/PsHtH8x997t1toFTPdhAtmLQTR4dBaMcBxLf3qSHdsrPhHA9k?=
 =?us-ascii?Q?Ahv5RaiKZ8Pz0TAV5mmU4dDi3pZy8YO881DQL1JxNKKRWQvPJJoJEfvsmnjH?=
 =?us-ascii?Q?w/7NPELpH6HERjcGio3Eitu0n/3iC/Mwwl7Ya8+IU5Ou60g3YE4TMCv2Ej4B?=
 =?us-ascii?Q?cpkYdKl2kMWHRF7lP+mTtrCB0vjXOFbNGCmHayKEcz7mp30Mm2INxxQL7fpY?=
 =?us-ascii?Q?0Qrz9pSxhAUTuXfVzADq3zLLR/EHAXbBUVzEIXPqbV+shnTyb7hd+NLgNHPi?=
 =?us-ascii?Q?98HsVUgC5ZatJ+hCUUFghdWr?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd37f502-ab0a-442f-9aa9-08d9151cb78e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2021 08:05:33.0171
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6SWEqqw7UwNQIMjSDTSHz3VN1YIFs9cnrgRX8TvhfqXzEXe4Li7xxMF3uIwHceZ7t+QmH/umJ74RX7dOtA3SB8AlL1Y/uw3g7PRsgvWDohk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR01MB5193
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Robert P. J. Day via
> lists.openembedded.org
> Sent: 07 May 2021 15:12
> To: OE Core mailing list <openembedded-core@lists.openembedded.org>
> Subject: [OE-core] SDK question: does "-c populate_sdk" build SDK based o=
n
> entire image?
>=20
>=20
>   almost certainly a silly question as i'm still poring over the
> mechanics of standard SDK creation, but if i define a perfectly normal
> image, then build the corresponding SDK with:
>=20
>   $ bitbake -c populate_sdk my_image
>=20
> is the resulting SDK populated based on the entire contents of the
> target image? that is, if i subsequently add a new package to the
> target and rebuild the SDK, will the new SDK now contain the
> corresponding content from that newly-added package? (i'm just about
> to test this with a build but that's going to take over an hour on
> this server. *sigh* ...)

We use the SDK a lot to give application developers an easy to use a dev en=
vironment which has all the support to build against the libraries included=
 in target images. The SDK of an image recipe will contain all the *-dev pa=
ckages matching the packages installed in the target for the same image (i.=
e. if foobar is installed in the target image then foobar-dev is installed =
in the SDK image, if it exists).

>=20
>   now, i realize that if i just want to add content to the SDK without
> adding to target, i can use one or both of:
>=20
>   TOOLCHAIN_HOST_TASK
>   TOOLCHAIN_TARGET_TASK
>=20
> but if someone asks for new content both for the target and the SDK,
> is it sufficient to just add to target?

Yes, with the exception of recipes for which only the headers are used when=
 compiling a recipe that is included in the target image. As no library is =
being linked for it then no package is installed into the target, so no cor=
responding *-dev package is included in the SDK. A typical example of this =
is boost when the header-only boost libs are used (and I suspect the same h=
appens for static libs). In such a case you can add the recipes to TOOLCHAI=
N_TARGET_TASK (we actually have an sdk packagegroup that we add to TOOLCHAI=
N_TARGET_TASK that pulls in all target SDK things that we want in the SDK b=
ut not in the target image).

Other things that you may need to add manually to TOOLCHAIN_HOST_TASK are s=
upporting tools to run on the build host which are not included in the SDK =
by default, like nativesdk-glib-2.0-codegen to get the gdbus-codegen utilit=
y.

>=20
>   and one more question that inspired all of this. i was asked to add
> a particular executable to an SDK, call it /usr/bin/fubar. fair
> enough, i thought, it was short work to determine that that binary
> came from the recipe fubar_1.0.bb. but i checked and that package was,
> in fact, being installed in the target, so i was puzzled as to why it
> wasn't in the SDK as well.
>=20
>   i checked the recipe for fubar and, to my chagrin, it contained the
> snippet:
>=20
>   do_install_append() {
>     rm -rf ${D}/usr/bin/fubar
>   }
>=20
> well, that explained it, so as a first test, i'm just going to dump
> that snippet from the recipe, which will install the executable on the
> target, and will(?) also install it in the SDK?
>=20
> rday
--=20
Diego Santa Cruz, PhD
Technology Architect
spinetix.com


