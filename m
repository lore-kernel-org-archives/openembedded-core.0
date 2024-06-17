Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3EF9C2BA18
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 11:30:54 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.65])
 by mx.groups.io with SMTP id smtpd.web10.54460.1718623846635886804
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 04:30:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=OchT9t0v;
 spf=pass (domain: prevas.dk, ip: 40.107.8.65, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPUF1oxwxVLVL0U0j1A+4vgaDBW5efLGMRfXi6AImI6iVEqUSw/A17FXXqLX11YrqsUMrt5iP+f2Ku5lYPQI3HJvSQIhvvNCzh9fAtKvhhqwjHC73m6mDTVg+wcsxiL8F4anzK61BjQvT3kyhbvuIhYCSx6ske5qhGHmRxjomP4q4miZ8X+PifSvtF2US2gbRDNAmWQ8O4Ac3kUwRjfTN9AsejGuIat25OlfoA6MeLo7qmuoOk6N2Xhln+3r+flkdQZAGzkj+4xHbwdmvPnyAZvDGxkULIvd5Y1CWoT3TrKUtuGnxh0e8Im6jwjO6eLrdENOrPtb+QjsFoFFHXKGAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OCwThP4vkawGyCyjBtxEXN5vb4hEETi6hgWTa8lmd3Y=;
 b=fdl3zYrIjBXuUvxvCQIsnkIsJZA/qPdCoKzuNI/uWoxrUwY2A5PKcl4wgXCDIpLUnkLBszds4/vjSR8djnHxAPUcwucrkB1go8VHI6ZFqueMe7QRzGF5/PFJR1z77SgvDt77wUqV2UgpErNRMTPbtQlmcg1kygYu5LqdW8xg8QVESJxXX021xJdd4JZrOLFBzLYMWULBLgqo6fLiEGJDnnDEqmlMUrRsxh7YBDEbamEIobsInQR6ory6ZFjsURYtTL1gHw80pK4G0sUzqVevjPaAua/DiipLl776VxGHJdNthFQnC2PruUK379X5p4an52AJQuizBVOy7L4GRg08tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OCwThP4vkawGyCyjBtxEXN5vb4hEETi6hgWTa8lmd3Y=;
 b=OchT9t0vTiMZPPiGwjqs16ZT0iFe33TPqJzSwtzd6NVmwC1GZRKAj11T64OqSe7J/jAn4lSPwv38+r7HUp44jMFPmWexjYkJQJ+ppGW3FCdHs125Oz17e0T9zJtmBwvIDGlipgVFOinfyCHIi3UMFLpGT64ceDBk7kg2tb38X7w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
 by PRAPR10MB5228.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:290::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 11:30:42 +0000
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9fcc:5df3:197:6691]) by DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9fcc:5df3:197:6691%3]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 11:30:42 +0000
Message-ID: <be5f8301-f4a5-45fc-b784-9209d904c591@prevas.dk>
Date: Mon, 17 Jun 2024 13:30:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] findutils: split into packages
To: Ross Burton <Ross.Burton@arm.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
References: <20240617095954.10982-1-rasmus.villemoes@prevas.dk>
 <D4F6D0D8-F070-43A7-81A2-EF8F2C4520B1@arm.com>
