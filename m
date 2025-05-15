Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB16DC3ABC9
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 13:05:04 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.37])
 by mx.groups.io with SMTP id smtpd.web11.11776.1747314295225291383
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 06:04:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=SZ2lZB29;
 spf=pass (domain: cherry.de, ip: 52.101.71.37, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vawMsnmhA7dvx2XCI9mN3sPtSlGjmFseq9SwnMT1mI3EDTGwyxW1TjlUD3FnyBaQGhJwgEKUAO8gvWio7zxedEYFzC6Y6GJV+I2Sd07c2HSry/GYB1Mq7ToHDsfD1fMMBfuUa4tnSZaFN4GC2Ax3a/InLKupy1E5b6TR4JwGiDAulbX5Y+7WgxvHz3/ZS6Raddy6hK0M1kIQs00zLN2PRBL2vR+4yr//IOzBVobHGmAVTJOvIPYrHeRiWcQ/d6ZsdQbAMfYEC7wITZbhL8Q1/PXfVJv+6BD6A2JDB5mx+NwwVjopbFU/HiahRtCPm3zdvoVLPgPzS9OxVyJ3bi/WcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6lbLTLr6HdEFs4imeRSTX324UEnZ/5jb2yYvXZLhFeQ=;
 b=QiNlms5eMmAm8U80ELuv58OA8rC05Ag761u0e0Sisn/vUPqy8dBR6/i5xqiq0lLB6HSHB3Aq6rce8Ivrt6RiTEogGvWT1DjSZEpKM8OxWsUIJyPzgyYqowlfF7/cNl9JE2t7J9IaSjNYb6GJqL56vx9cFXSA50V31HKDupZTWGoJwixyGZ4FbjX2RQsCojLWZedz2lkj2NinTYpi7nzqD/OcrSvkslAKDMXvuSrPJkHHSs1uYEeZK1RQHqd4c5GyrhjPo/y/GEqdDus9I4hMYnK+dTLfR5jDnmPcd47v8QENeV7Wmwr9xmncKDAIXF1ztGrJ28HIFeob0IXKn38dHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6lbLTLr6HdEFs4imeRSTX324UEnZ/5jb2yYvXZLhFeQ=;
 b=SZ2lZB294UFi9wbi1AQwn62O0Oy9ScZJLB+or0Lu0IFp0d5af6XBklwmpVDZJHzJrqm8kd+lhLtPaR//Cvp9SPN9RXgrcYjzvxq/5sayAdP1fMgErOOSNZi51l4qBziz+0cSvwHRQ/hsozMYQbsJHYgITTkmv/owAOyFPmsiIg4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by DB9PR04MB9451.eurprd04.prod.outlook.com (2603:10a6:10:368::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 15 May
 2025 13:04:51 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%4]) with mapi id 15.20.8722.031; Thu, 15 May 2025
 13:04:51 +0000
Message-ID: <55ad05dd-16a9-47b2-a3d1-d5136145f133@cherry.de>
Date: Thu, 15 May 2025 15:04:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 21/22] ref-manual: replace
 kernel-fitimage.bbclass by kernel-fit-image.bbclass
To: adrian.freihofer@siemens.com, openembedded-core@lists.openembedded.org
Cc: marex@denx.de, docs <docs@lists.yoctoproject.org>
References: <20250514185225.162998-1-adrian.freihofer@siemens.com>
 <20250514185225.162998-22-adrian.freihofer@siemens.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250514185225.162998-22-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::15) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|DB9PR04MB9451:EE_
