Return-Path: <samuli.piippo@qt.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A0A7C4332F
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 07:42:23 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.134])
 by mx.groups.io with SMTP id smtpd.web11.8063.1670485333710270344
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Dec 2022 23:42:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qt.io header.s=selector2 header.b=B4RIp6nC;
 spf=pass (domain: qt.io, ip: 40.107.21.134, mailfrom: samuli.piippo@qt.io)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lOxkvMZc9wVNjzkJ6eVDMox9bdn0iEyaTO9qEoZ3a1mWEuBVjy8j0HV2oVQMu+ZdVWaIaYe2K4pLn1viVdK999Je+n1zD7/+RHEQiwQvGwzQqEByICZMdxnk1YUD5L02DDLH/m8/vnKjJ09OjtopIVzSeU8udu9JsokuM59iX+OMzS16+2nySHFE7ctRC288bflGPd3kjLSmeh/SrOUwKIoS4fDLCOjoEAroHaHLUroI8G35uw5vbDU7xUrmu2pkKmQZnuFa5x/stRwO076aNub1EWXzrwQqHPqD/12DAIaJVe0rFvdX4f74wkPqGDV/IEmuPvKpHVD+4nR4tIqxXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i58SrRJAAPkBgIukrjxjHcIYOqY+R8UedrIT2mvu7zk=;
 b=WS+3SefDa4LX7TAVINKtJ6loX3x2yy9cKUKgl4wuiQznz10WeGwZfzgOd6pDP6MkeSHs8vf3olAfpJbNujwseKXyV9JuytR4M0R/B+fW7bExFSVPzPVFWlKSKqCMyvyyo4O/utJ/xV9+0iBo1zHEwF/EjIvE53bG3WL0SKQRqsOZc0pp/Y2ywA2+CQEDceFpKEQpeRkg0oXmoULHNxb/VrZOmn94rUAe6BBNMMOFDQKd/Ac1FSVvxw2ENfoGouuQz78Jver3Y7p6Yn0QObfsFxsz+ZrbcetKCwCI31yK+r+/h2lHn0BnIEHb2nDRzP4mmib6+DeCZjD+BQsPQsvPEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qt.io; dmarc=pass action=none header.from=qt.io; dkim=pass
 header.d=qt.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qt.io; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i58SrRJAAPkBgIukrjxjHcIYOqY+R8UedrIT2mvu7zk=;
 b=B4RIp6nChqRfe5Dal9O6KkaUI4y7G7tpBWucKIRQdGcvC+JLXqC6QwUZjY03wZpVDxLdOojhHUc48zsXGEaWsq0+3VfffHEASA33jyPH9OcP2tsV3QeyHjp56kjSORRXJDZgaB9SzbIy0w8F1bWNQFGG/BsT5RVII708RjU4BXs=
