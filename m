Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A68AFC27C78
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 00:56:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.535.1718153787153374666
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 17:56:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=68938acc5b=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45C0roS0024717
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 17:56:26 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ymptg39dg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 17:56:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UgSHNYPywxDhjL+BVShRiJZnfntZ/DNMHb2eccYOG58rzAGINxSrYKYsANyPVRFs96VZAQ7hyxIerUh1hD5qKlrw/tKIFri4AVGnxNAFZDJxI/HJjrSnYNL0pO0M8LUxdd1i4YjI4aGszE/dtI5COh89xp97oPiQg+5GlMVDYe17DiEuyHmepx5+Pqalr6J3IaeGet17inNBt7yA8aMucQgiK5eJcpiM0/AfQV5Y6C3rW2hlJwKosp/iYZj5+6mxCcIlJX4BtOxICKHCxSLuSYsDo3yPuG92cKT42Sv3YDt+NTrY0QTi7pWEBXemow9M2cYo7Gsq4XBS+r+jyhn67g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sah6fchND5+Dlq+FuVzUfQsuEep/pRTYBuP1xOG/j4A=;
 b=kW9JaNZzpMRwmCzK1Wxl8ABOxQsh+YqtMVQaWoAi5MOM5t5XuwHmNbMHNITwBXlz2bqTp269O4FqiE9qBVNZBiicfMvrJnio9SscMSNFhAeWXdYVDF4htJoeoItOfPyjAqLthvSz9MRG7GWLKY0eXK88HghQFfSu91eTCKhHZRR0wMFVfD2ELJUtDi+l3D5lFsYb4MHES6BGgNnn7O+Z/XztPBpWsKsMI6rWFHbpo9kJU4xZCjNRNq7anMf5lEA995E5nA9OaejizK/mt2wJ7wneAcv2ts6kaW2/Os1cdwqXz1XD6Ebycvcnv74bE9GC3N2M6TCbTODHn4YCv3l5/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Wed, 12 Jun
 2024 00:56:21 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.7633.036; Wed, 12 Jun 2024
 00:56:21 +0000
Content-Type: multipart/alternative;
 boundary="------------yrizNnyPKRpvOstSKtjWV9FD"
Message-ID: <a5803329-7dab-46bc-9fbb-a739a524c126@windriver.com>
Date: Wed, 12 Jun 2024 08:56:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] VOLATILE_TMP_DIR: Extend to specify the
 persistence of /var/tmp