Content-Language: en-US, da
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
In-Reply-To: <D4F6D0D8-F070-43A7-81A2-EF8F2C4520B1@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0018.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::32) To DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:45a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB7100:EE_|PRAPR10MB5228:EE_
X-MS-Office365-Filtering-Correlation-Id: a48b4947-f9de-48ac-3ad4-08dc8ec0eba9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|41320700010|366013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eExuTkx3VGpjbE5ZeENXL0lxTWNBTThGcHprakh1Sm9YOHhPMWNCUWExN0x3?=
 =?utf-8?B?YThabkgvaDhETUIrcXg5eEF2N2FFdUFhcmpxWDkzYzZCMHd0MnR5Kyt3RUVt?=
 =?utf-8?B?SWJ1K0NwVkI1RXpydjQ2MnRaYjkzN0lqNkU0QytOcFRxZXRnMVQ2SUFUMHY5?=
 =?utf-8?B?MDI2eGJNTE1xMEhuV21Dd1IvNzRuclpWeFVYbVFxL1ZRZElmL0tOczNLam5x?=
 =?utf-8?B?dlFhM3pyNG1sUW90Z21sT1puWjlrTGJQTS94TUw4ZTEwcXZkUU5LT3NaZXdj?=
 =?utf-8?B?QUlQZUswMjZYaWpOR0NnWFFZMFNCaFJBZ1A5T1F4cVNqVk9DWnRlSGlSbWd4?=
 =?utf-8?B?Ry9GMUlOM0pVd1JPZTVxU2tvWk9OTHNDbGRERHJZaTdva0dYR1AxcksxTkpn?=
 =?utf-8?B?TEsyN29vUGRRRzFacWIyRFpOVWF1aGV3SkNSWTBvSm8rMHNsSGVpalhKQ0sy?=
 =?utf-8?B?amhBMVVrd3NIMnhPZExORXB0U0s1T3JDOHBKOTlxNDhYQk5hV1l0TFVMNDk5?=
 =?utf-8?B?OEdlZytNT3cxdldGOHYwcW5JUDA1LzhoWHJBZTQ4TFFEelBCM1NoaVNHcHQz?=
 =?utf-8?B?ZzE1eUo2S3pBeksxa3g4TnY1dzFnZHFUWnArMUplMTluMFVjZU0rQVRNUUpH?=
 =?utf-8?B?Z0dtYnU5KzFkcTF2RGFQeTFBWUozbGFoTTVOU1FtU1BQZXFnOXV6d0xibW9u?=
 =?utf-8?B?OXJDV2RRM2NLaE9wandQRW9Rd0hJNTFlOHZhaGhjaGZHSG93Z29hQ3BUQzh6?=
 =?utf-8?B?YUJJNk8vQjVSZkIveG5SOHdxdWU5UGNmcjExOGhjZkN6L0duUUJuanhZM1F2?=
 =?utf-8?B?bWRUM3ZXbmFsVWlPTnRkSEJUWVY0S1BwdmNzUDhubStJc2hTT1p0aDlmbjFx?=
 =?utf-8?B?RXJiUUdXUlZwSWpnZEtMVldNS1NGSHp6ZEtTSHgwWFZHQit1R24yMnFSNzFM?=
 =?utf-8?B?a2NtL25TTlVBendMejU1VzhLUzJaL1dVQUtLMDNaVCtjRWlCcWdRS0xSRVN3?=
 =?utf-8?B?a1lVSE1lUjJJUXJUWlNNdEtWYk5TaGdDcVREZ0M4a3VpU3puMEp4Y2c0OHl1?=
 =?utf-8?B?VSsvdDcwSmE0NHM3T0tKRmhza0VabDdMU2JLdFR4NWtGWW13VDBEMlVERWdO?=
 =?utf-8?B?SzFHanI3M0haakJRVEJ6Snp0Sm52d0FsRm9CQ2VCU3JQZWI2S0g5bXo5VEc3?=
 =?utf-8?B?ZjUxV0hRWmdSTWd4cER3ZkFhVk5rV2RQV2ZxVm9RNCtmR2NyOG4vSlBvdDNS?=
 =?utf-8?B?VFBVbGloSlcyMjl3ajZaN1JsNUJWZDFWc20weHpLNVJHdWtHTCtJVVdCM2lo?=
 =?utf-8?B?NFJtejNwOWRvNUJjUGhzNTFCS0hXYW91MHNkUzFJUUZhZmh6VTA5UzVnaE1E?=
 =?utf-8?B?cElRS3lWWm5LSit3azU2UjVyTndkRzhHaUdnejdwNW85Tk12eXYzV2gzTmx5?=
 =?utf-8?B?VXdaNHdic2RYR2xpNHlkYTd1SDNINytEbERDRGR6YkVUNURXOW5nejl4cjFV?=
 =?utf-8?B?T3Z5ZVNSd2twakVzOUhnN1Zlemg5VGlhb3M2WXd1L1hZdkM1Ukw2YSs1MG1z?=
 =?utf-8?B?TEplcnVRNkp4by9qT2RvaTdDYnJHWjFwSThrbER2TENXTlplaVJJNVhWcWMy?=
 =?utf-8?B?TWxTdFpESmtROHpnUWpSMEZmTEFINjZKMUx4RXBDT3dMd0JVYTJjYmR1d1Q4?=
 =?utf-8?B?YlM1YTY4WFpsc3h5eXNvY0JHVUM0SCtrTFB3YnBVYWJkdnlEQzlMUndkVElz?=
 =?utf-8?Q?vBx/TRcwBBKxYW8C8IEDP6wld6ObtkWviqBub+e?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(41320700010)(366013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cTlDRCtZZDRGQUw0WXcvSUdENTY0dmFyRmhWWFg2aXFURjdldTBQU0dCYmIz?=
 =?utf-8?B?T3ZHSWJ0TXRDcUN2THhTZjI4ZzBQSVVUZXBZYzIxeTZ0OVJZRi9hQ0lBNjl1?=
 =?utf-8?B?RnI4UnRKbms5Y2liTmZLVllEelV2QnpCQ01laGNFSERJczhKcWJZYlJlNHlR?=
 =?utf-8?B?N0ViWkIrQWxQb1BXVWxoQ0FQVnd4S1U4TmhJcmlrejZnaVpsaXoxTzRDSmlC?=
 =?utf-8?B?SEdhdFpTeDA5SVN4UVVRb01VYnlkaU9sYjdZdU4ycWFnNjBIWmQ4R1FEL2Vt?=
 =?utf-8?B?ckdyTDVYbEpDSjdMSmtjNVJuVXhtMGZ6U3Y5T25TSG1naDBWalppVVlxQzhh?=
 =?utf-8?B?QndoQ1N6RjlBc2Q0UlZRc3RNRzhWTXNRd0d3WjVaMldkYVUvUjY5NTlvVlVp?=
 =?utf-8?B?eUJzR0tyMDhmbkwzTkI3eFV5VExLdWNEQlZBNWQraEFKblNQWmtod2V5dStK?=
 =?utf-8?B?dEhUSFdFWG84UXZJaDQzZWwyUlF4OU5PWFlkM3NVL1BZSCtXNFhUUE4zRWRK?=
 =?utf-8?B?RnA4eUl4a1BUcnlZdE1sK1VrNStoN1Z0aHVTb09tdkVWNTdMZU9PdGx1bUNr?=
 =?utf-8?B?aFdsMDhSN0NGZVJHKzBndDJEVXBYSjUwdnVPZzloOHZKUkQ0OFVOUWJXR3Ji?=
 =?utf-8?B?MnQ4d0lqSmVyWEs2VmJrcDN1eVpZbDhPRlNsaUJHVi93QVg0aVdnNzVoaS9y?=
 =?utf-8?B?TUlDN2RMbmt0a3VXS3pqYkVYd20zUytNWUZBZVhKUmFkWmtJMDlReVIvdkdF?=
 =?utf-8?B?WnBPaTNBTXdWa2l6WkU0UUNCNVZlcmdkbFJWZm0wRk1CZWpHd3FLMmhiZU5N?=
 =?utf-8?B?d3RrMmVZd0lCSGozRlB6MTV1ZlFyTmVVUFNNRXljRStGZ2NuNWUxV0ljOUlm?=
 =?utf-8?B?dUw3allkUFRmOWRTRFRRTjQyVWMzWjdFckVuTEQ0azlOQ2VQTEk5VXFKVlFH?=
 =?utf-8?B?YWZuZDhta2ROSklRQmJQbkxXazVsVGxCWUxUdHRLOFNjNnRoV0RYbDdEK3Zm?=
 =?utf-8?B?Y3pyVWM5NmtkMGRkTUZTRVFvZkRvelFhTzM3K092anArRTU5SllNVlFQSGVV?=
 =?utf-8?B?YldBZ2RvMklHbE9jSC9qSHg2UGI0dlB4QjhMRlRTaXV6ZFlFS0tKaDBobUY5?=
 =?utf-8?B?TjlHM05YeGxyWktYMVRWSXV5VjJIOHJqYTJ3TDhQdmVzNTR1U2p6amZKR0o1?=
 =?utf-8?B?ZjMwcGJxdktBQ0dGNHV5bEFQREhnVmtRbXN3RFpGd3NWcmRWVlJ3YUNNTWtq?=
 =?utf-8?B?V1lFd0RDM095NHhGendYcm5COW1HYWhzUVBuV2ZnN0oyTldNNjBVMUlmMnZx?=
 =?utf-8?B?VlRxU09JM2pUWE83KytNUXBpM0ZkMWdRMWhGWUJ1ZHAzOWk2YVdpZlVFM3Qr?=
 =?utf-8?B?TXRpSW9WcWhoQUN2WW1weWtITTJjYThvamowQzhrQWNLcXB3MnRGV3lLY0Jp?=
 =?utf-8?B?ck1GRW5rMW1GNHk4L3J6RHFOVC83VzhiV2RpdGJEZUpBbDFabmdFRnlMVVhZ?=
 =?utf-8?B?Ny9LbXB2WkNBcWRsRjFBcmpHd293MHFIcFVYcUVKc2pWKzhoMUVRYmN3Mllv?=
 =?utf-8?B?YWo0SXhPR3c4R3hwclRNdGpQMFhDM281eElvZVJEazR2VkgvUlB4T0VuSUV0?=
 =?utf-8?B?dHNKMDJNNVowblZzTForZ28vQk9YdHk2VEpHZ25kVmVyT2JGZmR0NkJoR1RW?=
 =?utf-8?B?M3hZc1FQeXo2UzY2Y1owMmhoN2c1ckhaZlRTbDV3NzhyNkZHV2xkbUF1ZGtj?=
 =?utf-8?B?dmQrdy9zR3dqU0tYaWpmVlBxciszMnF5RXpRMEZVVEphYjNkSmJWTCtFT3U3?=
 =?utf-8?B?ZnI0OSt5clN0OG9XRDZWcFJrY3NUNjNoK1Y1aDNROGZlRFIxbENJWHQ0UFY0?=
 =?utf-8?B?akw3aTJBaFk0RGhIZTMvRDRoeTRaeWVpZi9DMVI2L1h5VnkxaDFNZms3OTJK?=
 =?utf-8?B?M2xKOGFvNkhrV1ZaNWNST3lFRDdzakhFV3VEbml2RHRmNlFESEFvQmZWOVlI?=
 =?utf-8?B?TVFreVZMZ0Iyb1lSYjJVR3E1bW5aQ3k1L21nM0FOSGdVQjlpeWhVSVQ5dkd2?=
 =?utf-8?B?OU90WEpkYy9YUmNxRHczck81QmRxRHdlRG9ueFliWm14YllxRUVQbjV2OUJM?=
 =?utf-8?B?b2ZJdXVSUEpoK2dLNHYzWFBvM3cxZnRtRDk0U0hwNlZXdmprNzlsZ0xBVDlo?=
 =?utf-8?B?OUE9PQ==?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: a48b4947-f9de-48ac-3ad4-08dc8ec0eba9
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 11:30:41.9737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DvBWn4G780nrJgpV3KSEroon08JZ8NIYfvaajf5U7NsJs0jebw0BN740WVDmfwR2Xb4RCRjkiP1SLgLRugHCg5iNGxY9aobuOVXk6EmrBUY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5228
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 11:30:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200806

On 17/06/2024 12.22, Ross Burton wrote:
> On 17 Jun 2024, at 10:59, Rasmus Villemoes via lists.openembedded.org <rasmus.villemoes=prevas.dk@lists.openembedded.org> wrote:
>>
>> From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
>>
>> It can be useful to have find and/or xargs by themselves without
>> pulling in locate and its associated binaries updatedb and frcode. In
>> my case, I just need xargs in an initramfs, which is a 42K binary; the
>> other binaries add over 300K of dead weight.
> 
> busybox has both find and xargs, why is that not satisfactory for a initramfs?

It might be, for this particular use case, and where I control everything.

But, the problem with relying on busybox for anything is that there's no
way to say "depend on busybox built with at least CONFIG_XARGS and
CONFIG_FEATURE_XARGS_SUPPORT_QUOTES". So in order to make the recipe for
my script correct, I'd rather just say "RDEPENDS += findutils-xargs" and
know that I get something with the required features and semantics. I
was bitten by precisely this; I tested whether my script would even work
with busybox xargs on my host machine, was pleasantly surprised that it
did, then tested on target and then realized that the busybox shipped
with Ubuntu apparently has that feature flag set whereas poky's default
busybox config does not.

Apart from the size issue (which of course mostly matters in initramfs
and other constrained environments), there's in general value in being
able to not install binaries that are not needed [*], and apart from
being provided by the same recipe, these binaries don't really have a
lot in common. Yes, 'find -print0 | xargs -0' is a common and useful
thing, but xargs and find can certainly be used by themselves.

[*] Say, when some severe CVE is found in findutils-locate, it's nice to
be able to say "not affected, that binary is not on any of our targets"
despite findutils being in the sbom.

Rasmus

