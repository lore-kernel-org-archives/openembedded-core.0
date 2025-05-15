Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC695C3ABC9
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 13:07:24 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.5])
 by mx.groups.io with SMTP id smtpd.web10.12051.1747314440720238092
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 06:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=WubuPWva;
 spf=pass (domain: cherry.de, ip: 52.101.70.5, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qzB+FeNbQlWZrJl/QgHJ0nDFZt6/n1+nCOj91cnKM8epyeClumUSaXbF0vx6ca2BCgQDvlcMfAEkBGGZkRSj88KjxAGa3DTwbDyZ9Z8INliNLLItmAqGIrN+1BMhJ2XaMFH/CtCkUxKI8JLfrfUQkzpmDvWU3MP6xdHvCNRsP5Uh7uKJ6q6XXdoq+tKtdmfKWnXz84VJukZw1okNGFW2jDp+UpraUiN6d4DTiWdbPBC0a4wM/Atz6AUPCcXWg1v/w5qfXd9IGpsEb8BpUt/mKzKezpjl7Rs6++uM80VcCjxMd+XhKhw0jv3uk7YxTqU3UWKr6T162jiU6DxCl/Nz9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BGZ0clmpPBuGKq9nwTVMEriVanKUijuhjecTDviMxIk=;
 b=x7svYANqscCpiJT+77YHcJtJoMx73npfd40ENqV3pJnS0EMAwv5NVfZKfYXft74ZDWyTzKlpFeeI66DuPhHFIrJ5yQxstyYeaezaFMGhxlmZGkQNi1QTowBsHET+8P30XCOD7TooANYlFv4yaB/ccxVJm+gthTk9qnfNZUbcVVNmnVvGEcefuC+YosAGF6TU4QF8KLVI76Zv2jipTBZ8d5XfNuck2Fufg/EBgKmzcr7DWpKyk3Y3Wu79aufE9pKMioZSB6rCG+BK1nqcHaNLtOLoQKACOncaqRkg708ly9+RVVpQ7frgbJJI22f92DWtWzLxxOad4dhGQHQ7R9a0JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGZ0clmpPBuGKq9nwTVMEriVanKUijuhjecTDviMxIk=;
 b=WubuPWvaI7xvOECcULurnURgrSBV6hDWY+chq4cgbEofvM1PYyFLX11VL8ci8mZ10cOS8G6CWvQ2+m6NEVYnQ5eFVX0hvDV+etLAn/LQIpDo7mxg1/k7BFDWzZt4E9QXI9WoeJxBQX+l0Q5ZFarkLrY8PqZcECsv6M3ouYzFhNk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by VI2PR04MB10689.eurprd04.prod.outlook.com (2603:10a6:800:26f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 13:07:14 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%4]) with mapi id 15.20.8722.031; Thu, 15 May 2025
 13:07:14 +0000
Message-ID: <22cdbc6e-7b9f-4f46-b000-39ea4867457b@cherry.de>
Date: Thu, 15 May 2025 15:06:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 22/22] release-notes: drop references to
 kernel-fitimage.bbclass
To: adrian.freihofer@siemens.com, openembedded-core@lists.openembedded.org
Cc: marex@denx.de, docs <docs@lists.yoctoproject.org>
References: <20250514185225.162998-1-adrian.freihofer@siemens.com>
 <20250514185225.162998-23-adrian.freihofer@siemens.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250514185225.162998-23-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0377.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::13) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|VI2PR04MB10689:EE_