To: openembedded-core@lists.openembedded.org
References: <17D438C2BEE02E99.24551@lists.openembedded.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <17D438C2BEE02E99.24551@lists.openembedded.org>
X-ClientProxiedBy: TYCP286CA0227.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::14) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DM4PR11MB6312:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a017833-8b83-48d5-ddf1-08dc8a7a79e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230032|1800799016|376006|366008;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NDhjNjAzNFI4c3dzYnBVb0NnbG1wM25maGkxSUFhdzIrc2h0NUkrSElERHlB?=
 =?utf-8?B?OFJuajJSeW43MnBidWhweXNkdVdOdUpJY3FVdG1hM2xQYlplbXlyUDh6TS83?=
 =?utf-8?B?SzBlYTByNHRzUFlMb1Z2TTJENElZWTFBazBUbGxuOWNuN0pmOG0vdWc0NGl1?=
 =?utf-8?B?TXBqS3NFemtrSzZ1S0M2TjZWdFI3WU5PenFXNFRjSENzZVFjQTUvbFEvUzlx?=
 =?utf-8?B?TVZnY1daYXFJSEJKdm54OE1kOHFpNW1UdUVGSzV6aEdiY2hZY0JBSHkvbVRJ?=
 =?utf-8?B?ejFYcmNpK0xSR1BHRlBhVnQ0a3FwQmpCcTdhNXV0Qk5KdGdmQld6VzJNSmU4?=
 =?utf-8?B?eHVIQU5OSk5POGV6Q2p5czAyVm9XcHFCM3RNZzFjZFpVN0FJUXp3UGQ3OWhU?=
 =?utf-8?B?TlJGekRkNHBzeklndUw5N1plUGxoTnNpWndOb1JVWUxoQlg4TXA5QmoxbHZH?=
 =?utf-8?B?Qm5GUTlEKzRMNm5IZnE2N052RGlCYU9rQVZ3a0ZNdUZWRmxReGdRRy9EYUxn?=
 =?utf-8?B?WldJQm1IbGJON21yM0tSRUZ2RzFCcVlqdUszaUtUb1VxMnA1L2ZIeWtLMWx4?=
 =?utf-8?B?YU9FRXI5UDBzQ05RbmM3WDlZWE5jNmUyenoyNDZFNS9GMGg0eW1KcXZHaDZa?=
 =?utf-8?B?bTh0YWwxaVdQa2hYTlhmNHBYNnRUazNacGVkMjJINGRIZE1sZjJsUmt4bUtQ?=
 =?utf-8?B?bkd2dDA0dER2UjhLOXg0blVBZ29vMTVHeEhDSVRXUHRKYUdmelpQdEh4YWwv?=
 =?utf-8?B?M1dudU92di9BbEtYQ2c1YnRReU1xZ2c0WjllQjN6eC9YSVBPYnk1L2x3WGdU?=
 =?utf-8?B?OFpsWlNSeVdTblFTZW82L0N2eGNJSUJiMTJxbFE4clYrL0dKR2FacFJybkNX?=
 =?utf-8?B?VTBIZjF0YzNiNkthN0VWTnZMRW16bHVQcEVLeGs2SXA5RnN4aHR0aHh4Vko1?=
 =?utf-8?B?RWorSGFZcldNR1VKVG54WWozUnVZOGZVZ0RnSDlXNU5WWHNqK282Z2tUMEE2?=
 =?utf-8?B?RmJtSFNRZnVvVWJLOWd5azhWM0FuRjFJMmJmY0syOEl3L205MEpDSTFTa2h5?=
 =?utf-8?B?ZTlwZHF2d2tDa3NOZlc5L1JTYTYzQmVSWnltVVV0cmVwSmorT293NHVZaHcr?=
 =?utf-8?B?UHdQdUErVVVFV0RJQUNUN0Z0WVQrUGZTOG1ZZXZadGU2OHpBMkNyTDhXY29H?=
 =?utf-8?B?bElWOFNvS3ZxcGdQbTZqTmxub1p4clZSZUNxSTROeXgrNzd5RzVzcUJNNTNp?=
 =?utf-8?B?SXF3RjNlOXFHZFpNamNhcWttamFrMHp4Y3dXTXk2dUNFeTRQYThqOW1mOG9j?=
 =?utf-8?B?MjVGbjZzTy9pNFU5MHUraFRMdndvWFhFUkVtMXBQNjJzTFdBcWJPcXdlUktM?=
 =?utf-8?B?U1B3ZnpmazErcnkxRGZldllncFFDdzJ4V0ZzaDY5eVF2djc3L3RVUTdCRUQy?=
 =?utf-8?B?akpmMjZxSWdGcDhCdzJLWUFkNE9sQXg1NnlrTzJqM0xGNzdocEZiU2F4cm9m?=
 =?utf-8?B?ZHdtUldYTVdDVDFQYUppWVlrL0NzOStYb2U1c1ppY0EzMFNRNlNqVlhWYzRD?=
 =?utf-8?B?SUI1UDBhd3AwVVZpY1NNZ3BTMlB5NDYwM21mdStMV2gvams0MWcwdXRRcjNW?=
 =?utf-8?B?UENGTENhQS9uVW5UeFFCejJWN0lscE5mL3lpTHErMWgyUHFLZEMzR3JzZFlz?=
 =?utf-8?Q?tGwIHdD0wPHvnlAOAlO3?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(1800799016)(376006)(366008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YnRqdDBwUi9NcEhPQ3MxV2N5SENFRzdCUWpMMSs2K2NUeEMralNtRkFqV2tt?=
 =?utf-8?B?ckdoZFpKRHB4d1NWZStYblRIaEtDRVJrdnVlVzlzbXVON1ptR3BYRi91MHRj?=
 =?utf-8?B?ZjRNelVKLy9MOXNxQlZaanV3WjVlZUJ0a2V4eFB2bHloR3pvQnlsSmVZeGp0?=
 =?utf-8?B?SERiOTBIUTAvTW8xa0o3QmZYZXFFOWczVFRUUnZFcFFOUGFkMVIyenNDc1pY?=
 =?utf-8?B?ekZXdEJERHp0L1B3MVRKUE1LOCs4TkIxOXRadXRFMzZVc2x5a0I2OEFxY0cx?=
 =?utf-8?B?bmR5OWRmS3BnWElWZkVZa3F1WlFMSEpldW5TS3Rxc3hRQTFLUUd0YXVKbE1U?=
 =?utf-8?B?WHZrRkprVHVZc2JiOWU2YmxacHF2ekVJcGt0MEtZQkxRcGNzN0hyb3RxZHJz?=
 =?utf-8?B?RVJZZEtsNTJtUmxoRm9WYTliRm5MMVVDZG1xdjNORGVTQ1NiaGdZaTI5UUFV?=
 =?utf-8?B?VHJpQkFoaUpzUWdZTzJYQjhhUzlBeFBJTTV4TldaZHRWNTlnaCt0L0lTK3Jx?=
 =?utf-8?B?SGx1SGpBYU8wYWpPNFJweUVvdFFWdnhCSDVjY0lCa3FKWjgxcUFkMjIrcWU5?=
 =?utf-8?B?Qnp4ZVlCRDV4SWJmVUdjYmxwN08zSFZuUVNqTmxtS01MbXVQNC9vdzZlNGZX?=
 =?utf-8?B?b2xOTEJ4enFWVTBNNXNndDhqdGRRcGlsdVc0S1drQi9sVlcvQ2VZWDJYWHc4?=
 =?utf-8?B?SEdoYnIrTGpIY2J3Uk8zcUlNQ01kbHhIWkVIT0dYQmpKNlRJc1pXcWxWajR6?=
 =?utf-8?B?bHh1NFhyaitkYWRKOW5yN2hGNUlUOStzc2RTczduLzk5RGh4Z3FtVlBKKzM4?=
 =?utf-8?B?dDhFMG42bGM3dzQxSEIvc0NIU0QrbUl3Q0hoQVBkRlJzMnJBdXNoV1UrZ05Z?=
 =?utf-8?B?dS9Ec0VFOWVsSmI2NytiUlE5aEg1Y3E2SzZDVWZOdXo0aXU0T0V3R3BZRlR3?=
 =?utf-8?B?bktBQlhhcGR5T2VqMEJXYUJSRy9MekgvVnNaNG55TXZnRXdPOHM3WERwUVlG?=
 =?utf-8?B?c2txSTZ5V1BaWS8xZkNrb2dPSFlKenFRS0N2N1dlNTZ0Q3JGMTlCNzd5bVd5?=
 =?utf-8?B?V2VjYTFIZVpaRm9PMjNTS1RybzZNUlBHNFp1WmhDRVliSFc1Rlhua29FUUxH?=
 =?utf-8?B?OUM5WUROak01WXI1TnArelNLTWt0NzVGdFY4SnBDb0JRc216bkdxK0tRREtw?=
 =?utf-8?B?aC94T3M0QjNWU2hrNm9kMEJ3di9IdjJvMVRNc3VBcUdoKzFlL1Btc3ppRlF3?=
 =?utf-8?B?NlU4c0hQMnRqRTJYcEx0RkQzTFl0bWRDTFVqUnFVNnc2WXVnMlZHbS9HVHQ3?=
 =?utf-8?B?MUQxNWtHaDcyRk8zODBLOW14VkRPVkxpNXZFR0czSjFvam9FeWtyWjQxYzg5?=
 =?utf-8?B?TzVVbkJObTBOR1NDSUlBWTRNQWF3c1VvMk92MHo2VEdGWWFQV3kxMVYwVWNt?=
 =?utf-8?B?eEU1UnRsUTNjZ09MbUhSUExQQ3FtQkJIeUY2b2FzOTVYWmlPVDVSNk9WZzBC?=
 =?utf-8?B?UXpNeHplTTBJcTJtdDRLQlovb2dMS0Vyb3hQT0ZyWEFuZWRZWEMxMDlHVlZZ?=
 =?utf-8?B?Qk5qWDlYN2VLOElWdVRlcGZ3WjM4VEZKeXd3TzFCbmFlYy9jN3dIYXhEUUlu?=
 =?utf-8?B?b1IxRlBFVSt6VGJWVmlGc3FMUTViRTJYbERDUGw4VUlXMmEzL1dlMmJCSmcv?=
 =?utf-8?B?WVJMbm9YcnNpK3RvdWxwbWNmQjUzSmtNZ0FrcGRiaHFkTVltU3JMUXV4cU5t?=
 =?utf-8?B?NUxwNzRkRitSUXpOU21OK2RpR1kybE0vcnhUVGFFRlRKTXZPZ0l3NGFtVDlZ?=
 =?utf-8?B?SVRnV01lcU1VdkVmeEViVWZ6QmQwUFRJdStnVGExY3k3cEp4R1NkR0FraGI0?=
 =?utf-8?B?TkVIR2VjUEttNEFodWpxeVZ3Q29VcWZteDJYcE9NUVBsUjlCeXRJNHdCZ3VV?=
 =?utf-8?B?aFZrTVEvai9lS2lHQ1haUFJ2TGZYcXJXOVJkVkNwRFBFNFJTRlZ6djVzcWZs?=
 =?utf-8?B?L1gwRTY4SkZxYjROS2xDQ0hFUm5EMGlaY0p2K1J1YWlxbUNMM29ONnorUmRX?=
 =?utf-8?B?VHo0OGNWbkhRN1pEWHpLWDhLY0FobWZCVWIySnI5WjZZRjE3TGVEdVdPZ3ZE?=
 =?utf-8?B?VmFoRmdaVnNVSER4V29kTUh4anU0cG15Tit4dFBId1NoUlF4VTJOQmZCVnBp?=
 =?utf-8?B?Wnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a017833-8b83-48d5-ddf1-08dc8a7a79e5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 00:56:21.7834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XIE2J2qAuu9ra3QI8RnFZd3iWDKafEJ7oGjHFgWkbUwzcayavLnG28N+o9ar+nWa55o/w1nY1PQlTON6PD5mzdJEelo3rABBAHXsG4MXhws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6312
X-Proofpoint-ORIG-GUID: y1Vpqehe7QwJlawMy-le-_jm3ZTRIv_A
X-Proofpoint-GUID: y1Vpqehe7QwJlawMy-le-_jm3ZTRIv_A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_13,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 adultscore=0 phishscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2405170001
 definitions=main-2406120004
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 00:56:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200553

--------------yrizNnyPKRpvOstSKtjWV9FD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Any concern about this patch? VOLATILE_TMP_DIR is originally added to 
specify the persistence of /tmp,

and I think it named as "VOLATILE_TMP", so maybe it is ok to extend to 
specify the persistence of /var/tmp (which by default is /var/volatile/tmp).

And this will cause doc change.

Regards

Changqing

On 5/30/24 17:02, Changqing Li wrote:
> From: Changqing Li<changqing.li@windriver.com>
>
> Currently, set VOLATILE_TMP_DIR to "no", only make /tmp as persistent.
> This patch extends VOLATILE_TMP_DIR to also specify the persistence of
> /var/tmp by following changes:
>
> * change FILESYSTEM_PERMS_TABLES to remove symlink /var/tmp -> /var/volatile/tmp
>    for the packaging process
> * update base-files to create /var/tmp as a dir not symlink to /var/volatile/tmp
>
> Here is an use case:
> Steps:
> 1. docker import core-image-minimal-qemux86-64.tar.bz2 poky:latest
> 2. docker run -it --rm poky:latest /bin/sh
> 3. /var/log /var/tmp are deadlinks, and cause "No such file or directory" errors
>
> Root cause:
> By default, /var/tmp links to /var/volatile/tmp, and /var/volatile/tmp
> usually created by initscript(sysV) or systemd-tmpfile.d(systemd) during
> boot up, but for container, initscript/systemd-tmpfile.d will not be
> executed, so /var/volatile/tmp is not created.
>
> This patch provides an option for user want to use container, set
> VOLATILE_TMP_DIR to "no" can resolve above case.
>
> Signed-off-by: Changqing Li<changqing.li@windriver.com>
> ---
>   meta/conf/bitbake.conf                        |  5 ++-
>   ...fs-perms.txt => fs-perms-volatile-log.txt} | 32 -------------------
>   ...tent-log.txt => fs-perms-volatile-tmp.txt} | 27 ----------------
>   meta/files/fs-perms.txt                       |  3 --
>   .../base-files/base-files_3.0.14.bb           |  5 +--
>   5 files changed, 7 insertions(+), 65 deletions(-)
>   copy meta/files/{fs-perms.txt => fs-perms-volatile-log.txt} (53%)
>   rename meta/files/{fs-perms-persistent-log.txt => fs-perms-volatile-tmp.txt} (59%)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 3ef2deb088..e6ec640809 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -384,7 +384,10 @@ FILESEXTRAPATHS ?= "__default:"
>   #  base_prefix, prefix, exec_prefix, base_bindir, base_sbindir, base_libdir,
>   #  datadir, sysconfdir, servicedir, sharedstatedir, localstatedir, infodir,
>   #  mandir, docdir, bindir, sbindir, libexecdir, libdir and includedir
> -FILESYSTEM_PERMS_TABLES ?="${@'files/fs-perms.txt' if 
> oe.types.boolean(d.getVar('VOLATILE_LOG_DIR')) else 
> 'files/fs-perms-persistent-log.txt'}"
> +FILESYSTEM_PERMS_TABLES ?=  " files/fs-perms.txt \
> +                              ${@'files/fs-perms-volatile-log.txt' if oe.types.boolean(d.getVar('VOLATILE_LOG_DIR')) else ''} \
> +                              ${@'files/fs-perms-volatile-tmp.txt' if oe.types.boolean(d.getVar('VOLATILE_TMP_DIR')) else ''} \
> +                            "
>   
>   ##################################################################
>   # General work and output directories for the build system.
> diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms-volatile-log.txt
> similarity index 53%
> copy from meta/files/fs-perms.txt
> copy to meta/files/fs-perms-volatile-log.txt
> index 48191f504c..fc846bbdc5 100644
> --- a/meta/files/fs-perms.txt
> +++ b/meta/files/fs-perms-volatile-log.txt
> @@ -28,39 +28,7 @@
>   # Note: all standard config directories are automatically assigned "0755 root root false - - -"
>   
>   # Documentation should always be corrected
> -${mandir}		0755	root	root	true	0644	root	root
> -${infodir}		0755	root	root	true	0644	root	root
> -${docdir}		0755	root	root	true	0644	root	root
> -${datadir}/gtk-doc	0755	root	root	true	0644	root	root
> -
> -# Fixup locales
> -${datadir}/locale	0755	root	root	true	0644	root	root
> -
> -# Cleanup headers
> -${includedir}		0755	root	root	true	0644	root	root
> -
> -# Cleanup debug src
> -/usr/src/debug		0755	root	root	true	0644	root	root
>   
>   # Items from base-files
>   # Links
> -${localstatedir}/run	link	/run
>   ${localstatedir}/log	link	volatile/log
> -${localstatedir}/lock	link	/run/lock
> -${localstatedir}/tmp	link	volatile/tmp
> -
> -/home				0755	root	root	false - - -
> -/srv				0755	root	root	false - - -
> -${prefix}/src			0755	root	root	false - - -
> -${localstatedir}/local		0755	root	root	false - - -
> -
> -# Special permissions from base-files
> -# Set 1777
> -/tmp				01777	root	root	false - - -
> -${localstatedir}/volatile/tmp	01777	root	root	false - - -
> -
> -# Set 0700
> -${ROOT_HOME}			0700	root	root	false - - -
> -
> -# Set 2775-lsb
> -${localstatedir}/mail		02775	root	mail	false - - -
> diff --git a/meta/files/fs-perms-persistent-log.txt b/meta/files/fs-perms-volatile-tmp.txt
> similarity index 59%
> rename from meta/files/fs-perms-persistent-log.txt
> rename to meta/files/fs-perms-volatile-tmp.txt
> index 61f0a6e26a..26247acda8 100644
> --- a/meta/files/fs-perms-persistent-log.txt
> +++ b/meta/files/fs-perms-volatile-tmp.txt
> @@ -28,38 +28,11 @@
>   # Note: all standard config directories are automatically assigned "0755 root root false - - -"
>   
>   # Documentation should always be corrected
> -${mandir}		0755	root	root	true	0644	root	root
> -${infodir}		0755	root	root	true	0644	root	root
> -${docdir}		0755	root	root	true	0644	root	root
> -${datadir}/gtk-doc	0755	root	root	true	0644	root	root
> -
> -# Fixup locales
> -${datadir}/locale	0755	root	root	true	0644	root	root
> -
> -# Cleanup headers
> -${includedir}		0755	root	root	true	0644	root	root
> -
> -# Cleanup debug src
> -/usr/src/debug		0755	root	root	true	0644	root	root
>   
>   # Items from base-files
>   # Links
> -${localstatedir}/run	link	/run
> -${localstatedir}/lock	link	/run/lock
>   ${localstatedir}/tmp	link	volatile/tmp
>   
> -/home				0755	root	root	false - - -
> -/srv				0755	root	root	false - - -
> -${prefix}/src			0755	root	root	false - - -
> -${localstatedir}/local		0755	root	root	false - - -
> -
>   # Special permissions from base-files
>   # Set 1777
> -/tmp				01777	root	root	false - - -
>   ${localstatedir}/volatile/tmp	01777	root	root	false - - -
> -
> -# Set 0700
> -${ROOT_HOME}			0700	root	root	false - - -
> -
> -# Set 2775-lsb
> -${localstatedir}/mail		02775	root	mail	false - - -
> diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt
> index 48191f504c..d2266c1b26 100644
> --- a/meta/files/fs-perms.txt
> +++ b/meta/files/fs-perms.txt
> @@ -45,9 +45,7 @@ ${includedir}		0755	root	root	true	0644	root	root
>   # Items from base-files
>   # Links
>   ${localstatedir}/run	link	/run
> -${localstatedir}/log	link	volatile/log
>   ${localstatedir}/lock	link	/run/lock
> -${localstatedir}/tmp	link	volatile/tmp
>   
>   /home				0755	root	root	false - - -
>   /srv				0755	root	root	false - - -
> @@ -57,7 +55,6 @@ ${localstatedir}/local		0755	root	root	false - - -
>   # Special permissions from base-files
>   # Set 1777
>   /tmp				01777	root	root	false - - -
> -${localstatedir}/volatile/tmp	01777	root	root	false - - -
>   
>   # Set 0700
>   ${ROOT_HOME}			0700	root	root	false - - -
> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
> index 1b6e9671e4..256dfb214e 100644
> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> @@ -31,7 +31,7 @@ UNPACKDIR = "${S}"
>   INHIBIT_DEFAULT_DEPS = "1"
>   
>   docdir:append = "/${P}"
> -dirs1777 = "/tmp ${localstatedir}/volatile/tmp"
> +dirs1777 = "/tmp ${localstatedir}/${@'volatile/' if oe.types.boolean('${VOLATILE_TMP_DIR}') else ''}tmp"
>   dirs2775 = ""
>   dirs555 = "/sys /proc"
>   dirs755 = "/boot /dev ${base_bindir} ${base_sbindir} ${base_libdir} \
> @@ -55,7 +55,8 @@ dirs755-lsb = "/srv  \
>                  ${prefix}/lib/locale"
>   dirs2775-lsb = "/var/mail"
>   
> -volatiles ="${@'log' if oe.types.boolean('${VOLATILE_LOG_DIR}') else ''} tmp"
> +volatiles ="${@'log' if oe.types.boolean('${VOLATILE_LOG_DIR}') else ''} \ + 
> ${@'tmp' if oe.types.boolean('${VOLATILE_TMP_DIR}') else ''}"
>   conffiles = "${sysconfdir}/debian_version ${sysconfdir}/host.conf \
>                ${sysconfdir}/issue /${sysconfdir}/issue.net \
>                ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200015):https://lists.openembedded.org/g/openembedded-core/message/200015
> Mute This Topic:https://lists.openembedded.org/mt/106385197/3616873
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [changqing.li@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------yrizNnyPKRpvOstSKtjWV9FD
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p>Hi,&nbsp;</p>
    <p>Any concern about this patch? VOLATILE_TMP_DIR is originally
      added to specify the persistence of /tmp,&nbsp; <br>
    </p>
    <p>and I think it named as &quot;VOLATILE_TMP&quot;, so maybe it is ok to
      extend to specify the persistence of /var/tmp (which by default is
      /var/volatile/tmp).</p>
    <p>And this will cause doc change.</p>
    <p>Regards</p>
    <p>Changqing<br>
    </p>
    <div class="moz-cite-prefix">On 5/30/24 17:02, Changqing Li wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:17D438C2BEE02E99.24551@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

Currently, set VOLATILE_TMP_DIR to &quot;no&quot;, only make /tmp as persistent.
This patch extends VOLATILE_TMP_DIR to also specify the persistence of
/var/tmp by following changes:

* change FILESYSTEM_PERMS_TABLES to remove symlink /var/tmp -&gt; /var/volatile/tmp
  for the packaging process
* update base-files to create /var/tmp as a dir not symlink to /var/volatile/tmp

Here is an use case:
Steps:
1. docker import core-image-minimal-qemux86-64.tar.bz2 poky:latest
2. docker run -it --rm poky:latest /bin/sh
3. /var/log /var/tmp are deadlinks, and cause &quot;No such file or directory&quot; errors

Root cause:
By default, /var/tmp links to /var/volatile/tmp, and /var/volatile/tmp
usually created by initscript(sysV) or systemd-tmpfile.d(systemd) during
boot up, but for container, initscript/systemd-tmpfile.d will not be
executed, so /var/volatile/tmp is not created.

This patch provides an option for user want to use container, set
VOLATILE_TMP_DIR to &quot;no&quot; can resolve above case.

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 meta/conf/bitbake.conf                        |  5 ++-
 ...fs-perms.txt =&gt; fs-perms-volatile-log.txt} | 32 -------------------
 ...tent-log.txt =&gt; fs-perms-volatile-tmp.txt} | 27 ----------------
 meta/files/fs-perms.txt                       |  3 --
 .../base-files/base-files_3.0.14.bb           |  5 +--
 5 files changed, 7 insertions(+), 65 deletions(-)
 copy meta/files/{fs-perms.txt =&gt; fs-perms-volatile-log.txt} (53%)
 rename meta/files/{fs-perms-persistent-log.txt =&gt; fs-perms-volatile-tmp.txt} (59%)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 3ef2deb088..e6ec640809 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -384,7 +384,10 @@ FILESEXTRAPATHS ?= &quot;__default:&quot;
 #  base_prefix, prefix, exec_prefix, base_bindir, base_sbindir, base_libdir,
 #  datadir, sysconfdir, servicedir, sharedstatedir, localstatedir, infodir,
 #  mandir, docdir, bindir, sbindir, libexecdir, libdir and includedir
