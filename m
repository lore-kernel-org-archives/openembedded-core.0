Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.51])
 by mx.groups.io with SMTP id smtpd.web11.6058.1585795077370606484
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2020 19:37:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=R80D+KIg;
 spf=pass (domain: windriver.com, ip: 40.107.237.51, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lBjUtG37x7IFRBySCAJuWPcm+K1D5bqpE+oZl+cfbKIqtVm7dShc6v5UKj8DAxnUw0QnMBWEeXIc6Eoxb2lI2xo9YNVKQKdZBG0lTBBcdmzSZuJx76p94+EeyW0appA99heuRx8xyez71Ea5lrr8W82Y6cJmjKxvE7ITsOKmEL0DYZ7w2vzP82k5HJKZrWAsNiEHQTnCO8FBplszoKfXHB0fws5yxEzZ7wf5mTWXp5bUqV70Z4YVka48AsOXZpO91ONz441bwxXyCdA4wREf9jBYR0F1blfnm6LGM7Uq7ZuVbTJCOWwPIiOc1/+jRM+g0/kiULzm27AJ5PVFXn9/og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EvvrEzVhKoMo1eMc0PFbilTpWGqoALnJlorAA9YOp0c=;
 b=ih9jG1FCTglNlmnpsWw/CJsfhmH5MXyJ4vQXTjdGztdGE1In8wbOGuuQVsWOr0l4YuF3ux7iBeRRlfpY9C/c7EN3slI3bHnG1YjXup5GNb//8NeHtrowHis+OLwuzVsIVOBSYDhsg/CcY7dbOncQGQx2duZQYursZ9RemhNbdoUnlL7/+hLcW5gDjyawjrGwpsXEKtPpeCLmPXCHoMPOlu/kY3eYVlNEquHC+tmKp3nknXp0x1MDKQhzA/uQfFTbKUM6Hq/1InGt1eqMVcNhDBii1Sp2OO8vpchEecyToX5m6cdSTi5hOHuVUgQjBKa6jnAF+q2H6FrWP1w7XkvBuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EvvrEzVhKoMo1eMc0PFbilTpWGqoALnJlorAA9YOp0c=;
 b=R80D+KIgVtGro0PDqM+dwROxXG4umusDF7/4Hqaezuv5y2GJvXbf/07QCdZynT+jOZy3OahKoPpDC2JSTH5HLnCKMEuFlpc5glPof4UT/Blz7NvR7pwOh7xPb3vXfZxZzEZsPDhtfDaKQ/gglLkZCEJZfjEN+yGhy3so/Jbt+Yc=
Received: from DM6PR11MB3817.namprd11.prod.outlook.com (2603:10b6:5:13a::24)
 by DM6PR11MB4153.namprd11.prod.outlook.com (2603:10b6:5:19f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.18; Thu, 2 Apr
 2020 02:37:55 +0000
Received: from DM6PR11MB3817.namprd11.prod.outlook.com
 ([fe80::4525:e309:ac00:1d22]) by DM6PR11MB3817.namprd11.prod.outlook.com
 ([fe80::4525:e309:ac00:1d22%7]) with mapi id 15.20.2856.019; Thu, 2 Apr 2020
 02:37:55 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] netbase: use git fetcher
Thread-Topic: [OE-core] [PATCH] netbase: use git fetcher
Thread-Index: AQHV+3SzML6UFHNE/UmXYBZPqj4N1qhkFp0AgAEhdGs=
Date: Thu, 2 Apr 2020 02:37:55 +0000
Message-ID: 
 <DM6PR11MB3817B7D03D5961DA36C44231F1C60@DM6PR11MB3817.namprd11.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: b63adbde-9ba9-448c-b76f-08d7d6aed948
x-ms-traffictypediagnostic: DM6PR11MB4153:
x-microsoft-antispam-prvs: 
 <DM6PR11MB4153D6354AA0F1953E775A9FF1C60@DM6PR11MB4153.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 0361212EA8
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3817.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(366004)(110136005)(64756008)(4744005)(8936002)(2906002)(81156014)(966005)(26005)(53546011)(8676002)(6506007)(66446008)(33656002)(498600001)(81166006)(7696005)(66946007)(5660300002)(66476007)(52536014)(19627405001)(66556008)(76116006)(71200400001)(86362001)(91956017)(9686003)(55016002)(186003);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: windriver.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 hUG0i0pi3J5kycnNLuYNct/q7dfFP1rfBhT3f0Vrl0ZGmXtBzHlPhGBzRZDM2vFmqe5rEfEtffgkXUpHz32VRFREqYxbossuRM3Hqx2wK5qY5i5FHIHhpTGx7uBmlnZDmTMmvj4D0nCGQAAoAi7Itz5mTkLv5spH2vEbGduJTQq2pHLZ34YYewydUStRrwMum59clcw7iGirqHgf898t/31S6Ht2hd+v6Cr30faNb8g8jJ52CqPDUGRyw+vXkxnI/6FSP2e6db8sNclzmLVn1O31bepKAjn4yWFGe0PiBtif4MpT6F4ONsix8IEMWE6Er3HuCqY21GOcNCO9usUemo5VWy6X6yMPtKHaXNZsyN9QyUS1SW9w8rpSWIC1sEijvNOg+kG0RMPYVaupHpCEYl/utWf450JBBH096d9ZiZzrxmDq+9f5F8+b/FwOxFjKSgnb1lqomQ6VCkHoNZEGDnIuOyQkDjIqqMRa8kfSZDscfsVWpMNnbGseZXTtpmy31+SmNI2+a5kdY24T9YT1mA==
x-ms-exchange-antispam-messagedata: 
 6XD66jAA3j9QjQc4Y8OMfb9nYoNcQWFwcEuWxjatDcJsHLAKrZqiEo88KMVDPS3Mn5c4ZIHKurVrAMmhlw2QuvyeO3r1vWirobSuJnbUkzOZ1GYyd3Ut/ZSltokCLoTkicPLA3q0jvcvYtoTrs7lJw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b63adbde-9ba9-448c-b76f-08d7d6aed948
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2020 02:37:55.3100
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FYCL1GoTmfetwlbXa/dPu1VVlA8g+AH3Z7tIOhWYIXTfQkbq+MIzfLRihwqNAoVRE7OUc6hoTeqdWb+wjJI+lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4153
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM6PR11MB3817B7D03D5961DA36C44231F1C60DM6PR11MB3817namp_"

--_000_DM6PR11MB3817B7D03D5961DA36C44231F1C60DM6PR11MB3817namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi RP,

What's the error do you mean? I didn't find the error related to netbase, c=
ould you help to provide more info?

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


--_000_DM6PR11MB3817B7D03D5961DA36C44231F1C60DM6PR11MB3817namp_
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
Hi RP,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
What's the error do you mean? I didn't find the error related to netbase, c=
ould you help to provide more info?</div>
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

--_000_DM6PR11MB3817B7D03D5961DA36C44231F1C60DM6PR11MB3817namp_--
