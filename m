Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.70])
 by mx.groups.io with SMTP id smtpd.web09.10420.1619539798828174896
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Apr 2021 09:09:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=dS0uidKn;
 spf=pass (domain: windriver.com, ip: 40.107.220.70, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2fasdKf4o/GRMNYUjUEHG6n8hLs5liCcuNML3RNAEuVpr8U/ZjcWMBrJIamPhkJ/+41BfnsbFg/UyAT1G+9TWLo7PpcPCfvc2f5QYyZ3SIKoiKjBHP8a2+FR6uQi+Hqf9PD1jgdniCck3kWHr2bacMwHjdJznGi2Lct/IUcvzSsEFbpwFKCFCt2+d2XOKfnahSqeMUMNTCwRWg1xb3ybTtdxkE6YMXyF0zojGN7SAnIouIc1uxmBJOOivpvpkjYwkddSqQs5qhOuFaRlEGVqrzyz/9nJhep9W/znti3QnHbzR3VECR//EQH4ygPY7auNELwzXY+N0U3N9BM3zZhBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ec5aUulkXizs9Evra90plipQBsfDjhNs1ANv97OBaL8=;
 b=kA6H3RUjDn9kZU1VY9gibrYjFrn/qp8mcMLpBV/sE6s3L1JKEszYwRsU8BSI136NPPzR+Mm3uuhvDqOHjHpzZ2c3Hc2d48aJRW3a/jeAzsetXvsgAUUG9Ew0J6DNxZbNkwVmnk+gX+Ke56rFsUJ/lsknmn4meCPrY8MZO8mQY8g2H1aiA6pD2ayyrTGkbnZmFx5GD8SiLbCte3O2sqKfltjkhGCe56tE7YLW9RjoESO0wmgUlKMmXF5U2/iGiFz5RdsjwIsGMY/ofzGapNIB/Q5mhSZVkK2yOuPA1z4ddobJsbNWmW4uusuAw0rwugWMHiK+iN4OCvap1wCk2aLB4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ec5aUulkXizs9Evra90plipQBsfDjhNs1ANv97OBaL8=;
 b=dS0uidKnZD8UkH/wilTd/AEP/efqHh25NuOmXtSmHmcD7LedM0fyi6WdyCZIljMrHWPv7bgl1zUdngvS6AM5IBozD6U5ZYCkuqW0lecnZfsszpu2kv5S79aO2TfNo6FPhfjEHF4FnX8BtYaoENsRerLC+VSWnF95U8PiiJ4tfmA=
Authentication-Results: yoctoproject.org; dkim=none (message not signed)
 header.d=none;yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM5PR1101MB2188.namprd11.prod.outlook.com (2603:10b6:4:53::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Tue, 27 Apr
 2021 16:09:56 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8d3b:70ab:5fc7:9eb5]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8d3b:70ab:5fc7:9eb5%7]) with mapi id 15.20.4087.025; Tue, 27 Apr 2021
 16:09:56 +0000
Subject: Re: [OE-core] [PATCH 6/7] default-distrovars.inc: add wayland/opengl to default distro features
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org,
 "Wei, Yunguo (Bryan)" <Yunguo.Wei@windriver.com>,
 Kevin Hao <kexin.hao@windriver.com>,
 Yocto discussion list <yocto@yoctoproject.org>
References: <20210423180254.706537-1-alex.kanavin@gmail.com>
 <20210423180254.706537-6-alex.kanavin@gmail.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <8295040a-2b00-92f2-7ad5-95e2941f0dd6@windriver.com>
