Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.138])
 by mx.groups.io with SMTP id smtpd.web12.520.1620313240794459614
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 May 2021 08:00:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nobleogroup.onmicrosoft.com header.s=selector2-nobleogroup-onmicrosoft-com header.b=DW7LA4SA;
 spf=pass (domain: nobleo.nl, ip: 40.107.13.138, mailfrom: ishu.goel@nobleo.nl)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WaQzkEfeCfGo0V7FXKDZqicZabVvXE9RrqzyK4fFYwU/eZzg94PbdG0OBz2UKcfW113LLBg9sXMtrNM1aox7T+/zpq+fsjNLfZi+B7ZofhMOCFAMDE4vN/ZQkx8EQyOI0Ib2cu7ayUs9Vu77X4lgHhp0lFGkZBgtQvzu4RjWNuvrNSE8dJ/v4OnDN6TuYODmRGmCGrbGd9zyCeqeb7Na08S+BdVVMelX32DUoVDMSpBNs5oCl2PyuFoWjImQmmCixGhghK4KlA1Gz7beid0LRSUWlYsZ0+VuiRdRTe6caqquv0X6fH0YQrKAZG5+77rvd0+SZfnArvlmy0DxvI3mUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nrhnczxOiOPIeRyrUv+SWTUTlCz2bPrrLzKcxuyvWyg=;
 b=oFrS0a9SAsmMmDnSxKcRJawMkqOE+03gYD2ZM1J7rFJu+bsGJRLxY7uOHxjVDlhSEjyfW/SdtxkPiS8rJbyP1WrKB98MnKn8YcfvauXNPkDmOH1rdSOrmZ3DrNnliHaTS9JuTHjuGglB1sj/Iq56Ur9cz2UQmNmDbUxBmiKXNCVwje++X0vmVbijUoSMqEGZ/yg3bldSRRiZBVimFzmYgTR8TwJiIyH7YhuiGDDgEAGiX3VMa/TmrazOonpJE+31JTuG3/lJ9fIyD4XfnSBv6fig7AggOkyUjlXl8LMLqyD34Onqkbqyx7QgteiOCjXdpBzC5VgwBYiMP8NzFt4qkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nobleo.nl; dmarc=pass action=none header.from=nobleo.nl;
 dkim=pass header.d=nobleo.nl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nobleogroup.onmicrosoft.com; s=selector2-nobleogroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nrhnczxOiOPIeRyrUv+SWTUTlCz2bPrrLzKcxuyvWyg=;
 b=DW7LA4SAe7lGALSOROfBBFjEPeU3L+bO/9sNWDpEOTScsqnEaTe1dAjH+iVD/rR+Ns2TfamEFr62uWIsyjIC9gbiyPGNeqwvPhxRHFoUtWNgEnQuCgqQPIXhKIsS+r02sabyaSb4XwSh/eUDc+quoAj9b+dZAslvInKED0FSISE=
Received: from AM0PR0402MB3475.eurprd04.prod.outlook.com
 (2603:10a6:208:1a::32) by AM0PR04MB6994.eurprd04.prod.outlook.com
 (2603:10a6:208:188::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.27; Thu, 6 May
 2021 15:00:38 +0000
Received: from AM0PR0402MB3475.eurprd04.prod.outlook.com
 ([fe80::90dc:ba1c:5749:ef8]) by AM0PR0402MB3475.eurprd04.prod.outlook.com
 ([fe80::90dc:ba1c:5749:ef8%6]) with mapi id 15.20.4065.039; Thu, 6 May 2021
 15:00:37 +0000
From: "Ishu Goel" <ishu.goel@nobleo.nl>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] CMake fails with yocto
Thread-Topic: [OE-core] CMake fails with yocto
Thread-Index: AQHXQZCusR9Qi8OP9kS3uG6FeMtIy6rVSXKAgAFEfxo=
Date: Thu, 6 May 2021 15:00:37 +0000
Message-ID: 
 <AM0PR0402MB3475DD2712EF800DF3BBDC02FB589@AM0PR0402MB3475.eurprd04.prod.outlook.com>
References: 
 <AM0PR0402MB3475803C5E790CA079CE2B35FB599@AM0PR0402MB3475.eurprd04.prod.outlook.com>,<7ccf3572-30b8-c6b6-9785-92766844aa6d@gmail.com>
