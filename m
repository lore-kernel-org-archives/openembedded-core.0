Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.92.64.87])
 by mx.groups.io with SMTP id smtpd.web11.11836.1591184117975298733
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 04:35:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=SHSgb2BK;
 spf=pass (domain: outlook.com, ip: 40.92.64.87, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ejWVJ4KOUZjvLuBmEMbAI08peOInuzVpVEY+ERXTTTI8ErVUve39QGCLyMa5ttKLMRlEG+7XLOGXDm4zSlm96DMLBjzG3ID9i3lUCi/85OM1R1/0ShmGe2PodcfOUpXUkqjnTjBk+0rO09H/CqFtL4nIa3sk9l4NYfZK5JSiJYR7PnLo0FbtIRFPiA5Qy63sFpnEh2ZgGX2bsFkx0iNPNi4P7CYVggCXneXPK5NKD9A3CQWaZugb2Do5EgjUUlPqAnWddQu7+b8ugX2YgVOX7Z2ZBH+kvVYFRlQqIUpJJMm39YQbM0h01M1ne1I+CPeVSoJCX52nKs7kcrWYmzGp5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JghZOJBKKHyXhhlGJTQJ8yYJaj+DXKeu9vGQSCxKuo=;
 b=VFtI1U9IhD9vJGAgf/Y5G87vwBNNMDkgjo2gaRVQxi4DWMzrkuojvAxk3wUoU8sL8gXUjzP8mkxeMO1pRm1qk4CMqkW0gyJbGH1RfRUF2b4L1QaTgH1oYGY4KOyZU/dtlVKwcramcUhAqzSktq5zzxptOBqTfdvFI/YtYpDCySlr8MgC5YGQxOSYH8m/0q4y2i6XTP3DMx8NlW5bwufzx5s03zOlACQJEd/a69wcpLweU5LrL4VsOH+sNPBObqLuFggB7M6JxRjpCFs6FIbuiEKAK727uVJ2Jjirq7YveILZ5MpkBBnLPTKgLS6lXHO4aspM01BUIUPcKHAZiixoug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JghZOJBKKHyXhhlGJTQJ8yYJaj+DXKeu9vGQSCxKuo=;
 b=SHSgb2BKtyiYtZJaOMmVBRIOpRJOYzF/PRmakciYc9dk/spm7sR7+/q2tu8OOJw70oMhxHcRrxqzSKz2JZDQ+QDlsOnxVAlnVdZi5Rl6kSlCS3AU2bBlyELmF9bHwwtQ6UQKqATQKNK54mak+3BSTWSIgspGFRdR+uRmAb/1o6zVa1YAQycpBhGapyANvGfI5Hz8YJ2nIoyhP7b1dBDvxihu9ubvSyAax3iRR2wggk7p7dROSsq1WphANoY3HuKqh1kkG8SfGhLC2IpQMiSlCD/v5HsTr/RhyjZfryBEJh28746KO8j82jAV2oKm/YEMYc3ZQRLtumkT43yZ3zwttQ==
Received: from HE1EUR01FT055.eop-EUR01.prod.protection.outlook.com
 (2a01:111:e400:7e18::4a) by
 HE1EUR01HT084.eop-EUR01.prod.protection.outlook.com (2a01:111:e400:7e18::295)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Wed, 3 Jun
 2020 11:35:15 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e18::4e) by HE1EUR01FT055.mail.protection.outlook.com
 (2a01:111:e400:7e18::284) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend
 Transport; Wed, 3 Jun 2020 11:35:15 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%5]) with mapi id 15.20.3066.018; Wed, 3 Jun 2020
 11:35:15 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] ruby: properly append PACKAGECONFIG
Thread-Topic: [OE-core] [PATCH] ruby: properly append PACKAGECONFIG
Thread-Index: AQHWOR6y/2ckYfUEPkGbR6OOIcgLWqjGlCcAgAAm7ICAAARVgIAABHTW
Date: Wed, 3 Jun 2020 11:35:15 +0000
Message-ID: 
 <AM7PR05MB6881B36256B16A9465D75C86A8880@AM7PR05MB6881.eurprd05.prod.outlook.com>
References: <20200602204418.26224-1-kweihmann@outlook.com>
	 <AM7PR05MB688165541EEC54AF8DE1016DA88B0@AM7PR05MB6881.eurprd05.prod.outlook.com>
	 <7deef78bc70f79f48cc8d9da5c0e18bcb305cfbb.camel@linuxfoundation.org>
	 <AM7PR05MB68817744EB44DC11D7870292A8880@AM7PR05MB6881.eurprd05.prod.outlook.com>,<275c7726e04b7da93cc068ad2ae6ce594b242ab5.camel@linuxfoundation.org>