Date: Tue, 27 Apr 2021 12:09:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210423180254.706537-6-alex.kanavin@gmail.com>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: BYAPR01CA0021.prod.exchangelabs.com (2603:10b6:a02:80::34)
 To DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by BYAPR01CA0021.prod.exchangelabs.com (2603:10b6:a02:80::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend Transport; Tue, 27 Apr 2021 16:09:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec333403-733f-4490-ae9d-08d90996e60d
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2188:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM5PR1101MB2188C58354B566319E89E21DF8419@DM5PR1101MB2188.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4iiRBopeXRmfKPCDQ9vJNUi/PiFZvXxS8c31/zAnnGHUVtpDsXi7NVzPa7jVNYEU1rdMnD4/Z7hQki1kY2uYRWqqeTVkidDeTBGSJi19chpNjWf3sOQ7xAs1K5/E7GgTX78ex0BzoTB0MIKDXr/KXTurjjN0JIdRvgz7yOrbUqcir8Dl4SNh/Jl1odiSBliR6W6s53SA5vkyiCpsbaU+WbOKoxbb36dTHjQYun3RLyynMSELrab3p2ys87+6al6i9MaI6A2CABWJ5xkrZ7DLRmyM4lNT1R+i1oiH8Xw3ByK0bYhnPQEVpJc/RRAVPva19VMoDet9KxDyckeRoaXDqlu8tqMFiCeL7XktXI9h3v0WrCdfRUGC7IoVnTx0fXJ1UUrIhGzng1t3LRNZbJWIay6lzePQp6XPabE14uHImwA/MBBez0KtwsI3pp29yPZqj+qQLh9eLMyFEhbdXpwVwqkrWiy9BkJxqBE/vSQYFzCqZuMz7XgeDdYTnM+v+HgH6bSj1sUBstk02Vgtvhu3rHUIYk9l4daPZxt1ksrjQNODtlXHQoes6pWkRBUWQBcUz39+4gzuVBhC5AtwW7rEO61/hOsS/1pfRhTmX4mcFk8IFQcOqyjm60UJhi/ism2tXyOJ81FNYh2Y9wIQOEpyo8F9ASzFVWmJzQuiP9DQ0RLw98AXTTzK7hkOG8hDSLsxn1DIIjKXBkwApILqtnduizuzIBzNvUtfpVVuxYYpGyegT5B92Xvcl19Zlm45i4daFNkJKJ7U1op/AtQ5F8ET9g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39840400004)(366004)(376002)(346002)(396003)(956004)(966005)(2616005)(36756003)(66574015)(8936002)(38100700002)(26005)(52116002)(478600001)(16526019)(316002)(53546011)(6666004)(2906002)(83380400001)(186003)(16576012)(31686004)(8676002)(5660300002)(31696002)(66946007)(66556008)(66476007)(110136005)(86362001)(38350700002)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?dGFhSTRjaVg5MitoZDh1SDRwa0MvTTQrdkt3Nk5kNEZybFl4MUJVb2w5Nkow?=
 =?utf-8?B?UGkybGE5YWdzYXR0TlZkdWVkUEZyT0ZlVWZKWjZHVEl3QURpL0tmdDBQTGx1?=
 =?utf-8?B?Rk5ndVFFcXhGUWQ4RzlzV1VRbnpnRC9YYTJXVUg0WktMbktxSVdYalZwOSs4?=
 =?utf-8?B?ZlZFU1V1QVVIeUQ2U25mdU9BeGV4bms5aWxLelorMWR6SEsyZUFDcWc4WWo3?=
 =?utf-8?B?S0VzdU11TzlySG84akY3T0l1S0QzS3c1aFRxOTk5YzN2UVV6a1dxckxNTDhI?=
 =?utf-8?B?YnlYMnBkMzdSM25neDBMYXgzQWZyTmluNWFlc0I3aXB5YVdDNFVRa09DRy9M?=
 =?utf-8?B?dk5Wa0RaMENoU1RMK3M3bWxlUldvR1BIR1VvN3JJZERTd1BlelFiTU9LQVcr?=
 =?utf-8?B?eWhjdFVEL3d4QUdYSWhKeW1VeTFnUlZtS1VZSWRpMUlVVy9tOEsvekFDcGJm?=
 =?utf-8?B?dUIvbk1BQ3F5Ry9zT05lUHhmM3F1NjNiU2w5WnNnQ0h0UEpVK0REOVIwMnVS?=
 =?utf-8?B?Wlk4UUdtSm4xU2JpWDY2YnJpL1lsSUZObEpKS284V1VwWFl6SGd1VW04NndQ?=
 =?utf-8?B?aFdLU0hyN3d4b09QRlJOL2FUZjRDZ3VFdndxRkNzVlVrUGRFcFNsUWN5a2Z3?=
 =?utf-8?B?L1hVeG5tYmMxdzNIKy90ZE5Wc2NFaHk5UnNqQkRTaThXc0RpZTdqTlFSbEZV?=
 =?utf-8?B?dVM0YXdRdlRIbTVGZ2dWc0RwUFA3S1RlaG1QdWpjTFFiZVlZRzdMS0d5TE5i?=
 =?utf-8?B?cDNPR21SWHNZZmdQWm5YQW9Ub0QxRGE3TXBtWEpFK0ZtTTBTdzl3cjIycXNE?=
 =?utf-8?B?eGE0eG1wbm04YUZrazlCM3plVGJnOEpRQkF0VU1EakdEcEpraThXYWNtQTFx?=
 =?utf-8?B?bnBmcmxUSzRJemIzSUNtWWM3aVNBWUd1clJpTE15VUZabVZwc016LzczZjJR?=
 =?utf-8?B?c3czOG1sTzVMdHYrdjhwR0tXVnNaTEl4elFUK0Q3a0h2UGFzY3VvbHZPMDZP?=
 =?utf-8?B?MTRQR2NOZkdDRW84dzhtWkRTRWNYRFlWR1E1R2JxaEM4SGpRYUM2M0VVNDg4?=
 =?utf-8?B?RjNYemhiQVJHQWZ1elpsT3ZON0ZqSjBmdjhMNkx5YTUxcm9tbDNKQ1JENUNJ?=
 =?utf-8?B?YmVGbjhXWnpuSUdxbmk1R0FpWjhoR1NsM3hUWXBlMHdReDNsdmh0aC9DNi9n?=
 =?utf-8?B?N3AyRFlsbndvaUNmMlU0OVlvOUpwM1hnNzRhMmdEcHBKZEt0UUt1N3VibVJZ?=
 =?utf-8?B?QWZqK2lxNXRMQXUremRWQkQ3dUJ0S1RRTklpaGRNT1ByMzU4Yzg5R0ZhTW0x?=
 =?utf-8?B?Unp5aDQrTHE2aTduQXVYRllMRUp1TVNxdDNmblRYUGkwYzhZQUM4aWtzVm1T?=
 =?utf-8?B?UFpWRVZuMkxtTU0yQ20ra3pjQlF4ZFJvL0JCc2tNSGpzLy81SUlwZGlnMGc5?=
 =?utf-8?B?emhtc1o3V0ZYa1lMS21QMFNSbDJhQkQ3VUxXenVTTFVvTE5HWkp1dm5EUnRG?=
 =?utf-8?B?cTdVV1QyeWp4Q3JzbmpoRmpCa3lIdGNZN1ppRjBkQ3dqQzU3YVpkTUNJUmlG?=
 =?utf-8?B?b003TVNibk5WbVREdmVhcGxTaHZpV0hPcFZKMnRvQVlFeGFKYmx0S25xQ1dv?=
 =?utf-8?B?R3VHc3o3SUZYdHZ5QW1lWEpaM0s0N2htMUVYdEh5b0IwemhXMSs4UnlIMHUw?=
 =?utf-8?B?aUdMeXhTbmcxTEgyU0taV1J0T3RWQ21CVFNiNTBiRnM2K0ZmL002QXB1LzNQ?=
 =?utf-8?Q?HL4GCOza7TYgFVogpCZ0JtfGnIVePEFSG17Ooj+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec333403-733f-4490-ae9d-08d90996e60d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 16:09:56.1405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V8G0ZXVuBVLpF7QgWpv9hzzL4chsh6dQ/uRtcDcUrViGU544H4vGuLwxKr1+C78ciJ2WxhxwXavEBJqYAGWbs78yp4ufZr31+H4PJISmHUE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2188
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

