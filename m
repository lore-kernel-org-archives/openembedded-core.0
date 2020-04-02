Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.71])
 by mx.groups.io with SMTP id smtpd.web10.4505.1585789457663974940
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2020 18:04:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mdrID1UX;
 spf=pass (domain: windriver.com, ip: 40.107.93.71, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BVdFav+HvIZVdN2+NecevYn54R2SnR9Ox1o6ywW7qFpR5u8i3wb6h+7UHawsEAsnhtNConQ84QnMYfGX26/TDXGXjBXqwjL47AIGdZv6hcT4ZAuLN4+mjULV6Z3x8b6mH5q+hBTq3h6Zv73G9BZNH6FqfSlTNLDiAQbvSic9ETySX8DjY+uhW/knoA3x1/uzXqu39/95hiNo2hOq8SZBAreZ+/I/HYGhrVMABci9jYzBqBUH19XtkRRYBoSdIM77z3Jw6WJ6HhpEd/Mz8vZq3hFN5oK6vzi5/pzH282pR9xyayX2iR0Z8brAF9NqfV00G2B9PEqWxDm3iOZ36vMCWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjMe5BTwrrkl8JoycPzIesFKx+bAeMfDpqwu6wR6L54=;
 b=i7jJ1vnwQk7vwoNAb13N9Mrk6GxZyEhT2o5aY5KqYQHyZMwIMFPR3w5xtLLviCKbkZRK1H65heBTnbxZROviq/+hPa+oc1PFDW5sPjsLSVEq6QCLPdX6dlCklbYc40/JF3fyZZlFeud9b6hj32uibI2hZtj8VtmTvHBfVh19RL6RxFpbA7r7oQjYnlv3xKDZLfPoD6UDyEj4TaCsoEOinE2W1Updb1BdKkg/ivniLGBpORY5IZ5MeaiI3UdzJtpnalZdTHldTR0mDHG+HWYD1fLO2oQE6jRWFhsFUoMjEo8M5Kar44v3B1RIy7T2+qCUm1ZO587GBDcvtbMZSpnlFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjMe5BTwrrkl8JoycPzIesFKx+bAeMfDpqwu6wR6L54=;
 b=mdrID1UXL+RhqwrVk9BCPmPTdnqFE5OAJYvsd7SOGS1782BpZnpnrqh+wOk7CtPDkgLHWhhkYbjJAByW/v/dJvr0ORRDXvku4zBwm+qsofpc8ZGawRseScUiqCSUIFnhf3D/PNwjXAy3V9mhJddY7A9S3J7todrjVGqr3uAlvk8=
Received: from DM6PR11MB3817.namprd11.prod.outlook.com (2603:10b6:5:13a::24)
 by DM6PR11MB4057.namprd11.prod.outlook.com (2603:10b6:5:19d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15; Thu, 2 Apr
 2020 01:04:15 +0000
Received: from DM6PR11MB3817.namprd11.prod.outlook.com
 ([fe80::4525:e309:ac00:1d22]) by DM6PR11MB3817.namprd11.prod.outlook.com
 ([fe80::4525:e309:ac00:1d22%7]) with mapi id 15.20.2856.019; Thu, 2 Apr 2020
 01:04:15 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] netbase: use git fetcher
Thread-Topic: [OE-core] [PATCH] netbase: use git fetcher
Thread-Index: AQHV+3SzML6UFHNE/UmXYBZPqj4N1qhkFp0AgAEHgV4=
Date: Thu, 2 Apr 2020 01:04:15 +0000
Message-ID: 
 <DM6PR11MB3817A3F80E8DDECB26B53376F1C60@DM6PR11MB3817.namprd11.prod.outlook.com>
References: 
 <1584350653-141457-1-git-send-email-mingli.yu@windriver.com>,<796ecb1469a1944bb7386c5c6ba9bfe580795057.camel@linuxfoundation.org>
In-Reply-To: 
 <796ecb1469a1944bb7386c5c6ba9bfe580795057.camel@linuxfoundation.org>
Accept-Language: en-US, en-AS, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Mingli.Yu@windriver.com; 
x-originating-ip: [192.103.52.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a8c67539-40fa-438c-48a1-08d7d6a1c3ad
x-ms-traffictypediagnostic: DM6PR11MB4057:
x-microsoft-antispam-prvs: 
 <DM6PR11MB405762E53C04F85FB73C2F6EF1C60@DM6PR11MB4057.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0361212EA8
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3817.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(366004)(396003)(136003)(39850400004)(376002)(346002)(66946007)(76116006)(91956017)(6506007)(66556008)(66446008)(7696005)(33656002)(86362001)(71200400001)(64756008)(53546011)(186003)(2906002)(478600001)(19627405001)(5660300002)(110136005)(26005)(66476007)(52536014)(8676002)(316002)(966005)(81156014)(9686003)(81166006)(4744005)(8936002)(55016002);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: windriver.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 6QaSsc8iUh4UqVOydtBVaE9KDTZ4r3F4DxNQWKtSLl8tMQ7Cz6VBMWjSoOS9uiNCaD/vH5y3eUbNz+QqubLtVHTKaknT9IgjmSRh6oLTNdfqCHkVYH8UWxspIL7t8uuOJ/UqI20juWvMzm3IAkOy04zGVT24GuYh6S9BUpRrr2C2hirZ4oTdCXBW5vloiuK9EwEKd/TQAzGlyYgOaU1OvQUJfwfQfYbd/XUWyqZe437mJR81VkY/iDFEwKJHUvsG/JE9UvqmmiGqFaNIRaO4b6VQg9NPmJ+I/FJHJdvN+leMZ0Rha4+SgbtdN/jrYsOPM1MAnMoQ/qB0x47Wlz4jOpjciU03RlZnE2jx4XLAdNKoJ9es0eLgCT0tkUBTEpiHpvaDiJd33xtIzBC9tCfx0ozDOUmt6ulb8SegTZS29K0I+6oE9SoDkstqz2eCmC78Z/2BZgGgxjul1M85qnuEYpWikQ9dn9ueCAy6gtbusnif+pLwv9FiaeSj8N+gxEz25C5iZ8xQXmZYx3XulsVwoQ==
x-ms-exchange-antispam-messagedata: 
 JRbD5/gj2WyP97DmOUH3a+kD4qr/RhtFFR2XKgH0u15prdP6emUsT9GukJSgV4Sg36oTQIB9NHy9qw55LzhjjyOWL/gCMEJ/WKWT8k4uBq1Sf3b1lQYgI3wHOSLVb/esR2SB6iy9PnY/Lb8r+EW+Ig==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c67539-40fa-438c-48a1-08d7d6a1c3ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2020 01:04:15.6067
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VwcsFP2/RuWmBO6BdQVFNjSpphXfhlLwc8XaOHJlctWKaPTm2/bub7IXsdLFYa7cgR/P7YJCRah8pcFXSFI7Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4057
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM6PR11MB3817A3F80E8DDECB26B53376F1C60DM6PR11MB3817namp_"

--_000_DM6PR11MB3817A3F80E8DDECB26B53376F1C60DM6PR11MB3817namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I will look into it.

Thanks,
Mingli
________________________________
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Sent: Wednesday, April 1, 2020 17:20
To: Yu, Mingli <Mingli.Yu@windriver.com>; openembedded-core@lists.openembed=
ded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] netbase: use git fetcher

On Mon, 2020-03-16 at 17:24 +0800, mingli.yu@windriver.com wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Use git repo as the the previous URL only stores
> the latest source file and fails to locate the
> source tar file if we don't upgrade timely.
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-core/netbase/netbase_6.1.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Breaks reproducible builds:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/825

Cheers,

Richard


--_000_DM6PR11MB3817A3F80E8DDECB26B53376F1C60DM6PR11MB3817namp_
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
I will look into it.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Mingli<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Richard Purdie &lt;ri=
chard.purdie@linuxfoundation.org&gt;<br>
<b>Sent:</b> Wednesday, April 1, 2020 17:20<br>
<b>To:</b> Yu, Mingli &lt;Mingli.Yu@windriver.com&gt;; openembedded-core@li=
sts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] netbase: use git fetcher</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Mon, 2020-03-16 at 17:24 &#43;0800, mingli.yu@w=
indriver.com wrote:<br>
&gt; From: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br>
&gt; <br>
&gt; Use git repo as the the previous URL only stores<br>
&gt; the latest source file and fails to locate the<br>
&gt; source tar file if we don't upgrade timely.<br>
&gt; <br>
&gt; Signed-off-by: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/recipes-core/netbase/netbase_6.1.bb | 6 &#43;&#43;&#43;---<=
br>
&gt;&nbsp; 1 file changed, 3 insertions(&#43;), 3 deletions(-)<br>
<br>
Breaks reproducible builds:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/79/build=
s/825">https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/82=
5</a><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM6PR11MB3817A3F80E8DDECB26B53376F1C60DM6PR11MB3817namp_--