In-Reply-To: 
 <275c7726e04b7da93cc068ad2ae6ce594b242ab5.camel@linuxfoundation.org>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: 
 OriginalChecksum:A012511452EEC82700E8FE537EF957FE6764798D9C71633BC2F80605A0133677;UpperCasedChecksum:5EDA8B4AAC8C1CD7A7B115E1ED43C8B1CEFFECEC9DA091DCFDE16C36162C5928;SizeAsReceived:7355;Count:45
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [Y0quXihkQQGCcCWAr7LQ/BQNy09AbudT]
x-ms-publictraffictype: Email
x-incomingheadercount: 45
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: a3482ae9-6db9-46a8-83ce-08d807b22fba
x-ms-traffictypediagnostic: HE1EUR01HT084:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 tUyFWThcOg6s5+d25YhzqwT2IsqhY/4ex7mckfZuQp7pdJBro6/oVMbBSjvIRxdZW3nQ5JY2piqZ2RbsBO+emvUqQzRRv81/243i2TiRv1ptYn3Llc4/oNLldQfCNi6CaaKI6454sxlQA/S2XCy17UmV+PdJMPtQ8pAFcsagjWGxIZnpXxGy2kyNq8yYZCAWZxr+X30XlPyLvqzoWKf7sw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
x-ms-exchange-antispam-messagedata: 
 CSamfDiq800dqVjS7/7kWvmIddPkcfp+dlR3m4DYS3GoJ8mwyKARpH8eIY3aWVOCbOrcuOkhGMkbnf8rd+gPV9sQWYKt/lekeTGgi2379KPrWJ79YFMeBv+Li04UNKN6OOdokK0YfpDo745EBuxlAQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a3482ae9-6db9-46a8-83ce-08d807b22fba
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2020 11:35:15.8006
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR01HT084
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_AM7PR05MB6881B36256B16A9465D75C86A8880AM7PR05MB6881eurp_"

--_000_AM7PR05MB6881B36256B16A9465D75C86A8880AM7PR05MB6881eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Agree. But I think that's the nature of DISTRO_FEATURES to be all or nothin=
g. Also there's the infamous _remove that can be used to get rid of DISTRO_=
FEATURES based flags.

So what do you suggest to do here? Merge them or keep them separately?

------ Original message------
From: Richard Purdie
Date: Wed, Jun 3, 2020 13:19
To: Konrad Weihmann;openembedded-core@lists.openembedded.org;
Cc:
Subject:Re: [OE-core] [PATCH] ruby: properly append PACKAGECONFIG

On Wed, 2020-06-03 at 13:03 +0200, Konrad Weihmann wrote:
> Well I see a valid point in keeping them separated.
> PACKAGECONFIG is just a static list of things, while the other
> setting
> is based on DISTRO_FEATURES. If we merge them, we kind force any
> override from local or distro.conf to copy the DISTRO_FEATURES block
> into their code or remove the DISTRO_FEATURES check - none of the
> options is a good one IMHO.
> With that in mind I personally would like to keep them separate and
> just
> fix the append.

There are two sides to that, its also near impossible for the user to
configure this option other than changing DISTRO_FEATURES if we use
append, we can't win.

Cheers,

Richard


--_000_AM7PR05MB6881B36256B16A9465D75C86A8880AM7PR05MB6881eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div style=3D"margin-bottom:45px">
<div style=3D"font-size:10pt">
<div dir=3D"auto">Agree. But I think that's the nature of DISTRO_FEATURES t=
o be all or nothing. Also there's the infamous _remove that can be used to =
get rid of DISTRO_FEATURES based flags.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">So what do you suggest to do here? Merge them or keep the=
m separately?</div>
</div>
<div style=3D"font-size:10pt">
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">------ Original message------</div>
<div dir=3D"auto"><b>From: </b>Richard Purdie</div>
<div dir=3D"auto"><b>Date: </b>Wed, Jun 3, 2020 13:19</div>
<div dir=3D"auto"><b>To: </b>Konrad Weihmann;openembedded-core@lists.openem=
bedded.org;</div>
<div dir=3D"auto"><b>Cc: </b></div>
<div dir=3D"auto"><b>Subject:</b>Re: [OE-core] [PATCH] ruby: properly appen=
d PACKAGECONFIG</div>
<div dir=3D"auto"><br>
</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText">On Wed, 2020-06-03 at 13:03 &#43;0200, Konrad Weih=
mann wrote:<br>
&gt; Well I see a valid point in keeping them separated.<br>
&gt; PACKAGECONFIG is just a static list of things, while the other<br>
&gt; setting <br>
&gt; is based on DISTRO_FEATURES. If we merge them, we kind force any <br>
&gt; override from local or distro.conf to copy the DISTRO_FEATURES block <=
br>
&gt; into their code or remove the DISTRO_FEATURES check - none of the <br>
&gt; options is a good one IMHO.<br>
&gt; With that in mind I personally would like to keep them separate and<br=
>
&gt; just <br>
&gt; fix the append.<br>
<br>
There are two sides to that, its also near impossible for the user to<br>
configure this option other than changing DISTRO_FEATURES if we use<br>
append, we can't win.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</div>
</span></font>
</body>
</html>

--_000_AM7PR05MB6881B36256B16A9465D75C86A8880AM7PR05MB6881eurp_--
