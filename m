Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FD40CD1292
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 17:26:05 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.90])
 by mx.groups.io with SMTP id smtpd.web11.44654.1712251555956188774
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Apr 2024 10:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=iqHvXbZE;
 spf=pass (domain: axis.com, ip: 40.107.8.90, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LdM1F4oUx37fkUkKg9Pt0WSR8xAe82h7uDz94Uz1FMz8Z2YEZ8HOtMVqAfg3yMXE3+4INaywkAYW2vJL7YdMHGf9tVMRlOSc9e6xEXZ3lX6fc8kdBOMp8Lx1qb37OwSNIr5bIWNTInDOG5aKjDQhh5Gx8LzktTLY951vHVIOdNJvzgjeZRBszWvHWlcowWHsVv1ExpMCDq6CE3nJmuwe9uWXCF7Y43IhZ9ael3sHIutU2tPfsc5sFflTHU7CYBBpG4vJ0vTi6YXwIJC2IYtaaambHMuWlrzfsafl2tYymY4nxP5SmuM+jWH/7p/jlz44WfIV9PqXmkcq5ZFEzj1Srw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLosRUiRFXkweYdNEKKqdyBEsBOfT/zQYHczMLbDx0A=;
 b=dUxSNfRemm6MuIODW1wWNnZxWZamuKx9GqMsiF3+R5xdaYded1u49koyJvZzV5KkluqDQL1Al9zgZ37AAJn6CMdPMW8at8ImMH8p7+TF89YfoUrLpa7lMyHDsHE+swNwg5Wr42S8zTDzArS8lT9ZlR+o15sX1uxyRLBGHlp4ixnkGlGvZCUzpqLnLsLYfsPfWRqRFYaK+G6/hB2ni1XHvNz+iKiV37FhN1HoBjrBuMSP47QT188sK/2P81gO5tS9T1bvEMSyQg1EBJ1COddQkSYwYCXj+URE4FtbPent+KiwOZkUOlitxd6u5YGoMyuTJ9hfcyf3jy6ekcjikXmfsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLosRUiRFXkweYdNEKKqdyBEsBOfT/zQYHczMLbDx0A=;
 b=iqHvXbZELHTAqRQaArj+KVkoBV5EKecQ352nyB0k3zTZRFeRSWr3+4fOpPHkM5yhxjpLomeVe8RQA3XuOkEtq8yiYOzk8s6Ve7G74NzH1yjuTqLDrpcSQtlguv5Xy6TgzxtmkT0T993CgKgbccWouci1Uxtd28vPxRQXNm3hZsQ=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AM7PR02MB6449.eurprd02.prod.outlook.com (2603:10a6:20b:1bb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 17:25:52 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::fa03:deff:aae:c4d0]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::fa03:deff:aae:c4d0%7]) with mapi id 15.20.7409.042; Thu, 4 Apr 2024
 17:25:52 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] util-linux: Set the license for
 util-linux-fcntl-lock to MIT
Thread-Topic: [OE-core] [PATCH] util-linux: Set the license for
 util-linux-fcntl-lock to MIT
Thread-Index: AQHahiDylEBkE+XUNkuhELS64xkvk7FYW4qg
Date: Thu, 4 Apr 2024 17:25:52 +0000
Message-ID: 
 <DB5PR02MB10213CCA7CB746291E72C4A07EF3C2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240402045654.3717582-1-pkj@axis.com>
 <2024040323445722e2c297@mail.local>
