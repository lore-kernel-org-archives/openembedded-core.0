Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.48])
 by mx.groups.io with SMTP id smtpd.web12.12654.1617718055426913551
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Apr 2021 07:07:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=MSdn4+MR;
 spf=pass (domain: kpit.com, ip: 40.107.138.48, mailfrom: purushottam.choudhary@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mc9HOCAal62yDCM0Vx0vm0GPqtZBZmERJiOISacxZvPVCToHt2sL09pJLWueZQMA+b8QFAIsB+mcqWhz9pWbv+aE1dTpjqPZzmQ4SPwrVPI97EqCCInR3GyjjSGlkOViKs38XyFduDOHGwZXZo/A7LNsjBZvMRJGOYuQ/73/wcaBM3R9QlwJeL03wOOlyG7HZSZWkKmUfB6jb80AubKaOrpGKDPPA6bIdPjp7kDVR1HNalo78rzNPxMArJKREtlq/CZGMyUPSSctfEUXHrI4jxIrukX9Gy54WacQVx3LCjc/f7Wq+x+sNKFGdFBYBXVJp+y86fhYBYnNhpRR3TToWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XKij6/jM/H4wrN0Ne/C1LK3XC054Suburgu+TNfHYvk=;
 b=lFLskXwQ2P5jWADdyg9dYz9JHiFneaI/ILAx5CVUsG0/YjsCKnUzJdvhrsrY3CJmYG1uQM8mPZrJWrNFDNk8x81jjRjD2TB7XGivptMWvOPM01+KI3ctroDziDeoO+ygV5Wr+vX6GNxxESRpsLEUXteJYlVhp7tpNfd0h7hMx/xMQCVC7G36Hm5uYarrSjIIpVkmgdZtoHNPPFJ22s/Co9a4PACxR4yfUJb0T3w2pBSLkPps6UrOy6hPiXLVLfDa163gE7yu1Du6E4LJoa1aVyx4aovGe4MKPb6eK3AJ2MZz4G7VWemORmgrZo0Z4FRQiGvbHIR21Ortlcn2Yt9IrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XKij6/jM/H4wrN0Ne/C1LK3XC054Suburgu+TNfHYvk=;
 b=MSdn4+MRJiToeqM3HFWXYr3GovL558erc3zfpXygIFGNB7coUr4+OVKgeubpyOJ7si2E9YMmnFtAO9l9R22FITIV7N9YpABlcAWlToFR1gtiBT0zFZF+eE69TUAneBtDPAJMj2CbGH0fEEl8YBDpNsMVRH4ecc3AR/Tipau9yxU=
Received: from PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1c::9)
 by PN2PR01MB4713.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Tue, 6 Apr
 2021 14:07:31 +0000
Received: from PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ec0c:730d:7fe9:9cd6]) by PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ec0c:730d:7fe9:9cd6%7]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 14:07:31 +0000
From: "Purushottam choudhary" <purushottam.choudhary@kpit.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>, Nisha Parrakat
	<Nisha.Parrakat@kpit.com>, "Mikko.Rapeli@bmw.de" <Mikko.Rapeli@bmw.de>
Subject: Re: [OE-core] [poky][master][PATCH] buildhistory.bbclass: store MAINTAINER variable
Thread-Topic: [OE-core] [poky][master][PATCH] buildhistory.bbclass: store
 MAINTAINER variable
Thread-Index: AQHXJsmoCTbPtHfx40WbmXPJWS1NwKqnV1yAgAA3Clc=
Date: Tue, 6 Apr 2021 14:07:30 +0000
Message-ID: 
 <PNZPR01MB422418D2A13262F2ED54139390769@PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM>
References: 
 <1617262550-10558-1-git-send-email-purushottam.choudhary@kpit.com>,<3e693a34b87c151c4672fcd59b23aab3bf6b55de.camel@linuxfoundation.org>
In-Reply-To: 
 <3e693a34b87c151c4672fcd59b23aab3bf6b55de.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=kpit.com;