X-MS-Office365-Filtering-Correlation-Id: bed738f0-297b-4ab5-71f3-08dd93b160fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SnI2YkI4d3lMLzArU1FzOFE4TGQ4YUNqNllCaCtLS2RyYUN5KzMrc0dVVDBv?=
 =?utf-8?B?V3BLZjQ2c0FSZDkvcmRPbjNnQklCSXk3ZHpzMlZaTlhkSDJXaHlDUnByQkE2?=
 =?utf-8?B?ZVYwcHRLWER0TVlRSllqWFY0R0s5OU5KWWNldTBnbytpRHoyNWd2dFY2ellp?=
 =?utf-8?B?dy9ZKzhseTFPSU1ZbjRTQXhtWmxXSnBIcnNoS1U2WW5tR0J1UlpLRk5xOGNv?=
 =?utf-8?B?OGxYTHJJTkNINGNxeUd4M2l3T0lKWGwxVVRuY1JvaklNb3RMMEQ5Y0dzZjFX?=
 =?utf-8?B?VFBNdnZXMUJEK05vRStrWENFQUtZdGxwbHJlQ2NxUjZwTStQU0NTTWtWNHhv?=
 =?utf-8?B?eHFpVjFVTmcrU2NORXZBRytjSGU4WU5Jay9Sd21VVndBV013MWcreERHaFNi?=
 =?utf-8?B?Ylk4Y2d0YXlqY3V6L2wxeXdBYkdQeFdNZFZ3V21vQVFWMXgxN3EreGtQNXB2?=
 =?utf-8?B?QngzaWhoQ2ZvTVpoakJrVm5PRDk5Qkg2WWl3RUlMTXA3cDc1b0Uyek5iYk5n?=
 =?utf-8?B?TnBJRThkdmJXK1c0OFd3TkR3eEdCOC9YUXpDYUJVb3dGQnZiYTVzcnkxVWNu?=
 =?utf-8?B?ZG10bGZHOXMxUVJ5VmZ1YlFiTUd4N00rclZ0cm9BK0NTSGd1ZTlnVHptR3k5?=
 =?utf-8?B?WEVOaWtVOEhpQzczb2dkcjZVN29vY3ZBY0VZWTRkdE5aVmNRZDZ1azN1amVC?=
 =?utf-8?B?Yk1aVjdONXdreEVlcU1DdzkvUU1xWnNKdzFXN1lzYlp1eDZZSTJ0ei9wV045?=
 =?utf-8?B?RnA3RjEyNEtmZHZYc1Q5bnBJN3lkb1JJcGtSeFhVTHlYQnFLU3QveTdsaEdS?=
 =?utf-8?B?Vkd2WVFUaVlmc216cEpsNkxmYi92QUk5R1VnMWozL0p5L2xoRFg5OG85WkJN?=
 =?utf-8?B?T1dtZXlMU2RJS1hLWHhabGdqZ0Y2M2N2QkxjdDZ4b1E0dUtkWi9tVXFGR2M5?=
 =?utf-8?B?SE5Na2s0R01uTHNmcFI5OWRtbUM0TXlFdjRTbWZVbklBWlhFL0dXUXY3VUZJ?=
 =?utf-8?B?RjkvRENEU2JQMmNzVGJDOWxodWpZQytBQ1V3YjZSSjV4OTYyRytaaDYrbDB4?=
 =?utf-8?B?N0FJZTB6dC8zVXZxdXRJVXowRWpwUk1qc0VHRGhvUnd3cWN5d1FPZG5OQzNL?=
 =?utf-8?B?cnJYRm05YXVyMGNZUjFSQlZ6RDBkVTUzUndVNWMrUUpVSFgvRW0wcEkrTlRW?=
 =?utf-8?B?eHk5VDZjM3AxcUoyUkx6VWxPWng4NkRKU3g3RmtpWlN3WWtScEZxY3VJN0R1?=
 =?utf-8?B?STZXWWc0aTRQRG91cmRBb0l5Vm51eStTNGtMM1QzWXJQb2VHMTFSdm85bGhT?=
 =?utf-8?B?WjVHSEJqS2QwL01RTE9sbGdxeWdXdlIxTEVCK1drRVA3eWUrR3FNUmV4RU90?=
 =?utf-8?B?WjNRcUViK3dQKzBKc3UxYVNsRlNxVUFVNWo4OFNBQzl2S2FOUDI3cmhMd2Vv?=
 =?utf-8?B?eis0QUJaTy9QV3VGMmZOUG4zTHBEcUk4QmxZRVJWaXE5VUpqRHlBTjJaTUpK?=
 =?utf-8?B?aEhUZG5LNHJJRStsWHhBaWgrSEttUk1kS0xQZGJnSEM3VlFvMXNzK1M4cTJx?=
 =?utf-8?B?M1Rjejl1NDFRTzUzRm01Q0c4STJQcENxZENJdmZyZXpTUVlQV1pkMVcxcldl?=
 =?utf-8?B?TjJlKzhmNHJyeDJISThTb290aldVV1FUeFNMMVFWdkJjRXNYZWJCWmV6WTN2?=
 =?utf-8?B?QVJiL24rdFlYNnNPcUJBdDVVYmgybFZjYVJrRDlUVndTWVNJVk1Xd0tpK2oz?=
 =?utf-8?B?MUlTOU9kM294Qk5TMkRWQ29heEJmWGhFejhubitjZnh5dWIrc0VzdXFsMXN1?=
 =?utf-8?B?dkdycStDYS9JTW1SRFc1Sm9IdThQSUM0QzQwaGJBOXlNblowZWJrcThRd1NR?=
 =?utf-8?B?ejhMUTJCaGNyYjFnN3RoR3loRGRpRWtKZzZoOHZxTkZ0NGRqZW5yYnFkQ1lG?=
 =?utf-8?Q?jq//8c0NDSg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ekN5RHZaY3F3Zk41eHhLVVlYbGFoRG9TNGpUZWlGaHBic3NPd04wSlJyK2w5?=
 =?utf-8?B?Z1RhSU45NENITkFnb1R2bmVvUTB3OWF0ZXhrRFdkQUZMc3VWZE83MVFlUitn?=
 =?utf-8?B?RUVoeTl4aUNxMGNGUjY3clRLd0d6MHFhaG10UHNpbEk0MHNMVDBXTnRhYWtV?=
 =?utf-8?B?N3V2RjNoM1ZQcmZhbHpQSS92aFRsUytQRUZMMFBBZXBlTXJHa0RnWWNzazJj?=
 =?utf-8?B?ZWo2Tmp4NTJKMkQyQ0w2dU1oMGI3YTR0ZkhOdVp4N3QzVjhYSXVzRm8vNXpK?=
 =?utf-8?B?Qlh4OHE2elMyeUxmQVVja2ZTUENmM1AxMHNsZnpmOHVWUUg4YnhnTEFoSXBi?=
 =?utf-8?B?OVVzemxrUlJIcHlUMkhMa0dRWk80MUt4bmpoVU9QZU9kaVR1NG1YYUxYb2Yx?=
 =?utf-8?B?L21BMWQzYkhETWEybzJXRUUrQldoWVVQUjEwdzZITkdGbGpOT3NlcVJPY3Zz?=
 =?utf-8?B?UWJ2UlJoR1ZEVnREQXhTbkZjUTFmY1VBZklQQW8rdXI0ZGQ0UjBQbXUxT0Zi?=
 =?utf-8?B?aDZZZDZla2RLdVhYS1FXT2JIU1luSEZhc3Vva1YvSU9hMTRRc1ZwemZBcmF4?=
 =?utf-8?B?S0lGZ0JHMXZ3NHNPN0JHSlE4MklXdWNyRmlwcVk2aG1GL2VLWTJrS2dKaU5w?=
 =?utf-8?B?QjR3ZWJkc0xtSTd1cm9YR2hsL1lMaHRnMXVEakQ5cVhhdUhPVWROa2l6ZzYw?=
 =?utf-8?B?NG9yRXVkMlNXbUVIVnc1cDFZRGt3aXBvMkFrUmMvMXJHeG5yUlFuMnVWcGMx?=
 =?utf-8?B?aHMvUW5kbGhUV0FiUzZHQXdaVFJ1eklQMHFsVDdJaE54eXN6MkhFSjVUcTFX?=
 =?utf-8?B?c3pUcjhSaEF6MisyS1dLLzV5NFpwOHlYd0RDNGgvT2w5bTlGQ1JJRGtCOTFS?=
 =?utf-8?B?OEREaUowMXBuK0lOc1NRTlhab0cweWF1dnBEeExqZExzOFNyQnFZdkFqOElQ?=
 =?utf-8?B?VE1Id0YwR0Q4RGdXd1lwSURmRWFLRVNHUGpvZzY5R21uQ0ZYN090S2dObnhz?=
 =?utf-8?B?N3dpSUtNcUt1S3p2MDdGNE9xNVlweDlWSGJTQlFsa3gzMDBYVU1XVytBeXBL?=
 =?utf-8?B?ZTZQQTZyWmlkcGRNeW8yV2xWVENaTnhvWXRWN0lYRDJFMFJwTHByMTl4L1dH?=
 =?utf-8?B?SHNPK2RYdWpzdDM3elYxc3doVlArV3c5OEJIc1ltTGhpaWtYV3lYcXRyZ0Z4?=
 =?utf-8?B?WkpIWHFGZ1o3bERuTW82ZHhZQWwvTWVPUm1Pa0Jac2ZQNlJFam15blBING1m?=
 =?utf-8?B?eFByMHJtNkhXKy9BdS9KeW9SeUc4OFJmQTk4emNDSHdLY0N5bWpMZnRISjdX?=
 =?utf-8?B?Q3dGUldoWXRtalpOZXErcmZkTit6Z2lOVThBV2t5N01PSmVzYmI0MjE3UGhN?=
 =?utf-8?B?S3g5clVoS0hTSEErdmpLckxvTE53dGVBQ2NnR0dTcVdQYzlVVHI5ejhrS1Vr?=
 =?utf-8?B?WHRaa0ZUNlJPQlhUaVRmQm1yNkU0T0NORXhGZlRBb0J2V1hxS1dMZ1p2U3o1?=
 =?utf-8?B?aVZ3MXNJNi8weEs4cHhLcWtZd3BhY1dpMnNteVMzc0FyZlc4ZjBwUElmUmtM?=
 =?utf-8?B?RjZacmY2M2RUQWdzZGNjNHVJK1BtYmd3QnBxVHNnRW9tbWRBZkg2dkZOcUJL?=
 =?utf-8?B?eFFuNFozc1pWV3I1djZTZy9pZWlzbWl2RGdQY0g2Wm5iSDF4aTBhbkFoSmhX?=
 =?utf-8?B?UXF0b1diZnBSSjNaOWNpSkZodnBELzNSVGpSR0FTcXFUQ3k1ZEU1QVNocEVQ?=
 =?utf-8?B?c2ZZcjYzS2hNYWNXU1BOK05LalFBcHNmMmtaWHNBcXdEL1VEdmlZcW9hQVNZ?=
 =?utf-8?B?TUlLcDh1dUhtNWxiYnlpaXdZcEREQ2FEQXJ6cU1UZGpENHZZQUdFSVhXS0F4?=
 =?utf-8?B?dDFOczJjN1NKYm5Qd1ErZjBlUC9qTUhKQ1ErdFNHa05PZEJLVEVxQW4yeTNn?=
 =?utf-8?B?enpHMnA2VmV0dU1xMlgzZkwyOTBiYWVkOGtqb2krWnlQOEhGcTNvN0RiS282?=
 =?utf-8?B?a2ZXZzhFZEhGQUdPVWlHYmtiNFlzb3hmbDhZc21iTzRFWEg5a1NOTDZNR2JV?=
 =?utf-8?B?bEtyK21VZGZjSmlJSHMvaDltUXhYa1I3RmRweHJlTzlGWHdNVU52OTNDaVM3?=
 =?utf-8?B?dDNtdGtpNTdLWEtWR1ZrU2FRekVRYVNEaGVpTFdMVU83TWhSR1RxdmtWRWdZ?=
 =?utf-8?B?bEE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: bed738f0-297b-4ab5-71f3-08dd93b160fa
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 13:07:14.7676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZZ1Hgq5WlhuQUpg5tnROsjfEN2MHhUhuqFjrVGH0+/ZXRWu7LJTPlJnGSL6a+GlQh3ccV6gqt/KZEZK2uZRkcj1QPAad+L0bgqqjd2xOvQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10689
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 13:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216671

