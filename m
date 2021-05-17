Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.115])
 by mx.groups.io with SMTP id smtpd.web11.15830.1621237221547979674
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 00:40:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nobleogroup.onmicrosoft.com header.s=selector2-nobleogroup-onmicrosoft-com header.b=UkmoQJNn;
 spf=pass (domain: nobleo.nl, ip: 40.107.20.115, mailfrom: ishu.goel@nobleo.nl)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PuU3vlqTEcSYvhXAGpw0fw1868Da5etyY82unWzdUXmQEQzx8VJSZf5FmvMJQGgGDlaQ5kSJOv6aZbXZtGsqjGz+4vm8yqbqevs9DeoDQ2DY1i52/1D6VnsHc6323kO59HBMSPs7YzV6q2FG3xzccMaOcPeSYUymnVgHv69zmJBEPecrnAi1j9v4zBiahO8lKLna7++rKqHVJSOs4xSUyYQ3kNWUWzn+o3hbP8oR+bmX0lNeycxQqz/wCGt88dStL2iAtnYN7lDON8t1zo6OzL3KACZdCjJ8EEZhqOTS/k0cxyoOhIT/h/JIOgn60TR4Nb55QxTJlbt3YUDRQlS0vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9xBfd8aGyU4kSQixapbsWcxR0sdTPYXdmgYZIXLXyA=;
 b=mgcPAaRH2SCXkT3HS17JL/+6iG2dMJ15UTum6AUKrfnPy9ayabMHCu3PuBUV0hHqwRC7ZGTQi9lMjcoFMQT1RMA2JWisIJV2GsacxghmjuEC57yx62zoXt2TKZzM19MNNdfbRn0I2909JxKYC5lx27rKcW8q7mA2trODXgLk6oPgLVII/UwPTYhSjToN4WuGDaKuFtLWaCJ4sP0+lcnZbPAiCQXs3jVCsyXMzmUrx+9PAoRKeGSyJN2WK7KJwWD3c3aXsrmrPkCGfSI3RoL6VHuXlocUAEctrnfhGEVVMZ/+l0Pci8ZbBFKYRoeypp8hlosdWuxtf9TE++aMajKiyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nobleo.nl; dmarc=pass action=none header.from=nobleo.nl;
 dkim=pass header.d=nobleo.nl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nobleogroup.onmicrosoft.com; s=selector2-nobleogroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9xBfd8aGyU4kSQixapbsWcxR0sdTPYXdmgYZIXLXyA=;
 b=UkmoQJNnt98L2hCkydMk9zit1u6emoz3SKHqgPX49sDdawVUilM6pOOiwqYnNLZm6dFJjtQ9jpQwRbgjew7bjnsJBAmCr/awswzObh0UZ1HY2Dp1kzmt9c0TGmfFzoK2g0VqbsvB7f3udLSYin/AsSluDuaCSSCweD/4j2kClO0=