x-originating-ip: [49.37.82.78]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8568d525-0c48-4c01-fe4f-08d8f90551a2
x-ms-traffictypediagnostic: PN2PR01MB4713:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <PN2PR01MB471377E7E56B16947993288890769@PN2PR01MB4713.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YOTqnPtymnXAjT0oqJy+LkTNvSVK8pGlnhY1aLKWiz+SiF15DCusr82b+yZCAeo8lI4LhnKv1OQJCHDwCu66dtxpxSQdYR23IWx+lABBlniY0iuYJbjkAg05kvuHgzF1F+iG3Nkm7RkkcGN7jHR9y8ABtWovthAE7errSv1+lQaGCMncu6nasXIiDUfnSOQjKaL9Sm4VXnPhEyy1dHu7SDqWs7IN3gyWmgJOyUI6VSbOoaw/aGeo0iJC3fm7iJoWp61EPA9szvw6unexGJH/lEf43klth0SVuv1bTD2hlIgTZ8hGj9eyXXUYDf6vJQfGu/zHuF7P7syAYP3H7iXbBbDyf4OPa7AnCyGfW4RYSPKNX0BTWRoWaq6eUsfTeFk85zrW18Aum2wLz3g3hJpuHIcHJZaaxjrvcao9wRmw94EU562y8p02kDaPnFr2sYVcX+XAw36SkaFsIfdv4bnbb+8qxRCpPFsYb0qw4A2FSMBBufqgdiRl28trS8tSTozOFikT2v5FYvfiW6Otjw8UwkT+ehH5pbZ11d7aIWvqYsdaskvLJexV7nFZliKL1bF4vSB7WaD5sdccz8Ol3ZwG2yROzFrDFqNxUL3HrHiD/eaJJyGR+0S6pfATMvYZ272tsm4ztJdWDAU4mzoPLFRk1whEMsLx9hwosmzalPc/NCg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(39840400004)(346002)(396003)(66446008)(66556008)(66574015)(66476007)(76116006)(54906003)(66946007)(6506007)(64756008)(26005)(19627405001)(8936002)(8676002)(53546011)(186003)(4326008)(83380400001)(2906002)(71200400001)(478600001)(86362001)(110136005)(9686003)(5660300002)(55016002)(7696005)(38100700001)(33656002)(52536014)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?cQUxw2X2NVmJPNFARQhzLaVsH8pdvG+jyV9ZrQqN+GPgx0RMVHZhUrTJcAkQ?=
 =?us-ascii?Q?FnBqiKrXLlSn3/sVFDFH7+tuLcdV21IIHz3ur7/J02yDTWRUw2jfhngFeJxD?=
 =?us-ascii?Q?iBExHlon5HRMqFFd/Dhmyf8b4uZ1wYcMcUx5qiFeaG6vUkcvpTXEiYRi4O3G?=
 =?us-ascii?Q?mTi0RFknxqj1/8C2/RjPMuTjmwgJMcXYWOcaXI9cd6is2gVm69yP/zrcaBKf?=
 =?us-ascii?Q?SKDYPermJvS2C5B7n1Pej6bz7gAhKtxYXjyWxdrVxmdF/zjcoxVSxuuFvubs?=
 =?us-ascii?Q?engjvnaB+4TSeGJXMf9oWv0DUSn9UrvYyxmcrE/0H0XH2hbxfkkuD6UXfPYd?=
 =?us-ascii?Q?6K0pW/DpUu/qY3WqbVaANSrFrxSJ9lBODjWJ1KO1W8Vh9MQ4UBwjzKixoclv?=
 =?us-ascii?Q?+olFQ8r6/A5fz/6xeHP21RmMHH2N46cjWClj1lBqN/+J4ltH4jZ57gAMY7b3?=
 =?us-ascii?Q?IZXl/bOIfoCuH57b3P287LRUoibH7yxvh9hBY/X4x3aFHJgM8Fg3I9Vur7n0?=
 =?us-ascii?Q?DJTcyaXnNnEC0wp6wa+2T+InhhRGrlwmpMGaMoE3zTu7i2DCQQ62bI/4NL0p?=
 =?us-ascii?Q?YPK87xSBFg89xs08RKe9sbtaTRESeM1v55kvJsfQTAEdKj40IiaMGtfILNZR?=
 =?us-ascii?Q?kQt758kAeObStUGbBARP9FFmoHr6TTkppC0Mm2aRoLcDwu2aAkDjEYzGwsVT?=
 =?us-ascii?Q?4B6h3pbFNTdejrObqmsozMmQBZNLKo1C6EBq+bq1UAAUcakmRteg/POC3ApE?=
 =?us-ascii?Q?ko20JEG5SZYtjeI4zXXJx5kNWyWYwzFeMfZ7JAgA7VYT8a1j0XsrmgnEFeVl?=
 =?us-ascii?Q?fqS/tT6y9fQ5cpLQpFaQLhliIIKKaPGXAmy3qrSo84YV8g/tkq0rnDGDLufM?=
 =?us-ascii?Q?dmyOUIopbjDWAjAZBOa4rKlezI1pnD+zqQSURlljiG4DAtsNbOtV1eQJsrh7?=
 =?us-ascii?Q?CUhcbvhBnYzxtj4RtqxZDYG8q+XZlZ2Uy5XtNNtcKFMebqA3VfCUdYpaJfCH?=
 =?us-ascii?Q?sDERg8K3vv/SbTmV9MruboYXxbsQu+E2spd+ehIBofCExIskZ2Dtrop9s9de?=
 =?us-ascii?Q?NQKaQc8/zomZMZKTW77dpmT32U/rlji/Tt0b4BoLuN6OMc9Wn3PzdEZXKli0?=
 =?us-ascii?Q?RFZeefUFTGxd5phWlLOaT3TRLC6QMvFctVVl1sn2ljZLnc/z5CzxvFyol19r?=
 =?us-ascii?Q?AtQJZLgdgo3vvgrMm24wxGSxv1YDxekn25GrJtRa9Bc18OWxucrB0PKR8TzN?=
 =?us-ascii?Q?GgQXJlWqgfCA8ryDEreHUiyvixYeJ2B2GYR2VOxkZeuBBV/eU02y+rnphiNf?=
 =?us-ascii?Q?WpE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8568d525-0c48-4c01-fe4f-08d8f90551a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2021 14:07:30.9667
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BmAIa77TTUML/5TdSIhBqFb/4HkjAJa7hUtgmOdIbdNfV+440p20to538kUgF48pSeAajmcQkkv4VKijG+UcIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB4713
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_PNZPR01MB422418D2A13262F2ED54139390769PNZPR01MB4224INDP_"

