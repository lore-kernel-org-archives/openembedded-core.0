Return-Path: <emil.andersen@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66DB3C3DA6F
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 09:06:04 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.111])
 by mx.groups.io with SMTP id smtpd.web11.9546.1692954353935915083
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Aug 2023 02:05:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=F9wSvpVR;
 spf=pass (domain: prevas.dk, ip: 40.107.7.111, mailfrom: emil.andersen@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dVRAfNpAS+6A3cEQooGchhDV656OTpeIvqERww/adb6mfTCnwZOpqXmuaXIo2C0TJMgEqoRONDWV1WVdR6WvcpuxQ2nuKlG2SF2k+wcvQ7FsKlQSZW4wYW3e2OlROWqqZ1aQ8DZs9UtBLFASqAMhElKMdcsd3yHIYR0geYY1LD5RwP89y4M6pBBnkaIXZTcVJZ9lmLwSTD78F35D0fN3rf5PnT2tqiFZ8t+28BLedAlMn86tQrEMxuJstyEH+XnkixRoBZxI8fdcP+rzIbaHnlloGe89jYv8jHYoMcVCFUDm0OUH4NW+iSdlxeMy89uziZxgICLmhb1jlhhgT9+ljw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXxKh9Oh1Orcx8dFMlyMdpDuKAqKK/c+AJZNSSAlL8U=;
 b=fPkSAq2wpGAGc7hAsld7so6FQvQaQmbQzZJPLVWdnYJruZ4oCNKGUXHEAuIR8EqxlJND+kVg7YOUv/m/zNTpl1DrTaisBDIXb/nVxHIT8pl/Dam8MtxVXjUus4csga0B1cJ8ZAOfFezYZMil2ZXOEL/+4Ebsb3bCPJ41OOsEsfeMf5eGmJIa2lmFp8PHhRoiGx/WXgA414ht9T/QciZjJ/OJTfNf0GnMhMRA0ol0o7kEjrMMUUOdLlAufjvEy+IhWlPiJq5rkJoGPWPnMpEBYpha4HhNGO3P/QT/cOIkIpqEHRAwrskLKJGV19zbetm1bXnmonhyBBq+xqp9gBLviw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXxKh9Oh1Orcx8dFMlyMdpDuKAqKK/c+AJZNSSAlL8U=;
 b=F9wSvpVRFOht7ji3DhY6S3KLOuqi04Z/FRKWxbPUOxeepjcBt574g2o7Ni5aWp2/rrMHW00/Yrtk6Z4xSClJIqFep4DYJVgOlZtIhnJ/2c9Y4aVWMp0stlKwciDfevvo/upqveyzAd3F95JlZU6YKUC5j6fg4AxQTvkRWwHMv4I=
Received: from PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:10a::24)
 by AS4PR10MB5271.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4b7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.29; Fri, 25 Aug
 2023 09:05:50 +0000
Received: from PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6def:6be3:e407:5126]) by PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6def:6be3:e407:5126%7]) with mapi id 15.20.6699.027; Fri, 25 Aug 2023
 09:05:50 +0000
From: Emil Kronborg Andersen <emil.andersen@prevas.dk>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Emil Kronborg Andersen via
 lists.openembedded.org <emkan=prevas.dk@lists.openembedded.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [meta-oe][PATCH 0/3] add missing CVE_PRODUCT
Thread-Topic: [OE-core] [meta-oe][PATCH 0/3] add missing CVE_PRODUCT
Thread-Index: AQHZ1pRhz6ztAyqNF0CbQGZxNSWaUa/6rgWAgAAJJ1Y=
Date: Fri, 25 Aug 2023 09:05:50 +0000
Message-ID: 
 <1f9a76e18d694ceb9876e7ef4135e73accfe62a029214e6992be876ce1d444d6PA4PR10MB4576781D8CA1C15CBBE6F1F0FFE3A@PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM>
References: <20230824140747.45594-1-emkan@prevas.dk>
 <20230825102439.10f9f041@booty>