Cross-posting to yocto since this is of general interest.

On 2021-04-23 2:02 p.m., Alexander Kanavin wrote:
> This puts them on equal terms with x11 distro feature
> (which I think is due).
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>   meta/conf/distro/include/default-distrovars.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
> index 9fcc10f83a..384ee7fc98 100644
> --- a/meta/conf/distro/include/default-distrovars.inc
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -10,7 +10,7 @@ LOCALE_UTF8_ONLY ?= "0"
>   LOCALE_UTF8_IS_DEFAULT ?= "1"
>   LOCALE_UTF8_IS_DEFAULT_class-nativesdk = "0"
>   
> -DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth debuginfod ext2 ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat"
> +DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth debuginfod ext2 ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat wayland opengl"
>   DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT}"
>   IMAGE_FEATURES ?= ""
>   
> 

We (Wind River) already drop the x11 DF from some of our distros and
we'd likely do the same for wayland and opengl so while this seems
like the wrong change for headless systems it is one we could deal with.

There was some discussion about this topic on the tech call today and
people were concerned about BSP support for opengl since the software
rendering in mesa is horridly slow.

Kevin, Bryan,
Can you comment if you think we'd have any show-stopper problems
with opengl support for BSPs?

Joshua said that weston has a usable RDP (remote desktop backend) but
I'm not sure how usable it is especially for single application sharing.
This contrasts with x11 where you can use X11 forwarding over
ssh trivially for whole desktops or an application.

In conclusion, I see the value in pushing yocto forward but we may need
to wait for agreement from BSP folks so let's see what they say.

../Randy


> 
> 
> 
> 


-- 
# Randy MacLeod
# Wind River Linux