Received: from AM0PR0402MB3475.eurprd04.prod.outlook.com
 (2603:10a6:208:1a::32) by AM0PR04MB5764.eurprd04.prod.outlook.com
 (2603:10a6:208:12f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Mon, 17 May
 2021 07:40:17 +0000
Received: from AM0PR0402MB3475.eurprd04.prod.outlook.com
 ([fe80::90dc:ba1c:5749:ef8]) by AM0PR0402MB3475.eurprd04.prod.outlook.com
 ([fe80::90dc:ba1c:5749:ef8%6]) with mapi id 15.20.4065.042; Mon, 17 May 2021
 07:40:17 +0000
From: "Ishu Goel" <ishu.goel@nobleo.nl>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Ishu Goel <ishu.goel@nobleo.nl>
Subject: Re: [OE-core] CMake fails with yocto
Thread-Topic: [OE-core] CMake fails with yocto
Thread-Index: AQHXQZCusR9Qi8OP9kS3uG6FeMtIy6rVSXKAgAFEfxqAEM4GWA==
Date: Mon, 17 May 2021 07:40:17 +0000
Message-ID: 
 <AM0PR0402MB3475153B898E2AD60EF78D77FB2D9@AM0PR0402MB3475.eurprd04.prod.outlook.com>
References: 
 <AM0PR0402MB3475803C5E790CA079CE2B35FB599@AM0PR0402MB3475.eurprd04.prod.outlook.com>,<7ccf3572-30b8-c6b6-9785-92766844aa6d@gmail.com>,<167C824F33296DA6.28455@lists.openembedded.org>
In-Reply-To: <167C824F33296DA6.28455@lists.openembedded.org>
Accept-Language: en-US, nl-NL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nobleo.nl;
x-originating-ip: [94.190.201.89]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 61e1dc60-99cf-4053-6a0c-08d91907043c
x-ms-traffictypediagnostic: AM0PR04MB5764:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM0PR04MB5764FE76F146867ED3EC504AFB2D9@AM0PR04MB5764.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 uzkt0yJcCtkpJ8rqND7OIyBCY8jNA6XasAo8+/L3h4XCPcj5Yp4Tr1ICXCsDK4ct9LQJyF7Tz+ez/btjOTtJzXftWJd6Zbdl83GM2nFuWU7D9K+S3kHRDzCWNQo/JOkDSygu7/O7gzRmfQg5GQHvMjVLa5gSScWLLVbJOFKh73NmUkkbHxvQJxvjKdPL6kMKrTMFzj7UBaGmPIGmB5m6NnTecX2Osn/61anxVDhujPnkKM0+DY+AIAhv/hxvMvTwnPg/HpWT8sBemxtgREsq7Qvu+7N0wqwMRgsbXOHHEfkuzv702Iu9Sf3En6o5lkeh/Rl0Hsw6/iQmK6v/o37DGJy4Wkv/tBsn3RnncQALZNbmoi1rx/a+gh4T2m5U9zaDZC2AEqg7RkVAzbgXBvEyDMzYc1bgWfUS4n76bxbX8VY8ks6t+hP5Fxv4pA8I08a3R+kXi9RojZKzXG2uA6ew/2cDNDS5iIEQUFlKij8aS7t6STX0G/uJzGM8wDyifUVKNhOaw8hDUdiJtBKtLPc4V+cFxzYSeRIs3SaLtGnpO/3jTuZnKkUMhBDIn2e4nEaZ7glakgpfvl7HdKooMit3IKDYryuIkm9Fr7BmKBokJblNG2I5KtxApVGIFOepaemDSRfW9Z68oyPXSV6pGQonGhvIKw+2ziOUWiBqy3+SGL4RG+v/4tI2I4ohmI2DZbNc
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3475.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(366004)(346002)(376002)(136003)(396003)(186003)(71200400001)(110136005)(44832011)(52536014)(55016002)(19627405001)(966005)(33656002)(66476007)(64756008)(66446008)(66556008)(26005)(53546011)(6506007)(86362001)(83380400001)(166002)(7696005)(5660300002)(8936002)(478600001)(66946007)(76116006)(2906002)(122000001)(9686003)(38100700002)(8676002)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?Z36FhUh+Sov6pklEWFHBeGLkcGjUNyO08AiBdGvvRae8lTloNsP4PIOi0qeQ?=
 =?us-ascii?Q?6l0oZ7jCrIDA5Fwv1ist94tSX308P6aGFIG17o0PQ3G/OkMAtEx0xrSegdmH?=
 =?us-ascii?Q?yDUjdlxfHLB3jxmXv5/QBXWbPyfvLR86z3bQn5MohGnR7XcVbBv0DfRAsla2?=
 =?us-ascii?Q?vp9EioCMC9HpiEibiP1vGAFcUk6pOn4SAG78YZfsNWeU/BdQ3TmonD2yjv25?=
 =?us-ascii?Q?Qlra87wND9zrWqZmWl/9oW2mWo+VDLwi+kXHBSQqJa6GT4Ze/xhqvO770pOm?=
 =?us-ascii?Q?KwWjwYcD6y6Jz3AKFG6ZkCOfXwJD4HeJsAyUJ9ptHepQqR4ItJzOnfji//Zr?=
 =?us-ascii?Q?Z3PJAI0cCHZbidUnpkTMRBrrA5dBf7ei1aTpSf1GB9V5ifE11/tWNGgnU4Hl?=
 =?us-ascii?Q?aulmKYjr/6qLe7B2EtlE9u56LonLF/IyB5orr5Zie9Sb6Wr0DKvjTT+G/Yka?=
 =?us-ascii?Q?ZVzRv/xPLbt++g1WufJSslbwX6/KqX75tq05e/X0ehe8BBQvMTs6P6+cK2QO?=
 =?us-ascii?Q?FYKDqtM6zxQ2D1ikH4LxfYNccqZPJUYE62Yj/MU8r8ZyFKdHzhWpl4Gi8ByA?=
 =?us-ascii?Q?iC6temstk8BgE7e4FTqPO1KGWO7GVcDzPVMZdWnmuTesU5UQZ3yDUHpptmDK?=
 =?us-ascii?Q?fL7J98nf6NeqAM4yMmRzxQVZT+sJhSlN/PAZDCoynVeWCGzjCxLIAHPimnlY?=
 =?us-ascii?Q?+op8dO25OzYDdLnXzuKQ8ocdGrV/EcAc6X6WkMlkA8FJBgn0qDS5qL0JYL2o?=
 =?us-ascii?Q?TcOC/A2sns1JwnAA5veD60Jyn8sn1sJXc3ibPy0/C/xxBzEHHbR5N1437lmi?=
 =?us-ascii?Q?QptSi8KGCzVFJS5SHgGEns5Ze1H/MqEvZQ7hvvczjplv86McFnrsKB955twZ?=
 =?us-ascii?Q?EdvqBwYIXzJcXUALkEw6TaF30czDYvg/bjPTC618zdxXxB1oNEDf5V9h5igq?=
 =?us-ascii?Q?pIXwwTA2FgenvLAFcvSGl/UYY/QPqlvxg0L+4sb7oIs7ZyDWKdEmZfzSPoaW?=
 =?us-ascii?Q?iPkyRget6Nm0iugfL4QNzdnEn2LB6VDdePtSm9VidpU8W4WKwwDGzUZCV1tU?=
 =?us-ascii?Q?JEv8IHkzsivqbvLhwtcY4EQ69EJTokwIu8TkQfD2cI8B1RiAU9TP933c4cdk?=
 =?us-ascii?Q?B5CCw+iOZoly2k3n3ME7eWyRom3Ji3jBoJrtQmNpzxSapZTLcZViBAEy1IPz?=
 =?us-ascii?Q?g7uFn1BcukfW19Wfga5ie0bHiQcSuL8M2yKMg33JQEFEoMMh8KcPlwaflfCL?=
 =?us-ascii?Q?kBC4Nq5VRx3UOxt+Qvnhdoj49w5Ngf5QuYBLy4Mo9ldw0HtwJNkVvBKx2zKH?=
 =?us-ascii?Q?1/s=3D?=
MIME-Version: 1.0
X-OriginatorOrg: nobleo.nl
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3475.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e1dc60-99cf-4053-6a0c-08d91907043c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2021 07:40:17.4990
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d354334-64ad-4352-9b8b-cf80e736aa70
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TJCkA/adl12D7e8e+D9EjIvxDPZ1sYSVebqNSqwbZymku5+l5GyvVVld6cTc9Pv9A6dcDMIeWN7ANk58vSQXVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5764
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AM0PR0402MB3475153B898E2AD60EF78D77FB2D9AM0PR0402MB3475_"

--_000_AM0PR0402MB3475153B898E2AD60EF78D77FB2D9AM0PR0402MB3475_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I am still struggling with the same problem. Any leads or suggestions will =
be helpful.

With regards,
Ishu
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Ishu Goel via lists.openembedded.org <ishu.goel=
=3Dnobleo.nl@lists.openembedded.org>
Sent: Thursday, May 6, 2021 17:00
To: Khem Raj <raj.khem@gmail.com>; openembedded-core@lists.openembedded.org=
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] CMake fails with yocto

