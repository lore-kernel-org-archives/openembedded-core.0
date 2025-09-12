Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E82B4CA101F
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 15:36:56 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.54])
 by mx.groups.io with SMTP id smtpd.web10.19886.1757691407738297613
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Sep 2025 08:36:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=DyvCUDUo;
 spf=pass (domain: cherry.de, ip: 52.101.69.54, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i56rREygr+H6MYk5wVh30rDYSk8caELY/2uurEgAN6akN30+gj5PNFAQ6bPBYR4eUGNggogDS+KNgSGY0uo4V5pd2l4JDnDekG4+Glcr0Kd74qP7R+aV0OzBXYfzZu4CnwDt2b8QptrROpUntkP+18scv+wNY0bZk4HHRHe14fBJCChFDQ4LYILTuvAZPiGccxANjdg6Txm0YYGcyfc4OyOUS+Pnl2HBestHda4SV/IIGtFeTl5WfepmRakStlcIVi/PeIcWfYe6uDG0xoIPr+v1rPzACLZ/M4pF6urAutARn/3lbb19zhumkOe3YUJon7oO4kCTvWCfxC+5X5tcUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=toFY+zLzT8roNRfeL8I2ni+nflrAHqCj8/+ZF+bFlqQ=;
 b=q/VMdS5IYjJmdZ/TNNHb86yhU4aN7DzQ/Nw70A23ufRWKU8P2KPS3J0P7Pa9mll+Btu5CBHqIr3uygIDfbseN7yajsSQf4hEmq22eqI0YDKwX0+TMyyO9E/GZJZUOBlu02A6kIrDO5DaQe5bqS1QjBF/eOMAK0egC12L9CHvtf41O5y98ScN/1TWjFay/6kKaJiXMVrbGTNofpl1W8zb3uo/DjtjWKK67ryqtCmrfbzA5N/5XSmOytT2WCTHvZOM7eHVu28KbtLfQvUzwXL22tDMkhrY/ljEjzwbzjSq29fVwn+BJBFXIhpMSBpF95ag1yiKgkJGiWLBSTSKOr+GnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=toFY+zLzT8roNRfeL8I2ni+nflrAHqCj8/+ZF+bFlqQ=;
 b=DyvCUDUogHq4cZbxdheN8Eobv1XMZr59qXoAAZJSryPN1XOk/icFEw1eFcVGqokLjHimqjY6NLJJKvoM6EUFgwAC93Bi4kHUAxBllXBtrxVuRpmtSvAahzzGpKwuZX0UhmXAt4U5Hf+bFs3vlemZDgeRX9NEFIG+EXTD26YjjuY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by VI0PR04MB10211.eurprd04.prod.outlook.com (2603:10a6:800:240::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.15; Fri, 12 Sep
 2025 15:36:41 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%6]) with mapi id 15.20.9115.017; Fri, 12 Sep 2025
 15:36:41 +0000
Message-ID: <c8e6332d-7ec2-42c8-901a-7e95b48d95d4@cherry.de>
Date: Fri, 12 Sep 2025 17:36:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/3] bitbake.conf: add vulkan to
 DISTRO_FEATURES_FILTER_NATIVE{,SDK}
To: dmitry.baryshkov@oss.qualcomm.com,
 openembedded-core@lists.openembedded.org