X-MS-Office365-Filtering-Correlation-Id: 496a8655-4253-4895-ee09-08dd93b113f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bWlLRjhwRlB2Um8xRE1iNUs4ZGttQk5sZ1VqT3gxTEV1RjlxdWtLdG5YcHd0?=
 =?utf-8?B?WW1LdEtwSGNjdmdMS3ZCWmptZVpTS1RWU2pBa2s3TGV4Y01QRnY4czRVd2cx?=
 =?utf-8?B?NDVBMlJMSE9reTBWRndjcnV4MnVjZVpjTHY2b1NENE03RktCemV0NThmdGtM?=
 =?utf-8?B?WXNyVkhERmoxSFg4QVZnZVJyT1lreEFMekJOMnpFZUpudTN1VTVtZTZmY1Vw?=
 =?utf-8?B?ZjZKWWVYaVlmdW5uZUZwaExWd1UrRHVYa3h4ZXB2RFRUYzNCOHdCM0h0TmR0?=
 =?utf-8?B?SEU1cXpIOGlBejZsaXhmV1kvSzhQSldpcHVxRUh2em9pajE0RDlSWEJPQlM1?=
 =?utf-8?B?QlZ3dVRhT2RIN1hWd1R6N3dsWEJEVHVBTUpObURjaThYbHkrNXk3QnNhMkNJ?=
 =?utf-8?B?RlgrekMzVDJyeGh6N003bnVvNUJtU0xENHlnRzRZZ1dVOFdaYWNOTENFMWpK?=
 =?utf-8?B?MTYycThnVTk4Tis0cXp4VFB4VkV2c1J0ZVVTRUgxd1hTYUJkQkFvbTg1Ulo5?=
 =?utf-8?B?RzR3Z1dTVnZwbndGM3Z5ZFdOeFF6NklBVkVmZGk1SDArTDdqOVY0eXJPbE90?=
 =?utf-8?B?OXJrOXdtRm1QTFZGbHp1WnBzRStiRElWdnB1UXM3V1Y3STBMbU81blV3ZEta?=
 =?utf-8?B?ZU8xSEJ5eWc2VVI2NXpVTUVRbCtoV0xVSCt5eDhTbTNIUjNrbzE0VEF6dWpx?=
 =?utf-8?B?Sy8zVlo2VGx6NFdsZXNBNXBWTEo3QWxYMmlDa1A4VTN4Vlgrb3lEQm9WZ0VV?=
 =?utf-8?B?ZGtQNmt0a3JBNEhYSkRuVXR0dVFpZE5VQVFaMFFkbmMrZVFiTk9kWWtZc1Zr?=
 =?utf-8?B?V2dtQnNrMGRXYnBRTTBocGcrUmhvbEZ4UVMyVGlvUnI2K2MyWktpMGxzZHo2?=
 =?utf-8?B?cVlLSkp3cjByUnNZU0dUamk1NDkzanhxRmprNUJJM084eHdMR3RJWXo5QVhP?=
 =?utf-8?B?TUw4NGhJRk5aQnFJSGVrTkp0ZC9VWm1EU1Fad0xiNkRxOXhSY3V0M3JSdXBj?=
 =?utf-8?B?d1oyUDVVdlg2bFBMR1RVMFo3YzlzY3Q3WE5FOUd1S01ORElxVGhWNTlPZm5J?=
 =?utf-8?B?N0dHYTZ4bWlTZlo0c0NXS0dmRHNZczlZRzJFRXR3RWwrdUZSQ1dzK2FJclZa?=
 =?utf-8?B?a1M0OEJqeFpWa2orYkxNdXZLbUllVXJZR0ZqaVE1OWNoL3h3S3l1eGtLd2pB?=
 =?utf-8?B?QWJsZEl2MGdNeDY4WDd1WnJoQ20wSDBNY0taQ09NZ2kzcFY4cEMvOTNPQU52?=
 =?utf-8?B?Q3VmUVlEcEg5RkFWcnhMVGJBVGdsR21aaXdjNFBPS2pUeTBqdWJaZXNxUy85?=
 =?utf-8?B?UE1vc3l2Q2Z0d2g3TlNCYk5ldUtWYjRXcGgzRmlpb25qTm9nSThXSEhTODJ5?=
 =?utf-8?B?aGprODdJeFNkMXJzWUUzMjJJSm93SkVUWjYwU0Fhc2x0NGJaYUxsTG1MMkUw?=
 =?utf-8?B?WmNkaGNGUVgvd3lpUjBzQ2dBMEs4SkUyQXNWSFVmb2kzM2VvRVFVYUNzcFhV?=
 =?utf-8?B?cjlidG9ZTVI2MVcxSnRwbTBMclV1Mng2Y1BNaWkwdGlCdXQyRFVreWhkcFJR?=
 =?utf-8?B?Z2ZuRXhUM3ZkWVJBaXZ0N0kvOWxBbVpydythY3NzTitsRmdZcGs0QStORzZp?=
 =?utf-8?B?KzhJQzZCOU9Uem5tbjFvVitIeFpGNWNQNndjV3gyb21SeGpQL2cycVhqTWFm?=
 =?utf-8?B?OHIwV093UHNHV0xreVNHVWkrRDJFT1dxNXhmY0VTUXFLaFpQK0xBRVRwM1NM?=
 =?utf-8?B?VS9haUR5Ui9XWWV4bWkzZHQ2QkpTTStpd0x2SUxGb1ZJa3dXQ0swTUNjYUFP?=
 =?utf-8?Q?S8mE7FdvPAGvLeZsrH+2n/zl3kpEYqAJ/23JE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QVQ1Z0szY3NQRVFtNkdjZkZyc0gzNkFiYnRBUVhCQVg1bTdyK0xjQzFsdW4y?=
 =?utf-8?B?ZHBJL0NzWU9PbGtNTzcyNFlSMWVHUmMzNys4NHNoYVlmWGo1QUJzZ21XMG1x?=
 =?utf-8?B?ZC9CdTVqa0ZjVHNjQjJQOVZUVVZTYjlXN3F5WVppNm1TVXQ3Ny81VFFzaWdR?=
 =?utf-8?B?dEc1TDhLVW93Sk51WHdOWXN3dVZkaFdoTjFnUFc4WEhFaXEyaW1TNzA0Vkd5?=
 =?utf-8?B?Tnh0R3NkYTBsMmozQmJsQkFUZGVydWo2K3B6dmh1T3ZiMW1DZERmVFYwRTNT?=
 =?utf-8?B?YlVESjk5YnozdUdxY0JiT3hISU1BTHdUSkZDdFpWalFvSWt1NDRSaHFJSlR5?=
 =?utf-8?B?OVFhM3BIZ2YyVHg3bWIveGVuVDFIMWljR2duV3JmTFlEN2hWSzBCQUo5T1NU?=
 =?utf-8?B?YmVrYjFrclc4SEgrOXZSamNVRVRFMGdBajVhRjNreERZYXZNS2ZudGkvUlRy?=
 =?utf-8?B?Uk1EMlJiN1BkVGo0d3VKaFdFUDAxWmdHd2hweE5WL002MnNKTjRqdlJ1T294?=
 =?utf-8?B?YUc2SlNEdWtNZThOeGxqdFJiTm5mOHFtd3IxTHlCZUh3NHduclltL21pUDB1?=
 =?utf-8?B?bWZ6NjdaM0JOa0tram0vaEoxWU1qQjRBSm9qYWlrT0k3RlZVZ2NhMlphb1Q4?=
 =?utf-8?B?VE82VkRPeVpYRnpEbC9TZ3FNU1d4Z21uTjErVlgzdnBJcGJHK0o4Q2gwby9v?=
 =?utf-8?B?aVdnSVkyK283eEVadU1uVG43QmVtMUZwaGR6Q3NrdEFjUXI1QnpJV1Q1bWlW?=
 =?utf-8?B?WjMrZlpSc25YWlZzcEpLK21nQTFOZEViRFlHMDd6VEU4RVhDMTRhZmVjQkFE?=
 =?utf-8?B?MTdiaU5GS0lkbVBmejdGZ2U0WnpaaEJJMWtteTlBTnFVNGVSWERZanMzVmgr?=
 =?utf-8?B?VmlEOXlRL2RXRVlJd3lZVnc5R2tkU00wSWlSU1VxNW5BS3lFWTVWa0JEZ3VP?=
 =?utf-8?B?aWo2clhSM2F1U0V4UzJNckVwcGlBc3FYaGJiNDlZL0o1MGMxSkZ0dkNZUFg1?=
 =?utf-8?B?c1U2aGtjR2g3bWJkVUdyZFZJSk1kSVpraXo4d3BmZHpoNnd2aGV4dGZlc1di?=
 =?utf-8?B?VlBFQkhWMnBvaXNuVW9RdXBSaFZZUklmajRkRnFJVDdjRVc4YTF2UHcrQmF1?=
 =?utf-8?B?UlFtMlNCK0h6QXdoMjZXcDRJWW1kMms5a21mbUtxblBONHNiTlNnbitWUUtE?=
 =?utf-8?B?TmFoaXIwNkpvY21iL1V1ZUUzTXM5YmZFS1RaZEorRFN6Z05CZGRZcEl2blVs?=
 =?utf-8?B?d2I3WkFMTDZTUmxSZmpRdGhZQThnNmZyMThpTUh5TlpaUk1RQUtBKytneW1t?=
 =?utf-8?B?QUZQaEYvTEgzcWVIV05xblFjcUR2aERNNGtQbDhGL09DZ2E0RHg5Tkl6VDQ3?=
 =?utf-8?B?aGZTMUgzMGhpQnhsck5WQWVNcWdEbG5za2ltSUl1ZEF1Mk1CelhrNlYyRlBp?=
 =?utf-8?B?R2pnV3JOTDlEQTRSZVAzbkE2Q01kdHNkUC9RUlQ5ZkZmdmw5aTFmUEdVU3Ez?=
 =?utf-8?B?SEJiWTcyVFF6cCt6Y3RYbDZKR1dILzJ2dTcvaFJ5YktvcE1ONkcwMjZ3dFNh?=
 =?utf-8?B?UnhBNVZ2c2lmenl6Y0dvVjhCQWJJdHRVeGNDYVIrakVCWElHRDJqV1MxWEFl?=
 =?utf-8?B?V2k1R0FUeE0wQzRhT052WE5VNTF3TWc0dlF1M1lBa0EyOXQ0Y1VxWWxNUFBm?=
 =?utf-8?B?bDlQNG9SaUN2bTFxSnp6eGkvR3YvT2ZhWnhJclNObVFJQTVMVDAzM0x4N213?=
 =?utf-8?B?WG5tTlRPdkVKM3hSVHRWU1d5ZmFDVEg2eG9TcnF1TEpvbGQ4MDV6NFdVNVdX?=
 =?utf-8?B?a0NsVXJFU3hCTHRkY0hoNWt4TmFnQ3kvZ05rVWNJVlZNdm9ZeXRKREhleG5z?=
 =?utf-8?B?eHE3K2pSdC9RRmlqbXAvRWlnWVJiVTJESVpmNzJId2RxMHh5bEsxN3RQN2tq?=
 =?utf-8?B?NnBRaS9IOXpRN0ZoSHJKeWlob09SRE43ZGJpY0MxaUdtM0hja1dRdjllb0c5?=
 =?utf-8?B?cVZJV21FREZtRUVNcXpMYVlhU0pVUFFKQ1FzQ3p5b2ZWbWNTd3BtU05MNk9r?=
 =?utf-8?B?OFpmZndsSS92VWR6SU5rNEE5MFNoUlM5TVJSZTNXc05oMWVjclRhUHRrM2Vo?=
 =?utf-8?B?bmlsTTNxa1Z1dnFrcGtFOWlLOUNYZUFBeGNQc0szbFpBWVVLcUJaWGdqajAw?=
 =?utf-8?B?Zmc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 496a8655-4253-4895-ee09-08dd93b113f4
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 13:04:51.4712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WXXYJdL3ETNVqaJZmrvsiPEB9ypjkuam0TaRl136KmKvMkLP7tFy+jFV3wSDsW7a/mLuPzavui0qhOWtSn21olqtWtTdSHQTgQ0zM8nyF8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9451
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 13:05:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216669

