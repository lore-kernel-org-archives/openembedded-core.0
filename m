Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.86])
 by mx.groups.io with SMTP id smtpd.web10.8920.1616682647704074986
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 07:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topicbv.onmicrosoft.com header.s=selector2-topicbv-onmicrosoft-com header.b=qLV8Vuoj;
 spf=pass (domain: topicproducts.com, ip: 40.107.21.86, mailfrom: mike.looijmans@topicproducts.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OoGoa1PCSPESilVDnAdAS9uyG046ZC2n7dunV+ebqqo=;
 b=qLV8VuojQS8kI1ob5vBKlbkkYpfS1QUytD8R7fFp2TqIn7ZGLTna8A/ig2YFMJDUCMP+4zILaz/lBtYxsr5wcd/LCOgJ9zpILeK8cqqBn7AnS4JbVWIKOYMmC1S9OGN+1L/17mMCOi7zlHGQx2bRr5TJtsz/9Bxnh8lyETjiDP8=
Received: from MR1P264CA0022.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:2f::9) by
 PAXPR04MB8238.eurprd04.prod.outlook.com (2603:10a6:102:1bc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Thu, 25 Mar
 2021 14:30:44 +0000
Received: from VE1EUR01FT014.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:501:2f:cafe::4a) by MR1P264CA0022.outlook.office365.com
 (2603:10a6:501:2f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend
 Transport; Thu, 25 Mar 2021 14:30:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.81.10.179)
 smtp.mailfrom=topicproducts.com; lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 13.81.10.179 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.81.10.179; helo=westeu13-emailsignatures-cloud.codetwo.com;
Received: from westeu13-emailsignatures-cloud.codetwo.com (13.81.10.179) by
 VE1EUR01FT014.mail.protection.outlook.com (10.152.2.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Thu, 25 Mar 2021 14:30:43 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (104.47.17.108) by westeu13-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Thu, 25 Mar 2021 14:30:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z7lbu7AuSqIJbDWnJ7u93dsnczSGOrn9uH15OxrfL2YmyCDB8lyXLIy73I2gimnLWUBkOvxEl04s+zT7cbsuTF+EBKivFSEAeLGoQ5IjeRqsUwR1NLcV0SuSawctTrfuRABhEkSEXjZRuG614vL2+jjMbFdt6F/MAlFPs1XiqSHEeEzCVrIUknBFAUX8eM1n1GZvSdrfgGoB+NSGtR2RobRLPpryO7HRSm1jogbiKhdjMMYhgtYh4hUnTuZRyqqeRz2YRDdtxUuCEvc0WGrE3aUOV8AzGyGjv3KMKrKoPfbhH1McdJCudws7MglqPb8LgcKvJDAFogyUzlAbfGyG0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T8qdHSza6sMFM+RNXg5ivxfP2IsU9V6c5tbgspVb9Pc=;
 b=NRK7W7TRoTrvyjuwSpf0uEZZCoztEkv3thtcttLypQLWNudzmKchUwYzCEHDqj+LXLt4XgJXVjI+ht184KMvPl2c+DxojXEegcv/xky1Mf+SNiubv2Rs69d5Uj5l1RgL8UmX5P60YnzlrYt2rsqLaS0A4m01AGSWbM/YxW+d8vvjAT3GGH4D0gxiePxwgIVInJ96Xk6izAXmArxrASj6zNhoi7WQq1DYcah7CQVFTc0Dnqr/uimP1Daip/wvxhOarGsjccmkFIh1Rh1lvL/Mi5YNmahJYC+aZ3vok0fVJVmo/d32Rx8RNeEhomw2nVjCUq0CLkJsbVBu2YOwqTLHvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB8PR04MB7034.eurprd04.prod.outlook.com (2603:10a6:10:128::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 25 Mar
 2021 14:30:39 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988%7]) with mapi id 15.20.3977.025; Thu, 25 Mar 2021
 14:30:39 +0000