-FILESYSTEM_PERMS_TABLES ?= <a class="moz-txt-link-rfc2396E" href="mailto:${@'files/fs-perms.txt'ifoe.types.boolean(d.getVar('VOLATILE_LOG_DIR'))else'files/fs-perms-persistent-log.txt'}">&quot;${@'files/fs-perms.txt' if oe.types.boolean(d.getVar('VOLATILE_LOG_DIR')) else 'files/fs-perms-persistent-log.txt'}&quot;</a>
+FILESYSTEM_PERMS_TABLES ?=  &quot; files/fs-perms.txt \
+                              ${@'files/fs-perms-volatile-log.txt' if oe.types.boolean(d.getVar('VOLATILE_LOG_DIR')) else ''} \
+                              ${@'files/fs-perms-volatile-tmp.txt' if oe.types.boolean(d.getVar('VOLATILE_TMP_DIR')) else ''} \
+                            &quot;
 
 ##################################################################
 # General work and output directories for the build system.
diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms-volatile-log.txt
similarity index 53%
copy from meta/files/fs-perms.txt
copy to meta/files/fs-perms-volatile-log.txt
index 48191f504c..fc846bbdc5 100644
--- a/meta/files/fs-perms.txt
+++ b/meta/files/fs-perms-volatile-log.txt
@@ -28,39 +28,7 @@
 # Note: all standard config directories are automatically assigned &quot;0755 root root false - - -&quot;
 
 # Documentation should always be corrected