This needs to go through yocto-docs ML and git repo.

Cc docs

On 5/14/25 8:51 PM, Adrian Freihofer via lists.openembedded.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
> 
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>   documentation/ref-manual/classes.rst   | 103 +++++++++++++++----------
>   documentation/ref-manual/variables.rst |  60 +++++++-------
>   2 files changed, 92 insertions(+), 71 deletions(-)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 59efcbe19a7..4ea8677a1b2 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -1732,77 +1732,100 @@ Its behavior is mainly controlled by the following variables:
>   -  :term:`KERNEL_DTC_FLAGS`: flags for ``dtc``, the Device Tree Compiler
>   -  :term:`KERNEL_PACKAGE_NAME`: base name of the kernel packages
>   
> -.. _ref-classes-kernel-fitimage:
> +.. _ref-classes-kernel-fit-image:
>   
> -``kernel-fitimage``
> -===================
> +``kernel-fit-image``
> +====================
>   
> -The :ref:`ref-classes-kernel-fitimage` class provides support to pack a kernel image,
> -device trees, a U-boot script, an :term:`Initramfs` bundle and a RAM disk
> -into a single FIT image. In theory, a FIT image can support any number
> -of kernels, U-boot scripts, :term:`Initramfs` bundles, RAM disks and device-trees.
> -However, :ref:`ref-classes-kernel-fitimage` currently only supports
> +The :ref:`ref-classes-kernel-fit-image` class provides support to pack a kernel image,
> +device trees, a U-boot script, an :term:`Initramfs` into a single FIT image.
> +In theory, a FIT image can support any number of kernels, U-boot scripts,
> +:term:`Initramfs`, device-trees.
> +However, :ref:`ref-classes-kernel-fit-image` currently only supports
>   limited usecases: just one kernel image, an optional U-boot script,
> -an optional :term:`Initramfs` bundle, an optional RAM disk, and any number of
> -device trees.
> +an optional :term:`Initramfs`, and any number of device trees.
>   
> -To create a FIT image, it is required that :term:`KERNEL_CLASSES`
> -is set to include ":ref:`ref-classes-kernel-fitimage`" and one of :term:`KERNEL_IMAGETYPE`,
> -:term:`KERNEL_ALT_IMAGETYPE` or :term:`KERNEL_IMAGETYPES` to include "fitImage".
> +The FIT image is created by a recipe which inherits the
> +:ref:`ref-classes-kernel-fit-image` class.
> +One such example is the ``linux-yocto-fitimage`` recipe which creates a FIT
> +image for the Linux Yocto kernel.
> +Additionally, it is required that :term:`KERNEL_CLASSES` is set to include
> +":ref:`ref-classes-kernel-uimage`", which is the default.
> +The :ref:`ref-classes-kernel-uimage` exposes the required kernel and device
> +tree artifacts to the recipe-sysroot which are used by the
> +:ref:`ref-classes-kernel-fit-image` class to create the FIT image.
>   
>   The options for the device tree compiler passed to ``mkimage -D``
>   when creating the FIT image are specified using the
>   :term:`UBOOT_MKIMAGE_DTCOPTS` variable.
>   
>   Only a single kernel can be added to the FIT image created by
> -:ref:`ref-classes-kernel-fitimage` and the kernel image in FIT is mandatory. The
> -address where the kernel image is to be loaded by U-Boot is
> +:ref:`ref-classes-kernel-fit-image` and the kernel image in FIT is mandatory.
> +The address where the kernel image is to be loaded by U-Boot is
>   specified by :term:`UBOOT_LOADADDRESS` and the entrypoint by
>   :term:`UBOOT_ENTRYPOINT`. Setting :term:`FIT_ADDRESS_CELLS` to "2"
>   is necessary if such addresses are 64 bit ones.
>   
>   Multiple device trees can be added to the FIT image created by
> -:ref:`ref-classes-kernel-fitimage` and the device tree is optional.
> +:ref:`ref-classes-kernel-fit-image` and the device tree is optional.
>   The address where the device tree is to be loaded by U-Boot is
>   specified by :term:`UBOOT_DTBO_LOADADDRESS` for device tree overlays
>   and by :term:`UBOOT_DTB_LOADADDRESS` for device tree binaries.
>   
> -Only a single RAM disk can be added to the FIT image created by
> -:ref:`ref-classes-kernel-fitimage` and the RAM disk in FIT is optional.
> +Only a single :term:`Initramfs` can be added to the FIT image created by
> +:ref:`ref-classes-kernel-fit-image`. The :term:`Initramfs` in FIT is optional.
>   The address where the RAM disk image is to be loaded by U-Boot
>   is specified by :term:`UBOOT_RD_LOADADDRESS` and the entrypoint by
> -:term:`UBOOT_RD_ENTRYPOINT`. The ramdisk is added to the FIT image when
> -:term:`INITRAMFS_IMAGE` is specified and requires that :term:`INITRAMFS_IMAGE_BUNDLE`
> -is not set to 1.
> +:term:`UBOOT_RD_ENTRYPOINT`. The :term:`Initramfs` is added to the FIT image
> +when :term:`INITRAMFS_IMAGE` is specified.
>   
> -Only a single :term:`Initramfs` bundle can be added to the FIT image created by
> -:ref:`ref-classes-kernel-fitimage` and the :term:`Initramfs` bundle in FIT is optional.
> -In case of :term:`Initramfs`, the kernel is configured to be bundled with the root filesystem
> -in the same binary (example: zImage-initramfs-:term:`MACHINE`.bin).
> -When the kernel is copied to RAM and executed, it unpacks the :term:`Initramfs` root filesystem.
> -The :term:`Initramfs` bundle can be enabled when :term:`INITRAMFS_IMAGE`
> -is specified and requires that :term:`INITRAMFS_IMAGE_BUNDLE` is set to 1.
> -The address where the :term:`Initramfs` bundle is to be loaded by U-boot is specified
> -by :term:`UBOOT_LOADADDRESS` and the entrypoint by :term:`UBOOT_ENTRYPOINT`.
> +Note that (in contradiction to the previous `kernel-fitimage.bbclass`) the
> +:term:`INITRAMFS_IMAGE_BUNDLE` variable is not evaluated by the
> +:ref:`ref-classes-kernel-fit-image` class.
> +The :term:`Initramfs` and the kernel image are added as independent image
> +nodes to the FIT image.
> +Bundling a RAM disk image with the kernel image and including the bundle in the
> +FIT image would be possible. However, this approach has the disadvantage that
> +any change to the RAM disk image would necessitate rebuilding the kernel image.
> +This process requires the full kernel build directory, which is kind of
> +incompatible with the `sstate-cache` and, consequently, with SDKs.
>   
>   Only a single U-boot boot script can be added to the FIT image created by
> -:ref:`ref-classes-kernel-fitimage` and the boot script is optional.
> +:ref:`ref-classes-kernel-fit-image`. The boot script is optional.
>   The boot script is specified in the ITS file as a text file containing
> -U-boot commands. When using a boot script the user should configure the
> -U-boot :ref:`ref-tasks-install` task to copy the script to sysroot.
> -So the script can be included in the FIT image by the :ref:`ref-classes-kernel-fitimage`
> -class. At run-time, U-boot CONFIG_BOOTCOMMAND define can be configured to
> -load the boot script from the FIT image and execute it.
> +U-boot commands. When using a boot script the recipe which inherits the
> +:ref:`ref-classes-kernel-fit-image` class should add the script to
> +:term:`SRC_URI` and set the :term:`FIT_UBOOT_ENV` variable to the name of the
> +like the following::
>   
> -The FIT image generated by the :ref:`ref-classes-kernel-fitimage` class is signed when the
> +   FIT_UBOOT_ENV = "boot.txt"
> +   SRC_URI += "file://${FIT_UBOOT_ENV}"
> +
> +At run-time, U-boot CONFIG_BOOTCOMMAND define can be configured to
> +load the boot script from the FIT image and source it.
> +
> +The FIT image generated by the :ref:`ref-classes-kernel-fit-image` class is signed when the
>   variables :term:`UBOOT_SIGN_ENABLE`, :term:`UBOOT_MKIMAGE_DTCOPTS`,
>   :term:`UBOOT_SIGN_KEYDIR` and :term:`UBOOT_SIGN_KEYNAME` are set
>   appropriately. The default values used for :term:`FIT_HASH_ALG` and
> -:term:`FIT_SIGN_ALG` in :ref:`ref-classes-kernel-fitimage` are "sha256" and
> +:term:`FIT_SIGN_ALG` in :ref:`ref-classes-kernel-fit-image` are "sha256" and
>   "rsa2048" respectively. The keys for signing the FIT image can be generated using
> -the :ref:`ref-classes-kernel-fitimage` class when both :term:`FIT_GENERATE_KEYS` and
> +the :ref:`ref-classes-kernel-fit-image` class when both :term:`FIT_GENERATE_KEYS` and
>   :term:`UBOOT_SIGN_ENABLE` are set to "1".
>   
> +If the FIT image should be used as a replacement for the kernel image which
> +is installed in the root filesystem, then the following variables can be set
> +e.g. in the machine configuration file::
> +
> +   # Do not install the kernel image package
> +   RRECOMMENDS:${KERNEL_PACKAGE_NAME}-base = ""
> +
> +   # Install the FIT image package
> +   MACHINE_EXTRA_RDEPENDS += "${PREFERRED_PROVIDER_virtual/kernel}-fitimage"
> +
> +   # Configure the image.bbclass to depend on the fitImage instead of only
> +   # the kernel to ensure the fitImage is built with the image
> +   KERNEL_DEPLOY_DEPEND = "${PREFERRED_PROVIDER_virtual/kernel}-fitimage:do_deploy"
>   
>   .. _ref-classes-kernel-grub:
>   
> @@ -3434,7 +3457,7 @@ See U-Boot's documentation for details about `verified boot
>   and the `signature process
>   <https://source.denx.de/u-boot/u-boot/-/blob/master/doc/uImage.FIT/signature.txt>`__.
>   
> -See also the description of :ref:`ref-classes-kernel-fitimage` class, which this class
> +See also the description of :ref:`ref-classes-kernel-fit-image` class, which this class
>   imitates.
>   
>   .. _ref-classes-uki:
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index c22abd4a8e5..5612c1487d2 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -2790,7 +2790,7 @@ system and gives an overview of their function and contents.
>         ``meta/classes-recipe`` to see how the variable is used.
>   
>      :term:`EXTERNAL_KERNEL_DEVICETREE`
> -      When inheriting :ref:`ref-classes-kernel-fitimage` and a
> +      When inheriting :ref:`ref-classes-kernel-fit-image` and a
>         :term:`PREFERRED_PROVIDER` for ``virtual/dtb`` set to ``devicetree``, the
>         variable :term:`EXTERNAL_KERNEL_DEVICETREE` can be used to specify a
>         directory containing one or more compiled device tree or device tree
> @@ -3318,7 +3318,7 @@ system and gives an overview of their function and contents.
>         Specifies the value of the ``#address-cells`` value for the
>         description of the FIT image.
>   
> -      The default value is set to "1" by the :ref:`ref-classes-kernel-fitimage`
> +      The default value is set to "1" by the :ref:`ref-classes-kernel-fit-image`
>         class, which corresponds to 32 bit addresses.
>   
>         For platforms that need to set 64 bit addresses, for example in
> @@ -3337,11 +3337,11 @@ system and gives an overview of their function and contents.
>         Specifies the default device tree binary (dtb) file for a FIT image
>         when multiple ones are provided.
>   
> -      This variable is used in the :ref:`ref-classes-kernel-fitimage` class.
> +      This variable is used in the :ref:`ref-classes-kernel-fit-image` class.
>   
>      :term:`FIT_DESC`
>         Specifies the description string encoded into a FIT image. The
> -      default value is set by the :ref:`ref-classes-kernel-fitimage` class as
> +      default value is set by the :ref:`ref-classes-kernel-fit-image` class as
>         follows::
>   
>            FIT_DESC ?= "U-Boot fitImage for ${DISTRO_NAME}/${PV}/${MACHINE}"
> @@ -3350,12 +3350,12 @@ system and gives an overview of their function and contents.
>         Decides whether to generate the keys for signing the FIT image if
>         they don't already exist. The keys are created in
>         :term:`UBOOT_SIGN_KEYDIR`. The default value is set to "0"
> -      by the :ref:`ref-classes-kernel-fitimage` class.
> +      by the :ref:`ref-classes-kernel-fit-image` class.
>   
>      :term:`FIT_HASH_ALG`
>         Specifies the hash algorithm used in creating the FIT Image.
>         This variable is set by default to "sha256" by the
> -      :ref:`ref-classes-kernel-fitimage` class.
> +      :ref:`ref-classes-kernel-fit-image` class.
>   
>      :term:`FIT_KERNEL_COMP_ALG`
>         The compression algorithm to use for the kernel image inside the FIT Image.
> @@ -3374,31 +3374,31 @@ system and gives an overview of their function and contents.
>      :term:`FIT_KEY_GENRSA_ARGS`
>         Arguments to ``openssl genrsa`` for generating a RSA private key for
>         signing the FIT image. The default value is set to "-F4" by the
> -      :ref:`ref-classes-kernel-fitimage` class.
> +      :ref:`ref-classes-kernel-fit-image` class.
>   
>      :term:`FIT_KEY_REQ_ARGS`
>         Arguments to ``openssl req`` for generating a certificate for signing
>         the FIT image. The default value is "-batch -new" by the
> -      :ref:`ref-classes-kernel-fitimage` class, "batch" for
> +      :ref:`ref-classes-kernel-fit-image` class, "batch" for
>         non interactive mode and "new" for generating new keys.
>   
>      :term:`FIT_KEY_SIGN_PKCS`
>         Format for the public key certificate used for signing the FIT image.
>         The default value is set to "x509" by the
> -      :ref:`ref-classes-kernel-fitimage` class.
> +      :ref:`ref-classes-kernel-fit-image` class.
>   
>      :term:`FIT_SIGN_ALG`
>         Specifies the signature algorithm used in creating the FIT Image.
>         This variable is set by default to "rsa2048" by the
> -      :ref:`ref-classes-kernel-fitimage` class.
> +      :ref:`ref-classes-kernel-fit-image` class.
>   
>      :term:`FIT_PAD_ALG`
>         Specifies the padding algorithm used in creating the FIT Image.
>         The default value is set to "pkcs-1.5" by the
> -      :ref:`ref-classes-kernel-fitimage` class.
> +      :ref:`ref-classes-kernel-fit-image` class.
>   
>      :term:`FIT_SIGN_INDIVIDUAL`
> -      If set to "1", the :ref:`ref-classes-kernel-fitimage` class signs each
> +      If set to "1", the :ref:`ref-classes-kernel-fit-image` class signs each
>         image node individually, including the kernel, DTB, RAM disk, and any
>         other image types present in the FIT image, in addition to signing the
>         configuration nodes.
> @@ -3431,13 +3431,13 @@ system and gives an overview of their function and contents.
>      :term:`FIT_SIGN_NUMBITS`
>         Size of the private key used in the FIT image, in number of bits.
>         The default value for this variable is set to "2048"
> -      by the :ref:`ref-classes-kernel-fitimage` class.
> +      by the :ref:`ref-classes-kernel-fit-image` class.
>   
>      :term:`FIT_UBOOT_ENV`
>         This variable allows to add a U-Boot script as a text file to the
>         FIT image. Such a script can be sourced from the U-Boot shell.
>   
> -      When inheriting the :ref:`ref-classes-kernel-fitimage` class a
> +      When inheriting the :ref:`ref-classes-kernel-fit-image` class a
>         script file should be included in the :term:`SRC_URI` of the Linux
>         kernel recipe.
>   
> @@ -4990,9 +4990,7 @@ system and gives an overview of their function and contents.
>      :term:`KERNEL_CLASSES`
>         A list of classes defining kernel image types that the
>         :ref:`ref-classes-kernel` class should inherit. You typically
> -      append this variable to enable extended image types. An example is
> -      ":ref:`ref-classes-kernel-fitimage`", which enables
> -      FIT image support and resides in ``meta/classes-recipe/kernel-fitimage.bbclass``.
> +      append this variable to enable extended image types.
>         You can register custom kernel image types with the
>         :ref:`ref-classes-kernel` class using this variable.
>   
> @@ -10221,13 +10219,13 @@ system and gives an overview of their function and contents.
>      :term:`UBOOT_DTB_LOADADDRESS`
>         Specifies the load address for the dtb image used by U-Boot. During FIT
>         image creation, the :term:`UBOOT_DTB_LOADADDRESS` variable is used in
> -      :ref:`ref-classes-kernel-fitimage` class to specify the load address to be
> +      :ref:`ref-classes-kernel-fit-image` class to specify the load address to be
>         used in creating the dtb sections of Image Tree Source for the FIT image.
>   
>      :term:`UBOOT_DTBO_LOADADDRESS`
>         Specifies the load address for the dtbo image used by U-Boot.  During FIT
>         image creation, the :term:`UBOOT_DTBO_LOADADDRESS` variable is used in
> -      :ref:`ref-classes-kernel-fitimage` class to specify the load address to be
> +      :ref:`ref-classes-kernel-fit-image` class to specify the load address to be
>         used in creating the dtbo sections of Image Tree Source for the FIT image.
>   
>      :term:`UBOOT_ENTRYPOINT`
> @@ -10239,7 +10237,7 @@ system and gives an overview of their function and contents.
>         -  The :term:`FIT_ADDRESS_CELLS` variable for FIT image creation.
>         -  The :term:`UBOOT_FIT_ADDRESS_CELLS` variable for U-Boot FIT image creation.
>   
> -      This variable is used by the :ref:`ref-classes-kernel-fitimage`,
> +      This variable is used by the :ref:`ref-classes-kernel-fit-image`,
>         :ref:`ref-classes-kernel-uimage`, :ref:`ref-classes-kernel`,
>         :ref:`ref-classes-uboot-config` and :ref:`ref-classes-uboot-sign`
>         classes.
> @@ -10507,7 +10505,7 @@ system and gives an overview of their function and contents.
>         -  The :term:`FIT_ADDRESS_CELLS` variable for FIT image creation.
>         -  The :term:`UBOOT_FIT_ADDRESS_CELLS` variable for U-Boot FIT image creation.
>   
> -      This variable is used by the :ref:`ref-classes-kernel-fitimage`,
> +      This variable is used by the :ref:`ref-classes-kernel-fit-image`,
>         :ref:`ref-classes-kernel-uimage`, :ref:`ref-classes-kernel`,
>         :ref:`ref-classes-uboot-config` and :ref:`ref-classes-uboot-sign`
>         classes.
> @@ -10535,15 +10533,15 @@ system and gives an overview of their function and contents.
>   
>      :term:`UBOOT_MKIMAGE`
>         Specifies the name of the mkimage command as used by the
> -      :ref:`ref-classes-kernel-fitimage` class to assemble
> +      :ref:`ref-classes-kernel-fit-image` class to assemble
>         the FIT image. This can be used to substitute an alternative command, wrapper
>         script or function if desired. The default is "uboot-mkimage".
>   
>      :term:`UBOOT_MKIMAGE_DTCOPTS`
>         Options for the device tree compiler passed to ``mkimage -D`` feature
> -      while creating a FIT image with the :ref:`ref-classes-kernel-fitimage`
> +      while creating a FIT image with the :ref:`ref-classes-kernel-fit-image`
>         class. If :term:`UBOOT_MKIMAGE_DTCOPTS` is not set then the
> -      :ref:`ref-classes-kernel-fitimage` class will not pass the ``-D`` option
> +      :ref:`ref-classes-kernel-fit-image` class will not pass the ``-D`` option
>         to ``mkimage``.
>   
>         This variable is also used by the :ref:`ref-classes-uboot-sign` class.
> @@ -10554,42 +10552,42 @@ system and gives an overview of their function and contents.
>   
>      :term:`UBOOT_MKIMAGE_SIGN`
>         Specifies the name of the mkimage command as used by the
> -      :ref:`ref-classes-kernel-fitimage` class to sign
> +      :ref:`ref-classes-kernel-fit-image` class to sign
>         the FIT image after it has been assembled (if enabled). This can be used
>         to substitute an alternative command, wrapper script or function if
>         desired. The default is "${:term:`UBOOT_MKIMAGE`}".
>   
>      :term:`UBOOT_MKIMAGE_SIGN_ARGS`
>         Optionally specifies additional arguments for the
> -      :ref:`ref-classes-kernel-fitimage` class to pass to the
> +      :ref:`ref-classes-kernel-fit-image` class to pass to the
>         mkimage command when signing the FIT image.
>   
>      :term:`UBOOT_RD_ENTRYPOINT`
>         Specifies the entrypoint for the RAM disk image. During FIT image
>         creation, the :term:`UBOOT_RD_ENTRYPOINT` variable is used in
> -      :ref:`ref-classes-kernel-fitimage` class to specify the entrypoint to be
> +      :ref:`ref-classes-kernel-fit-image` class to specify the entrypoint to be
>         used in creating the Image Tree Source for the FIT image.
>   
>      :term:`UBOOT_RD_LOADADDRESS`
>         Specifies the load address for the RAM disk image. During FIT image
>         creation, the :term:`UBOOT_RD_LOADADDRESS` variable is used in
> -      :ref:`ref-classes-kernel-fitimage` class to specify the load address to
> +      :ref:`ref-classes-kernel-fit-image` class to specify the load address to
>         be used in creating the Image Tree Source for the FIT image.
>   
>      :term:`UBOOT_SIGN_ENABLE`
>         Enable signing of FIT image. The default value is "0".
>   
> -      This variable is used by the :ref:`ref-classes-kernel-fitimage`,
> +      This variable is used by the :ref:`ref-classes-kernel-fit-image`,
>         :ref:`ref-classes-uboot-config` and :ref:`ref-classes-uboot-sign`
>         classes.
>   
>      :term:`UBOOT_SIGN_KEYDIR`
>         Location of the directory containing the RSA key and certificate used for
> -      signing FIT image, used by the :ref:`ref-classes-kernel-fitimage` and
> +      signing FIT image, used by the :ref:`ref-classes-kernel-fit-image` and
>         :ref:`ref-classes-uboot-sign` classes.
>   
>      :term:`UBOOT_SIGN_KEYNAME`
> -      The name of keys used by the :ref:`ref-classes-kernel-fitimage` class
> +      The name of keys used by the :ref:`ref-classes-kernel-fit-image` class
>         for signing U-Boot FIT image stored in the :term:`UBOOT_SIGN_KEYDIR`
>         directory. If we have for example a ``dev.key`` key and a ``dev.crt``
>         certificate stored in the :term:`UBOOT_SIGN_KEYDIR` directory, you will
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216541): https://lists.openembedded.org/g/openembedded-core/message/216541
> Mute This Topic: https://lists.openembedded.org/mt/113114324/6293953
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [quentin.schulz@cherry.de]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