Received: from AM4PR0201MB2097.eurprd02.prod.outlook.com
 (2603:10a6:200:4a::12) by DB4PR02MB9408.eurprd02.prod.outlook.com
 (2603:10a6:10:3f8::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Thu, 8 Dec
 2022 07:42:09 +0000
Received: from AM4PR0201MB2097.eurprd02.prod.outlook.com
 ([fe80::bab4:22e2:2cdb:f693]) by AM4PR0201MB2097.eurprd02.prod.outlook.com
 ([fe80::bab4:22e2:2cdb:f693%12]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 07:42:09 +0000
From: Samuli Piippo <samuli.piippo@qt.io>
To: Martin Jansa <Martin.Jansa@gmail.com>, Otavio Salvador
	<otavio.salvador@ossystems.com.br>
CC: Markus Volk <f_l_k@t-online.de>, Khem Raj <raj.khem@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH] mesa: update 22.2.3 -> 22.3.0
Thread-Topic: [oe-core][PATCH] mesa: update 22.2.3 -> 22.3.0
Thread-Index: AQHZBavwiInuhDGPNEy5ZkcJXysNJq5d/wCAgADRCYCAAIlnAIADJnKAgAElkzo=
Date: Thu, 8 Dec 2022 07:42:09 +0000
Message-ID: 
 <AM4PR0201MB20975667EA5BA27E0326E3BEE91D9@AM4PR0201MB2097.eurprd02.prod.outlook.com>
References: <20221201173942.1218836-1-f_l_k@t-online.de>
 <CAMKF1srCn0tDWAxxpVCYhTZmow3uwy0tGqLXy2VDX0qBHDx2ZA@mail.gmail.com>
 <NMLEMR.NA7JF86LUFN83@t-online.de>
 <CAP9ODKopgRpWZNiFHjFtw34dYhRHKH188p2_AAs_=Ptyti-ESA@mail.gmail.com>
 <CA+chaQcCzmqKquXstrcBBQGD8vJ5gDVuUJDNoN7uVNEbpjm+AA@mail.gmail.com>
In-Reply-To: 
 <CA+chaQcCzmqKquXstrcBBQGD8vJ5gDVuUJDNoN7uVNEbpjm+AA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qt.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM4PR0201MB2097:EE_|DB4PR02MB9408:EE_
x-ms-office365-filtering-correlation-id: d513988c-3c84-410e-fc6f-08dad8efb670
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 nNTU0iu8wYjLTERu8h1T5w/CplslP6pxwJuArC7saiHr2kxnHEr8XOOOr+/9XlDuB87WtXGmRy9gMyBg4JAE2FuMkKDkLUQme6DJEaQwWQzcSezqZA8wK9RSIKWuaMmB5sWybH4xzSwCZCrJ3r7LRpK2yr+M2hZwhuHJrbEQ573KK0AG1DC8pXjgzvZlM5vDALAPmcp0Avk1j0Ab9BwC3P9puX0Iea1qguzMz4cuMzjuzBpLCwDt5iE/PXgMrDsC7OcrteShAVHR9J3PGCOHMpa2nVU65kQLE6fdjrxxe0aoiql+eoZ+R0JnNLGfoas4y9p3sAmvhwKCZMm/uU16tABybzN643hFIHMotJs/+iDrCPiXc6FuBCA9Sq1IamcPPwWxRQLu6qSSaBW3kOW/2HM2gpg4qDsDIecUnv8mhs6csMbn/GxrKUk8kpd3QN5sgZAyqwiF9P+pu62hd9N/IGloyxN2OdfseSdR1kPUjVz8xol2/oKUpwxJFWZVdHybUiUHxfCcXb2/KX6xyHuo0yZnBBbn6EjYwXOJIJb8d3fyTnfYgLwNEkJtxDp1gQ5FCsDP0BHu6ESA2fDeWOrQkbhIwtcuoYiLdNPaLU/Nk9CQpKAxsCVJk/T3/pKDNG135qMNxtMTDrrDnET919oHUfJ8PNj3ISQOE0nHDv/ZBZ8Gk/WgRsRrahcFLWaUsKscMwcEdtHzQLClGUyUNYsuPBkhEwxW9rAbOP8X6/EfoH6Ia3Amm25Jy+fyiRaWQSnzTXcBLwqtoeKnWRiPKi3hiw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM4PR0201MB2097.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(39850400004)(366004)(346002)(451199015)(316002)(38100700002)(54906003)(8936002)(122000001)(110136005)(2906002)(52536014)(66556008)(44832011)(15650500001)(91956017)(83380400001)(5660300002)(76116006)(41300700001)(186003)(64756008)(4326008)(66446008)(55016003)(66946007)(33656002)(8676002)(66476007)(478600001)(38070700005)(966005)(19627405001)(166002)(53546011)(26005)(7696005)(6506007)(71200400001)(9686003)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?nWwO1fUHKrkPZE/8oTsrM3YYm566xe4K0cv7Kx06zV1r+E4dT2r7T9Ez4t?=
 =?iso-8859-1?Q?7fIaKF/M+Np7Az/mky4xA9kc/kWkxl9D+IU6hh2KOgZlYTLUCMbp7Y+E/9?=
 =?iso-8859-1?Q?ZNTHmNfJ0FXdnXjtlOJ+3evayzgRMiESRDTPHoee6UQU597q5CfNXu0iM8?=
 =?iso-8859-1?Q?KUAsJZJOiaZEc6nAR01hedurNkRriyrUIrTsyeBBPRPeJGyeFNtdQbCP6K?=
 =?iso-8859-1?Q?/0CYz2dECdA8svuwUm9eMYyRX31fNyovZqY1K9sDKF4hoSR/qKHGtCD49M?=
 =?iso-8859-1?Q?iihsvw9x8JMizWT77Qlb4Jnb/WOJ7/BdI24PtDLtsEeb6aw2iOx7bhmlae?=
 =?iso-8859-1?Q?S5rjftbMztFlMlvOpiIW8tuWvENGczlCO91gLMNuREyff0opSF16V4p1xn?=
 =?iso-8859-1?Q?5Vel7qza8NLH9wBGKBsrx26Z938zGq/GzWli3lk1fsgU2l3NzP0r4msAt9?=
 =?iso-8859-1?Q?e2JrHoly+T5NWuvErYF7ysKgJobKuddApAVBptyupwQoSndcg+oXfXLSoH?=
 =?iso-8859-1?Q?9ktzQSiSvIXh36MxDHOyEx0stayRp3fVx4TZc8Qd46pP4DUugTaOwAeBns?=
 =?iso-8859-1?Q?IB0SYv6mtm4JrLYHCiGifPnbVnOdL0jkWoxvgNDulib2h9G2W8eOqQ1yVr?=
 =?iso-8859-1?Q?SPhyfphF0+2a1Dv0uIW3SoL4q2kAfK2KnP7Rjliz4CdlVJtLwNIbHMDJoV?=
 =?iso-8859-1?Q?bCSuSjtJy2rOvShYZeioDH8kqZsbiiqed3zYl//uH/rtpa+XUEYrPj+GRS?=
 =?iso-8859-1?Q?oAZbQ8fM1+9B5SXDY5DT7mvmt5fKj9axdBvfVa+mzW1WsKL46iLBwB/En6?=
 =?iso-8859-1?Q?8s30WjOqNkFDYeKkzkI17p5yXwW31hC8vPCvoKHhzHIDmS/Hareh0PuvLh?=
 =?iso-8859-1?Q?UTCnAKzcNmRhs2qmgPs3cYIA0EeLTT5+/WbWFFG9hRdsx99/71AVpKqy8Z?=
 =?iso-8859-1?Q?49y3DxDcQZAvzoB7yVhIYoeI//8/Z++L9sptcLBL+hHlk0OJjkzyEHcdUt?=
 =?iso-8859-1?Q?xGvs/nJYbFC0VaDGaR9WH5QY1UhwjSuLdGcCkWVZM2KrKzV8OUtQ8cUusK?=
 =?iso-8859-1?Q?CjQYSKw5hXQxUvVnO/02797Xwx9eouSC74zFxvXnyswREZtQF3QPnhFRyt?=
 =?iso-8859-1?Q?Xch7y8f+QWv+x3259AQhZlk/TVJgJBL0Pu8PifKeZgcPfCjCmDk3gEMVT5?=
 =?iso-8859-1?Q?OvH92UVWodgIoJBOInftBUSLk5pMIHjh1lML/mK525k6HfSLBZtnD0MmJ9?=
 =?iso-8859-1?Q?qUsoQWZXi0zaAe0aTvvcsu7NDBtvfTnxxzK1qeVfkokiIzK7dgBZ2MjEs9?=
 =?iso-8859-1?Q?E5wEGvLfhpWDDypgkdqcBnO5/LxXW4T6ZxP3o1zw2DGR2T5vxq1q49zcUV?=
 =?iso-8859-1?Q?yk/FRYW9qF/3E0j7ArNxiErj/DYFJMT8+Ogvt0p3UOgPUs0asvnzQNwdTw?=
 =?iso-8859-1?Q?58wHQCANnVMxatR3wxZUA2wOxueXyU9AdOo7Q+ZcLatog6VACKyTanAd8d?=
 =?iso-8859-1?Q?lmLFwvmYIkk4HMmD5Cl4MQwX1+MG1H4TEfDWVjYVBaoWLkeUFQ9lpKlHUU?=
 =?iso-8859-1?Q?/qFXJmV5WkNij2EBSV94W/cxDfrsa1eWW3VRyEvidnqxP7FCPiBPCnOzHl?=
 =?iso-8859-1?Q?YLwfabIWP4spM=3D?=
Content-Type: multipart/alternative;
	boundary="_000_AM4PR0201MB20975667EA5BA27E0326E3BEE91D9AM4PR0201MB2097_"
MIME-Version: 1.0
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM4PR0201MB2097.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d513988c-3c84-410e-fc6f-08dad8efb670
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2022 07:42:09.5675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 20d0b167-794d-448a-9d01-aaeccc1124ac
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VLZiDaeSWAySDZQX4+9Oo3K/HJrbJYSD0vxnv4DqlSrXq7dAriJQc/h5fNQY0D0J8INsz7dhij8Utjvw2LirqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR02MB9408
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 07:42:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174391

--_000_AM4PR0201MB20975667EA5BA27E0326E3BEE91D9AM4PR0201MB2097_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Qt6 should handle this already with https://codereview.qt-project.org/c/qt/=
qtbase/+/371780 in place.
I tried test build with the mesa upgrade and didn't catch any build errors.

-samuli
________________________________
From: Martin Jansa <martin.jansa@gmail.com>
Sent: 07 December 2022 16:10
To: Otavio Salvador <otavio.salvador@ossystems.com.br>; Samuli Piippo <samu=
li.piippo@qt.io>
Cc: Markus Volk <f_l_k@t-online.de>; Khem Raj <raj.khem@gmail.com>; openemb=
edded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org=
>
Subject: Re: [oe-core][PATCH] mesa: update 22.2.3 -> 22.3.0

On Mon, Dec 5, 2022 at 3:04 PM Otavio Salvador <otavio.salvador@ossystems.c=
om.br<mailto:otavio.salvador@ossystems.com.br>> wrote:


Em seg., 5 de dez. de 2022 =E0s 02:52, Markus Volk <f_l_k@t-online.de<mailt=
o:f_l_k@t-online.de>> escreveu:
Am So, 4. Dez 2022 um 09:23:49 -0800 schrieb Khem Raj <raj.khem@gmail.com<m=
ailto:raj.khem@gmail.com>>:
Not sure if this is related but I think its somewhere in egl headers provid=
ed by mesa.

This is related to an update of the egl headers in Mesa, just as you though=
t:
https://github.com/meta-qt5/meta-qt5/pull/491

It looks fine for me. @Martin Jansa<mailto:Martin.Jansa@gmail.com> could yo=
u check the PR above and merge if fine with it?

Thanks, I've merged this yesterday.

+Samuli Piippo<mailto:samuli.piippo@qt.io> as qtbase in meta-qt6 fails with=
 this mesa upgrade as well.

--_000_AM4PR0201MB20975667EA5BA27E0326E3BEE91D9AM4PR0201MB2097_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);" class=3D"ContentPasted0">Qt6 should handle this alr=
eady with
<a href=3D"https://codereview.qt-project.org/c/qt/qtbase/+/371780" id=3D"LP=
lnk780937">
https://codereview.qt-project.org/c/qt/qtbase/+/371780</a> in place.</span>=
</div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);" class=3D"ContentPasted0">I tried test build with th=
e mesa upgrade and didn't catch any build
 errors.</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);" class=3D"ContentPasted0"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);" class=3D"ContentPasted0">-samuli<br>
