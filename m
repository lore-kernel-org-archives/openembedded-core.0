Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.92.64.56])
 by mx.groups.io with SMTP id smtpd.web11.1667.1620935065964689236
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 12:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=LA2dW5ZQ;
 spf=pass (domain: outlook.com, ip: 40.92.64.56, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dRc9Vm0Gl1ygkGTf0chUoX9W3jN1jjK3e2WPMz7/m3CphvKJUAAxKV7ASuwisUSFItb1ON4B9Om3E6+cjAbtKKP+nPV0Un8inwI5iCd66YPMSuD9NrZzBI6ZvtRiE12m8sMn1z2kHnhbDV/xicnH9CtBMviOgl7XmE2ZeqRxb8hXq207Wn32cmQOar1/AKqnbBT+m5sVc28g0XMrA7NKwDpjevhDv4NfY7v90B+qXP/wYqI8rxtKXzw0INjN+tGZjN2n31qzo+xtb7gK29BhoHsi4Sy1B3eHsMZShZpsmKSnUT7Kf5c20DDBaziThshwmT+Y0l+QneF31VgWngoXRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2dyBJlkchBiryj9/MVF68cjzfohod9sq3ew6bTN6N4=;
 b=oHHDIV03HU0muZxGaJ3oBpY14X1X96I6oLbUHBMBM8aO5Oeat8Y1w0cY7tcxa0mHi+0Zgo2aabaO6xPF4LnJfa3ZyfHLcnahr8l2S67FqS94OSJiRIO2T6eRZiaDNLYqY0n/dYJVr1+JxOzRvv6dM4VN0mxTpL7BnIqesbyFqmfOWyJ3bcgXe9F4mYVT/0F51dUgMODc7eOndmqlhnZ+7gMS13FYzLpfneM32NfT9yZTBaWMEnNy7BpBwHo6CvoNfn5mRSMNhy/zz0VCyA9qhgCa2/86Kax8NQRcfICFFcyashZUqhUZQQmYlvtBQd+8vFWtweCjgdBgIUxa4iK1/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2dyBJlkchBiryj9/MVF68cjzfohod9sq3ew6bTN6N4=;
 b=LA2dW5ZQ59ixkAY+e3BIhfKkDXvK9Ptnq4OFAIAjSHmFA9nl+MO+CZS2hqSGG2Fx7J1chT7+0++7VYl2GARj+62XUpLc9/wdJmk2kw2PYYvkgC8LSEb/GkzijvEv/sMmFWQDWRuB+DqLOITsU3zwdC0Babhks0TUpMfQnlxij342ZtP6eMt9TQcWMElaopjCYF0OcTcOCLDQRy0RacD9Da3GD1Kb2iVIb2l1F4JaHiRzlsOeOStxpHyjVBsFZ5ZaWjyqRvCPoDCps+InzU2Er5soI3yRDRH1mIxpTDkdlR8KQgSdR1OcOU42uJkYlrU8aKvGFXrQvKptjLnBCJYl3A==
Received: from VE1EUR01FT035.eop-EUR01.prod.protection.outlook.com
 (2a01:111:e400:7e19::4b) by
 VE1EUR01HT093.eop-EUR01.prod.protection.outlook.com (2a01:111:e400:7e19::192)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 13 May
 2021 19:44:23 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:7e19::44) by VE1EUR01FT035.mail.protection.outlook.com
 (2a01:111:e400:7e19::236) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend
 Transport; Thu, 13 May 2021 19:44:23 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:BF08D23BED6DD34448414DE3A3030E85CFE08B19E932F6D52042B458D5767F47;UpperCasedChecksum:1E3FD344ED0463E8782BB5CBFD616FFEF1A1230A6DB12D590825FDB8208A6EEC;SizeAsReceived:8785;Count:47
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::9c9b:9858:17df:de84]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::9c9b:9858:17df:de84%6]) with mapi id 15.20.4129.026; Thu, 13 May 2021
 19:44:23 +0000
