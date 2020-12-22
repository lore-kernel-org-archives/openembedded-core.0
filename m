Received: from EUR06-AM7-obe.outbound.protection.outlook.com (EUR06-AM7-obe.outbound.protection.outlook.com [40.92.16.21])
 by mx.groups.io with SMTP id smtpd.web08.9849.1608633409742243860
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 02:36:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=lINewW+7;
 spf=pass (domain: outlook.com, ip: 40.92.16.21, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fmq/vxQdZ6YyU5iiNlqcR/JRlZDhxtXuvhRqCMHoLDsMk3KmNwAjrjIx3a+i92nHqOTxXKY4JL4GSZyHlpX7t6p+bg9ZZ0Psf2vMIIqx4K4TnES30Nv23caJ9ZZosff8rjcIUstzZpdZ/NqJiVxfj2Xww9vSaCYWhhqe8Rf0NvhhBGtAAGkClpvM2L0+i+DjdiiXwx1E008IF5kNcCPHUuNjBG5UpgYHjIVGAvB2UN5Xu9yHltDbijv55oMWlThrmoty1NQTCO1UV/P7hndDDpofE8BDCo60N0X7nyKmw5XCnhPR98iNDIWKkgU1jJdHkpFFaYkStVEeGLUG90cTKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ttFYsb9PLySKRzE2DkerkqdoBd1uLGVLq+fSaC4YB44=;
 b=Ik2y4C6hyKw/Ldyv+CWA4rYX5gzFF3iqolbGzt3u4XxWvOmtM5jFZtfQ/Gzk+OYW2iH8lIkce0CneohL2zgCg+SBvrap2XY3U8fx9Shx268d0cIaahXsZnyrMoeWU7He6Euo4DYoUBtcXVKPvpxTT3p/B04A0Ho0FWxAspVquDxK4BUs757m2Gs0P8EQFlURrPxmaDLQ/etDaaYqg6DTGM6EJOEl6jPNY4JmW9DNAX7LiIRCqlGPUw6FvywWyMbg8uO5dK9jkzdmtOWDRYBDJfF/1S5vjQoG+5qLAtRh6BEo8n5vikWsP2Fq9jfDMVN+VGHE2viUtSdDgHEyCmbowA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ttFYsb9PLySKRzE2DkerkqdoBd1uLGVLq+fSaC4YB44=;
 b=lINewW+77RXhNVZKg7236q3oITvn9K8u68xyceANCHZ4aEdQbFq+Q8Sx4Or/DT+BocYdB9S9wx9GgeZkOJJqo6FngFfP9rCchPAgviAhX2L6mk6LPa+sX1LRA4cu0ZzlLW5V2thXhBJCqeGlxw26wrCtSx6B8u0MiS9R/PmNBq/zmWj9enbbemS9veCF4GGgDPChCUGqaZNlcOGwoCaMxL7c96y52j1uTzhIs7KPAk7hrZgHasS5jFTAurPJNmWlrUuhtrCxDevBMQQx5L3ErsIF+pfO4e44pA1NvLWi8NmGvxMOUGfHG1MUw5sjTzrXOA935cGc8XCeIxHDXIwfxQ==
Received: from VI1EUR06FT055.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc37::48) by
 VI1EUR06HT020.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc37::122)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22; Tue, 22 Dec
 2020 10:36:47 +0000
Received: from AM9PR09MB4739.eurprd09.prod.outlook.com
 (2a01:111:e400:fc37::42) by VI1EUR06FT055.mail.protection.outlook.com
 (2a01:111:e400:fc37::226) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22 via Frontend
 Transport; Tue, 22 Dec 2020 10:36:47 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:C83F4DB9A5C212EE94745CA49CF5DD2BD1AB37352EFC1D946ECE9343173C1F7F;UpperCasedChecksum:4934F2D4E4A73356235B35ED03AF00A234CCC72B95FE6837E501A002DED620FC;SizeAsReceived:8480;Count:45
Received: from AM9PR09MB4739.eurprd09.prod.outlook.com
 ([fe80::535:3ab8:a03f:46bf]) by AM9PR09MB4739.eurprd09.prod.outlook.com
 ([fe80::535:3ab8:a03f:46bf%2]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 10:36:47 +0000
To: openembedded-core@lists.openembedded.org
From: "Konrad Weihmann" <kweihmann@outlook.com>
Subject: Logging configuration on recipe functions
Message-ID: 
 <AM9PR09MB4739BD8923073F795F54CE0EA8DF0@AM9PR09MB4739.eurprd09.prod.outlook.com>
Date: Tue, 22 Dec 2020 11:36:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
X-TMN: [BP3QstOwcO7wuRflbNoQauQcOybItnBH]
X-ClientProxiedBy: AM5PR0301CA0024.eurprd03.prod.outlook.com
 (2603:10a6:206:14::37) To AM9PR09MB4739.eurprd09.prod.outlook.com
 (2603:10a6:20b:282::12)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <fbd562fd-4ff2-c72c-daa8-824e1c318286@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.83.19) by AM5PR0301CA0024.eurprd03.prod.outlook.com (2603:10a6:206:14::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.30 via Frontend Transport; Tue, 22 Dec 2020 10:36:47 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: a69f5168-de40-45bd-0586-08d8a6657c0a
X-MS-TrafficTypeDiagnostic: VI1EUR06HT020:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	R5A8W36y8Xk6OrJ17APoUsNEQ4OB9LCia4e0gey4reocBTlAx0ux63eOBHQK/Gj7tl2XPQ/KTxSxtGz011ElL9eFuGSDf68/tx+Z3i0CQxYeHWtVv9cSIEfm18e8YI9LiDg0nmhLUhju9YQdwcemEfHTZPV7uezxVCNTply6Ga3bBlp3PCuEHel2kOSo48DRWrn3fQyMhDQiLht/xSoiAfkWDs7Ggf0V17aJ+MmknFBBE2Iymht87Fjt5ZDKByfr
X-MS-Exchange-AntiSpam-MessageData: 
	DSpX2+CtmtQeCQSa5+u+HJisR+0pFTzKkKKm+DPZopXWxEUp2lp0OGGMgwVVwabogEjqJgAP0QUjdgPO05guJsbiyxkHmz6XIjpVX576d9gKru0RAfVqht8+e4qxTVZBcCuV5Te4oAA1+XU1ECfVQw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2020 10:36:47.5595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: a69f5168-de40-45bd-0586-08d8a6657c0a
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR06FT055.eop-eur06.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR06HT020
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi all,

I encountered an interesting issue while I tried to debug some 
functionality.
I have some custom python tasks which provide additional log output by 
using bb.note (or the wrapper bbnote in shell tasks).

These are by default not visible in the console, but under certain 
conditions I want to the output of those in the console log (e.g. in CI).
One could run bitbake with -D or even more verbose switches, but as I'm 
solely interested in having the output of those bb.note calls - 
debugging switches are a bit too much IMO.
I tried to configure this by using BB_LOGCONFIG and override the 
standard configuration.

After browsing through the code I have the following questions

- which logger is used for python tasks?
   I tried "Bitbake.Main", "Bitbake.Build" and "Bitbake.Util", but 
couldn't see any change in behavior
- can I change the behavior of this logger by using BB_LOGCONFIG 
(judging from the code it should be possible, but I've seen no example 
in real life) - aim is to have the bb.note output as part of the console 
(not as an additional file)

I helped myself with using bb.verbnote for now, but it requires 
additional logic to make it configurable and therefore I'm still looking 
for an easier way to do that.

Any ideas?

Regards
Konrad