</span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Martin Jansa &lt;mart=
in.jansa@gmail.com&gt;<br>
<b>Sent:</b> 07 December 2022 16:10<br>
<b>To:</b> Otavio Salvador &lt;otavio.salvador@ossystems.com.br&gt;; Samuli=
 Piippo &lt;samuli.piippo@qt.io&gt;<br>
<b>Cc:</b> Markus Volk &lt;f_l_k@t-online.de&gt;; Khem Raj &lt;raj.khem@gma=
il.com&gt;; openembedded-core@lists.openembedded.org &lt;openembedded-core@=
lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [oe-core][PATCH] mesa: update 22.2.3 -&gt; 22.3.0</font=
>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"ltr">
<div dir=3D"ltr">On Mon, Dec 5, 2022 at 3:04 PM Otavio Salvador &lt;<a href=
=3D"mailto:otavio.salvador@ossystems.com.br">otavio.salvador@ossystems.com.=
br</a>&gt; wrote:<br>
</div>
<div class=3D"x_gmail_quote">
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left:1px solid rgb(204,204,204); padding-left:1ex">
<div dir=3D"ltr">
<div dir=3D"ltr"><br>
</div>
<br>
<div class=3D"x_gmail_quote">
<div dir=3D"ltr" class=3D"x_gmail_attr">Em seg., 5 de dez. de 2022 =E0s 02:=
52, Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_blank">=
f_l_k@t-online.de</a>&gt; escreveu:<br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left:1px solid rgb(204,204,204); padding-left:1ex">
<div id=3D"x_m_1949578005322084513m_-7398430256557306960geary-body" dir=3D"=
auto">Am So, 4. Dez 2022 um 09:23:49 -0800 schrieb Khem Raj &lt;<a href=3D"=
mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;:<br=
>
<blockquote type=3D"cite">
<div style=3D"white-space:break-spaces">Not sure if this is related but I t=
hink its somewhere in egl headers provided by mesa.</div>
</blockquote>
<div><br>
</div>
<div>This is related to an update of the egl headers in Mesa, just as you t=
hought:</div>
<div><a href=3D"https://github.com/meta-qt5/meta-qt5/pull/491" target=3D"_b=
lank">https://github.com/meta-qt5/meta-qt5/pull/491</a></div>
</div>
</blockquote>
</div>
<div><br>
</div>
<div>It looks fine for me.&nbsp;<a class=3D"x_gmail_plusreply" id=3D"x_m_19=
49578005322084513plusReplyChip-0" href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">@Martin Jansa</a>&nbsp;could you check the PR above and mer=
ge if fine with it?</div>
</div>
</blockquote>
<div><br>
</div>
<div>Thanks, I've merged this yesterday.</div>
<div><br>
</div>
<div><a class=3D"x_gmail_plusreply" id=3D"x_plusReplyChip-0" href=3D"mailto=
:samuli.piippo@qt.io" tabindex=3D"-1">+Samuli Piippo</a>&nbsp;as qtbase in =
meta-qt6 fails with this mesa upgrade as well.&nbsp;</div>
</div>
</div>
</div>
</body>
</html>

--_000_AM4PR0201MB20975667EA5BA27E0326E3BEE91D9AM4PR0201MB2097_--

