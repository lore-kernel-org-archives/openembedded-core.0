Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.112])
 by mx.groups.io with SMTP id smtpd.web09.30168.1627307319972040058
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jul 2021 06:48:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=hSUuQgqe;
 spf=pass (domain: prevas.dk, ip: 40.107.22.112, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G7vyurux+swtHlBpJybBKGc1BaxZMnxX5yd5eWw1DrHIUFD9JOHGn14CjhTIhCuPVJnF+Xbrum3+GHUUSMNcN0/QE8MTvNvvKSjIA/bsLzj6BM2LrOjUqUnflWNWiMZZEMx04DkqPCq0vfAYpfYfW7NAAsFWP2sdx04kGm6/BNR/4sZIMAG/HYGV74RxuLnOidYOFyzxMb5kzneA18UI6251O97l7J+KWqvnc7rXoorLrHL+54J5OrWAnolh8Rqu1/blw/l3jb6ZdhQfb/Ul9DIZ4ZM1J22ofygQloMYq+/xE3GajtGr4/ewcyQuVx0cw+UmQq47yXE+9sMAFU1ajQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OdD4GtvTjBd/5tywVpY0rNquOTk7Aa8H+mbaSnVjX6Q=;
 b=JKIVvznNbyYFvx4SuuHtGmr6D6rrNktBEpAqBa/CPjL1FvLx1J0MOK5+Hw7CO2OnMi/zh9RTRIU5cRzR85JAhMHY3K0s6dAnxtLllMKwL9Ukj8qSyiRFqr9png6RaQNkuPeDCPDQz5TJPVNBRkj1+JtQUR2tT2ODB3f77MunqcLKFRv/9SWcNdD3wHdY/uMDP0XxqNw94kztjVudq9Mde3U6gK4bm70amgOYYUCi2rmKrolhSgi3+x9dgWQ5n/pXgGQc8kaAZh+3mqLyX2IJEtoyFxh2g3935g9yxV7IYA3zsXZDVCUdVUaazXwktpBjQ7Km0au8bdYhYaQGgmuvTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OdD4GtvTjBd/5tywVpY0rNquOTk7Aa8H+mbaSnVjX6Q=;
 b=hSUuQgqejP1hQKailTD5AU2GQIlrZkOrpCcOc+J/SgnEBm6KHMjU06RVcDt2o68F1WyEV/kYcD9I185r4YVOwaKYMK9P+YVZjqVin3bmT3kTwkp7Aj5yqW7hwfcjHFxEAjd2FKa6N1fYtu3cVeIKw9iy7DbJU2OjZO2Czd5C3Bk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM0PR10MB3170.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:180::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Mon, 26 Jul
 2021 13:48:37 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fc83:36a5:db02:3dbb]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fc83:36a5:db02:3dbb%7]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 13:48:37 +0000