This needs to go through yocto-docs ML and git repo.

Cc docs

On 5/14/25 8:51 PM, Adrian Freihofer via lists.openembedded.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
> 
> This commit drops references to the kernel-fitimage.bbclass to prevent
> from build errors when the label is no longer available.
> 
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>   documentation/migration-guides/release-notes-5.1.rst | 2 +-
>   documentation/migration-guides/release-notes-5.2.rst | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/documentation/migration-guides/release-notes-5.1.rst b/documentation/migration-guides/release-notes-5.1.rst
> index 267934a71ed..bab0c145814 100644
> --- a/documentation/migration-guides/release-notes-5.1.rst
> +++ b/documentation/migration-guides/release-notes-5.1.rst
> @@ -377,7 +377,7 @@ New Features / Enhancements in 5.1
>         :term:`SIGGEN_EXCLUDERECIPES_ABISAFE` and does not trigger a rebuild on a
>         change for dependent tasks.
>   
> -   -  In :ref:`ref-classes-kernel-fitimage`, the existence of
> +   -  In ``kernel-fitimage``, the existence of
>         :term:`EXTERNAL_KERNEL_DEVICETREE` is checked more thoroughly to avoid
>         false positives.
>   
> diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
> index dd541a7e3a4..42c6d60f9b8 100644
> --- a/documentation/migration-guides/release-notes-5.2.rst
> +++ b/documentation/migration-guides/release-notes-5.2.rst
> @@ -29,7 +29,7 @@ New Features / Enhancements in |yocto-ver|
>         ``RuntimeWatchdogSec`` option in ``/etc/systemd/system.conf``.
>   
>      -  :term:`FIT_UBOOT_ENV` to allow including a u-boot script as a text in a
> -      fit image. See the :ref:`ref-classes-kernel-fitimage` for more information.
> +      fit image. See the ``kernel-fitimage`` for more information.
>   
>      -  :ref:`ref-classes-meson`: :term:`MESON_INSTALL_TAGS` to allow passing
>         install tags (``--tags``) to the ``meson install`` command during the
> @@ -684,7 +684,7 @@ New Features / Enhancements in |yocto-ver|
>         command-line tool was added to the different Yocto Project and OpenEmbedded
>         repositories.
>   
> -   -  :ref:`ref-classes-kernel-fitimage`: handle :doc:`multiconfig
> +   -  ``kernel-fitimage``: handle :doc:`multiconfig
>         </dev-manual/multiconfig>` dependency when
>         :term:`INITRAMFS_MULTICONFIG` is set.
>   

Please write some word for the migration manual to 5.3 (Antonin, can you 
add some placeholder like we did for 5.2?) so people know how to go from 
5.2 kernel fitimage creation to 5.3+ kernel fitimage creation.

Thanks!
Quentin