-${mandir}		0755	root	root	true	0644	root	root
-${infodir}		0755	root	root	true	0644	root	root
-${docdir}		0755	root	root	true	0644	root	root
-${datadir}/gtk-doc	0755	root	root	true	0644	root	root
-
-# Fixup locales
-${datadir}/locale	0755	root	root	true	0644	root	root
-
-# Cleanup headers
-${includedir}		0755	root	root	true	0644	root	root
-
-# Cleanup debug src
-/usr/src/debug		0755	root	root	true	0644	root	root
 
 # Items from base-files
 # Links
-${localstatedir}/run	link	/run
 ${localstatedir}/log	link	volatile/log
-${localstatedir}/lock	link	/run/lock
-${localstatedir}/tmp	link	volatile/tmp
-
-/home				0755	root	root	false - - -
-/srv				0755	root	root	false - - -
-${prefix}/src			0755	root	root	false - - -
-${localstatedir}/local		0755	root	root	false - - -
-
-# Special permissions from base-files
-# Set 1777
-/tmp				01777	root	root	false - - -
-${localstatedir}/volatile/tmp	01777	root	root	false - - -
-
-# Set 0700
-${ROOT_HOME}			0700	root	root	false - - -
-
-# Set 2775-lsb
-${localstatedir}/mail		02775	root	mail	false - - -
diff --git a/meta/files/fs-perms-persistent-log.txt b/meta/files/fs-perms-volatile-tmp.txt
similarity index 59%
rename from meta/files/fs-perms-persistent-log.txt
rename to meta/files/fs-perms-volatile-tmp.txt
index 61f0a6e26a..26247acda8 100644
--- a/meta/files/fs-perms-persistent-log.txt
+++ b/meta/files/fs-perms-volatile-tmp.txt
@@ -28,38 +28,11 @@
 # Note: all standard config directories are automatically assigned &quot;0755 root root false - - -&quot;
 
 # Documentation should always be corrected