In-Reply-To: <20230825102439.10f9f041@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
x-ms-traffictypediagnostic: PA4PR10MB4576:EE_|AS4PR10MB5271:EE_
x-ms-office365-filtering-correlation-id: 4ac9443f-b3a1-46c9-4263-08dba54a7ac9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YbeY2qT2ump/eZgFBzbK0kJF1kjmxZmjZak0Hkmgg8z+DIxnvDxeiWTmfNpKIkoD+rYt+Jp47u7a3rk60+ljknTOWCbghTd2ubSS6eDcsIls9OkbdxkH4K1L5bEaT6qCIe78BJXa5z0TNiSEaxhInTUkr3znTiWeB/1HLvjWl2+xVpsvMRRnr7ddWPwvpiglWVd3Ab4sbv4sqZcWaKpNWnx9Mko8HO1WsUHPLDsTfNi9HH1zhbf6pzyvjpfFVLndDKx++QF+QRYWCUqscbY+KVOwAP6UC4yCAr8VrA/5ZxxdAa+dtFSMV/JiJVXNvdpGrSGyu17Blr6MnS98SWRJCqCg8bINiMUkeVitiCEWSO9cQI2zOfQ7/07nX3HON8VF5L4h8DaafLLj2Sv+fGJMsdtxrByMpcMjLAUJw0+DIScMyDvJcKuW2Y4u1nHwYw5Irtc15N+RC7U7gmacB0RMr11wJ8UjsR+9PWt6wR+o0oBokNolQyVpw3fyKN+5HX2HoCvnUqRWSpMmqQGLsuNAL1VKqTmDevx6ZkO1SJH2WLaPb3yxiB0RawdJqe3pv8BO8qax4t95D+qUDuh6TNznLpWztPr2XErz3rNBDKeV71Q=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39850400004)(396003)(346002)(366004)(451199024)(1800799009)(186009)(450100002)(122000001)(38100700002)(38070700005)(8676002)(166002)(4326008)(8936002)(64756008)(41300700001)(6506007)(53546011)(316002)(91956017)(66446008)(7696005)(66476007)(66556008)(110136005)(66946007)(76116006)(86362001)(71200400001)(9686003)(55016003)(26005)(478600001)(19627405001)(966005)(2906002)(1015004)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?cgt1QEIsYJK6NMwhc7WssWylthr6QvmVs8yGtkzSk0JDyUAs4j3Tw3qGuz?=
 =?iso-8859-1?Q?bVtkvZHot3G1SxN0+aw39EyB3K++8JH09fCEFBLrjSvqKh1TGKEkMJhrbq?=
 =?iso-8859-1?Q?rV60QIc8A1gI1fAiKXmoUOg8VP00jloGJfk9wRQ/hAeV5JMIfjb5enGmVT?=
 =?iso-8859-1?Q?LsE89xaig+y354DiEUPPBkzxSedVocAkG0t7XrlAs45Qj0D/+6iqY+bU40?=
 =?iso-8859-1?Q?mGzexkZTs/0o3tSAoSU8kVqWc9sd3iQPPLsTvuV7iibR4bwZtlM350iOhK?=
 =?iso-8859-1?Q?0kmONIL4QBuyuZ+dE0bVoPvkw0rVUsvYYNiY2VBSLS+NtReeVymIIA98rB?=
 =?iso-8859-1?Q?KIO97ruZIAAzDMXQDQR3BS1dB1qulKeQJoHKO1f4obdV8yIe/TsBKY0Xyl?=
 =?iso-8859-1?Q?kjdYC6foqCD4UALxVKdrQbxafWB7q/5uOunaXX4KWg5X+mGOkmr+0Oxtkp?=
 =?iso-8859-1?Q?ZEpsfnil64ZbfeXDvZ6R8YrMUwrA7F2m2feoDU3FSnc55r6xUW89pmepAD?=
 =?iso-8859-1?Q?0l5xHjhZMeMv05DO1x5eIaOjurvTpwltZKljSkcFwYneGateBNQTDj+31+?=
 =?iso-8859-1?Q?lkVjuLfoQrcJZBO4CiDxJB5ibfMioZCuUf9ENIivUiNJ2GeGrH4ByWkfF7?=
 =?iso-8859-1?Q?DBIGD64BsWmFaXTwwujbgZRKxfJelMhYrlFp9LcG3rMj8hV/WeVbWybzvn?=
 =?iso-8859-1?Q?RCyWqMv9k/0mZd1gryjfxAiBcP1xKHqEn3dFAiGuYJeith5+PAKPieX26k?=
 =?iso-8859-1?Q?pLsRSkof07/EyNbXq3EiI3dr0tAom+F7gA2ramHOGTNs9UzOoxFsyRlbbi?=
 =?iso-8859-1?Q?HIgJM0sumrSzA7EJyBAmQDyGK4Vl1BbN0TdWfQjKU4JyBCQA2rNj6ieJH5?=
 =?iso-8859-1?Q?JkJY3HaXcFI6AGksfDV2Jeb1+he5qReaDURW6dt0B8tfP49ZWFR7XhBuEe?=
 =?iso-8859-1?Q?toJ1Ofhq+kGHgdnQu1fxAozFodtBm/MQP/yHVSmwZ9sY3aTV3zDJbyYxlx?=
 =?iso-8859-1?Q?9Uu0PR/lMPEsbG36BKpMv0Eg+KXhbc9iOcCVpK/WEo2ab6EZ47EoPseK1B?=
 =?iso-8859-1?Q?VdQwXMBKHIlLj87AlQ52ApZnuK+lbK+5f+qTTOZciHgXbHjKh25UY+NzAq?=
 =?iso-8859-1?Q?I7kWl9SjWAAjDp03r3//rbVXMS7npJmQQbH7YqX50h74d6k1j/AqlIFKa3?=
 =?iso-8859-1?Q?Q4W6SYFc8NbLs6xG9UPZ19oYCU8hQ5AIveGi9dngTqse4aRF2o7OmqfyvV?=
 =?iso-8859-1?Q?ISOroEh1MH2q6w9nCcX1pqP4WhMV/JsYezs6dyzJoPdqMGPYBZz/oIqBCX?=
 =?iso-8859-1?Q?0mM0jwq9kqHQQyi4gQCuaz1mDfmRGQxi6ItMvCUqoYWVm9eeoIEbhfIOJF?=
 =?iso-8859-1?Q?1Bzrti2WZ8Vxr6tqtYAhc5jXCehP02C3l8pbJ9AnqgbypLOKWT20o6wPCL?=
 =?iso-8859-1?Q?SdwX0jauzpAtsWjVHH5ByBmAUVgD9eBo917oJzWllj2SdTd0GEm14Oij4U?=
 =?iso-8859-1?Q?4N8IcMLa4XZH66L9sbTkpd7Hzor2V9YnVV4rcay4c/ulTCLqEdEAT2PLXs?=
 =?iso-8859-1?Q?AFxrTclec3/Ino4izqOf2WeD4uogkTdSVfC7vLMaKSUwHPYz9mY4/+oAJ5?=
 =?iso-8859-1?Q?8THlw7R0tCkAwFkzWn3JVWfVPEH3qTbyVC?=