Hello Khem,

Thank you for looking into this issue. Below is the content of pseudo.log f=
ile as asked by you.

debug_logfile: fd 2
pid 453 [parent 452], doing new pid setup and server start
Setup complete, sending SIGUSR1 to pid 452.
db cleanup for server shutdown, 08:07:22.373
memory-to-file backup complete, 08:07:22.373.
db cleanup finished, 08:07:22.373
debug_logfile: fd 2
pid 869 [parent 868], doing new pid setup and server start
Setup complete, sending SIGUSR1 to pid 868.
path mismatch [3 links]: ino 3169066 db '/home/developer/work/build/tmp-gli=
bc/work/cortexa72-oe-linux/hellocmake/1.0-r0/package/usr/src/debug/hellocma=
ke/1.0-r0/hellocmake.cpp' req '/home/developer/work/build/tmp-glibc/work/co=
rtexa72-oe-linux/hellocmake/1.0-r0/hellocmake.cpp'.

The problem seems to be 'path mismatch' but I do not know why that occurs? =
Not sure if helpful, I am using bitbake version 1.48 and CMake version 3.13=
.1. Please help me in finding out what is wrong?

With regards,
Ishu
________________________________
From: Khem Raj <raj.khem@gmail.com>
Sent: Wednesday, May 5, 2021 21:38
To: Ishu Goel <ishu.goel@nobleo.nl>; openembedded-core@lists.openembedded.o=
rg <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] CMake fails with yocto