--_000_PNZPR01MB422418D2A13262F2ED54139390769PNZPR01MB4224INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

Basically, the whole idea is to generate the metrics dashboards of each com=
ponents. so, that Maintainer variable in buildhistory could help us to coll=
ect this data from automated CI which will maintain KPIs like unit test res=
ults, coverage rate, clang-tidy warnings etc. for the components that will =
map to software domains which consume the component.

Thanks & Regards,
Purushottam
________________________________
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Sent: Tuesday, April 6, 2021 4:19 PM
To: Purushottam Choudhary <Purushottam.Choudhary@kpit.com>; openembedded-co=
re@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Cc: Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>; Nisha Parrakat <N=
isha.Parrakat@kpit.com>
Subject: Re: [OE-core] [poky][master][PATCH] buildhistory.bbclass: store MA=
INTAINER variable

On Thu, 2021-04-01 at 13:05 +0530, Purushottam choudhary wrote:
> The maintainer declaration in the buildhistory
> is useful for tracking the maintainer of recipes.
> This change adds the MAINTAINER variable for
> recipes and packages to its buildhistory data.
>
> Signed-off-by: Purushottam Choudhary <purushottam.choudhary@kpit.com>
> ---
>  meta/classes/buildhistory.bbclass | 10 ++++++++++
>  1 file changed, 10 insertions(+)

We could add all kinds of things to buildhistory but I'm not sure
there is a compelling case here. The idea is buildhistory reports
changes in output such as size, changed dependencies and so on. A
change in maintainer is pretty much always going to be a conscious
decision we've made and clearly visible in the commits.

What justification is there for adding this? Which kind of change
are we trying to detect and report to the user as a potential
issue (which is the point of buildhistory)?

Cheers,

Richard

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_PNZPR01MB422418D2A13262F2ED54139390769PNZPR01MB4224INDP_
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
<div>
<div style=3D"box-sizing:border-box;font-family:&quot;Segoe UI&quot;, syste=
m-ui, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, sans-serif=
;font-size:14px;orphans:2;widows:2">
<span></span></div>
</div>
</div>
Hi Richard,
<div><br>
</div>
<div>Basically, the whole idea is to generate the metrics dashboards of eac=
h components. so, that Maintainer variable in buildhistory could help us to=
 collect this data from automated CI which will maintain KPIs like unit tes=
t results, coverage rate, clang-tidy
 warnings etc. for the components that will map to software domains which c=
onsume the component.</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div name=3D"divtagdefaultwrapper" style=3D"font-family:Calibri,Arial,Helve=
tica,sans-serif; font-size:; margin:0">
<div>Thanks &amp; Regards,</div>
<div>Purushottam<br>
</div>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Richard Purdie &lt;ri=
chard.purdie@linuxfoundation.org&gt;<br>
<b>Sent:</b> Tuesday, April 6, 2021 4:19 PM<br>
<b>To:</b> Purushottam Choudhary &lt;Purushottam.Choudhary@kpit.com&gt;; op=
enembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openembe=
dded.org&gt;<br>
<b>Cc:</b> Harpritkaur Bhandari &lt;Harpritkaur.Bhandari@kpit.com&gt;; Nish=
a Parrakat &lt;Nisha.Parrakat@kpit.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [poky][master][PATCH] buildhistory.bbclass: s=
tore MAINTAINER variable</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Thu, 2021-04-01 at 13:05 +0530, Purushottam cho=
udhary wrote:<br>
&gt; The maintainer declaration in the buildhistory<br>
&gt; is useful for tracking the maintainer of recipes.<br>
&gt; This change adds the MAINTAINER variable for<br>
&gt; recipes and packages to its buildhistory data.<br>
&gt; <br>
&gt; Signed-off-by: Purushottam Choudhary &lt;purushottam.choudhary@kpit.co=
m&gt;<br>
&gt; ---<br>
&gt; &nbsp;meta/classes/buildhistory.bbclass | 10 ++++++++++<br>
&gt; &nbsp;1 file changed, 10 insertions(+)<br>
<br>
We could add all kinds of things to buildhistory but I'm not sure<br>
there is a compelling case here. The idea is buildhistory reports<br>
changes in output such as size, changed dependencies and so on. A <br>
change in maintainer is pretty much always going to be a conscious<br>
decision we've made and clearly visible in the commits.<br>
<br>
What justification is there for adding this? Which kind of change<br>
are we trying to detect and report to the user as a potential<br>
issue (which is the point of buildhistory)?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</div>
</span></font></div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_PNZPR01MB422418D2A13262F2ED54139390769PNZPR01MB4224INDP_--