Subject: Re: [OE-core] any *compelling* reasons to whitelist env vars for an OE build?
To: openembedded-core@lists.openembedded.org
References: <429b51e-7cc5-54a7-a28-7e8beab0c77d@crashcourse.ca>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.437c1374-0ed0-4179-b9f8-331319118723@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.1ce5b84f-c798-4314-b673-c5072a296141@emailsignatures365.codetwo.com>
From: "Mike Looijmans" <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <dc3e6ce6-21fe-729f-63e9-c1b94819a524@topic.nl>
Date: Thu, 25 Mar 2021 15:30:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <429b51e-7cc5-54a7-a28-7e8beab0c77d@crashcourse.ca>
X-Originating-IP: [81.173.50.109]
X-ClientProxiedBy: AM0PR03CA0041.eurprd03.prod.outlook.com (2603:10a6:208::18)
 To DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
Return-Path: mike.looijmans@topicproducts.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.80.121] (81.173.50.109) by AM0PR03CA0041.eurprd03.prod.outlook.com (2603:10a6:208::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend Transport; Thu, 25 Mar 2021 14:30:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b3fe22e-700e-4440-db3e-08d8ef9a9290
X-MS-TrafficTypeDiagnostic: DB8PR04MB7034:|PAXPR04MB8238:
X-Microsoft-Antispam-PRVS: 
	<PAXPR04MB8238F1DDE504311FBBE455AB96629@PAXPR04MB8238.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 kxbAGiSrHjuTd2wIJ7ESC+VjvJ0oAxAZhzTkzNlycxaqGIwQPrsXjIrfJFptVTrq3AjxNuUp3jagdlewHl0/GoQbfWo4sLiQkpAT8cQqTFhlp35K/VdD2rCrU7m06TuM16159K/mjge2vdZ+/c5ExpABgfV2HN2bPlkgQty95BMPC99CusKBTDVJZlS0quX2I15aIibN88TDt2Eb+f5UfDF70p/C55M7sk1dSx3cxsnNXKuEttfUedNEQrrmsRnoyWTZDJnDodBe8gPwDN6jOqw4vu+lql52EY/e43NyWL55oCzAuaOTCHUSY5Q7XTwIpbg3oHyZDfpss7+fo7m7oA7DUtKltRjJhWpYVomn5skjB0hVzHCy+Oi5aErR4fr9GM+aNSbYLCWJpUU7Cf6hu9dmVud7HhbIPKGU4HFK6GsgXeUl8O4cU4VimEw5Ed/8UmgafflIxcGnEZ5Cm1x7DUXdqzFa4FxlWqiA4X/NMcxQbIDhZmcp1swC2F5geX21s5N6qlJ6d3ay58EA6CETWGeISJLm/c5IP1extyLszfi5QWPzP+/fsdC+rL/ox2ptG2uoxO3RUGz5ejKRZbgBhYY968N7sPTZcy0pjFwrHOzcEzeHVdqxHC8gIbm0Ms44JAwZYmb+zjMYPVh6XFIY/Wv4sxqvkqxNxK50SA7SUF4uWtR4bHytuwL2fefs5YynJ1l04KrQ8bMdpfD6B9cWW21UbwstEbl6r8wyOuX1SYXc8ss+sXu4qbkCJgfO2xV/Rc9BT1JGjXOdGMDl8TEcR5hrB5+FmUFDnYYrFH/01P8=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(39830400003)(136003)(366004)(346002)(36916002)(42882007)(956004)(31696002)(316002)(6486002)(6916009)(5660300002)(66476007)(966005)(2616005)(36756003)(66946007)(8676002)(83380400001)(478600001)(8936002)(31686004)(16576012)(2906002)(26005)(53546011)(66556008)(16526019)(44832011)(186003)(83170400001)(52116002)(38100700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?6o4sKzVXbURfKua+VghnLMQZf+Y/txGLwy7T+jIYH+7ZZzUH3hhpA1zf?=
 =?Windows-1252?Q?wka4TzdStBeocx1RDr3XmMcdUQxfHK8P2kMTHG8UgVPJMNGQd8ymaBCu?=
 =?Windows-1252?Q?DM/Q1z736v4SBJgb+HTXzUy/+v0aTb6cdKgAek32Xa7aA2Yd/RsZSTOR?=
 =?Windows-1252?Q?CyHuZ5/ScAvRR2jpMVXJ4i9lXGO11KJ5INpedYO8oNxn8+fPE8C9KpsR?=
 =?Windows-1252?Q?nPw5hFPf+ZYG8dCFSry/lXXwKyMqNkiHTmWhgdeglJFhXzgDlX1n/2n7?=
 =?Windows-1252?Q?Owlzwjc6lLPxYvoik4Iy/S8o7YYxsJmRkdxz4FZeBGKGfrr3LF9tHNGX?=
 =?Windows-1252?Q?KxuCe79pKKNTxwMmPM5NkWZaMwPbzOHm7wYkDPkOlCGXRcX2JvgMjp5i?=
 =?Windows-1252?Q?0uJAVtEzN7+lTIDz7tEOqGFU8ZlyQ3RdI/9wdGRFGhsIVeTDar/RPwc2?=
 =?Windows-1252?Q?/QsojqxmL8l1O337v15fD468FJEyCPbpnCftR7rImFdfCdwUKsylJunW?=
 =?Windows-1252?Q?A+NfoAuQUO3xkLibohbPzY0RzQ26ZBWqqPzAmJopjmDkqcshkRQKyoRm?=
 =?Windows-1252?Q?CTlu3Db+lnNZSRgw1ZuT3bPhfXZ9pkyqJHouEk/A/2k2hFgU80TKD9/0?=
 =?Windows-1252?Q?H8jSVPA3e0ziFhA3gmCwb5EvcW362OK4dXfqMQKXu+3UohECzR+ppZuQ?=
 =?Windows-1252?Q?05nZ+m9JspAlej0dsZn3kv0GDaMd/ayMiWOXFCQ9bgaxQlsvxY+K11W6?=
 =?Windows-1252?Q?fIAADdnLU30EiEawfv8ANn36/ZtwNa17op23/sZWvWExvbem5zyjIVMW?=
 =?Windows-1252?Q?PfxKjycVEY9zkZ+wM8wEWV14Y6X0juQriu2QwODvpWlyYGSD9IYcKzEM?=
 =?Windows-1252?Q?wYpe16+iiWiY9cnlmMwRWSL9G1XILj8n/0W/bGzHr+UOZwWHk3x1qERX?=
 =?Windows-1252?Q?E8YPn/0tEVzN1JusMnPoCJaumdxctd+gwYcSQkYoYyIwXSveZpAsAGBu?=
 =?Windows-1252?Q?BAS1Mud/P450tFgaPywHBtFRQw3AypqesQQsKSV6KAqKmGUtH6qHpppm?=
 =?Windows-1252?Q?custafVnaTplCE62QxeLc/sdXhInK/Oq698Tv3HqXxJvLoBvtvjTyuPf?=
 =?Windows-1252?Q?5FwJqztQT5CfDHFntxcroWsJvusrtf3NFeFsYCDxRKQEzB4Ibr7lyF41?=
 =?Windows-1252?Q?93tvHgI2OZHSm1yHOuNI5s1Q/kQTKa/fTXBLxvOhdB8tn5xUlfTJB2+q?=
 =?Windows-1252?Q?1SRi9bSLy9x3JXanM3F28I6JqyeLwvaUKJxxsXE6RURF4cRbldIsyZGf?=
 =?Windows-1252?Q?ErILBBpfcDaqcbTdu7VRpHcwBuocI9/RPz47STGSVAisnnz9rmf20Mg7?=
 =?Windows-1252?Q?UzyizYW/JRuW8iMQpH70l3uImL77xr6L7nta3nwiY2zch4amq97VQKIl?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7034
X-CodeTwo-MessageID: 13db490f-2a84-43cc-b874-6d667c622bfe.20210325143042@westeu13-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR01FT014.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cce8580a-135e-42c3-7480-08d8ef9a8fd8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	L2Oa2TGs90Sdyw16T5laJk+6G4sSy9p413KPgUUE6NMfSHSutE3ix2GnECTz9h2Z/qqQtxf53U6v4R2BYkdioKPnT4TR9FJIZVYZazypcUL3XDlHprCtyRrF+BaiF6Y47F8BYWS0pCwB8LfXBj4xTYu4GRn2TVztFJIpYjes3MuNpx+YX3NDiymTQ0jD275WonWMF9SEDDcnyJFAUrcNG1sT4F6px10qggflJ1ltHjfvfczJKyq4I4rDyHt0UQ8pe0pqhogghbi1UJBxHQY0BEerI/ICEmcwvg/MYssHFSSfSG6LE2EJsUr/wh7XZ9Bq/GrF2nfBbYGmP9mcPIX9AEzvsTdaRNJAojI7wrKt1PLNspMtTv+2vxPfeYAOPRkRRhFIP9XJjUWSSC8+xidexEoxfgZVZT4EWdUa6YjM7LP2bJJmQ/aD+223JcRpo+6tuiThtDpN90hZnB/XP4yIHSThO7bbd4shbPI2pAsM4Lco8tWIOp+5XFL0OkvCADgvICk7SAtpt0hjBYHelaQ6vfsjyzvTtseg/c5lIBh/SEF20htmUKj2wZ4FyWiaKGSAlYXE4s4WRz82oshRE+s34H2AemEIa0J/QQFhHiIFa/vcSNgcY4/GDuY7e8lwYj0/LRis5DAjuXZh7kpsQUU8lFYhZ4Zs1k0ji04u3F2+7nU4ElBIcKee7SWHYdMWuUwbjl3xAt/hz9opWMTWtlcwuvbPFabBcyxmanplBc1OQrfNsTiOP/C+BGb7Of7nYLBdcrD6d5QQiR6onKN2zJcckw==
X-Forefront-Antispam-Report: 
	CIP:13.81.10.179;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu13-emailsignatures-cloud.codetwo.com;PTR:westeu13-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(136003)(346002)(376002)(396003)(39830400003)(46966006)(36840700001)(42882007)(83170400001)(53546011)(36860700001)(2616005)(31686004)(15974865002)(7636003)(8936002)(8676002)(956004)(7596003)(336012)(6916009)(83380400001)(36756003)(70206006)(186003)(44832011)(6486002)(16576012)(478600001)(316002)(36916002)(82310400003)(70586007)(356005)(16526019)(2906002)(966005)(26005)(47076005)(31696002)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 14:30:43.5364
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b3fe22e-700e-4440-db3e-08d8ef9a9290
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.81.10.179];Helo=[westeu13-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT014.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8238
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: quoted-printable

I for one use a whitelist env vars daily, both hobby and work.

We tend to build for multiple machines, so in general we'd have something =
like=20
this running on the build server:

for machine in mach1 mach2 mach3 mach4 ... mach40
do
    MACHINE=3D$machine bitbake image1 image2 image3
done

Being able to pass the MACHINE through the environment is a big win. We co=
uld=20
alter a config file in the shell script, but that would change a file that=
=
=20
we'd want under version control, and I really don't like it when builds ch=
ange=20
files under version control.

(The "40" machines is not exaggerated, I'm really involved in projects tha=
t=20
build for that many targets)

Come to think of it, MACHINE is the one and only environment we ever pass =
to=20
bitbake.

For release/test/production/debug/... etcetera I tend to use a different=
=20
image, so you'd see:

MACHINE=3Dmach1 bitbake interesting-image interesting-image-dev

So "interesting-image" would be the product, while the "dev" version would=
=
=20
apply debug tweaks that make the rootfs writeable and enable the serial=20
console for login and things like that.




Met vriendelijke groet / kind regards,

Mike Looijmans
System Expert


TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topicproducts.com
W: www.topic.nl

Please consider the environment before printing this e-mail
On 25-03-2021 15:08, Robert P. J. Day via lists.openembedded.org wrote:
>=20
>    kind of a philosophical question, but i'm having a discussion with
> some new colleagues about how to customize an OE (actually, wind river
> linux) build, and these colleagues have, until now, used (whitelisted)
> environment variables to pass info to the build, that info being used
> to specify things like a development versus manufacturing build, and
> so on.
>=20
>    i suggested that i didn't think there was any really persuasive
> reasons to use environment variables this way, as there are more than
> enough configuration files to customize a build. i mentioned things
> like:
>=20
>    * machine config files
>    * distro config files
>    * defining packagegroup files
>    * defining image files
>=20
> and on and on and on.
>=20
>    my point was that there are more than enough ways to support all the
> customization you might need, that taking advantage of shell
> environment variables strikes me as unnecessarily messy and, for that
> matter, dangerous if you forget so set the environment.
>=20
>    thoughts? am i out of line in advising them to use what OE offers
> them, and not extract stuff from the environment?
>=20
> rday
>=20
>=20
>=20
>=20
>=20