-${mandir}		0755	root	root	true	0644	root	root
-${infodir}		0755	root	root	true	0644	root	root
-${docdir}		0755	root	root	true	0644	root	root
-${datadir}/gtk-doc	0755	root	root	true	0644	root	root
-
-# Fixup locales
-${datadir}/locale	0755	root	root	true	0644	root	root
-
-# Cleanup headers
-${includedir}		0755	root	root	true	0644	root	root
-
-# Cleanup debug src
-/usr/src/debug		0755	root	root	true	0644	root	root
 
 # Items from base-files
 # Links
-${localstatedir}/run	link	/run
-${localstatedir}/lock	link	/run/lock
 ${localstatedir}/tmp	link	volatile/tmp
 
-/home				0755	root	root	false - - -
-/srv				0755	root	root	false - - -
-${prefix}/src			0755	root	root	false - - -
-${localstatedir}/local		0755	root	root	false - - -
-
 # Special permissions from base-files
 # Set 1777
-/tmp				01777	root	root	false - - -
 ${localstatedir}/volatile/tmp	01777	root	root	false - - -
-
-# Set 0700
-${ROOT_HOME}			0700	root	root	false - - -
-
-# Set 2775-lsb
-${localstatedir}/mail		02775	root	mail	false - - -
diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt
index 48191f504c..d2266c1b26 100644
--- a/meta/files/fs-perms.txt
+++ b/meta/files/fs-perms.txt
@@ -45,9 +45,7 @@ ${includedir}		0755	root	root	true	0644	root	root
 # Items from base-files
 # Links
 ${localstatedir}/run	link	/run