In-Reply-To: <2024040323445722e2c297@mail.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AM7PR02MB6449:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 4HWjYyIbKwY4YTtxvsNj/qPOAIA7AmRtPCO51bmJIv6+1R9KMBfrgBmDBodh2pAsAuylmAEW90Uz7OZIbu5wbFlumVikSR5Vm1Kzt7X0Z16m3yVz4JzI9Il8PX8GKbFJBNjIP7mg+x8qom15eFUW5ZPlSMwbV3+jJV6QR8btHkc/WtgmKfroXch93ROfEvixjLWtXPLo6RNuDhyITCy++qx6/JY/Mdlgn3mA7Otf3GHim3cPXSNwgm4wn4+8Xo5wMnIKXQjxrAGyC4I3ZGAbBZhIWuMQ4rdbRoWzMjI7CrH30DFo2Y12NHo8jJ39LROpP2l7LnQ1vQRj1ceY5rQEDWT47Eo25B282t4it7I8KKwJuFio79nztv5ZI1ZCfOo5RLOLnzyPMC+pDpnOxh45Q5Asbu/1IonOyrDb1wBXSJa8iJWBU1q69U6hgO3Xx4aAS4CY/upAmxtqSvfO4obKdCoc54mWp6SWz14VD3tgyFRevkLRMYPY1qI37YYJeVPfXr3OlUMFhIUe788s5GgyMqtOthrTcPUZcy6s5Lwx4NCHweZL/t23UBuMmxZIFtm3wAK1zO4LytNtEcS2yfimjf4zzD8z2IrDRF+G9ihf+GQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?yG7QSVXomvUU0UFiXtv+9hx8zF6fRWf8gZQfHmaWksH0SJIBAFmTI8jMucB0?=
 =?us-ascii?Q?L0sG2/xPgyp/FWLeZTFZ2i7sux4xSEt1Q5VPvA30MEZ3XCfgv8mlyvwLxo0F?=
 =?us-ascii?Q?VQhq/HuqJcF8WTpIYGLu9/4NoxwUw8rEonlHzkohhipAEr1UJhfpeJu9LgFC?=
 =?us-ascii?Q?ZeJ1lWVepS/qb4VLBjsDHyLHTfcBAF7q0b8/4tvCDWmqq1hiZczXSZd5R8vI?=
 =?us-ascii?Q?UqXOjUoHWKjpxGuZvsisP9AePNvfUG0pc89F3mH9xKX8c2p9+p2C4U3RXtFp?=
 =?us-ascii?Q?Q5GwGBjnLpiIEOdQZCc8AvF6ENMKPzOSNdXnqLv+WYVsTi34TF3zHdjX92X4?=
 =?us-ascii?Q?Au+p0zJyW1wQjnNmmyAZFbRTiEjzNDzjvGQSwmfLggZPATa7RlguYbS30H9k?=
 =?us-ascii?Q?zkw4KD1jijc9B7zOQLpa8g/VBjkbvoA2N+QWr+X5kkfu3uBkk16vkTnFguIj?=
 =?us-ascii?Q?Er2EFAvoBFIAZlWOP1WbX+ywxEXNGiXQ0R+7PlSXOSrV3hhfjzPKqP9kI7m0?=
 =?us-ascii?Q?YwOGs6oZAdan7P8vuWwhtfgVIvAVUq0ufHjAe1eOLUS9rLVETsloiRnsBi/S?=
 =?us-ascii?Q?q8/TDn3g+YqRh1f04mzVGTPTuBOxsvTWEaZP9KNvpOdzrrqbQeoDdWBao9gZ?=
 =?us-ascii?Q?rikpoJw0ICxNPX11HJCEOmnsQMbzTdIW02l1ewEiOEdwxZ1KtS3jA+uJonFI?=
 =?us-ascii?Q?ZBvMe22giuiBG/hmqzUgw8sy5FSDxAgdkj/UwCtMJzEXrt8rXl65fd+rvfOn?=
 =?us-ascii?Q?V4P4P1ZHCnM0ayoWE7ueGJZcw43wSjGli0g6pxi3VidVLede5cy85m7NjMt6?=
 =?us-ascii?Q?85RhvBQD6m6aV22bKOJXhh+F7J9Kh4YJH53uJuy6Ih+KxCI8PNNavFuiRurY?=
 =?us-ascii?Q?TV7cs5stcY9HMw0LF9GZMIQrI8glAoFCbzHrTU45TxPb9ZbE2DGZvFvfynUR?=
 =?us-ascii?Q?VLmYlVvJgSzNQ2QL/XNg23WVNzIMidXwbQ9wkcrisElDSoSqeMJYez2AhLSM?=
 =?us-ascii?Q?S06GU87/rCZ0IsczKvk2xFRoWYCH/OU2PZb6SzQEHtXI7tfxH69iZmgwmfyi?=
 =?us-ascii?Q?wuCLwobvgMXQ/aw7Gqu3SIlM1bbpEi0RfmXHn3VHmzetHkHQTVF3D5FApikc?=
 =?us-ascii?Q?kulN0K99zJaa+77f4kmtQa9Qfl3c9IZKK7tmeVJEo2h/8TCZrNq0CYdTNZPC?=
 =?us-ascii?Q?7w9TQUVopMpLeSvDiybrVwDEwwrCh0lDccpe2CigN6xxbHJZ+5tQ+SfwYaGu?=
 =?us-ascii?Q?Dt50mjcZHF5+hjYeHVZ3EsNc18LaTaBz+VyCLRqWX5gawWO86KQePy4gZK7K?=
 =?us-ascii?Q?HcHLQ4JW71KJu5DtRf5PkU0uxZTrBlgCqw5rGEk3j3FuX11UQCJ2N0vIb+iA?=
 =?us-ascii?Q?ApSujvr/EgIZMgks9zuBhnqAZHU3S0cDxj0jdwdWBhKYR5bTnD6K2lN8gx+w?=
 =?us-ascii?Q?820pgr38id33DEzwHwxNpAl/nNNC05H1rpnQhTMLe2CtpBWr960lXRVIOxFV?=
 =?us-ascii?Q?T8o4ucSkqopobbtc9jIeXo3nI2iut6jU2C9OGjTrTX2xhFtCXBu8cZKhsVIu?=
 =?us-ascii?Q?+KDGRFgMCoKFbcYB6tA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 525e76fc-ec28-4888-5063-08dc54cc46fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2024 17:25:52.0290
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p1XNoltnLwwH3G4lF4QyXq0QG5/9bp82/0lLlDHh5Yb7smXbud3oGp24iiktWonc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6449
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 17:26:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197969