In-Reply-To: <7ccf3572-30b8-c6b6-9785-92766844aa6d@gmail.com>
Accept-Language: en-US, nl-NL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nobleo.nl;
x-originating-ip: [94.190.201.89]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ef51e53-1563-47fa-5865-08d9109fb56f
x-ms-traffictypediagnostic: AM0PR04MB6994:
x-microsoft-antispam-prvs: 
 <AM0PR04MB699434A75B9386B0EF3D0EFBFB589@AM0PR04MB6994.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 n5NztwDo0FuCndn3BDvI2+ZHOz7C/gFu9P3NEaHEfOy70CKwHQFiou0LXkXfpuObCjU3AfEyLjYFM2j9WT5aJAXkJ7eEAed8mXbd+ZVh4joU7au8w2FX8m+vr8wPLw1X/4xvutc6EoAwQkChz1hRRtwug3Tk9AEjp4dyr4a+6NRxC3focloTp8dBlcvUe8UMyi7M2aInZOkRt+S771ODLPYNBJL7Qo+PIzQ/wS1Jo5AUXBWletLuPVkL4A27WwJOuul+Gady/fWFku5/zUjOWmO2cMqklz4/mZZBWdBMPdxv+PNpNrIOlFBodrKe/q1B5VoN23jMnY0HbBjujA5lGjollxEDrHC6jPvZxqnf8AE2+0mCWHn3LvGNM37iqE8VpSpCPnST5VS44UkwJtxF3Z1kJldJddAmt6MiXLl4nFceI2PJ1HBnuq6BjImmf79NMW62Y7CwEa4ZS7ltd8xdhIz9BRt9T6GQwlswWWgBka7sNH1Yy3zybSyohugSdHLWBaBwag2GJFe4A7PE/t9dTreUrS21hPWujm2zj4K6EuBYT3m+2nqrTyUPmPNcFVhd7T2g1SjfaMGcBAOFTg2+6LtmxZvvLgjry0n9qjvo4hB08w78TKQXZll0K0r1jKih+4Zxo0YKCZReTp0r91niWdoefa5RuEIt25qmslpmgoMLcEQVnBSW7Ies17jtrFLQ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3475.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(136003)(39830400003)(376002)(346002)(8676002)(26005)(8936002)(64756008)(76116006)(66946007)(66446008)(66556008)(71200400001)(186003)(6506007)(5660300002)(478600001)(19627405001)(122000001)(53546011)(66476007)(38100700002)(966005)(33656002)(110136005)(9686003)(316002)(44832011)(52536014)(86362001)(166002)(2906002)(83380400001)(7696005)(55016002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?Es5wz3WM9MAVDLmMLVXhyLYGX62K7vKVm8EESNMoa0c7hXleD906fqUjNUF0?=
 =?us-ascii?Q?pczsJ/KNqVZKyZBJHH+JT72UDxMWuZGtTecVASIsdDhQ2AOqS7I/L9528tyz?=
 =?us-ascii?Q?phTrGetCrky/owZqLGnJ1+eSmft7tovgMfWVDNOTqrDYganJupFUSCOrAjbf?=
 =?us-ascii?Q?7OnmH6/+bwJhKnmt2YpyWUAFEjvuB0HQJpnlCnCPIJ93GJstHpmOWA4gotMR?=
 =?us-ascii?Q?PgaVqrt/UJAxxtIle4vAQqqs5wHNYhd5zn0fqkCFnAX/7uflt2L1ZjfnfNKQ?=
 =?us-ascii?Q?wGfdF6oklalu9TgtCbdCtBibi16cpXhxMcBG2rYjPqztDve4HH2g1v+wQ02s?=
 =?us-ascii?Q?aSucwOmLNTvbiLI4yfgBRQga9Ir5KbXbc52HEa5LWpRoXjVt12OeElZk151m?=
 =?us-ascii?Q?9LPXLU/+JqIg+8uxyQ/Fj3AaruDLrTviR11vdP0sGr+OVPoVC8bMQl7vlwCH?=
 =?us-ascii?Q?j+TklF/EwUcR7yi8JBYpjJD1R62bL3iRGqGfdS7NdT4S5Ulakjtx6TGXm4dw?=
 =?us-ascii?Q?IGhpTZMDcNvugA+Y4NPUU5tPpJjrhrD9F8n+QZnxfgrsbP76zWU6VVat/uPT?=
 =?us-ascii?Q?u7MklaDQSD8WkaBLwbdYioc5SLVn4IPl7By77SUrSfQhbAIekkku6YeST8V/?=
 =?us-ascii?Q?1736CBUEnRmLSBYxVmyKpqG2bC88ZPGgkUIpGGeeaB8ba8Sys3/MDCdgNzqf?=
 =?us-ascii?Q?+4p7MvzTwEyMXqw0+VWY8p+1VpdXuhXg/lEq5XCJnXaqeLMsIpee/6s/XKnP?=
 =?us-ascii?Q?6vfzCasQWmQ6rTfL6yMhXKDAaAtqqdB0hW/hnUVHFCox2QoYKcMCF3VzKRNB?=
 =?us-ascii?Q?mBNNUeCKBzWGci6Dk/nac990bdF2qlN06uKcwOnoLYtAuD7kUrgFSmh7aHiB?=
 =?us-ascii?Q?RkTdSuMjTsSipy8UWM77a1Db7UpVUReAOhr/+EAF7Hmk9FvdFSWFhSNj/xkp?=
 =?us-ascii?Q?VgWnI5kEOTDhooVSk/mFNZK4VJqDF/Tr37GjYfgjtez3m5Y2p/fm9TGh1Z8x?=
 =?us-ascii?Q?B4zmkdpza9PfrRcXsaoFAacgrQKq57dR++AJFIGZjt6wYtGxacoVNhufV+Ap?=
 =?us-ascii?Q?zm5gJ3e68ynLczmoNXwJDDE8Cb8KXpcwuX+5PslZeRCoawsqRY++K3ra3XGe?=
 =?us-ascii?Q?iDvOiQAyQV7t5q6epcff4FEHwIiKthjDdYzqkvev/W/BwVgmS//GQ0jUEuqH?=
 =?us-ascii?Q?8km7fchpuEgm9gQl2Uf5TMYqGuChKozT3plm+FP61T3PhkwTX9HUoRzKRibj?=
 =?us-ascii?Q?8oDsZi4Ri+9ckvNb4VGNfYyOoE3CB/ieUDwNBQShOoLpQc1Neva+onjjUkLk?=
 =?us-ascii?Q?Q4s=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nobleo.nl
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3475.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ef51e53-1563-47fa-5865-08d9109fb56f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2021 15:00:37.8194
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d354334-64ad-4352-9b8b-cf80e736aa70
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dngbcdsWN+wTCWWAiZBumUcdGL3Tsu2P4fFboq9SaqDPeTAFsrUYhRILgmH57krD2fYeIpOkzN0PCba18hI9Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6994
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AM0PR0402MB3475DD2712EF800DF3BBDC02FB589AM0PR0402MB3475_"

--_000_AM0PR0402MB3475DD2712EF800DF3BBDC02FB589AM0PR0402MB3475_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Khem,

Thank you for looking into this issue. Below is the content of pseudo.log =
file as asked by you.

debug_logfile: fd 2
pid 453 [parent 452], doing new pid setup and server start
Setup complete, sending SIGUSR1 to pid 452.
db cleanup for server shutdown, 08:07:22.373
memory-to-file backup complete, 08:07:22.373.
db cleanup finished, 08:07:22.373
debug_logfile: fd 2
pid 869 [parent 868], doing new pid setup and server start
Setup complete, sending SIGUSR1 to pid 868.
path mismatch [3 links]: ino 3169066 db '/home/developer/work/build/tmp-gl=
ibc/work/cortexa72-oe-linux/hellocmake/1.0-r0/package/usr/src/debug/hellocm=
ake/1.0-r0/hellocmake.cpp' req '/home/developer/work/build/tmp-glibc/work/c=
ortexa72-oe-linux/hellocmake/1.0-r0/hellocmake.cpp'.

The problem seems to be 'path mismatch' but I do not know why that occurs?=
 Not sure if helpful, I am using bitbake version 1.48 and CMake version 3.1=
3.1. Please help me in finding out what is wrong?

With regards,
Ishu
________________________________
From: Khem Raj <raj.khem@gmail.com>
Sent: Wednesday, May 5, 2021 21:38
To: Ishu Goel <ishu.goel@nobleo.nl>; openembedded-core@lists.openembedded.=
org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] CMake fails with yocto



