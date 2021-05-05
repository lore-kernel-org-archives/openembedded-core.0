Received: from EUR06-DB8-obe.outbound.protection.outlook.com (EUR06-DB8-obe.outbound.protection.outlook.com [40.92.51.103])
 by mx.groups.io with SMTP id smtpd.web10.1783.1620242714876707406
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 12:25:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=Q+WIiVB1;
 spf=pass (domain: outlook.com, ip: 40.92.51.103, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KZFRafq6LyfyI+dWQKr9xKjMrqT/RMuATRRFWmG5ivuhXXHyTH3tGCHgxUN6PBLWb2emfHzUuLj/GXwrTWR1aZ7+Z/BEWOCNfXXFRCbzQ68MSxS03ggcITBrbztYwZovDA+X9PWxE6b3K6hzr2VZDmdKaIALESJaW5LNX3iEqrDpbQT86d7WJX4mYPhVBfz8c39rHWt39xOE82ZU9m2Nhlg1OWSosBkEbXvUOS3kedxPLF/fSIlldYjC+rpbqBemQruO1JrhkcXMBMxCd8wheK+cByF+9F/FdFOGHuSqcQKgdQXYSDVtjZUyxA3AnbeDVHsGs8ilHBm99rb1jkrFNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jm0X8b5Ck7e2Zg3oeUXThdM9BpqOIK5OiPD+p5a/b0E=;
 b=aKrC8JAS1L0xetoMPslNeEAx8BGk152hECSgnxBfwSbZlzuihJRW+rIE3xmwMa8n67EBALrtXxmN7nDVWaIkidEahUpyajPE8yiGGpML5Q/z/vLcJ5KeLpr7yME1rKGiFKL7QCK+9WL/RKdSoOplhFY6Y/vzzJOKZERKWmXdcK6Ij89wiTIQAikETuZBbna/LXKLhUy3LGEd+uT8rHjxVMUSZUHwSWqLyVnTlfloeoKV091370zHTOaBvSXCmo71JD1uyXVdWqtU7Md8Dk3qJv0PzzCrcR7Bii7P6qYmbB0fKujGSqp5t3dDbUYa7WB0Tji5Cfq0r1OJNUCEjEf8Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jm0X8b5Ck7e2Zg3oeUXThdM9BpqOIK5OiPD+p5a/b0E=;
 b=Q+WIiVB1CqB2Qd3Ti/HcHR7IPwWLk+ZZyhRvcZTjla3ZaX/8Rg+W8sNdgidmycm66Bys5KY/wwaOaso7nxU86kseD9nQc9y0QZTxKXrUUf/8UeW+YLU+S/KSmfC2hrneSfin3nHSvO4kJZqQhON1uwoylYAIvQsgc9crPhxhq+XmBYFHn+VJ2HG3WrKzvyA9UUdQ1N7TnpquC1IRoRGq1H/Qgsfcv12nj5/Sh8Yew11UAUc1PzFh65/D3GBwrkLDz+9hvjC40HaZP+BjUlChRr3B5BLthfZ3Xn8eY0rwLn7g/r/CRA4xzNh/XGwnKlQkGA8bHbaA+URmzNXbnY523Q==
Received: from VI1EUR06FT040.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc37::48) by
 VI1EUR06HT098.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc37::286)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27; Wed, 5 May
 2021 19:25:13 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:fc37::52) by VI1EUR06FT040.mail.protection.outlook.com
 (2a01:111:e400:fc37::327) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Wed, 5 May 2021 19:25:13 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:3FCD59A275052D2FA904AA3082B4E36C1E549E8D3536F55EF700982EDB160822;UpperCasedChecksum:11864A021AEBFBDB8801F91AB87809592BC67AEC8846B468B6F963C02902564C;SizeAsReceived:9226;Count:48
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::9c9b:9858:17df:de84]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::9c9b:9858:17df:de84%6]) with mapi id 15.20.4108.025; Wed, 5 May 2021
 19:25:13 +0000
