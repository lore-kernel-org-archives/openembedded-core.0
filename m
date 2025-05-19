Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E62DC3DA6D
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 10:44:03 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.54])
 by mx.groups.io with SMTP id smtpd.web10.48318.1747651432399188772
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 May 2025 03:43:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=YkHiwgyS;
 spf=pass (domain: cherry.de, ip: 40.107.22.54, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/fZsg0pQRSCScEclaET/2AH27Jq36jOYzu401ymj3bSo2RWTKpjL/CnIxBeixLzZlIm17xNDMM/PxdBt+pd8cBCf77cUSZIoGq86NmeSO4AE2K6BelhDhSmsjqffEAk7sG8hu4aI9v/ENSormQ/20XoarL31pDPCq8LJOFwra/Y7Ayq40c2tl4cRJGJQ/O3UNpL5MXksPg673Txrqg1v2Iwuglsq+yroK7/oto/ZnTeNjbI281GZQqan4mr8hccWqsiJfTq9cZIfzEoUkhAEget8rcp8tYsd+pfmEiczDMnEiflQDJILkw2HM6i1R3ROTWxVqj73sAtgblnyDj7/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qGSsApVZlac4H0f9PHPzqMVx//6wpHqq4z2Btd2a6Gg=;
 b=IfCnhzuITI9Nd1KvYExGg7w3ZB4olzY8T4aLJ3iN+0vyGQJ2eAdvhwtQNrGfCuIOMyGnrd5grObD8YkI7FquQIpy4wxn+siYuYUg3sxia9hVOf0UCHDBq6+KhBkumx3GgN6NuwVed2z11J9UgRz9d3h802SCkYwbxY6y8h7nsCj0T6y0HUHZ+B3IxvOlB+r20Y8simvlhwePSwhiXuBIk9auqZIGHxnFMIFkA6ID8Ky6UbGT/fYStnrZIrBw84kR5a6RLVi+fs5L79Joi8Hz//0ToT2FYgH8cbTy2xWhDDmzgIEQTMT8VqC9ebr0gbME9ZhNyaQwdiLMWOIQIJTXNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGSsApVZlac4H0f9PHPzqMVx//6wpHqq4z2Btd2a6Gg=;
 b=YkHiwgySJUxgRDt10odSWdea1vmM4kQx+r9vxGD5cMyiiEqXb5/ZaeAceSN3OC3ZGQqi+YgqSJKQhNoSEOaJ8uh4r/BlbXjnwxDi0ifqGFOAsBVbxtGKS1I/zmUFvSjSE6fXBdRVLkG1wC5eVx5yPK6rP21DIUOtKgNraB+PawE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB8465.eurprd04.prod.outlook.com (2603:10a6:20b:348::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Mon, 19 May
 2025 10:43:48 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 10:43:48 +0000
Message-ID: <db0c30b2-7a27-4a62-b445-e13485a5585e@cherry.de>
Date: Mon, 19 May 2025 12:43:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] clang: Include the libclang python bindings
 in the build
To: luca.fancellu@arm.com, openembedded-core@lists.openembedded.org
References: <20250519083344.1646432-1-luca.fancellu@arm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250519083344.1646432-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR02CA0048.eurprd02.prod.outlook.com
 (2603:10a6:802:14::19) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB8465:EE_
X-MS-Office365-Filtering-Correlation-Id: 3db67f3e-8957-4e6a-a453-08dd96c209b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?amI5K3N2STNiRUtFRGhmZlVCSHRWRFJjMFhUNHpLc29uTXdXTCtOVUZqYTNt?=
 =?utf-8?B?cVRDb2NXTi8rRm9BUkUwNUdGVUpSUFdEQlZsWlJwWGxYSUpIbnM1dm5jVVBW?=
 =?utf-8?B?OW9EWnJoTGYxanFLWDlxdFdFUUFKWWVTdklPQnVGYjZ6bmpOQkZyWlBsTXhK?=
 =?utf-8?B?dW5OdmNPSFFUSXBOWVh2MGlxbFUrWXNSaTdXWjRiaTlGUXl4Y1NJK215bDZv?=
 =?utf-8?B?OEJvcVJEcWR2K3paRGZFN3VVaWIrbUFEREhpSlFiZjJPY0J5cUp1OXV0NHBr?=
 =?utf-8?B?azF4NWZmQjJsNEVUb1JzcnpWL0xhMjRPTlpFU1BodW1yZTltcG8xaEdkVXJH?=
 =?utf-8?B?ZzY2UlU2SUliTldLYk55ajM5eG9SVU9ZUjcyalVOM2syQklNczluRWlzWDFR?=
 =?utf-8?B?YWNnUy85SEc1YWhaa0dBcjVtRUh1VTVCRmhnQWFjZkFrZWFKS2t1MEFBTHNq?=
 =?utf-8?B?WUdLT3dieXV6UXAySUFMK3Bqd0d4NFRSRmhFQUNFVW4ydEZ3blc1Z0xlVDFC?=
 =?utf-8?B?OU90LzlCRnhLRlhzQWFUTnRVQzNJeU8va0prZ3NlcHNjV05ZOXdrQ0FSdFc1?=
 =?utf-8?B?dWtWUWFjc0FHTHFRQTlpb3lEV01lUVUyQTBIS1JUY0Voc0ZPYTVkNDIrSDQy?=
 =?utf-8?B?c2xCNWUxWkZkWWtWVDU2ajkyTlFOQlNHNDRtTjFFLzZOcUU2UFl1TVB6NTkr?=
 =?utf-8?B?YVBaazNVM0F3N3AydXIzeDE5WUgvcFRtZ1l5MmtQTkdtNldLU1dNb0thcHZs?=
 =?utf-8?B?NkphWlJVQXh2SzZJb1k0ZTltSmRVaFFSbmp3ZXBXb0VCbWxvalZPZGRHUGJM?=
 =?utf-8?B?Z0NXL0NNeTlnT1JDTEtNRTdtd0NLMk0vWDVDZmdCVVRhVjNzUGpjT3RVZVFG?=
 =?utf-8?B?TjRXNnMraHI5MXdzT0VqTGdlK0V0b25lSnc2NnpDUlJkZElZbzZacU45dFd5?=
 =?utf-8?B?cW9IUlJJUlIzb1hBN1hPbHZML3g0NGJ3eW9Dcm5ZcTUzZ0EyK1Z6NGhtclYr?=
 =?utf-8?B?MWtJem8zMm5Sam9USVU4KzVmZG9kMlVJRHFPNEJSMlkzR1RmWkpKb1l5ckFW?=
 =?utf-8?B?NHlBWjU2blIrM2JONDQvMjUydFdRNzZoNVNCMk4yR3BoZzJFZk1QS2UxU0NS?=
 =?utf-8?B?MXQwQnljMWhpQndZTUVYZk5KN2JIQWtyK0xTRm56SzFlWG02RmlQN0pFREc2?=
 =?utf-8?B?SFFQMGx6SHJKNnRUREZ6cVN0OFB3ZDZLeGh5Z0lyUlUrRDBYWUNQVytlMzhm?=
 =?utf-8?B?aVE1L3ZKYm1MWjhrRnBGMVJ4Y0liKzZGT0dpektFV0huMmNIekR1elByWjF2?=
 =?utf-8?B?Q085djMvSXNlU0s2NHRoVmhNcHdjU3YrZHdnWCtzT3hsQldyR3pyc0MyTE04?=
 =?utf-8?B?blYrRmRXQ0VhOGw2NjlyUmlIcHFDUE53RFYxZVhaaUJrT01yQ2JPRTNLbDM4?=
 =?utf-8?B?RTRhSHJJSGRxbmdSQnJmSS9JbXprdUUxRzlWUE0wcDZ4WmhnTGhwc2hoKzkw?=
 =?utf-8?B?UkJpN2FiNzNuZWkvT2FwSFRXbnlLQW96OW8yL2dkYndzdkdoVFRHUWVwWEhw?=
 =?utf-8?B?TXRCbkpmN0MzZWx6MlIzbW1ITDlqcUk3eDdHcG1DWnRWVlo2VDBveW4zcEE4?=
 =?utf-8?B?REhpTkllZC80cW1wbUJQeHpBNHhBMmwzaXpQQWdjYU8vMHNobWdzaEtIbU9v?=
 =?utf-8?B?cG9STW9ZT0p6VzYzclIvN3U1ZFNMY3YwU3ZMQmpqUXh6eVFmK0V6UUZxcEp6?=
 =?utf-8?B?WUxSRlBidzVyVyt5RTZrUmIxVlBWb2JpTnBJSG5xZjdnaUJuOWlmTFNuQTNn?=
 =?utf-8?B?OVBWME5TaTRXKzRxTDNTZHFPbmZOdERhZjZhTWZvd0FOeUhLOWRIRkRQUW1U?=
 =?utf-8?B?LzFOZzZjQXZDSVJPek9kYy9QQ3doaWtBWlJuZXhUWUh3YW12VTRxRUdESmdB?=
 =?utf-8?Q?6E3D+W9CmJY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QjErSzdIdjZPTlRmR2JRdm1MUys3N211U0o1bnJSSHNua3pkeUd3YUh5SUJz?=
 =?utf-8?B?Zm9vZXhiWEpLcjB6blMvZUJxRzloTWVRSXQrOUthTlgvd1JSS1hLcGtjNEJm?=
 =?utf-8?B?clN2dTgyV1Y2bEFvTXBPSzV1QWRUREU3MzlwY25YVi9ZRWZLRi8yMWxhQUdK?=
 =?utf-8?B?ZStXdThIbDFiV2hoVTV0Nm9udnQxa1pTeTNGN3dnMmVERC9TSTNYZEdmbjE5?=
 =?utf-8?B?ZXdqNlc5MDNUaERTSStvQ1M5cmhQNXZRckJ2WHBpa25LRjNZTHRkaHozY3hm?=
 =?utf-8?B?alVPMjhFVFg0dFJORWJzYjJ1VWJYdTRsaUIvTmFZdG5SdFZFZGN2NEZKNkEx?=
 =?utf-8?B?amJKbnFCUXhSUWJpbzFVVGxLQUx6UTVBRW5TTloyVWZka09xZnFyK3MvUFk0?=
 =?utf-8?B?UGd4Zm42ZVNNNk8xdU5leWNaRGIyeCtKTVh1ZnJ1TmFNUGJzMUdzY3djb29v?=
 =?utf-8?B?T1J2UXJQVlVhMDZTcnFkTXA1Q0FZQWdsbVlxakZjWjJRSDAvM0J6U2RSTHdo?=
 =?utf-8?B?Sjh3bVg1RGVvMTl2U1dDVS8ySFNpbjl4UUxpQlBDZkYyc05BYklQRDRkM0lM?=
 =?utf-8?B?R29VVUdiRDRUUE5LaTc1RTZzemNmcHNabUNIeXB0T3ZpeExIdUMxcUZiTFNP?=
 =?utf-8?B?bGFFajhOTWZPR0V1b1NtVzBsc3RwbHdtREYrdHVMTExlYjZBREJxQllFV1hB?=
 =?utf-8?B?WWtPN2NxZ3Z0ZG43YldveG9oTGZrZDU4Vkh5OUhjODRadzJsSjZtak1ITTFK?=
 =?utf-8?B?YUZ2d0E0NktCZEd2NytYeWRBWlNERlZJbFgyWVBrSis1VkE2TlplQVpLZ1dx?=
 =?utf-8?B?bFRoeTFSVkdINXk4b1RSc013NjMvWGs4LzA5TXhycXk4dkFwQjVtenNDclpo?=
 =?utf-8?B?VXdGMVpJZTdvU2txbDZKcWJ2ZlZGT2RGUmVrU0s4YU1kOE5DaXk3Y1RuUm04?=
 =?utf-8?B?NlA1ZHd6eUhIU1RRSllORUJPZEtIZWptV3FzWDZxbWZ4VHV6cmdldnhVb3FM?=
 =?utf-8?B?cDB4TFo1S3cxa3RuRTRwZG1McFVhaDZWcHgrOWwxWE1RWlVzdzc0emJTaUl1?=
 =?utf-8?B?bUVueEZTMzR6MUdzZ2dMRklSZC9iU1pZUlN2OStRbDVjeW0zZTNqREdYLzFk?=
 =?utf-8?B?NE9maEdrbU9sZWhhOCtRNGJzb2p1V29wWnVKTEg0dHBGNUpVdVczWjhoeFE1?=
 =?utf-8?B?OG9TQlB5SVdUSVQzWDlNRVZRSHpaVjJUWXhuUjJQSGNyd1F4RHljYmxrOG5s?=
 =?utf-8?B?V09xUVpLaHJ5MjYwaFcvbkZpUWhBMmpEZlVOOXBGUDkwZVNnYVVTTEhkNFJC?=
 =?utf-8?B?R0NaTkpxUGdCZ2hqMlpUenRSWFVMdWJNL2xxSjY2V2VGcTNPL3ZBN1pwN0Zm?=
 =?utf-8?B?TFhwL2YxdlRnUlZSdmxqclp5VkVhRldoRWZxTUZSVzRQL0NtaTg0Vjh4eDZQ?=
 =?utf-8?B?UnVKUXVpdXNacURBak4rMWhRMnV1bVNFNXo3UE1ad01xTitYNUJ5R0pibURv?=
 =?utf-8?B?RENOQitNdkZ1a1B0dDE3WU5RWWl0dC96dU42UU5OK2o1TGtXMllldWVwTXJD?=
 =?utf-8?B?c2NYalc3V2krWWs2NWt2UXFONk91Z25reFR3UlM3WTVCQVhTRWRDSHJHYmpH?=
 =?utf-8?B?Y1NyckpQQXFsTFBaVUFURTBpN0ticXd0RXpQY29EVTZab3NOek1FK3dHU3FD?=
 =?utf-8?B?SDZKNS9iWWpoY3QyV0c4OUFpWG1EemlmOGVMSGFVek8vRU9rS0REZDE1TUhx?=
 =?utf-8?B?RmZKQzN4VWJLT3JXd2RWNThEUjZMaS94dWNUeTAyZ3h5Y2g0bGhZdVBDSzN4?=
 =?utf-8?B?czhLUW54QlhsOG4yL1NaMkV5YUpjclVQU0I3dVBoZ0ZydGwyVTR1OWNtNHBa?=
 =?utf-8?B?Q3UvTDZybmhsdGRyLzRMd0JSUzQzNWlnNDNzakhjVjVIUHU1b2s5Sm9ha2NW?=
 =?utf-8?B?bm9ITS9JK1lkWGFQblpqdjF1cGxGWkE4c3dpZ05CVmFsRWlxTDlrWXJFdGhj?=
 =?utf-8?B?RGJZb29XWWNGaisxdE5CNlZ0VjkrRWlvbHAwUzN4VzQrQWNRTVpsWlUxQTJV?=
 =?utf-8?B?TFdiYlFyWXFFclRLN2pxWTZhR0xHcWdvd2YrbTd0SlgzZkpDekFiMmNLZlRz?=
 =?utf-8?B?b2RnQ3VkaFZHY0dncVVFSDZkTGE0a1IzU0t2QXE4YS9yOVpaUytaTjdtQTJY?=
 =?utf-8?B?OXc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db67f3e-8957-4e6a-a453-08dd96c209b3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 10:43:48.8448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mihZh+J23W+O3EtV6RflcUVv5etY8cUxiRdJExtTCuH4ADz6niEYSnK1rO/wjEsdagt7YIspkyEbsNsOBEtsDc6HFT7LojSwi6uHOO6VDOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8465
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 10:44:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216832

Hi Luca,

On 5/19/25 10:33 AM, luca fancellu via lists.openembedded.org wrote:
> Modify the clang recipe to provide also the python module
> 'clang' when building libclang.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v2 changes:
>   - used PACKAGECONFIG and default on
> ---
>   meta/recipes-devtools/clang/clang_git.bb | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
> index b41b700292c7..42f52af4056e 100644
> --- a/meta/recipes-devtools/clang/clang_git.bb
> +++ b/meta/recipes-devtools/clang/clang_git.bb
> @@ -49,7 +49,7 @@ def get_clang_host_arch(bb, d):
>   def get_clang_target_arch(bb, d):
>       return get_clang_arch(bb, d, 'TARGET_ARCH')
>   
> -PACKAGECONFIG_CLANG_COMMON = "build-id eh libedit rtti shared-libs \
> +PACKAGECONFIG_CLANG_COMMON = "build-id eh libedit rtti shared-libs libclang-python \
>                                 ${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', 'compiler-rt libcplusplus libomp unwindlib', '', d)} \
>                                 "
>   
> @@ -90,6 +90,7 @@ PACKAGECONFIG[split-dwarf] = "-DLLVM_USE_SPLIT_DWARF=ON,-DLLVM_USE_SPLIT_DWARF=O
>   PACKAGECONFIG[terminfo] = "-DLLVM_ENABLE_TERMINFO=ON -DCOMPILER_RT_TERMINFO_LIB=ON,-DLLVM_ENABLE_TERMINFO=OFF -DCOMPILER_RT_TERMINFO_LIB=OFF,ncurses,"
>   PACKAGECONFIG[thin-lto] = "-DLLVM_ENABLE_LTO=Thin -DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR},,binutils,"
>   PACKAGECONFIG[unwindlib] = "-DCLANG_DEFAULT_UNWINDLIB=libunwind,-DCLANG_DEFAULT_UNWINDLIB=libgcc,,"
> +PACKAGECONFIG[libclang-python] = "-DCLANG_PYTHON_BINDINGS_VERSIONS=${PYTHON_BASEVERSION},,"
>   
>   OECMAKE_SOURCEPATH = "${S}/llvm"
>   
> @@ -312,7 +313,7 @@ PROVIDES:append:class-native = " llvm-native libclc-native"
>   PROVIDES:append:class-target = " llvm libclc"
>   PROVIDES:append:class-nativesdk = " nativesdk-llvm nativesdk-libclc"
>   
> -PACKAGES =+ "${PN}-libllvm ${PN}-lldb-python ${PN}-libclang-cpp ${PN}-tidy ${PN}-format ${PN}-tools ${PN}-clc \
> +PACKAGES =+ "${PN}-libllvm ${PN}-lldb-python ${PN}-libclang-python ${PN}-libclang-cpp ${PN}-tidy ${PN}-format ${PN}-tools ${PN}-clc \
>                libclang lldb lldb-server liblldb llvm-linker-tools"
>   
>   
> @@ -342,6 +343,8 @@ FILES:${PN}-libclang-cpp = "${libdir}/libclang-cpp.so.*"
>   
>   FILES:${PN}-lldb-python = "${libdir}/python*/site-packages/lldb/*"
>   
> +FILES:${PN}-libclang-python = "${libdir}/python*/site-packages/clang/*"
> +

Wondering if we cannot use ${PYTHON_SITEPACKAGES_DIR}/clang/* here from 
python3-dir.bbclass? (same for lldb-python and do_install:append()?).

Cheers,
Quentin