Subject: Re: [OE-core] RRECOMMENDS "masking" unsatisfiable IMAGE_INSTALL
To: Alex Stewart <alex.stewart@ni.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <5d6b6934-bd33-04e5-cf55-ce09895bbd6c@prevas.dk>
 <599d48303a40d8c4db4d0d380d4cfcc5f0c7acfb.camel@linuxfoundation.org>
 <6f831e07-bfc3-8803-07a8-39050f92b3f6@prevas.dk>
 <6413b9648787dc0ba529241cb62bc5e031654d22.camel@linuxfoundation.org>
 <d2bb69c7-1466-d265-4f81-adbd69ebb512@prevas.dk>
 <2d520cb4-2af1-fa63-1ea2-141f72a7bd80@ni.com>
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
Message-ID: <f0a4283f-66d1-8739-fd08-3a583e2fe635@prevas.dk>
Date: Mon, 26 Jul 2021 15:48:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <2d520cb4-2af1-fa63-1ea2-141f72a7bd80@ni.com>
X-ClientProxiedBy: AM6P191CA0049.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::26) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.149] (80.208.69.72) by AM6P191CA0049.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend Transport; Mon, 26 Jul 2021 13:48:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3e14e51-2ef3-48e4-224b-08d9503c1192
X-MS-TrafficTypeDiagnostic: AM0PR10MB3170:
X-Microsoft-Antispam-PRVS: 
	<AM0PR10MB3170C41205C26506A244FD9493E89@AM0PR10MB3170.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Dcvbrl3DYo8AokUvFt4eDgLJxbrhFEooOpDvNLSRZZrO1vizvVaaUWm3zJpCL7enFWMakORlQFpHoSZ98BFcH2lop48FN1S/X4mf61rXCBjePne3NPeJdtxGels251j44AdQYVShYBosbsVUjjnmFnGJb/WXvOVYlfCgiiva4aWy3oFrr3f2l6kDNwgUVfT9djpNrQbn8KknUX4CPJWcIyYgJvjYHuozO7TGud/Wxbs5VaZT8WxOerAwEScvzqkD8rstzkhcM+6M9DFz/9/CkfVgucKvbPy5lg5uLgR5d6IzPwRqbU9liD+KvCp7pyl9emHV+fYJ3FETrFO2ydNId19Qg4gkpyl0t7gEYsvzGbCeZiKJ2ULlhncYMphOq2mYvKDOcafb4KjylVDFP93vbqSzXh/jY4qvNKGla/twyRm92iMahdOvw8xBj39EUv/AcEEDvoT9d9BaFBaiDXGb/qarraRMJBE5gJ1fdDvl0lkFRzAqrJD3CedegWP6FjF5VykoHKbde3Xi99iNLUCl4Q2i8BhthIrEwwUo9GgdbZEY3DQT3y4kTlb3YAGkiOvz/6bYIFOjlocgSDggPVX+RuK9V0v2fJJ2UW+S7ySQgyE5YqBH95MzmO6QDdCilJJG1gHoCkiwv+dVereDOfgB6+cCnsKxxr+BYMBrUtq+6sNsp0ZSHKDPbMrR0DsoYv9KLhUKjz59FxhccycvNgS9Q+2/F7Hn1jEuO2yuEtuvj99VdkiCCdgMJ2yLtTtkmEAevmk6mrTZygWwE8BsJhjKrg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(346002)(366004)(376002)(396003)(39840400004)(136003)(31686004)(16576012)(110136005)(5660300002)(66476007)(66946007)(86362001)(186003)(6486002)(8936002)(316002)(53546011)(8676002)(8976002)(26005)(52116002)(36756003)(31696002)(83380400001)(478600001)(2906002)(2616005)(66556008)(38350700002)(44832011)(38100700002)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OVZ4dXROVWRUYis5dERUeTlGbWIrWXlIdkwyQ3UrZnFLeWtrMzZzdFNsYlpL?=
 =?utf-8?B?SVp6N2ZsakI5ZDdsSlFlQnhERlBHU1k1T3NjeHJkdVAxVEUyR3ovUk9CTWpX?=
 =?utf-8?B?Y3doOUtYRlRNbVFVRzlPcjJ4cFMyOFRETjNTMzdFK29zVXRrYVJWQVVwY1ht?=
 =?utf-8?B?R0VObzNUalBKZUxCcUdKY2YxaTd4TlJHcXhKVG92VjhUZnNIRHRhbXYxaEpi?=
 =?utf-8?B?clVFZ1ZtVVFaamFwZjhzYVgwWHVRWFlSU2UrcXNIS3cyQmVlMEVMN2VjOWM3?=
 =?utf-8?B?S294NE5JZGlySXl2YkFaWXpsWm9lYUdFbjZrQjNXUEJCakJKbEFOT2QyOHha?=
 =?utf-8?B?Z1NWc3ZVYnN1ZXdvQzY0bThoT1JxeDlNc1Fqc204OVNPNGRrNFd5cWJsZ1Fj?=
 =?utf-8?B?Zm1hbTlIZ0szQUNab3dHajM4WnI4RkRuSEI0VExMamt0WWEvd1V3UzFhSmZz?=
 =?utf-8?B?cVlyV1czY0Y3QnBqRmM0dHI5N3gxU2dMaG9haEwxZXZuUHZ3YVE0RTJyQm43?=
 =?utf-8?B?Tk5BWCs5U2RaTldxeHd3UnVJc0pXYUQ3K0dNUThLSnJZMlVlb1JsWkxSTTYv?=
 =?utf-8?B?TWtTWHRqQzk4ZUxqOGsvbXRITVRtS0xXNWdZWDQ1Wkx6dStoTFMrNnRMbUd4?=
 =?utf-8?B?V3NkcmlYZk1GNzRaMCtkdlV6OHdtcHFOU0VRSDhxRUowL3k3SlhYZTdzY2pX?=
 =?utf-8?B?NVRXenJkbDNBMjhnSFNOSWlyK2VzZ1dMN2t1cDFlRFVva0xINWV5Ylp5aG05?=
 =?utf-8?B?dmhzNDZiT3Flcm5IVk9PQkpkNHR0aGFlT2RFem5wZU81d3dwR0RhSlZnYmYr?=
 =?utf-8?B?THcwYkpwWUlaVVpubjFjODVaVmpST2ovNGczRnJPQ2p2R29HbmwvVUljelZX?=
 =?utf-8?B?MjhLQm9abG1LbE5jdDdCUjdlRGJaZitrYThINlBpa0xmNmMzS0h5U3VrSHFz?=
 =?utf-8?B?MGE1TUZGb3VkUDdxc2cxd1MxOUxGb043cmFmcTdlYjNvM0F4Q2owNFRaSVcw?=
 =?utf-8?B?cGZ1dmNBeEJoOTRMbitzcXUvTTV3WUFBcU5IM1QyOUM1aTZiZmdQeEpwb1Rn?=
 =?utf-8?B?VFF1ZmhMS25aTHFBdW9UVlYycWxKeDJYcGJ6TVZtM29BNmNxVS9BQkh5aENr?=
 =?utf-8?B?eUVSOU9mdWIzWmZUcDR0ODUvNmJ6TXpyWVRreFRlMjJKeEM3SnM1dVE3M1Ft?=
 =?utf-8?B?MlY0ZXRlb3NTNlUxWFpIcElQU2U1NEVMV0JkTk9Ub0tuODRIVWszRlFZT0lm?=
 =?utf-8?B?WUZESCtMQWwwek1UVms3MlJZSTJvMGJFeGkvMGFVSHVESE4yaCtJam1qYkNG?=
 =?utf-8?B?U1hhWU1GNlZIVEp5N2JXSE43ajRBZHdYRjhSWWVubEZYb1JsM1hBei9EMEdB?=
 =?utf-8?B?UEx1NWhpQWZVaWdkNVhMUzBwaUs2ZWxURXdTeVZia3NMbm5EM2JzMTg2S2Ux?=
 =?utf-8?B?ZkVqQ1NPbHo4OGxDcTVVYkJaMndKNGo0ZFlOTHdMQWRWQU5mZlFMYWdFRXBi?=
 =?utf-8?B?TXAwTUVKaUNBdVlqMEZOZ2lZanZ1eTdrSDlrM1ljUmlxdkZ4OGp1cmVXRXlI?=
 =?utf-8?B?YVk3K09DNGNZSnAxZllwNlZadUtEVXhWbEFSa2FHS0gvZ0dGaVlpazRVODlF?=
 =?utf-8?B?RHZmZ3BraHgrelIwQkx3V25Yd28wMHdVcTUzWHMxVXRVSGFlN1FxZ3oxYyto?=
 =?utf-8?B?YThRRGwwWWh3S043SWFwUnVxc2FhWmJOVUFVRGNWVy9Zb0x3MmVPUW42NGJM?=
 =?utf-8?Q?ikFFglmRCdy44PnZE4tbrfpoFTnVfpd1q6TxMth?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: f3e14e51-2ef3-48e4-224b-08d9503c1192
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 13:48:37.4654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oPA4ih0+riUH2r2hpXkjObensQQSPoalQigserib892rKEs3wsgaKM4lpJZhYnoMv3DzBY/UCS3/jV5hz/j8Klxj3UxuxLMs5m+3CRw6wHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3170
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06/07/2021 21.39, Alex Stewart wrote:
> Hey Rasmus,
> 
> Sorry for the delay; I was OOO for the holidays and I'm just now working
> through my inbox.