-${localstatedir}/log	link	volatile/log
 ${localstatedir}/lock	link	/run/lock
-${localstatedir}/tmp	link	volatile/tmp
 
 /home				0755	root	root	false - - -
 /srv				0755	root	root	false - - -
@@ -57,7 +55,6 @@ ${localstatedir}/local		0755	root	root	false - - -
 # Special permissions from base-files
 # Set 1777
 /tmp				01777	root	root	false - - -
-${localstatedir}/volatile/tmp	01777	root	root	false - - -
 
 # Set 0700
 ${ROOT_HOME}			0700	root	root	false - - -
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 1b6e9671e4..256dfb214e 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -31,7 +31,7 @@ UNPACKDIR = &quot;${S}&quot;
 INHIBIT_DEFAULT_DEPS = &quot;1&quot;
 
 docdir:append = &quot;/${P}&quot;
-dirs1777 = &quot;/tmp ${localstatedir}/volatile/tmp&quot;
+dirs1777 = &quot;/tmp ${localstatedir}/${@'volatile/' if oe.types.boolean('${VOLATILE_TMP_DIR}') else ''}tmp&quot;
 dirs2775 = &quot;&quot;
 dirs555 = &quot;/sys /proc&quot;
 dirs755 = &quot;/boot /dev ${base_bindir} ${base_sbindir} ${base_libdir} \