On 5/5/21 2:26 AM, Ishu Goel wrote:
> Hello,
>
> I am using CMake with Yocto and working on the hellocmake example
> provided here:
> https://github.com/joaocfernandes/Learn-Yocto/blob/master/develop/Recipe-=
CMake.md
> When I bake the hellocmake recipe it builds perfectly the first time.
> But when I make any change in the source file 'hellocmake.cpp' and bake,
> I get the following error:
>
> ERROR: hellocmake-1.0-r0 do_install: Execution of
> '/home/developer/work/build/tmp-glibc/work/cortexa72-oe-linux/hellocmake/=
1.0-r0/temp/run.do_install.147'
> failed with exit code 1:
> abort()ing pseudo client by server request. See
> https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this.
> Check logfile:
> /home/developer/work/build/tmp-glibc/work/cortexa72-oe-linux/hellocmake/1=
.0-r0/pseudo//pseudo.log
> Child aborted
> CMake Error: Generator: execution of make failed. Make command was:
> ninja -v -j 4 install &&
> WARNING: exit code 1 from a shell command.
>
> ERROR: Logfile of failure stored in:
> /home/developer/work/build/tmp-glibc/work/cortexa72-oe-linux/hellocmake/1=
.0-r0/temp/log.do_install.147
>
>
> I want to know what I am doing wrong? I noticed that if I clean the
> previous build of hellocmake, I do not get this error. How can I make
> sure that CMake works every time with yocto?
>

you perhaps are not doing anything wrong. pseudo is a tool used by yocto
underneath and its bailing out for some reason. maybe you can share the
pseudo.log file and it might have more details.

> With regards,
>
> *Ishu Goel*
> Software Designer
>
> Nobleo Technology BV
>
> Heggeranklaan 1
>
> 5643BP Eindhoven
>
>
> *E *ishu.goel@nobleo.nl**
>
> *I**www.nobleo.nl <http://www.nobleo.nl/>*
>
>
>
>
>