No need to apologize; as it happens I've just now returned from vacation.

> On 6/28/21 4:17 AM, Rasmus Villemoes wrote:
>> On 25/06/2021 18.13, Richard Purdie wrote:
>>> That is probably a bug that needs opening against opkg in bugzilla then.
>>> Added Alex to Cc: (opkg maintainer).
>> Indeed, thanks. Alex, do you have enough context from the above, or do I
>> need to do anything explicitly to file a bug?
>>
>> Rasmus
> 
> Could you expand a bit on how OE is supposed to fail when the kernel
> module package is unsatisfiable? Does it propagate a opkg satisfaction
> error, or is the misconfiguration caught in the OE python modules?
> 
> I ask because it seems most likely to me that the inconsistency here is
> in the OE opkg interface modules, rather than opkg itself - which
> obviously has no concept of IMAGE_INSTALL or the kernel configuration.
> 
> Can you identify the set of packages that OE is requesting opkg to
> install, with and without the RRECOMMENDS? 

Looking at log.do_rootfs, it seems that opkg gets invoked in exactly the
same way with and without the RRECOMMENDS in play:

With RRECOMMENDS, where the build succeeds:

NOTE: Installing the following packages: [...] glib-2.0 iproute2
kernel-image kernel-module-abcd less libgettextlib [...]
NOTE: [...]/recipe-sysroot-native/usr/bin/opkg --volatile-cache -f
[...]/work/rpi3-oe-linux/pil-rootfs/1.0-r0/opkg.conf -t
[...]/work/rpi3-oe-linux/pil-rootfs/1.0-r0/temp/ipktemp/ -o
[...]/work/rpi3-oe-linux/pil-rootfs/1.0-r0/rootfs  --force_postinstall
--prefer-arch-to-version   --add-ignore-recommends busybox-syslog
--add-ignore-recommends busybox-udhcpc --add-ignore-recommends
kernel-vmlinux --add-ignore-recommends udev-cache install [...] glib-2.0
iproute2 kernel-image kernel-module-abcd less libgettextlib [...]