@@ -55,7 +55,8 @@ dirs755-lsb = &quot;/srv  \
                ${prefix}/lib/locale&quot;
 dirs2775-lsb = &quot;/var/mail&quot;
 
-volatiles = <a class="moz-txt-link-rfc2396E" href="mailto:${@'log'ifoe.types.boolean('${VOLATILE_LOG_DIR}')else''}tmp">&quot;${@'log' if oe.types.boolean('${VOLATILE_LOG_DIR}') else ''} tmp&quot;</a>
+volatiles = <a class="moz-txt-link-rfc2396E" href="mailto:${@'log'ifoe.types.boolean('${VOLATILE_LOG_DIR}')else''}\+${@'tmp'ifoe.types.boolean('${VOLATILE_TMP_DIR}')else''}">&quot;${@'log' if oe.types.boolean('${VOLATILE_LOG_DIR}') else ''} \
+             ${@'tmp' if oe.types.boolean('${VOLATILE_TMP_DIR}') else ''}&quot;</a>
 conffiles = &quot;${sysconfdir}/debian_version ${sysconfdir}/host.conf \
              ${sysconfdir}/issue /${sysconfdir}/issue.net \
              ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile \
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#200015): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/200015">https://lists.openembedded.org/g/openembedded-core/message/200015</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/106385197/3616873">https://lists.openembedded.org/mt/106385197/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@eng.windriver.com">changqing.li@eng.windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------yrizNnyPKRpvOstSKtjWV9FD--

