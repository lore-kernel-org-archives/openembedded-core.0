Return-Path: <haris.okanovic@ni.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0103.outbound.protection.outlook.com [207.46.100.103])
	by mail.openembedded.org (Postfix) with ESMTP id 3F4D7771FD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 20:39:50 +0000 (UTC)
Authentication-Results: ni.com; dkim=none (message not signed)
	header.d=none;ni.com; dmarc=none action=none header.from=ni.com;
Received: from harisdt.amer.corp.natinst.com (130.164.62.171) by
	BLUPR04MB008.namprd04.prod.outlook.com (10.255.210.28) with Microsoft
	SMTP Server (TLS) id 15.1.390.9; Tue, 2 Feb 2016 20:39:49 +0000
To: Diego Sueiro <diego.sueiro@gmail.com>
References: <CADkTA4PoDAgiJ2kdpT9HBnWLfGG-spLmSnF66BP33z520ig6wA@mail.gmail.com>
	<1450132548-31177-1-git-send-email-haris.okanovic@ni.com>
	<569EBB4B.7020606@gmail.com>
	<CAMCfZKFzUu7gRsgbw0rNBQZaRcLm7mbF=dZ9mvUx4DJfmSnynQ@mail.gmail.com>
From: Haris Okanovic <haris.okanovic@ni.com>
Message-ID: <56B1140E.2070200@ni.com>
Date: Tue, 2 Feb 2016 14:39:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAMCfZKFzUu7gRsgbw0rNBQZaRcLm7mbF=dZ9mvUx4DJfmSnynQ@mail.gmail.com>
X-Originating-IP: [130.164.62.171]
X-ClientProxiedBy: BY2PR05CA062.namprd05.prod.outlook.com (10.141.250.52) To
	BLUPR04MB008.namprd04.prod.outlook.com (10.255.210.28)
X-Microsoft-Exchange-Diagnostics: 1; BLUPR04MB008;
	2:n8E2iF3SlPT1OUdjyHqic/pUsW67iT/IUqDYMnU45r7AFD3l2RVPv4xmWmZ6UWGbnOsj96ZjnFJIfdkfJ7d1pR7ByDnExXjSy03fAbMhKcrCyfyScEnKgAxQiCb8BMg8yJAo9rZvSNQxI+gxdt4SOw==;
	3:iWyhJFb7AgiRK2vp9qhv82S09fS2guLPVe4C8PGEBmaDmPtvFfsELiHXtQcisBvtcP57PU0zPLRZoRTGt/8oJDI6mEPxWdIXqHL+RDA1zGqU7kQJ/A6LGH7rzdZerVjHctBNTw2RSG58M6DlpzDYe8BX90MwsPpvPnY6VMcVGnMXGIvU9vLgEdIBRn9532jB;
	25:amw/FY/1W7UymxmMSbv9sAWV5jLNlo+pqnG5oNb/snVELXtRV95cX5ez3mvZS/J0jPR1Jgh/isGgBdDdZlSf9MCLvlDWsJRX+nYPSvc66f6PS29jqxUPbvuN1fN9+ivhDXEAhEr3V/GFP7R+HS9YnK8WNmI65sI7gL+NQdBE7X695CmMxigNlSDRkcJsO5LIragQkO2vsr3abAS3AzTNMX/J8ISGlClmwFmLc3rlHizMUBluYTVZ9WHpWX/+030f
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(421221001)(42167001);
	SRVR:BLUPR04MB008; 
X-MS-Office365-Filtering-Correlation-Id: a14cfb8f-4a4a-49e0-2bd7-08d32c10ff7d
X-Microsoft-Exchange-Diagnostics: 1; BLUPR04MB008;
	20:ZxhAxeURNd+WrQJQedKK4D9cv6i6loQDC4eZnul17Rhozww6Gr0FWcnJZroZNPXTHmD+mLNr2Zx0cSEue5Oo9CQdWlVTEn8xkvZCkYC/N/HWPoRjnrjridU82Zel8R5jE/bwt2hAb5tlqn0V0PMNFUL7743BvHedW91Dyubp+cUhsXiZFQ5rJoo1Pgm90DisKspCViuaREVHLf7nnPGa9Z979dBJs1qPH7OjU1F/PUsJAM6A1dqxYwAbvebUlm+1yoWUp2HNEGQnGcOm16f/xXm7JvLUA7Sblo0wcyThwmprxo7ue0YLpdhU/UVdQeLOuyEValR6Ag5TAnjEFo10DCe2sHDJyfJpGtv1ZFiRnmzbdoAXdhK1aA9aJCfRg5XADlyIxTl5JOJ4NKuYFcdWRhLI8Reys4IuOvy1Ui6pu72vClwu4KkXxAghnNI/g85wqYSKmHq72bW2NSBGCL7CItQDRubQY0wVK7nH7rr0kVn8FuSHcg7HSHVhSZM/9K1v4777XgqpEmCuWRm6cbKSap1OcnSKo3vfHHg/bKpX47gUX86n6ssqEfakcBmc6AZVlzZ9EX5xdlcoSvoVveU+2UsgENYyc3UCmLK2EMGyJFI=