References: <20250912152548.730100-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250912152548.730100-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::16) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|VI0PR04MB10211:EE_
X-MS-Office365-Filtering-Correlation-Id: a4acaf66-daad-4855-b8ac-08ddf2122b5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RjBXdVlEOW4vWUdzYWkvQjNKNDdFUnQ0cy8wcDJsM0ZHajFQOXZmblJwM1l6?=
 =?utf-8?B?NDVBYksyT3lZNm9rcGVET2NQVmw4UjZoQTNpUEwySmRRRzJHckFTN0krVTJx?=
 =?utf-8?B?ZG5ra0QrT0RXYmZYTGo4bXVFd0hwMFRRdjJlaVVLT0RybXRURFptd0xIU0tI?=
 =?utf-8?B?RjVxZkk4bjQ4N09Wd2hPRUhxWTlUcVdZT3JvR0wxK1lhS2FrS2dUT2NhYW1P?=
 =?utf-8?B?UVJFd0djaDZmRE1SZVBJZjdoSWh6UWNYUlUzMGRSVmNTaFJic0dYb09hUEdv?=
 =?utf-8?B?L0VwcTFiQ1hQeFJkazhCOEp2MjhEQjFEVWp5UWlNV3lrZVJaOUlIbUxtM0JZ?=
 =?utf-8?B?SEdPQzFiRHh4YVBHbFFuNjhpRnRteUVMc2lLbFFpTWJUd3lQZWRVS0FyM1pU?=
 =?utf-8?B?a3Z2OTJ2YlN1TWozSUo0VXEzbzJKZ1Q2NzVOSVJlc2RRWWY5RlI5K3A5V1Ra?=
 =?utf-8?B?dmo1ZmtMdFpGZnhGazhwK3kvcmhNRFdsSkxqaG01aDhyeVlFelB2Tm8rZVho?=
 =?utf-8?B?R2F3SXpRVkVyRXZQT1F2ZmNpWGljSXNUV1pzcXRMNGtRMVU4RW8vb0ZwMXB3?=
 =?utf-8?B?QUF1N2pHdTU4aUxvRU1ha1JVSW01ODYxZ1c2eEtQOE8yZ1NOWjZZUHpvUEFC?=
 =?utf-8?B?UUt4K21tN1ZkYXFiU2dhMXV1aUszNVB6OXNNdnhUZ1U2WXcxWEd2N2hCZlVj?=
 =?utf-8?B?Y3NQaTF2L1VTN0l0ak0zbGJFcVR6aDRGYnB2ejJWK21NSUZvQmhGWG9hWVZu?=
 =?utf-8?B?bDVkWkxNSU1sUkZKaXkvbWRzKzkzYmFrZ25vdEhvNDl3djRhU21KeHprVUtF?=
 =?utf-8?B?K1VYamZpTllxdnNYRjVxb0hHdzBrS3JOQUdrRFM0b3BLMCtSZkc3VXptdEwr?=
 =?utf-8?B?THYva3ViV0w2MU1vUS8xRE5waXBVKzljNkU0K21zTFUwTkxRTHVGbUJoZ1lY?=
 =?utf-8?B?MWV2REZZbHZCbXJiNno3WjZIY1p6MkhDZWI1UTJKeDBJMGhnUTB1ektrUHJG?=
 =?utf-8?B?cGJaK2lpY1BENklxVUkzUVRKQ3phYnNqMmRCL1V0VXppRlNlODhvTTRlUHFr?=
 =?utf-8?B?b2ROZE9qeE5EN2VYWlA4WGpXTGtLQlVWSnZqT0dSN205Y3E3UkdhNHA0TmJP?=
 =?utf-8?B?NHk5ZEorWGttSHJHV01oa2JJcjR1TmtwZTRnUXBoNXpZYlZJbC9LSm5idUZX?=
 =?utf-8?B?NVRSTEdQZFd4V2FtUHZlVGE5MUhXeHNKaktWVDVOQmtwTDY1M2JkSjFYWVNn?=
 =?utf-8?B?N1RoYkxYTzBxTEdXMG1vMXd6US9QSmhCZUhvMk4xMGt0bnp2TWdkeHFpcERn?=
 =?utf-8?B?ZmxTV2t0bDBEMzJNd3M1cW95SXhycVZQajVmdmpxNjlsczFSNGplUWtDdUtH?=
 =?utf-8?B?anlLY2pBVlJMa3JQOUoydWk2N21YaFdUdUhXV05Md3oxamM4eHovK015RWpR?=
 =?utf-8?B?alVaQXZmZlBJZDVqelFwdk5zOTNNQmhMTXNvSjVwSmIyRitEWEU5b0FTOXM4?=
 =?utf-8?B?VVVuYzNuWFl1ZGFySjBqb0VCOWNYaW9sNmFWMTlSc3VhK3FNOG8vcCttNTd4?=
 =?utf-8?B?NTc5eENUVytrdlB4aE9FWWw5L3RSWUIzRmdUbW1sSFZKMXNJZnJsUEFzODFi?=
 =?utf-8?B?aUpTNVRzZHo2SFdCS3AwU2VSVFE5TFZCN2Y5MS9uMnpLUk9JN0tGd2xzSWc4?=
 =?utf-8?B?TVFucDU5U1Vib2NHU0NqZ21xck42MWppWE5GNFZ2cGNnb2I0NGZ2b08zVGpN?=
 =?utf-8?B?WEFUdzNrS2JUbytBa2ZueGF0SUpSOHpmWnE5Z3Z0eVM2cmU0ZnpLa0txenBk?=
 =?utf-8?B?QjB3cXM0cG0wN2tQR1prSTRKK2NnWi84eTVCQnVicEwvNldNZlZIN05oUUtO?=
 =?utf-8?B?aWhKQWFieENEdHBBVDc0VUUzK3NBYlVrSWpkTTJCMjVvcldGNGpLZkdJNzVW?=
 =?utf-8?Q?4DfvzS6rhag=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QkNKdHJwVDhBSFhvV1FmaDdwVTltb2dvTE40NnlIcm5SLzJJSTFHVDlQZVlI?=
 =?utf-8?B?dGV5TEFaRmtVeHVGcStMVjdabzhVaXpRMWdNL3lkSEpPOG05R29vanl4aUl1?=
 =?utf-8?B?ZnpPUEErZFFFcnNiNTVuNUpqKzEycnlQTnBseHJUeG9wSmZWZzNmaFRYaERK?=
 =?utf-8?B?V2lkMytNclZMNmZqUUY4Sk4wSy9BZmVXZm1CZytXSzRkTHIwc3k1Q1dpcUFp?=
 =?utf-8?B?c0w4SzAyUDNMTmFzZlp0aHZ3R2VQTkF4RjEvNVJ4ODVRQjlQSUhnVDcyaGtL?=
 =?utf-8?B?aWIreWZHdCsyemE2Zkh4dUF3Z08zVlJ4OVpCcytzYW1UTE1XYlozTEg1elJQ?=
 =?utf-8?B?blVNcHR1RG9SdXl1OVNrcDRQOVYwWTlPSWt6YXBIYjB0L2VxZ0tPdlFmNFRD?=
 =?utf-8?B?SkQzcC9zU1J4UXh0NHQwZGtxQjRoSEl3L0luc21oU1lTRTFjRTlSd3kwb01q?=
 =?utf-8?B?T1JKc3Zrb3Y5NjE1K1ZNWFBGNjNMQmxCSG16eWYrUXluT3d5NGZvK3k2aFhr?=
 =?utf-8?B?RXFhaGlkUlJQRDRsQnM1ZDhjeGZnNDFSSGs5LzVwR3J6Y0tYN3VvV0lQYWRW?=
 =?utf-8?B?d2M2MWpic2hMc0pXNG8zdkUvbWpGbEF6ZXE4azFoWG8xQlpGemZHcTFXcWs1?=
 =?utf-8?B?d2xQeG9DZy9ONWJZM0pkT1FKY2MxWTZBSXJ1V1pkQ1RTYityZ0FHdmI2OFRK?=
 =?utf-8?B?U3VSU0RLNGlXamVCSHphVEJQNXRWYloyV1JlcEFFMGJWUEZWVWMzVHJXNnR3?=
 =?utf-8?B?bWJEdTZETjlVK3ZJR0FUYU04WkJHbW9XalgvSEJGODB3LzdRRUdTeWdEYlM3?=
 =?utf-8?B?YnVuWUViRmJzcnUyeGVZOVllOCtqSHdNd3lmVFJPY3F1bGtBSVk5am1IeGVk?=
 =?utf-8?B?b2JyNThsQ1VWQjA2VWhnbkoxR3ZWOWVBZE9GWWxlZm01NjNCbXJlWXA5OC81?=
 =?utf-8?B?KzU2MnA4VjZJcURoZlpPOEpoQjEzaDdyWXNnWlhCeDhrN1pUVWI5ckx2VlQ2?=
 =?utf-8?B?VjZwQnBUdEw4MkZjM0dMWDJpTXVYdTNvdlJWKy8zREQxTUkvZE1ORzBNWTdC?=
 =?utf-8?B?ZzdJdlhHOXI3cHZONkxNVTg5TmdUbmZyMWxHQmVNdk90aXpFNTBDQXNubnBS?=
 =?utf-8?B?NXYrdERyZXgwQUtOU28xUzhnR0E3RlBTVU4xR2RwUlFhYUhHaUNlMUNneWVr?=
 =?utf-8?B?cm93OU5yZXpUbWpaMGNnWlllaWljc05nZEwrSU5ES1BCdGVmaGhiS1dUbVQw?=
 =?utf-8?B?TU8wSlVZY0J2YVoxZ0VnOWkwd0wyN0ZOT2hBMTNrNG5EYkJEUjZxMk15OUtG?=
 =?utf-8?B?eVhuTUdHUThLc09HTjRhT2hJWXJncmdsdmNtNFM0WGFiMFp1WVZMQy9kVEV6?=
 =?utf-8?B?SmUzN0xHMStkS25PbFZxRlF6RkNyTXAxMC9JdFI3Z2h6anFSQjBBY0xBQmVV?=
 =?utf-8?B?Ym9ONDZWQTdYU3VPWElPNE1VYis3a3Q5QUFMMXUzSUpKaTczZ0NHbUJ2NEti?=
 =?utf-8?B?L0FKcE1nck9OeHoxTWZjbi81eElxYk1TeHFidkRsTWdhakp0TExsUWk3MjRD?=
 =?utf-8?B?S0ZJTnhKaFQ0VzM1TjVlYkZFRDJvZUYxakFzblJIVU1QbEpUczlYbEFkTnd6?=
 =?utf-8?B?cXUwU3JHT1ZQRGRuWTJJZnMrRCtOSVYydHBSaFVHaGU3TUtZRWk3WHVIRnJD?=
 =?utf-8?B?TFRzVTJJQkdKWG1wc2ZPT0lwVWtBNjh6WHg4VHd6VFlvaDBvcXR3MVl0Z29p?=
 =?utf-8?B?SFdiZUIyRDJraXVOa2pyZzcreW4zR0hDZmRYazJwN0xLMWUvUjJxZURtd0Fs?=
 =?utf-8?B?YzdVTElpN2VGZ044NzQvd0N5T1YwSm4wU1NIRy9VVXdsVXcrMkdOcHFGeGVa?=
 =?utf-8?B?ZGVvQXl4M0tKODNBL2ZmdWlkMXRyeGdRbWRUQmF1dkRsNXZpQTdrZVpQcU5D?=
 =?utf-8?B?RlMyQTY0Um1rbXFMSjlqU3NCNFRKWG5maFlaanhRWk1sQ1h2OEpCc2ZkZWY1?=
 =?utf-8?B?eWxSVkdnZFhnYjVycnlSUGJvZk9abXBvWWNXNkNhQzFSRUw5cFNSYlN4MzRy?=
 =?utf-8?B?aDJiaUR6ZTgzcC9CQTEzUEowSkxnTjg5ZG1rQi9iZ3F5QU1BQlZlUkRiSFFn?=
 =?utf-8?B?WUJsRGJrdFVBdTMzeFYyamRtOSt6Y0x5UXJhQ3VUUVBwam95RmoyeGlSOHpV?=
 =?utf-8?B?dVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a4acaf66-daad-4855-b8ac-08ddf2122b5b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 15:36:41.0834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s07n53xZbTaiyJM4cuSX/UZQSUvGOjTGkNpJCdS5VReewKD8ijfDdnVRc9MsEidtoSg0c4cT6EM2bGd93o/enL852SoOCUZWT+6TUH0sUY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10211
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 15:36:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223323

Hi Dmitry,

On 9/12/25 5:25 PM, Dmitry Baryshkov via lists.openembedded.org wrote:
> Follow the example of OpenGL and propagate vulkan from the target
> DISTRO_FEATURES into the native build. This helps us to resolve mesa ->
> mesa-native dependency if 'opengl' is not a part of DISTRO_FEATURES
> 

It's unclear to me how this "helps us to resolve mesa -> mesa-native 
dependency if 'opengl' is not a part of DISTRO_FEATURES" and same remark 
for patch 2/3 in this series.

Can you please provide a bit more context on the issue you're trying to 
solve?

Thanks!
Quentin