> -----Original Message-----
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Sent: den 4 april 2024 01:45
> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] util-linux: Set the license for util-linux=
-fcntl-lock to MIT
>=20
> Hello,
>=20
> This caused:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4604/s=
teps/12/logs/stdio
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20240403-u_hy=
p_wv/packages/diff-html/

Doesn't this type of breakage happen all the time for pure recipe=20
changes that affect the output if the PR server is not enabled?

>=20
> I guess we need to bump PR?

Given that RP removed all PR variables from the recipes in OE-Core (see=20
commit d4c346e8ab8f3cae25d1b01c7331ed9f6d4f96ef), I would expect that he=20
is not too keen to see them coming back...

//Peter

>=20
> On 02/04/2024 06:56:54+0200, Peter Kjellerstedt wrote:
> > This avoids problems if BSD-4-Clause is in INCOMPATIBLE_LICENSE since
> > util-linux-fcntl-lock is now a dependency of run-postinsts.
> >
> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > ---
> >  meta/recipes-core/util-linux/util-linux.inc | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes=
-core/util-linux/util-linux.inc
> > index f4b547215e..d506783f9a 100644
> > --- a/meta/recipes-core/util-linux/util-linux.inc
> > +++ b/meta/recipes-core/util-linux/util-linux.inc
> > @@ -7,6 +7,7 @@ disk partitioning, kernel message management, filesyste=
m creation, and system lo
> >  SECTION =3D "base"
> >
> >  LICENSE =3D "GPL-1.0-or-later & GPL-2.0-or-later & LGPL-2.1-or-later &=
 BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & MIT"
> > +LICENSE:${PN}-fcntl-lock =3D "MIT"
> >  LICENSE:${PN}-fdisk =3D "GPL-1.0-or-later"
> >  LICENSE:${PN}-libblkid =3D "LGPL-2.1-or-later"
> >  LICENSE:${PN}-libfdisk =3D "LGPL-2.1-or-later"