X-Microsoft-Antispam-PRVS: <BLUPR04MB008575D119E714C28DDEC84E5DF0@BLUPR04MB008.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046);
	SRVR:BLUPR04MB008; BCL:0; PCL:0; RULEID:; SRVR:BLUPR04MB008; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR04MB008;
	4:AWnmXJhIacKV7yE+h/BNonTZXubOUS/hpPZFnPSpeJV+XHXJzRKIvb/a6REYwfh43fShgQ/Y/WbWCgzBgwxHVlOOk/bszvC8Xxd7Ov3Mzm6wMjQA/Dy7TH9DfTbO2PDe+VNt2i9r/3kf+g8tD2Y4DtMN5QVssmtstygvM20wTOZG3wcVNvqmJNBwYY+A5XHnw9Ry+53hNhkWsAlQVHVXLonYt0kgX/6M6TS6JxwaJlyxD3czuCMbwVgIv7tvQzsH+1/7XpL54TzLYhraEfW0QraQ/g6JhC/NvsxutoIkYDYVch/c0TcUx2GX8GrpeyMzgGuymmDG8FlPtxFiQNKtN8rSAQW5gQk6enUXTfRxH51NLhkNndU+CdVy7+h8tNpb
X-Forefront-PRVS: 084080FC15
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(24454002)(479174004)(377454003)(2906002)(4326007)(36756003)(5008740100001)(110136002)(15975445007)(586003)(2950100001)(92566002)(5004730100002)(66066001)(64126003)(230700001)(5001960100002)(87976001)(77096005)(15974865002)(4001350100001)(33656002)(65956001)(189998001)(23676002)(59896002)(50466002)(6116002)(40100003)(54356999)(47776003)(76176999)(50986999)(87266999)(19580405001)(65816999)(80316001)(42186005)(122386002)(93886004)(83506001)(1096002)(3846002)(19580395003)(86362001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR04MB008;
	H:harisdt.amer.corp.natinst.com; FPR:; SPF:None; MLV:sfv;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTFVQUjA0TUIwMDg7MjM6Z1QxMURuSVhRU1VmRllwU2daUFRTNmdKa2RB?=
	=?utf-8?B?S1VTSXdpc3Y4T1lnR1REQzNMV2hXV2h3akZRUmFkOWp0Tk1NWHRCb2RNajh6?=
	=?utf-8?B?Y3dQWXc3TTFOQUpKUGg5WjIxY0EyZmViOWJhdCtnbEtrMmtBeE1TVys4a3ZY?=
	=?utf-8?B?RmZSWHc3OFo0Q2dxNFcwd1hMdmI5TTlVVmRCUmZIWWN4N0NqRUN5UStXa3Za?=
	=?utf-8?B?dG9BMlVFeklaeGNKaWVPblVHekd0N0t2RkcyUGFDK0l3STZtRldaUm82YlhP?=
	=?utf-8?B?bjN1L3FyeGVLTktNWmQvb2VENmhvNGVmamI4SHlxeDg3NURPNjQydi9QbDAy?=
	=?utf-8?B?QVcxdVh2UUZCZEZZbUtpK3Q3cmFWQVVBYVp4M2o5cnQrcTU0MFBrQ1ZleU9S?=
	=?utf-8?B?Myt2dUFOd1ErdlZPZXo0b0RxQzhzZTJQVE02UFBHRXVTTTVhd1BYTS9SeGRz?=
	=?utf-8?B?VTg3R2RvSk5iWmpsNHdmV0FGQjRJSWFDWURsamFPR0hYR2V2d0lQNG9TWnVI?=
	=?utf-8?B?QnZyRHNPcjFUUWpvWUNtTXVSb3gweGo0b2hYNGt6T213SGxoMDV2cEIrWVNV?=
	=?utf-8?B?NUFSVHVWbmdXbkRuaVZodFJFa3VscWhHNWZwREFESGdCMEhvc3VqeGlydkFY?=
	=?utf-8?B?V0xESXVBcEFKd0VTcWlsZ2hzSmRocU1RQ3hWbGdPRGdxQnI4ZDdiNThWSUNY?=
	=?utf-8?B?M2JIdXdPNWlnekF2clBFTFZVNzJNaWIzZGo5Q3lXOFg0SXdjSUF1TmdXMldn?=
	=?utf-8?B?QUxvUmZrbEpyRENXZDVTdmhKNUVNeXByZEdVSmlIMndvaG50ckhLb1lxWVZT?=
	=?utf-8?B?VGtPeW1MSW5ua2xSMGt5V2hhSmRyd3ZLTDBjcGNRQldWZ0Z5TldFd3FCTEZk?=
	=?utf-8?B?SmZNSzhtNnNWUzd2VzVabEtDbW5ZVGt3MFIzNUdmVTZ6WUJ2U0p1TVRYeVA5?=
	=?utf-8?B?UUtTdGEwY01QVVlrdjB6L2p6cExBWklwVE5nZktWc2hHWXMwS2ZPaDdCVDRW?=
	=?utf-8?B?WmQ1RWE3dXkraVQ0WHFTR1VUeVJBRHF0WDRqSnRBR0J6Nm5pMjlVSnB2NHNo?=
	=?utf-8?B?SHY5dTlMVStoQVlyOWJicXcvcVYzMlhpdXV6bDlWNU9wV0JnZjNCRnZCVXQ4?=
	=?utf-8?B?SitYSUp2WTNzenFXczJpdjN0TERQNWsvNnZGVnhVT284NU5XRkdGMnJseDN6?=
	=?utf-8?B?Z0JYc2hJUFIydzRCTkRXMC9ySjQrQ0c2ZVBpOUpia2dlY3NwdWZ4UFVkdlBa?=
	=?utf-8?B?TU1sVU5WdVZhQlA3RFFBeVpCQnlJRFloOFZlYnU4c1BUTmU3Z2VEUVE0Vm9t?=
	=?utf-8?B?UlFabm1Zblo0WXZpRWdKeTlTMm5uVWxpVXR6SU9TUHMzSlpZWmpCcFRxZnky?=
	=?utf-8?B?WmxrNytGZkpVRGxoSlBPUDZxOW05eFMyOWpjK2dCZzNSU3F1aVRxUlZrMldj?=
	=?utf-8?B?UzVBcnZtZlVlanA4MUVNQ3NKeXg4ayt0QVNNQVNzcThOV0R2YnhWN2VmU1h3?=
	=?utf-8?B?VmpmUnZVTER1SUFUalEzeE9UVWxQenkrWHV3SUllbDQyeTF4dWdBdG10UUxy?=
	=?utf-8?B?Y3pGdnhZYjZDQlZxRGcwSHVJV1ZRMGdaMTdmdGYzZjBmZTdseGNvdm9iTHFJ?=
	=?utf-8?Q?/3dO45rk11UUWexwFxF?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR04MB008;
	5:uLdAXD4Qd54Bn2gGk5CJH0dXMkkN5KQQutase3oWAkRsusR/xkQ6URoAJVbXOEXimVkCqWm521K4ScCS9eNgqWOBn0VkIPhKZP6MtOaPjuoEaOCC9Hvj1dZn1eSRTJeK6z8xLElcHlRrK38qv8fBRA==;
	24:zGGCRX2RnVQkmuaQHywNhpQsaEJEBLxs2NFsBgpfdA7MQir89eCOpIHl6b6lD2dcxdFy09xc6NeT2bPUVPZdoyS8sRAbRkLkw0GLp9PLAAI=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2016 20:39:49.5787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR04MB008
Cc: Gratian Crisan <gratian.crisan@ni.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kernel: Add support for multiple kernel packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Feb 2016 20:39:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Diego,

On 02/02/2016 10:12 AM, Diego Sueiro wrote:
> Haris,
>
>
> On 19 January 2016 at 22:40, Haris Okanovic <harisokn@gmail.com
> <mailto:harisokn@gmail.com>> wrote:
>
>     Any concerns pulling this into master as-is?
>
>     We briefly discussed the possibility of building out-of-tree modules
>     against multiple kernels back in December, right before this thread
>     died. This change certainly doesn't preclude that improvement if someone
>     would like to implement it, nor does it change current behavior.
>     More importantly, it provides a useful function as-is in our opinion --
>     E.g. to provide a debug kernel in a feed for testing/development
>     activities.
>
>     Thread:
>     http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/72908
>
>
>
> Could you please give examples how kernel recipes look like?
>

Here's a simple recipe to make a debug version linux-yocto. It includes 
the real recipe then overrides KERNEL_PACKAGE_NAME and PROVIDES so that 
two sets of kernel* packages can co-exist in the feed. The other file is 
a kernel config snippet which enables some extra debug options.

[linux-yocto-debug_3.19.bb]
include linux-yocto_3.19.bb
KERNEL_PACKAGE_NAME = "kernel-debug"
PROVIDES = ""
SRC_URI += "file://debug.cfg"

[files/debug.cfg]
CONFIG_DEBUG_INFO=y
CONFIG_FRAME_POINTER=y
CONFIG_LOCKUP_DETECTOR=y
CONFIG_DEBUG_PREEMPT=y
CONFIG_KGDB=y
CONFIG_KGDB_KDB=y
CONFIG_EARLY_PRINTK=y

> I'm particularly interested in this feature.
>
>
> Regards,
>
> --
> *dS
> Diego Sueiro
>
> Administrador do Embarcados
> www.embarcados.com.br
> <http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>
>
> /*long live rock 'n roll*/

