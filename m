Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web11.412.1627504862284994800
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jul 2021 13:41:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=QBugEajl;
 spf=pass (domain: ni.com, ip: 148.163.158.57, mailfrom: prvs=38432969a8=alex.stewart@ni.com)
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16SJpm5N007120;
	Wed, 28 Jul 2021 15:41:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=to : references : cc :
 from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version : subject; s=PPS11062020;
 bh=Pd7inRLPnZjoDe42jbDn4cbvTmsnAYA2iTH0X0nEbSg=;
 b=QBugEajlcOD3qaDJi1EVF7zWPmNVwY7jHNKh3L4Cr7emg/HWkaOUMBz92ygI5MBwHrED
 5txVAOtTh/2dEZH7SXKlJHWHz3xI8JeokGGpGXHncyBk8doKDMgCdFBAjpAIiv8MB4Sf
 GmgWaBbxsaEZfksOyQNC/8/kDGmXMz9soI4l5dqCHACcB8FwqmB99JuSsHvGnda6188Q
 sfSoMl/LmBz6NS44AQmrJue6PPdLeKn3NRwk/fkzG4if77uqe0UcT77ZEJiG5SCUsYL3
 +8Y4q7Dzm0cNaW59bIbXsA74PO5GN/ob47KcRqBOBP6tJKYYmAG/aINw/Mm5KaAVw2vZ 9w== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam07lp2049.outbound.protection.outlook.com [104.47.56.49])
	by mx0b-00010702.pphosted.com with ESMTP id 3a235ycfbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Jul 2021 15:40:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9Ru4GF3PszzX68MblOwLu3lB+hfqwNTDEHnStcXAHecAiVoEhalzyC/EI7xyVNo83HY4QDP8+9JHN5jE0O5uTtJMXR+6baSPr/vXrb5gCpy4672F46wyqRaikQ7z0vHRu2miZd9K3f8ESo//2JfUS8OI9UueAmiBiE5WEI62G5iGpqRCqmMab6hBafAYX+0sFIB4h/0Ks0K0L5Ga21Tm2TS9ElPwbr/9sDpiXEj7tULXgc/ndvWHpVan7BkZQk/vkxEIdkoaUFhKvCOrqehDCr0OXZCoU+hlMCTWnikmFEb+iXxp9NtnfyGGGVMfhev/HH5ovOfg/2FHF4FrPOw4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pd7inRLPnZjoDe42jbDn4cbvTmsnAYA2iTH0X0nEbSg=;
 b=BKz1XZDiQ279RkSJqkyv6yem5gdMP0LeDmvILN+N0KH7UhyQsfaO0nHwcpAehVmhMlAVllSc3xrmFAlOrORxs1Q3DIgjQL4Aso4JKa7cBak6J7+QIwEm+WnVZSQTGRtSCt2iA8fVNZFLdhZRy5g+Lf8quI16dTNIjiN7BkeJJSkuOCH/KSelCOPqUQhJLzWBspibzdZEirAcjg41bVn+MHhD4TE827wSWhv9NGm3wxGPip4w1dIdmJM+EJfGu/wWrwyphJquJ5SwTAAWXzTeny8PQ9JWjIhJ/QC7xDLUEa3awetVjcnAgKCKbSHM9sbNbDrvrlrU1/fEyzFhMZIlcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pd7inRLPnZjoDe42jbDn4cbvTmsnAYA2iTH0X0nEbSg=;
 b=ISioGQ6vaeBc2eDH2t3lqTBY/+/dVdGQCzHutKT4Z0/e7ZZcZVgfFvKmypTVuzOYbbpykzaPM05F7sDb7HmAZ40YFC5fEGTTIQ9CaaBk4XTg4lAvK7V+mCPrVPtV7ZRVN+LH0sctDyocW4iMjtaVUHjqP6XSIOUszcfgKBLbzGQ=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by SN6PR04MB3869.namprd04.prod.outlook.com (2603:10b6:805:44::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Wed, 28 Jul
 2021 20:40:56 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::ed94:4e4c:ab8d:f185]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::ed94:4e4c:ab8d:f185%7]) with mapi id 15.20.4352.031; Wed, 28 Jul 2021
 20:40:56 +0000
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <5d6b6934-bd33-04e5-cf55-ce09895bbd6c@prevas.dk>
 <599d48303a40d8c4db4d0d380d4cfcc5f0c7acfb.camel@linuxfoundation.org>
 <6f831e07-bfc3-8803-07a8-39050f92b3f6@prevas.dk>
 <6413b9648787dc0ba529241cb62bc5e031654d22.camel@linuxfoundation.org>
 <d2bb69c7-1466-d265-4f81-adbd69ebb512@prevas.dk>
 <2d520cb4-2af1-fa63-1ea2-141f72a7bd80@ni.com>
 <f0a4283f-66d1-8739-fd08-3a583e2fe635@prevas.dk>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