Subject: Re: [OE-core] [PATCH 57/61] python3: add markdown/smartypants/typogrify modules
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
 <20210505151850.660512-57-alex.kanavin@gmail.com>
 <AM9PR09MB4642132C2006E4609CA966C7A8599@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CAMKF1sreCuyXW2wNh_1xaG+E_T=NFLuLq68vmFQegDJ1HTWiYg@mail.gmail.com>
 <CANNYZj8VfB5sO4O3tjpUDHseBTMwYG-kRGwVUERmAjJSH61=oA@mail.gmail.com>
 <AM9PR09MB464224482626504F72484641A8599@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CANNYZj9M5Gy34YJacwpYLvbyBREpAdPT5_uszJs5p=LnPXyLHg@mail.gmail.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB46420A8B633050319875E0C8A8599@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Wed, 5 May 2021 21:25:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <CANNYZj9M5Gy34YJacwpYLvbyBREpAdPT5_uszJs5p=LnPXyLHg@mail.gmail.com>
X-TMN: [kOA8rZUivISAOrpixyFBwixGUW6m4eVH]
X-ClientProxiedBy: AM6PR10CA0100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::41) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <a14715f9-fd1e-e0f1-6a1d-501f7c44bdda@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.89.134) by AM6PR10CA0100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend Transport; Wed, 5 May 2021 19:25:12 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: d599c34d-069b-4fba-f172-08d90ffb8150
X-MS-TrafficTypeDiagnostic: VI1EUR06HT098:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7lALnQCCh+eJBSw5LetaExAevpsKby7cAdLhBRZ3EjRsIkm/e7hR/5n/890hFKedWPj8FzeqPhJWlGjRTckbH4f2h6mINwdn/8Z8135Lni3FBsqJg2/ENEiK4AWRDzVoOMFG5bEOWwPskgmNPXUa7Yu2ihAnwlYWSUgznmQN0ltVAQhxmi4XQaOPf458/fMeGsknXGkZVxW87OLr4C1tmfChdDS1hPb6Ds3QcM2MueD2USIOAx+daYcWIvFnGakof6/xV/EduU6reK2DFZmkOdv/YKdTIRP1Sm07HlIBf5NzyTlNNIjO7p8Eg3UcvEd9BAyLPprDfmBYhkYiroOO0XN+bXyjdOVLfPNXva6l+qw8AtywCzA3KJ4eX9626Lk0kOUQtjelgltOyFM+WgEnX6+SHrfHcurx/tjGAfH2qtI=
X-MS-Exchange-AntiSpam-MessageData: 
	CHOrg9PP8JhurO9fm2JoBMviyxptqgry7DiECRv2/ZiXctUfbwwVwEYvvZqG+EbrQoHORzOv6PkoZjj9oca9LJHE7uSckrLHNlzrRv4d4/Bd0PoDid2KcYmi7UEa6fkvOGw+l6dVzrFju2orO8TlBg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d599c34d-069b-4fba-f172-08d90ffb8150
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 19:25:13.2221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR06FT040.eop-eur06.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR06HT098
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 05.05.21 21:11, Alexander Kanavin wrote:
> On Wed, 5 May 2021 at 21:06, Konrad Weihmann <kweihmann@outlook.com 
> <mailto:kweihmann@outlook.com>> wrote:
> 
>     On 05.05.21 21:03, Alexander Kanavin wrote:
>      > The repo is here:
>      > https://github.com/leohemsted/smartypants.py
>     <https://github.com/leohemsted/smartypants.py>
>      > <https://github.com/leohemsted/smartypants.py
>     <https://github.com/leohemsted/smartypants.py>>
>      >
>      > I opened an issue:
>      > https://github.com/mintchaos/typogrify/issues/56
>     <https://github.com/mintchaos/typogrify/issues/56>
>      > <https://github.com/mintchaos/typogrify/issues/56
>     <https://github.com/mintchaos/typogrify/issues/56>>
> 
>     Thanks for that one - but if this project is still alive (just
>     relocated
>     from bitbucket to GH), wouldn't it make more sense to introduce the
>     2.0.1 version pulled via git instead of the pretty outdated 2.0.0
>     from pypi?
> 
> 
> I don't think it's alive, open issues and PRs all dead, last commit in 
> 2017 shortly after 2.0.1 release.
> 
> If it becomes alive again, it'll almost certainly be a fork in another 
> location,
> and pypi would then automatically take care of it for us. Besides pypi 
> recipes are
> much easier to write, and this is a very marginal module :)
> 
> Alex

Agree - looking at 
https://github.com/leohemsted/smartypants.py/compare/v2.0.0...master 
there isn't much of a functional change either.

The status of typogrify isn't also not very convincing - changes from 
2014 till today haven't been released - so it might be worth a shot to 
open a ticket at gi-docgen and ask about the need for this 
outdated/likely unmaintained dependency
