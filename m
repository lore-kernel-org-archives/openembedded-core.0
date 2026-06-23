Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A783CCDB46F
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 15:36:11 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24469.1782228962946336542
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 08:36:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ZT3NPawv;
 spf=pass (domain: cherry.de, ip: 52.101.70.70, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SWEcD+mlsc94MDcqO0z2ceuSMavzwiwAlSC+ngLZn5EAO5LW9NNL/Hgr7Zyf5X1kAdCzhcjmeR/qR9xRRdTe+L6SYLzU0nhIfm3RIRx8BVmw3aAJhbmKjJ5GIbc9GLTZCFPIXXWPrVEcTPE3FrZJE5M/r8d9WMzAgvmzo7Ji2+xKNOV1Bfkbr/TNsKVOFtonSNUv9p/86RnfE+qAMmxUYv6sofAoTrj6GGr3ImVrzZcnQaf1xkNDEa/ZYtHaDSa8Ig4Oh0NO1NULDAeHW6guBW9WtWnO6EFV0cWDOcZ1p5lWWlNIzUkR7RbL/HPxP4G323gje7pg2WVjJmjCKQEDrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kNL154SYxHT2ItepJhnXlNBjkryvCmmznr2kJrQNqzw=;
 b=ZBFjbhjmkM+7+1ivfFk9H2WPw5aMGZ+iG3XNCPqerOAXkmtiD8wnNl289LZkLsOCRNoBIo+5F+oiWfJGqHnpS0pyUAcB15GwuQizqLt3yvZLqBY3tqGJCCbVzZi0ouzzxwt6xXW1sNQ/6bJv2GREbXA5ArAAsqfzfoETxgSfNiCDeSmw29CIGPdVeFObLj671efU3lhFpBuJxw4dfTd7AQmrOv9l55rQ6z396VEE957GE33qzE4GI4JvMjk92hCXJjfc51rhe1i4nlqLo9vYyVuhNybvuo2rP0KP2ak5L4gHgKgv3TfJjzf0RqQrB1yTfQprkcz6ZGWLBINNMu5nJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kNL154SYxHT2ItepJhnXlNBjkryvCmmznr2kJrQNqzw=;
 b=ZT3NPawvL4EyDBSvmIXuKbvAjAcRD2FpTmk5oN5xE1uxhINQ6+EzgL2E7LZNsHJ+8sE55pRciMc8XtKFixvXPWJGN0n2MA5Srbsk+yjMP/iIDoGCbKTZEwoeuDuZxHt8vnR4252oDanFKDWk2eEGh3jscn+Q2mnxul2EpVVHkFM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by AS5PR04MB9797.eurprd04.prod.outlook.com (2603:10a6:20b:679::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Tue, 23 Jun
 2026 15:35:57 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 15:35:57 +0000
Message-ID: <6912d50a-02fa-4b94-a887-6c98c1df7d9b@cherry.de>
Date: Tue, 23 Jun 2026 17:35:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] sysstat: Add missing xz-native DEPENDS
To: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
References: <20260605091342.3248644-1-richard.purdie@linuxfoundation.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260605091342.3248644-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0102.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:351::14) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|AS5PR04MB9797:EE_
X-MS-Office365-Filtering-Correlation-Id: 48a64310-9269-4082-c4a1-08ded13d1ed9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|18002099003|22082099003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: 
	Zuud6gSMen8Zt8APYLp5Cv4f6i7DUugrqfvb0n+LslEiMU2EBplNNsK8exRk7+xf+sVsN/2THV33qewTqZEBF2HWC+G/R/qIV8IguJUYmhhGvE8K6IbMlKA+OlznmvWR6Ep4LJ0noslSn0vTgrO5aCuiYQ6GbTPLwPR420JFS/b8tPTzHviC/Z2nIfb3VZU91Rw2879qtihxwpaEUtvTAqYr1cBiZ3A8XM72o7SA+69/DMelrp56Rz57TtL33DTCPzEOwtJI2f4b1FvbXbQx6RBzIwqKrYy0//Y7fetjCxIHGq7GD1oHMTy29gDo1ZNrg30eIB4OvO0Rl1pdAYXBkM3tXgdPOQhOmo+hLTKXX6XzRUaLwwiG4JJvDuvJDUBRjbAva2fjR6DR47mo/N0eECPnRNbmNbjKtveWL6R6NvG7HH4BBYC7ui2cyCWoLz+k1nmt5dcP1TucxgsTWzssDCi8CSrq0nqLpwd2ABpE1B/jNf4WVkfF78KW9JWr2vOIAzgpXZe5AWdjmTXDTwbqZfOAyQqZ2HknIqyUeFN5JXZnYeSIpVQQep7sVwfiujJO+0mnzo8lRQ7XBmsX+AoNsBqClYJLJ5mIkrfPPhx5GW/wU5/Ng1C2TU0497z2Ma3NQFouFM8lQ2/S+8la8BbIgiXNsgMdBV2JWF/P2Mlwa6A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(18002099003)(22082099003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OXoyZG0yUVdKS0VjMnpueU9EUkxxVHppakVrU1dLekMwZ1N6YVFMUXV0OUZx?=
 =?utf-8?B?ZmZVenRmRURvT3JmTGZDM2hmMDJtcEZIZHVKOWtlcENaWkVkL3dGWWR3dElL?=
 =?utf-8?B?YmhiOWI5T2IzaGI5K0tkek9mT3VvTjVTOG0vVUxuTnIrMWFhYVpOaHZRZllX?=
 =?utf-8?B?UWdhVzVCSWlmak9pcU5VVWgycWVCb1ZRenZ1eEVTWDhVNEFhTXZDZDNEeDB0?=
 =?utf-8?B?NmprTGJ1M2RjZUpnYmMvWU1GRnUvbXgxUUlXYkppWWkrNGozY0pNWllxOWRH?=
 =?utf-8?B?ai9KSkhjeFh1ZDVxeXRJVnRHM2h4QkxDVWFyQW9Ia2xNL0MrM2NaaFM0OSt2?=
 =?utf-8?B?ck03NkU4WHJkZ282aGZxOHg4a1BDZUhEVWNCWGV4MWFWekppd2o0U0RrSThR?=
 =?utf-8?B?RTFWSElVYk1nMGdJb3pub2k3L3VLeXZYSGlnSHJINUJ6eElQdlVJd1VybndF?=
 =?utf-8?B?cFc0bnhFTkFlU1VvOVJhemUvYUxXbnVZMHhIS2tucVFRUkpqK1RkQm4ya3R1?=
 =?utf-8?B?WGJHcVFBVW1vaE9SV29DT1UrejFTMjdFU1VENjczcDFCVG1lRkt1Qko0aVU5?=
 =?utf-8?B?b1VnL0wrem9hcW9sTjZFd3hQUW1Wa0R1VHc4VzQrNERmaWkrdGRtOElUUWlM?=
 =?utf-8?B?SllvRTgwSHF5OFFObi9JdVNyRmJvZjF1QWg0TE9lN1dLT2F0dFJucDlIdGd6?=
 =?utf-8?B?RElGclBwUFRDSVV3dFl5TWNYRTN3bVJ3RGtQa05kbytJUmJ3QWtiOHUrNnpQ?=
 =?utf-8?B?V2hMdXVJL2lMcVd5aVR1Yzl2dCswRytWUDhpQnVVQXFnMzFIZXlVOUpVYkZR?=
 =?utf-8?B?T0xtQkM1YTl4U1Q5UUttQjFHWTdzSDZvT0dSUnlaTFhnLzdHU05VWk1zME5O?=
 =?utf-8?B?dmxIKzFwWnJFZzhwajlpRGppcUN0NjY2VVR5by9rcklJeThXM2p5UjRCL2JP?=
 =?utf-8?B?SlV5YnR6R0lxZDFxb1NpNGN2YjB1Y0FPM01YRVlOaG8wQ1ZRdG8wYW5ZaUNP?=
 =?utf-8?B?REt3eUxxeEQ5VDVjK1hJdEorRUU1SWJ5NEcwamZGeGtCTG8vRDVMaHNxdzBX?=
 =?utf-8?B?b3dld2pxT21UR3Y2aHFET2Jib2pSYktjSFYwcTNxUDQ5Z2Q1dzBMMjdGVFRH?=
 =?utf-8?B?eGNtWng1dExqNDE3aDVsSFpUOUZOWExiT0xMZ3Naai9zazJ3QnRRenczRC9X?=
 =?utf-8?B?NFZ5Ulp6RDkvYUlXb0ZubDYwUkdSVXo1SDcwV04xd2ZzSTlSbUkwRXpXdmRX?=
 =?utf-8?B?MW84R0lGdnNlbEpUcGhoaU93eGJTTXoyZmxLVVhMbnQ0YmFjcWUxckNjUHdm?=
 =?utf-8?B?dzBWZkJXc1B2TkRtR3VlaTZjUlFRRElHYWZsdW1aTHdncXlqMWlZR1VNczBn?=
 =?utf-8?B?Mk16TTZ6V1AxY2xwbTAxOGpNMUFFeW9UWVRzRVNiYlYyREM0NkFxSE9oYS9E?=
 =?utf-8?B?akJaSExpZUtHcE05R2lDL0plL3hHTkQrTnREOU9QenlhU3JRL1JwOWJhRCtn?=
 =?utf-8?B?dzVEQ1BsNWhKeWN1dEpQMnNxN0dRb1NDM0trVHB1N05PcjUyaVBHQURLaUJT?=
 =?utf-8?B?dkp5dXFvdG5rVDhaNGVUQWZnbVhINXlhOVQwMU1RY2xFN1lYUm9qMGRXN1I2?=
 =?utf-8?B?bU5USjB2QUNzT2xLbW9zb0s4aWYvS0lyZEU3bTdRNFBjNHd1NCtsMGwvVVI1?=
 =?utf-8?B?N3ZaYk92ZlhiMG85clBDQ2UySTRBTmI4akRKaUZnck1MSDVWTG9sdC9mUXVC?=
 =?utf-8?B?NmR1Nmg2YTlLbU5GL0ZMbHRXRkpBNWg5WTlnMm91b3JSVjNRdjJxcVdYYUJT?=
 =?utf-8?B?SzQxYU9GaHh2RUtDSVBlSWg1ZkkrU2Nrb1ZnTHp6SThZZTNPTU54ME9EdnNL?=
 =?utf-8?B?L3ZjSlV0ajJwVzV5NnpRS0F1NFN6TEpzeElnZ09qT2JkZG9OZEs1ejI1VE9L?=
 =?utf-8?B?K3NtV29oWGJXTDFVaC9iU1liWnh5UFRhZkxibWE4dnc4cU1NeXVUT0pON0c3?=
 =?utf-8?B?UnNsdmc1aC9LbXI2cmdVYWgyUDVEOEFManpJMENLQjZEa1JmSitrM1hiclVB?=
 =?utf-8?B?aGZjZHl6S3pSaXRvYmNwNDMvajZEcUM3aDFlTGJCL3dFUVA0QmlDTTl5TVVj?=
 =?utf-8?B?eVJoY2Y2aVRmYldmL1NtOWFRNWVqL1gyM1E0bEM4aEFwdTB6WlpJYzF0Z3lX?=
 =?utf-8?B?NUx2VHdkYyt6bzA3Ykw1Qy9JckcyUE5zNDZNS3dvOVBvc0Nnc3Yyamw4czFE?=
 =?utf-8?B?bVQ5ZmREeFNjbTJRVFgyNFVuYzA4aWxxalFMNzBaSUtKY0haSkhHQ21sak5s?=
 =?utf-8?B?Qjd1MGdDRGF4cnV1NExHUllsT2xWcWpFRHgwaGZkTDNKNnBkdTRsZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 48a64310-9269-4082-c4a1-08ded13d1ed9
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 15:35:57.5834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u+LQJ/Kw1pynaw25x9axQSPLL0ISmanx91CPkq5UqYsMLwDAdYNiYLsU74rjvrO60MRHkAvopSHyctQDlEKhdfHfnPy9PPXal60iuzXywwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9797
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 15:36:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239408

Hi Richard,

On 6/5/26 11:13 AM, Richard Purdie via lists.openembedded.org wrote:
> sysstat uses xz to compress man pages. The version from the host may vary
> and hence make the output non-reproducible so we need xz-native in
> DEPENDS to make the output deterministic.
> 

Seems like the project supports disabling compression for manpages 
(--disable-compress-manpg) or manpages entirely 
(--disable-documentation) so I guess another option could be to make 
this a PACKAGECONFIG? Don't know how expensive the xz-native dependency is.

c.f. https://github.com/sysstat/sysstat/blob/master/configure.ac#L243 and
https://github.com/sysstat/sysstat/blob/master/configure.ac#L245

N.B: there's also a --disable-nls which we could couple with the USE_NLS 
variable, --enable-debuginfod with debuginfod DISTRO_FEATURES, 
--enable-lto with lto DISTRO_FEATURES, ...

Cheers,
Quentin