--_000_AM0PR0402MB3475153B898E2AD60EF78D77FB2D9AM0PR0402MB3475_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hello,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I am still struggling with the same problem. Any leads or suggestions will =
be helpful.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
With regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Ishu <br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Ishu Goel via lists.openembedded.org &lt;ishu.goel=3Dnobleo.nl@lists=
.openembedded.org&gt;<br>
<b>Sent:</b> Thursday, May 6, 2021 17:00<br>
<b>To:</b> Khem Raj &lt;raj.khem@gmail.com&gt;; openembedded-core@lists.ope=
nembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] CMake fails with yocto</font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Hello Khem,<br>
<br>
Thank you for looking into this issue. Below is the content of pseudo.log f=
ile as asked by you.
<br>
<br>
debug_logfile: fd 2<br>
pid 453 [parent 452], doing new pid setup and server start<br>
Setup complete, sending SIGUSR1 to pid 452.<br>
db cleanup for server shutdown, 08:07:22.373<br>
memory-to-file backup complete, 08:07:22.373.<br>
db cleanup finished, 08:07:22.373<br>
debug_logfile: fd 2<br>
pid 869 [parent 868], doing new pid setup and server start<br>
Setup complete, sending SIGUSR1 to pid 868.<br>
path mismatch [3 links]: ino 3169066 db '/home/developer/work/build/tmp-gli=
bc/work/cortexa72-oe-linux/hellocmake/1.0-r0/package/usr/src/debug/hellocma=
ke/1.0-r0/hellocmake.cpp' req '/home/developer/work/build/tmp-glibc/work/co=
rtexa72-oe-linux/hellocmake/1.0-r0/hellocmake.cpp'.<br>
<br>
The problem seems to be 'path mismatch' but I do not know why that occurs? =
Not sure if helpful, I am using bitbake version 1.48 and CMake version 3.13=
.1. Please help me in finding out what is wrong?</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
With regards,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Ishu<br>
</div>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Khem Raj &lt;raj.kh=
em@gmail.com&gt;<br>
<b>Sent:</b> Wednesday, May 5, 2021 21:38<br>
<b>To:</b> Ishu Goel &lt;ishu.goel@nobleo.nl&gt;; openembedded-core@lists.o=
penembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] CMake fails with yocto</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText"><br>
<br>
On 5/5/21 2:26 AM, Ishu Goel wrote:<br>
&gt; Hello,<br>
&gt; <br>
&gt; I am using CMake with Yocto and working on the hellocmake example <br>
&gt; provided here: <br>
&gt; <a href=3D"https://github.com/joaocfernandes/Learn-Yocto/blob/master/d=
evelop/Recipe-CMake.md">
https://github.com/joaocfernandes/Learn-Yocto/blob/master/develop/Recipe-CM=
ake.md</a><br>
&gt; When I bake the hellocmake recipe it builds perfectly the first time. =
<br>
&gt; But when I make any change in the source file 'hellocmake.cpp' and bak=
e, <br>
&gt; I get the following error:<br>
&gt; <br>
&gt; ERROR: hellocmake-1.0-r0 do_install: Execution of <br>
&gt; '/home/developer/work/build/tmp-glibc/work/cortexa72-oe-linux/hellocma=
ke/1.0-r0/temp/run.do_install.147'
<br>
&gt; failed with exit code 1:<br>
&gt; abort()ing pseudo client by server request. See <br>
&gt; <a href=3D"https://wiki.yoctoproject.org/wiki/Pseudo_Abort">https://wi=
ki.yoctoproject.org/wiki/Pseudo_Abort</a> for more details on this.<br>
&gt; Check logfile: <br>
&gt; /home/developer/work/build/tmp-glibc/work/cortexa72-oe-linux/hellocmak=
e/1.0-r0/pseudo//pseudo.log<br>
&gt; Child aborted<br>
&gt; CMake Error: Generator: execution of make failed. Make command was: <b=
r>
&gt; ninja -v -j 4 install &amp;&amp;<br>
&gt; WARNING: exit code 1 from a shell command.<br>
&gt; <br>
&gt; ERROR: Logfile of failure stored in: <br>
&gt; /home/developer/work/build/tmp-glibc/work/cortexa72-oe-linux/hellocmak=
e/1.0-r0/temp/log.do_install.147<br>
&gt; <br>
&gt; <br>
&gt; I want to know what I am doing wrong? I noticed that if I clean the <b=
r>
&gt; previous build of hellocmake, I do not get this error. How can I make =
<br>
&gt; sure that CMake works every time with yocto?<br>
&gt; <br>
<br>
you perhaps are not doing anything wrong. pseudo is a tool used by yocto <b=
r>
underneath and its bailing out for some reason. maybe you can share the <br=
>
pseudo.log file and it might have more details.<br>
<br>
&gt; With regards,<br>
&gt; <br>
&gt; *Ishu Goel*<br>
&gt; Software Designer<br>
&gt; <br>
&gt; Nobleo Technology BV<br>
&gt; <br>
&gt; Heggeranklaan 1<br>
&gt; <br>
&gt; 5643BP Eindhoven<br>
&gt; <br>
&gt; <br>
&gt; *E *ishu.goel@nobleo.nl**<br>
&gt; <br>
&gt; *I**www.nobleo.nl &lt;<a href=3D"http://www.nobleo.nl/">http://www.nob=
leo.nl/</a>&gt;*<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_AM0PR0402MB3475153B898E2AD60EF78D77FB2D9AM0PR0402MB3475_--