From: "Alex Stewart" <alex.stewart@ni.com>
Organization: National Instruments Corp.
Message-ID: <56999001-9a67-bda5-0fdf-887921035b42@ni.com>
Date: Wed, 28 Jul 2021 15:40:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <f0a4283f-66d1-8739-fd08-3a583e2fe635@prevas.dk>
X-ClientProxiedBy: SN4PR0501CA0135.namprd05.prod.outlook.com
 (2603:10b6:803:2c::13) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.3] (65.36.69.14) by SN4PR0501CA0135.namprd05.prod.outlook.com (2603:10b6:803:2c::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.8 via Frontend Transport; Wed, 28 Jul 2021 20:40:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dbdafce2-92a6-477c-18da-08d952080030
X-MS-TrafficTypeDiagnostic: SN6PR04MB3869:
X-Microsoft-Antispam-PRVS: 
	<SN6PR04MB38693BA02D4529465D451E5FFEEA9@SN6PR04MB3869.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	w4hbO0bkc0n1X9jlIy/Ay793D6GnmJNpsR7bBkrdmB6dshu/t2wx1jiPVWg9zuX446wJtQEyAnil26Vnt6cpyOPyqR5uPbGo+Xf+dlkn7Zl8WIjJozKpzS6uZ7b8NewUT6VN9Y7TUt3oG0RXWliCfuWVSkNj7J3tjErFfQCfc2k1v6NYlnkH5/wpWTL7ZVmJt8b3LAVEFtNiDa+eu307BJT1EJTckVBzG29ZNkXJu4aN1gsWjABBN7zkjlJAjhlqMeGHEOdiPt3KtEUwhIZQhB1AEIfNXokIozTGeY6z+5C3hvRo6qAF1Cq9zS12OABfdwbQmLt5y2dUgF8S2M693k/bZNESpshXBfgi0CxOW14SnttKTD/nOIFtewKP4/9f36Gli1Q0nxqE2kLQi053uvOCRwBtq+2Rr56U0TaLH4sDoa9puqPUzT73n0WdQFze7hUQLLHEDXZzRI0u+Wy4VItxD65ZVaSSjrNXBfb9cmI8c1SYeBp5L+K7l1V/rbhZOTFKCbAo1NtdYKOs6WLVgiiDgLjgbY8c/NQlF3v40zl5ZtUPCME64WIzOikxVz7ZCkatbrFlT/ok0HvzgiJDZiv03wg7a60ZrTxcR6UW1likAaPJnTJtwEX9BqBeXISbh+Aef5uI7ark+9OKuJepqUkvSTKBu8FXwfyse11AV1FM/iBXn6VCucxuy4V4tsSxfh4eui4MyCoFsqMT5/maUO9h9ieyd8ffb7xaAnIv5Pmky/yPdNSXUkEl/MzWe2QAYr9o3Gq/tT2kq88lJrEZ9g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(66946007)(36916002)(53546011)(52116002)(2906002)(36756003)(316002)(2616005)(66556008)(31696002)(956004)(66476007)(186003)(26005)(508600001)(8676002)(6486002)(44832011)(4326008)(110136005)(16576012)(31686004)(86362001)(5660300002)(38100700002)(38350700002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RGt5eDBqUXhoWHQ2M3J4T2JmWXVkNXBFT3plS0tXMllEYWFFT2FVd3ZNOVNp?=
 =?utf-8?B?UVVSK0VoMW1pWk12WG9PYXQwYWhZMTNTQUl1a0VIUDFWeVAwQ3o4aUJnZWFG?=
 =?utf-8?B?c3BrRmZrNEVXMnFjRStpUTFaeVZVTExpTy9MVjBpNzA1RC94aUFxSlIzVHI4?=
 =?utf-8?B?TjhwM3NUNGNHZEVBQVZpa1ludnc3MVFFSWM2SzlISTJ5YUxmZStzWTdQaDlv?=
 =?utf-8?B?aFF2cGxvZDRwRHhGOURNM1RaN0ViMUtQQkM4cUpISEduZGdUc3FoSUl1bjFS?=
 =?utf-8?B?cHVicDBXN2I3Rkt3T2pQT21hVlNsQjBFU09OTzdVSjdjbmdlNVJXdm9FdHVB?=
 =?utf-8?B?U1lYb3VRT1ViQlhtNXNvTEdRZmROUElOUHBRajVRMUY1ci9SRzJrL1VqMlV0?=
 =?utf-8?B?Y2s2a284TkJYVXIzYzZ2NlNXMFZaUmpzT0N6dlRQQnhuNEVQTjNQR2wrc0Y4?=
 =?utf-8?B?aEZDbWRJbGtOM1hqeWRETWRVdThvdER2ZW5JUE5UbWdzL2lraisxbkpPWHRz?=
 =?utf-8?B?YlBhR3A3ckUzbzR4QmxzM1MrQndIQTVDZGtrTWluNGFQM0dGSEQ0b0RUZ2ZJ?=
 =?utf-8?B?NjFQeDFkL01VdVQ1UXhKVENpNnlqTm0xS1gvRlYvWXFaSnNzOTRHZm9JNEp0?=
 =?utf-8?B?elROL3R6ZkNvV1FCZ1FGNHFIU0xpdTJya3dXcmpOTURWTHFaRVlHbDhFQkRi?=
 =?utf-8?B?bW0vWVdOdXBqeFJoVXZsNGpZT3JRNXdaUk5EdWhoNXNBWnBTM0lKYW5TVFZO?=
 =?utf-8?B?UEN3bk1TcS80NVd5WlM5T0RwUURSREFCZXZsanZ0SG04Qndqb0tqbWlwYzk0?=
 =?utf-8?B?WjFHRzRMaTFteWFQMGVJa1BmMmF0U0c3YUc3aHdzSEVrZ1BYbldMVVpucXNs?=
 =?utf-8?B?V1hIdFl1VUd3SHF2UlUxSmZCanBLNG1GTHlJN1FTN0FCRDRUdXh1TVg1WnVH?=
 =?utf-8?B?Vy93a255dlRKamFvQlcwZWZYOEF2OTRzQWhONGhGNGFQRWdQNFhkQnp0dDU3?=
 =?utf-8?B?WkNMbktRSmhJWElDYTNuU3EySzRKaDlGVVc3dFhJNEhnSlNGS3NDc05RNFQ3?=
 =?utf-8?B?RUxYT3I2NDNjalpzOTNGcmlOeERWQWZrWVBxYzNIaUlJY1hwdGZSQkVNSDhK?=
 =?utf-8?B?QXhtUklHc1FCU0JJV3JmSWs3Mkp2U0lHdStuVDBYZ0o2MGlpSW1OZHVJbTZ6?=
 =?utf-8?B?bFJmRDdCYWVMdUVob2d3Uy91SUcycnZYYlg5eEdhQ0Q2b2ZGVGNBeTQvRVRE?=
 =?utf-8?B?T0szNHFlOUMwNFZVVmMzZGVMMEllWGhENjBmNGpldjNRL0x3VXlIS3NlaDAw?=
 =?utf-8?B?SVplMW45UlA4MEt5OWlWNld1ZzVOWWVGMnA4NEZYMGtraWkxdC9lTXpLY01M?=
 =?utf-8?B?SVk4T3RVM1gvQ2tlTnl3LzNIdGl2b2s1bDNSdHVJV3BaNWFHaXZ5eWtxVThp?=
 =?utf-8?B?ZTJzSFpCc1NpTU9UeHVzVkNvck9yNkxtU0MwSktCbjIweEU2U0tHbjNEUmNs?=
 =?utf-8?B?M1JISWZKRHdudWRMVno1TW8wUUVrMVJINU9aa3crb2VTd1pnNk9PL2dSVzlN?=
 =?utf-8?B?UkNxMno4MXFmcjdxcElCMjZzbXI2dStNSnZsQ3V6U3BNS1M5blJMQWZLL0k3?=
 =?utf-8?B?aEhKMGwwS0d5eXBXKytrM0JEcVNLYSs5VUpzNy80dzFaeFZWZ1Ricys5Vmpi?=
 =?utf-8?B?dXRFZmw4TW93NllEVkZSZFZ0UVljMWIzMEVlOGlRUmdIbHF6SzM2MG4zbmNO?=
 =?utf-8?Q?gfrzXXNcp6X9CpThszhNrUodJFEdlEguGnvR28v?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbdafce2-92a6-477c-18da-08d952080030
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 20:40:56.7612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mcbIKiJoAvuBzdEx6klOsrTdedjh/BWCFrqkX1CogM4LnvLaCAx6aBlrWQG66rbFfaqohjUlbVC/tVYfjx05hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB3869
X-Proofpoint-ORIG-GUID: MJQ5Y0erYwQ5JMKG95OlMX9748fMKQqG
X-Proofpoint-GUID: MJQ5Y0erYwQ5JMKG95OlMX9748fMKQqG
Subject: Re: [OE-core] RRECOMMENDS "masking" unsatisfiable IMAGE_INSTALL
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-28_10:2021-07-27,2021-07-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30
 priorityscore=1501 clxscore=1011 lowpriorityscore=0 malwarescore=0
 adultscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 classifier=spam adjust=30
 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2107280113
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 7/26/21 8:48 AM, Rasmus Villemoes wrote:
> Looking at log.do_rootfs, it seems that opkg gets invoked in exactly the
> same way with and without the RRECOMMENDS in play:
>
> With RRECOMMENDS, where the build succeeds:
>
> NOTE: Installing the following packages: [...] glib-2.0 iproute2
> kernel-image kernel-module-abcd less libgettextlib [...]
> NOTE: [...]/recipe-sysroot-native/usr/bin/opkg --volatile-cache -f
> [...]/work/rpi3-oe-linux/pil-rootfs/1.0-r0/opkg.conf -t
> [...]/work/rpi3-oe-linux/pil-rootfs/1.0-r0/temp/ipktemp/ -o
> [...]/work/rpi3-oe-linux/pil-rootfs/1.0-r0/rootfs  --force_postinstall
> --prefer-arch-to-version   --add-ignore-recommends busybox-syslog
> --add-ignore-recommends busybox-udhcpc --add-ignore-recommends
> kernel-vmlinux --add-ignore-recommends udev-cache install [...] glib-2.0
> iproute2 kernel-image kernel-module-abcd less libgettextlib [...]
>
> And no further mention of kernel-module-abcd.
>
> Without the RRECOMMENDS:
>
> NOTE: Installing the following packages: [...] glib-2.0 iproute2
> kernel-image kernel-module-abcd less libgettextlib [...]
> NOTE: [...]/recipe-sysroot-native/usr/bin/opkg --volatile-cache -f
> [...]/work/rpi3-oe-linux/pil-rootfs/1.0-r0/opkg.conf -t
> [...]/work/rpi3-oe-linux/pil-rootfs/1.0-r0/temp/ipktemp/ -o
> [...]/work/rpi3-oe-linux/pil-rootfs/1.0-r0/rootfs  --force_postinstall
> --prefer-arch-to-version   --add-ignore-recommends busybox-syslog
> --add-ignore-recommends busybox-udhcpc --add-ignore-recommends
> kernel-vmlinux --add-ignore-recommends udev-cache install [...] glib-2.0
> iproute2 kernel-image kernel-module-abcd less libgettextlib [...]
> ERROR: Unable to install packages. Command
> '[...]/recipe-sysroot-native/usr/bin/opkg --volatile-cache -f
> [...]/work/rpi3-oe-linux/pil-rootfs/1.0-r0/opkg.conf -t
> [...]/work/rpi3-oe-linux/pil-rootfs/1.0-r0/temp/ipktemp/ -o
> [...]/work/rpi3-oe-linux/pil-rootfs/1.0-r0/rootfs  --force_postinstall
> --prefer-arch-to-version   --add-ignore-recommends busybox-syslog
> --add-ignore-recommends busybox-udhcpc --add-ignore-recommends
> kernel-vmlinux --add-ignore-recommends udev-cache install [...] glib-2.0
> iproute2 kernel-image kernel-module-abcd less libgettextlib [...]'
> returned 255:
>   * opkg_prepare_url_for_install: Couldn't find anything to satisfy
> 'kernel-module-abcd'.

That's helpful info; thanks. I'll paste it to the bug in the opkg 
bugzilla and we can continue tracking there.

-- 
Alex Stewart
Software Engineer - NI Real-Time OS
NI (National Instruments)

alex.stewart@ni.com