Subject: Re: [OE-core] master/main branch renaming and bitbake
To: openembedded-core@lists.openembedded.org
References: <CADkTA4OMd12mW9N37WtfUUHYZ=zQ9hsNb8sYanXU1q8MvLKj3w@mail.gmail.com>
 <1305.1620933899472438737@lists.openembedded.org>
 <CANNYZj_LDz9xV9iCW-N03xcGho0S12AaCQEvLb54UJw40FYPMw@mail.gmail.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: <AM9PR09MB46423E5A8EA819DA22C4B6D7A8519@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 13 May 2021 21:44:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CANNYZj_LDz9xV9iCW-N03xcGho0S12AaCQEvLb54UJw40FYPMw@mail.gmail.com>
X-TMN: [etnhTZQJ4WG3pD90Uw1ZPxebI4HP84Ah]
X-ClientProxiedBy: AM6P191CA0069.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::46) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <95eb89ef-5c1b-aa55-1aee-775d5ca86b55@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.89.54) by AM6P191CA0069.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::46) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend Transport; Thu, 13 May 2021 19:44:22 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: f07b024e-06d7-4793-9536-08d9164781d7
X-MS-TrafficTypeDiagnostic: VE1EUR01HT093:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3VzguQJ9VFDbP/2NxnJK/9+z4JeQUGR6eMS4xOlf/aB8zTyJvuxljO/wH8vnF+tL1rUVil5GsQ/Vs4oFNDvhkLLFwB4swE8ExwPnKoGBtntL1r1ZP09XMUj5gqoMK8UD4GOoJju990NucYFonIZ05xRWBVC3sj+hVlCtj2fgrbo4UpcV4KXYkUGFJOuEWotdczX/2Rpd8ANs96DqCJaezlfZFc7YjtM0oQf9JpvM/6kGUhzYu0f3ur0So5+jVnxA7ecLcyX2wh4MSURpWLJhczKCoanSaJcqos10wR9IAga9q8cF44YInsuSifN3XsyhZHz4kOa0SB2Uf0taMGIIQVIAGzIfu1KxxboEw8eoIXF3jgF0to7tXPzTGhbOxxXIvDnAK47+RUk+yj/6wYnp7nE8uZS7njGAGeoZN6OxWoxP4FkKJI6yV05AT17jRNSsccIZAarS7OwOjQYNG0xX7g==
X-MS-Exchange-AntiSpam-MessageData: 
	uc2VadrnwB3l7+A+MY6m6jLyZe5ybBs9YaCJ/bAbFrsvihTyYnLenUBbbDvYK5rqI8Uq6PQ1VjVMNUoearRabxb4flCd99K/EQyu6BH9K7AUpcdB6geCpamy7B2ZaXd8caQsY/2ytoXZObqclwFdDQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f07b024e-06d7-4793-9536-08d9164781d7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2021 19:44:22.9511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT035.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR01HT093
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

And IMHO deleting branches upstream is just bad practice. From a=20
Yocto/OE perspective I have to consider that people might want to build=20
stuff in 5yrs or even 10yrs from now.
a more reasonable pattern would be to branch off from master to main,=20
make main the new default but leave master untouched.

But this hard renaming of branches causes headaches when maintaining layer=
s.

Also I'd like to point out that there are plenty of examples where it's=20
just not the master>main transition, but projects deleting whole release=
=20
branches without a trace - so for me these extra security measures do=20
make sense and are really welcome.

On 13.05.21 21:36, Alexander Kanavin wrote:
> On Thu, 13 May 2021 at 21:25, Benjamin Gilbert <bgilbert@backtick.net=20
> <mailto:bgilbert@backtick.net>> wrote:
>=20
>     Deleting the branch normally affects people who are in the project's
>     developer community and pay attention to its announcements.=C2=A0 Th=
ose
>     folks can then simply update their local checkouts and move on with
>     their lives.=C2=A0 Everyone else just clones the default branch and =
maybe
>     checks out a particular tag or commit before building a package.=20
>     That workflow still works after the default branch is renamed.=20
>     Bitbake's additional checks are unusual, and impose a long-term
>     compatibility constraint on upstream projects that they didn't sign
>     up for.
>=20
>=20
> They're not useless though. As a layer maintainer I absolutely want=20
> those checks, as I want to be aware of any branch configuration changes=
=20
> upstream, and to ensure I'm not accepting a change in source revision=20
> that points to an unattached commit, or one from a branch that's not=20
> supposed to be used at all.
>=20
> Alex
>=20
>=20
>=20
>=20