Content-Type: multipart/alternative;
	boundary="_000_1f9a76e18d694ceb9876e7ef4135e73accfe62a029214e6992be876_"
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac9443f-b3a1-46c9-4263-08dba54a7ac9
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2023 09:05:50.8728
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UAlnKbg2X5rInI3ptt1cJ/HIrUzcdokfcK7IxU+ScneCC/Dr9VxsUkxsLl5w9Mz4r+fVzvPIf4838qDC4aMjxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5271
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 09:06:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186702

--_000_1f9a76e18d694ceb9876e7ef4135e73accfe62a029214e6992be876_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Luca,

Sorry about that. I sent them to the meta-oe mailing list now.

Best regards,
Emil
________________________________
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Sent: Friday, August 25, 2023 10:24
To: Emil Kronborg Andersen via lists.openembedded.org <emkan=3Dprevas.dk@li=
sts.openembedded.org>
Cc: Emil Kronborg Andersen <emkan@prevas.dk>; openembedded-core@lists.opene=
mbedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [meta-oe][PATCH 0/3] add missing CVE_PRODUCT

Hello Emil,

On Thu, 24 Aug 2023 16:07:44 +0200
"Emil Kronborg Andersen via lists.openembedded.org"
<emkan=3Dprevas.dk@lists.openembedded.org> wrote:

> Some recipes does not have 'CVE_PRODUCT' set, and will thus pass a check
> against the NIST database with 0 CVEs, even though there could be
> several.
>
> Emil Kronborg Andersen (3):
>   libopus: add CVE_PRODUCT
>   lcms: add CVE_PRODUCT
>   snappy: add CVE_PRODUCT
>
>  meta-oe/recipes-extended/snappy/snappy_1.1.9.bb   | 2 ++
>  meta-oe/recipes-multimedia/libopus/libopus_1.4.bb | 2 ++
>  meta-oe/recipes-support/lcms/lcms_2.15.bb         | 2 ++

These patches should be sent to the meta-oe mailing list.

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--_000_1f9a76e18d694ceb9876e7ef4135e73accfe62a029214e6992be876_
Content-Type: text/html; charset="iso-8859-1"
Content-ID: <B80A9089C5333B4DB4EF6F643B4C5AC0@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Hi Luca,</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Sorry about that. I sent them to the meta-oe mailing list now.<br>
<br>
Best regards,<br>
Emil</div>
<div id=3D"appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b> Luca Ceresoli &l=
t;luca.ceresoli@bootlin.com&gt;<br>
<b>Sent:</b> Friday, August 25, 2023 10:24<br>
<b>To:</b> Emil Kronborg Andersen via lists.openembedded.org &lt;emkan=3Dpr=
evas.dk@lists.openembedded.org&gt;<br>
<b>Cc:</b> Emil Kronborg Andersen &lt;emkan@prevas.dk&gt;; openembedded-cor=
e@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<b=
r>
<b>Subject:</b> Re: [OE-core] [meta-oe][PATCH 0/3] add missing CVE_PRODUCT<=
/font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Hello Emil,<br>
<br>
On Thu, 24 Aug 2023 16:07:44 +0200<br>
&quot;Emil Kronborg Andersen via lists.openembedded.org&quot;<br>
&lt;emkan=3Dprevas.dk@lists.openembedded.org&gt; wrote:<br>
<br>
&gt; Some recipes does not have 'CVE_PRODUCT' set, and will thus pass a che=
ck<br>
&gt; against the NIST database with 0 CVEs, even though there could be<br>
&gt; several.<br>
&gt; <br>
&gt; Emil Kronborg Andersen (3):<br>
&gt;&nbsp;&nbsp; libopus: add CVE_PRODUCT<br>
&gt;&nbsp;&nbsp; lcms: add CVE_PRODUCT<br>
&gt;&nbsp;&nbsp; snappy: add CVE_PRODUCT<br>
&gt; <br>
&gt;&nbsp; meta-oe/recipes-extended/snappy/snappy_1.1.9.bb&nbsp;&nbsp; | 2 =
++<br>
&gt;&nbsp; meta-oe/recipes-multimedia/libopus/libopus_1.4.bb | 2 ++<br>
&gt;&nbsp; meta-oe/recipes-support/lcms/lcms_2.15.bb&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; | 2 ++<br>
<br>
These patches should be sent to the meta-oe mailing list.<br>
<br>
Best regards,<br>
Luca<br>
<br>
-- <br>
Luca Ceresoli, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" data-auth=3D"NotApplicable" id=3D"OWAbe77ec=
f5-dd16-5e26-084f-3a6b2698fa7b" class=3D"OWAAutoLink">https://bootlin.com</=
a><br>
</div>
</span></font></div>
</body>
</html>

--_000_1f9a76e18d694ceb9876e7ef4135e73accfe62a029214e6992be876_--