And no further mention of kernel-module-abcd.

Without the RRECOMMENDS:

NOTE: Installing the following packages: [...] glib-2.0 iproute2
kernel-image kernel-module-abcd less libgettextlib [...]
NOTE: [...]/recipe-sysroot-native/usr/bin/opkg --volatile-cache -f
[...]/work/rpi3-oe-linux/pil-rootfs/1.0-r0/opkg.conf -t
[...]/work/rpi3-oe-linux/pil-rootfs/1.0-r0/temp/ipktemp/ -o
[...]/work/rpi3-oe-linux/pil-rootfs/1.0-r0/rootfs  --force_postinstall
--prefer-arch-to-version   --add-ignore-recommends busybox-syslog
--add-ignore-recommends busybox-udhcpc --add-ignore-recommends
kernel-vmlinux --add-ignore-recommends udev-cache install [...] glib-2.0
iproute2 kernel-image kernel-module-abcd less libgettextlib [...]
ERROR: Unable to install packages. Command
'[...]/recipe-sysroot-native/usr/bin/opkg --volatile-cache -f
[...]/work/rpi3-oe-linux/pil-rootfs/1.0-r0/opkg.conf -t
[...]/work/rpi3-oe-linux/pil-rootfs/1.0-r0/temp/ipktemp/ -o
[...]/work/rpi3-oe-linux/pil-rootfs/1.0-r0/rootfs  --force_postinstall
--prefer-arch-to-version   --add-ignore-recommends busybox-syslog
--add-ignore-recommends busybox-udhcpc --add-ignore-recommends
kernel-vmlinux --add-ignore-recommends udev-cache install [...] glib-2.0
iproute2 kernel-image kernel-module-abcd less libgettextlib [...]'
returned 255:
 * opkg_prepare_url_for_install: Couldn't find anything to satisfy
'kernel-module-abcd'.


So I assume the difference must be in some of the metadata files
(opkg.conf or the ipktemp/ dir argument to the -t flag), but I know
nothing about how opkg/ipk works internally or what to look for.

Thanks,
Rasmus