On 5/5/21 2:26 AM, Ishu Goel wrote:
> Hello,
>
> I am using CMake with Yocto and working on the hellocmake example
> provided here:
> https://github.com/joaocfernandes/Learn-Yocto/blob/master/develop/Recipe=
-CMake.md
> When I bake the hellocmake recipe it builds perfectly the first time.
> But when I make any change in the source file 'hellocmake.cpp' and bake,
> I get the following error:
>
> ERROR: hellocmake-1.0-r0 do_install: Execution of
> '/home/developer/work/build/tmp-glibc/work/cortexa72-oe-linux/hellocmake=
/1.0-r0/temp/run.do_install.147'
> failed with exit code 1:
> abort()ing pseudo client by server request. See
> https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this=
.
> Check logfile:
> /home/developer/work/build/tmp-glibc/work/cortexa72-oe-linux/hellocmake/=
1.0-r0/pseudo//pseudo.log
> Child aborted
> CMake Error: Generator: execution of make failed. Make command was:
> ninja -v -j 4 install &&
> WARNING: exit code 1 from a shell command.
>
> ERROR: Logfile of failure stored in:
> /home/developer/work/build/tmp-glibc/work/cortexa72-oe-linux/hellocmake/=
1.0-r0/temp/log.do_install.147
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
>=20
>

--_000_AM0PR0402MB3475DD2712EF800DF3BBDC02FB589AM0PR0402MB3475_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii=
">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-b=
ottom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
Hello Khem,<br>
<br>
Thank you for looking into this issue. Below is the content of pseudo.log =
file as asked by you.
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
path mismatch [3 links]: ino 3169066 db '/home/developer/work/build/tmp-gl=
ibc/work/cortexa72-oe-linux/hellocmake/1.0-r0/package/usr/src/debug/hellocm=
ake/1.0-r0/hellocmake.cpp' req '/home/developer/work/build/tmp-glibc/work/c=
ortexa72-oe-linux/hellocmake/1.0-r0/hellocmake.cpp'.<br>
<br>
The problem seems to be 'path mismatch' but I do not know why that occurs?=
 Not sure if helpful, I am using bitbake version 1.48 and CMake version 3.1=
3.1. Please help me in finding out what is wrong?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
With regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
Ishu<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" s=
tyle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Khem Raj &lt;raj.khe=
m@gmail.com&gt;<br>
<b>Sent:</b> Wednesday, May 5, 2021 21:38<br>
<b>To:</b> Ishu Goel &lt;ishu.goel@nobleo.nl&gt;; openembedded-core@lists.=
openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] CMake fails with yocto</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt=
;">
<div class=3D"PlainText"><br>
<br>
On 5/5/21 2:26 AM, Ishu Goel wrote:<br>
&gt; Hello,<br>
&gt; <br>
&gt; I am using CMake with Yocto and working on the hellocmake example <br=
>
&gt; provided here: <br>
&gt; <a href=3D"https://github.com/joaocfernandes/Learn-Yocto/blob/master/=
develop/Recipe-CMake.md">
https://github.com/joaocfernandes/Learn-Yocto/blob/master/develop/Recipe-C=
Make.md</a><br>
&gt; When I bake the hellocmake recipe it builds perfectly the first time.=
 <br>
&gt; But when I make any change in the source file 'hellocmake.cpp' and ba=
ke, <br>
&gt; I get the following error:<br>
&gt; <br>
&gt; ERROR: hellocmake-1.0-r0 do_install: Execution of <br>
&gt; '/home/developer/work/build/tmp-glibc/work/cortexa72-oe-linux/hellocm=
ake/1.0-r0/temp/run.do_install.147'
<br>
&gt; failed with exit code 1:<br>
&gt; abort()ing pseudo client by server request. See <br>
&gt; <a href=3D"https://wiki.yoctoproject.org/wiki/Pseudo_Abort">https://w=
iki.yoctoproject.org/wiki/Pseudo_Abort</a> for more details on this.<br>
&gt; Check logfile: <br>
&gt; /home/developer/work/build/tmp-glibc/work/cortexa72-oe-linux/hellocma=
ke/1.0-r0/pseudo//pseudo.log<br>
&gt; Child aborted<br>
&gt; CMake Error: Generator: execution of make failed. Make command was: <=
br>
&gt; ninja -v -j 4 install &amp;&amp;<br>
&gt; WARNING: exit code 1 from a shell command.<br>
&gt; <br>
&gt; ERROR: Logfile of failure stored in: <br>
&gt; /home/developer/work/build/tmp-glibc/work/cortexa72-oe-linux/hellocma=
ke/1.0-r0/temp/log.do_install.147<br>
&gt; <br>
&gt; <br>
&gt; I want to know what I am doing wrong? I noticed that if I clean the <=
br>
&gt; previous build of hellocmake, I do not get this error. How can I make=
 <br>
&gt; sure that CMake works every time with yocto?<br>
&gt; <br>
<br>
you perhaps are not doing anything wrong. pseudo is a tool used by yocto <=
br>
underneath and its bailing out for some reason. maybe you can share the <b=
r>
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
&gt; *I**www.nobleo.nl &lt;<a href=3D"http://www.nobleo.nl/">http://www.no=
bleo.nl/</a>&gt;*<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
</div>
</span></font></div>
</body>
</html>

--_000_AM0PR0402MB3475DD2712EF800DF3BBDC02FB589AM0PR0402MB3475_--
