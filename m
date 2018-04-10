Return-Path: <Martin.Hundeboll@prevas.se>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0135.outbound.protection.outlook.com [104.47.2.135])
	by mail.openembedded.org (Postfix) with ESMTP id 4CA8060402
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 10:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=prevasonline.onmicrosoft.com; s=selector1-prevas-se;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=l2Ga9uDHsBFqh0bb8kV/B+nWbKIfxEEaSejYxovIhdM=;
	b=MFYmDVqae6hIOLzSzp2N1L8EyQ4sbdrZGLTzDcnVGe461swaBLVOQhp9GdwRwhQ224y4uDmxMYxI2lya128ipPjfAlwVN1MYZxb3Me6eZdvzuV9ZMGtJiyi11nQ5+ZFmSz2k/pc37njb9zq831b1DgQH9CtrhOHCWI8js4YG0iA=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Hundeboll@prevas.se; 
Received: from [172.16.11.2] (81.216.59.226) by
	VI1PR10MB0127.EURPRD10.PROD.OUTLOOK.COM (2a01:111:e400:c54a::25) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.653.12;
	Tue, 10 Apr 2018 09:49:10 +0000
To: Khem Raj <raj.khem@gmail.com>, Marek Vasut <marex@denx.de>
References: <20180408230223.17260-1-marex@denx.de>
	<CAMKF1squXKSNhvmHj_p0Q-5cK3H-yKH1upwKXjvDCoindshUWA@mail.gmail.com>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <mnhu@prevas.dk>
Message-ID: <bf9e9593-a395-8d53-faf8-ad6609aa5ba1@prevas.dk>
Date: Tue, 10 Apr 2018 11:49:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1squXKSNhvmHj_p0Q-5cK3H-yKH1upwKXjvDCoindshUWA@mail.gmail.com>
X-Originating-IP: [81.216.59.226]
X-ClientProxiedBy: CWLP265CA0237.GBRP265.PROD.OUTLOOK.COM
	(2603:10a6:401:4f::33) To VI1PR10MB0127.EURPRD10.PROD.OUTLOOK.COM
	(2a01:111:e400:c54a::25)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(49563074)(7193020);
	SRVR:VI1PR10MB0127; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR10MB0127;
	3:0R0dzovZnHvknA3xlLJHoovUOOArVB9/dR/34JAnnotRw/AUC/n7Z8Jk3S0PTsV3s8rXynpC6tO95okjMUeqeETLd4Yr/9MOtMPIrga/CWmUFSxlDP3AeiLa66x6hWbw9HFI8mzP5jxBAPGeY3EHrDB4Almcykv0a62dantVSPUXYp76XuF36/LbHTqf6Hq41zVi4NQeBARzWVYEmn2Ev8pH8Lneeg4Jq/vFWletL5QJMjbtTxID9HLkh9N6T5ep;
	25:SJQRM8lID7p0zdsI782zYNb5lQ98YZ6RDc9U8wI6xJ20+LkyPjRT4ZZblW/fvEsJw9mLllcqnbxdOvW4+9d+SoI3yDcOYMUrErrREWLfuy//hEwCeAWQ8ciYVajknzrz6kE+JqrG9ca0rdX4EB9yGH5rkUqbPTWcsIOXw60aUx62Dp6Ux7pSljF5WXWpdVlABh9mYG/Zm7FXRWywir2q8Qzl3XM+0kXJOdcw+VJGT3+ElsI2DL/taAUMAR/bsJBd7TfCQo6a+SLHBDE0ND+ExI8hoBL9Ti7k36i0rn3ba6+B9j81gggOLL8mCcGvvHHg+uduIVZJezxt0iHQZ7218g==;
	31:dDViXq5plwxQZgw9MP0P8iSbqERWMsgnJVL/rDeCmSPwOmYfFdydMpWUcbDBC4H7BHVFxtXX4391DiP4aban37X5DL+JaBlJ7wCAjO6YeOnSrDz1mieoXSG7CAWBOSzXOsQTa0UAugUsCHSlcU5xzuC2t9lIWp34Fn1ao3TJdtDzGeeuVqHPbU4imRia1dL7oHABvn3R/9FKgQcVzqnXBn+JwzfAENh49HJQb6Vx2Vc=
X-MS-TrafficTypeDiagnostic: VI1PR10MB0127:
X-Microsoft-Antispam-PRVS: <VI1PR10MB01274AADF4220F01809757489DBE0@VI1PR10MB0127.EURPRD10.PROD.OUTLOOK.COM>
X-Exchange-Antispam-Report-Test: UriScan:(264703809997249)(166494164430575)(228905959029699); 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(102415395)(6040522)(2401047)(5005006)(8121501046)(3002001)(3231221)(944501327)(52105095)(10201501046)(93006095)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123564045)(20161123558120)(6072148)(201708071742011);
	SRVR:VI1PR10MB0127; BCL:0; PCL:0; RULEID:; SRVR:VI1PR10MB0127; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR10MB0127;
	4:ZOt3R8SNuU1T+ZrODS3TzhnfJMg2lqIiArYpr6XBcbqDhnF25oQTmmDNaBB4SkGsJtH09bH6lgU1dMVFkRPwihdZr9VHqGn2bQxTqsr723Ou8jm9x4eKnVnymHvF2WXfOprRH6ze26pPLT5p2NbLxIaIon0H5QIKFjL0H1Dy+eGVHU5IfVZzswyVdYH/0w7DeykUNtspMv2ByOWkrevDlXYYB8kUwr4dHDfPegocrTXUcwzCqXpeI/ngfx9y3LL+0ZHisgveL7d1Vt0NnsM499/koh0GmmbeU6NdhZskO/TKs/YT+4+5QYcJI9nrvjOo4fI85QmSNiom21JZujvwWLDkSLiZxkrlcAQ8M8E0t7WeLCgQD5xDRxIJ0ipDkbpS
X-Forefront-PRVS: 0638FD5066
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6049001)(396003)(346002)(39850400004)(39380400002)(366004)(376002)(199004)(189003)(377424004)(6246003)(36756003)(39060400002)(26005)(66066001)(65806001)(68736007)(77096007)(305945005)(6306002)(7736002)(84326002)(5890100001)(446003)(110136005)(53936002)(97736004)(229853002)(106356001)(81156014)(105586002)(966005)(81166006)(8676002)(72206003)(8976002)(575784001)(186003)(65956001)(8936002)(42882007)(52116002)(31686004)(33964004)(76176011)(53546011)(386003)(59450400001)(316002)(16526019)(64126003)(31696002)(16576012)(1720100001)(478600001)(4326008)(486006)(476003)(2616005)(2906002)(74482002)(956004)(568964002)(25786009)(58126008)(16586007)(2476003)(6116002)(11346002)(37036004)(6666003)(3846002)(4610100001)(6486002)(65826007)(5660300001)(19627235001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB0127; H:[172.16.11.2];
	FPR:; SPF:None; LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR10MB0127;
	23:kqOJoax1KaAFQCSe3AP9CIiJ7lZSCU5V99RG5l5gw?=
	=?us-ascii?Q?+l/Y1gzYfA1JPOlRa1Dl+RgY3unPlCIsaug5dSMXB+0BMUX7a0zWLUFXQX4I?=
	=?us-ascii?Q?ky3vD3ju/32ChHLnNj41qevaHWRigw3m1zvuwqyE4vv45Ewn51+QveCyyIl3?=
	=?us-ascii?Q?c9ULclu92AM+M9eOcPFKe20zSDDyMT41VMhfB+9sznYPJ+F8P4UQEJc6b+YR?=
	=?us-ascii?Q?MILrwXdVf40PkxEnzGcRxnlYBcl6sMquDJO9ajoFqQArten3i0zBMhx1WbnB?=
	=?us-ascii?Q?vexld278dhoRW+rlQ69e3QuxjXERfgDqzpIy9ARwspXn6eAKbqCzzvZ8d2fD?=
	=?us-ascii?Q?ERbdFz1F2bykyu8QBmNeKDxvE/mImywfjCez3wfi+g3vf9pR/iwzUVGaLYRM?=
	=?us-ascii?Q?bYOs+2W9H5/ZGSerrTKZA43fkfN5+DBPUhymaVEqGA/mrW/DdmARCQ+ZxlIj?=
	=?us-ascii?Q?RNfWOXmPWq90yAX9aNY5zJDjuWvGl3Pb7m/oy3uk0rkfOJci8baA6I5YIyxV?=
	=?us-ascii?Q?0h/zsOYpITgJTDmE1piuV8o/hYkZkFoFxnTy5GyUQEYYKGmY+rkQ9dDQp0IC?=
	=?us-ascii?Q?R5HH/E59vOAtxN9yOnBWDAztSQTzb6T3IzDhFFri88piJmA5gFO9H4BmqkFC?=
	=?us-ascii?Q?0/XH8OiQHceR1uWHfY2zer0bQEXBNa2OYWRCaf6lPpRrL91mR0lP8KN8e6jz?=
	=?us-ascii?Q?/ihowYZ5f3Az5kYcx+oOakUxuFhQ83GWxLzCYCe5yhIgVPNP6e3BhNY56Ute?=
	=?us-ascii?Q?6v9Q8zeylGs7N/TBZk9Vpdda4KrkGVJKgHZnWSzO//wwFly62FavDhRFa9El?=
	=?us-ascii?Q?bZj/h/yu0UNnx2bYsdWGaXjMCp7yl0yawKT6ZoZ8uK1LWfk9eTibYzgL3PIo?=
	=?us-ascii?Q?tfYdQ9Hsz6myyis1R6h+y+BCe80B/Jhk2zhcsFrbUoUs0NhV8HxtOLOInh5B?=
	=?us-ascii?Q?srKHqV3JsEn4wgOY6Tmz1oTiSRJxTfMBmokPNsOrHkUOgLIHBbvu+i5P/cBF?=
	=?us-ascii?Q?ud+bSTUJb7iRhOWLI/+SqZTMC4gUp0ciGJX5bLKFy07/9zYKZdqHkl2jDqLV?=
	=?us-ascii?Q?3+UaChVFmDUothhLLqCvSFnvs1LR1RQMtAdsrIzRCIowu0f/m4Bu5Oe4N+c+?=
	=?us-ascii?Q?k2q9WKK76riQ1+Zy/y1Q24X2ZVClCZjS6Gec95QwyuFrMI3t6Wu0XIeBPJRK?=
	=?us-ascii?Q?/nw328yEopreXz6t6RgTOxFwEDt0q5GxdfKzcC0khfRy49kerKzlLQ3h2h3g?=
	=?us-ascii?Q?pEpnfPVYsj1m57gfSKXdJu4+UGJbewgAxHlaGEA1tMIDIWJwHHUkiQq6LIMr?=
	=?us-ascii?Q?/Hn3ZPORnAfTZYSbGOPHAYhLWHc49Biwd4Y3J9coUtPpOVRvuI4BdOrZvGXN?=
	=?us-ascii?Q?DE6UUamy5a4DiLgo74e/xJcJKa9QIBz128eaa185MCTG3yBGgzrYmtny94A2?=
	=?us-ascii?Q?d8brfgAIbPshYd2NlKIK2nr1+twJCy/Ym/bnnuDVwYpZUfMS1oTTzBlQ7Ipi?=
	=?us-ascii?Q?fUWXiyIX2Jmpw9Y07ju9Wy2v2qFyNzohJcXApa9FurJmbmQnRImYckxkU0mN?=
	=?us-ascii?Q?HORBoEA/O09iENMaJzvuaQyA20pG+a1KaNQsDZKbEhJdzqyV9WrAHFSTD8G7?=
	=?us-ascii?Q?McTBI0eP4W/F4H+CGGpl1mAK+11GxI/8N2Z98Tv07F1qIyWdRtc5WQ0Y9Onx?=
	=?us-ascii?Q?qC5aJmH0t6cIiMF3V1gz4T7EYzdf0nFT99Wi7dUZVrJDsBrcAOGkIDDKCb4F?=
	=?us-ascii?Q?4o3gaRk?=
X-Microsoft-Antispam-Message-Info: NpPGqduwnFcHZdiuDJTsi4GcL4CW4/aSsSyHE8vrV3QxcM5C1F+UNmAgJXorFV/IlnhGJPHclX0Cc2/bOtbjQAayEfe2cZH9zvOFwtbuMavf7sQlUb9XR5W2i6u8lU/cvculLoEtzHpmtxsAUVDMzAyj+MbrSWp8/LBIkebEbzZWGWPePwi4sqmyxaDuUeb2
X-Microsoft-Exchange-Diagnostics: 1; VI1PR10MB0127;
	6:HOtRZDdasvQxl5CJk6ETF8mGSXT+++T1Nc9ieJj7NSP9v1zT9o0SjE4GdXgjB+5WNbSGJBuVS5HZZwzGntCgDKBdHRWaBv7/ovQady2VGXe9m1vWFLECBrTjxgovyPXut3ea5O0mwK3FxAdGXj4U4jHmnhU2K6rTzOkBJGMz+EBfHh1OMM86GizTbIwklOlL4NRbgpp0uoONhDNYt0uMfgHzwo03j4THFMKY5LABHaWNHBWsNQt6v4dFC/kYAR2rPTFXOY81MWYBTZimNmomQyFp61j1TTGAN3TKVEop29CAnED2KKVs5VAWhhmykScvM6V8gGFnN0rJLxQFv2TLYbKroxGpaITkrp6tEr6oluaxreTGxByie+9bSR8Z2xPYpdDfPAfOrWxdvZWDY3Xu3FDupO2S7/KQ4sD1nxZDoz0WUYGfYH0UIeEUTgh9oBDVutCie/PcJoibLDywh1P9HQ==;
	5:9UkrhpT5YtBcUA1XKLIhZgFvcYQjohhL7d+jf9ZEEDjQgI65KVz+vf7NO9WFL0U0aZpnOKFFmlrYomLDh1Hnodk7788QiNSfb2XtboAG+C2wQlTUv7uOfHkB47UnDmaSJ2r1aXoPmZbTCQ0i/oXh+TeDDUXWpevaavd/PoS6WgU=;
	24:b7V2gyzSHiuSHZYsMrc0FXSlozMQx8z6c19qKvHfluQ5AXQUsTvEQoBYq7m8l/VfUunj7gKjm4hxFBQ/1P8ZdDWWS8TY4zB2TCKnKpuFJn0=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR10MB0127;
	7:aAVy/gdpMx+1fYYtl8b/4qI++/Ber7p+xMW+G0VROU2XvpWBSkKBPib4cc7dXsNeOPWnBraty9dL3Pkc3ftSxip6HmxpQdcynuHWOM80IWeh6C58VZYt5s/2phWMeH4HkAzs2AhzA/jlnJEHQx3xqQNbdfCiekuG4NZBX7wlB4ql96NMXtRGY5yWLZg33jC0hj55gF81r4kl9gaOOPRH3cCDBNo5u6IfFmGggRvz4qeAUQbiJiY6w6946F6CZq4W
X-MS-Office365-Filtering-Correlation-Id: 1b2a7319-9f55-4225-479e-08d59ec84f8e
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2018 09:49:10.3477 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b2a7319-9f55-4225-479e-08d59ec84f8e
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB0127
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot: Upgrade to 2018.03 release
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
X-List-Received-Date: Tue, 10 Apr 2018 10:05:10 -0000
X-Groupsio-MsgNum: 110416
Content-Type: multipart/mixed; boundary="------------901DCD67A260514772DBD5F5"
Content-Language: en-US

--------------901DCD67A260514772DBD5F5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

I had to patch up our own u-boot recipe as shown in the attached patch 
to make v2018.03 compile for qemu-x86.

The thing is that the build of pylibfdt became unconditional since 
15b97f5c5e ('pylibfdt: move pylibfdt to scripts/dtc/pylibfdt and 
refactor makefile')

In my case u-boot/pylibfdt failed to find the correct (native) headers, 
because python setuptools / distutils looks into STAGING_{LIB,INC}DIR 
when compiling the native extension for libfdt. I didn't find any other 
way to specificy this in either the u-boot Makefile or some other magic 
environment variable.

// Martin

On 2018-04-09 02:54, Khem Raj wrote:
> 
> On Sun, Apr 8, 2018 at 4:10 PM Marek Vasut <marex@denx.de 
> <mailto:marex@denx.de>> wrote:
> 
>     This upgrades the U-Boot from 2018.01 to 2018.03 release and drops
>     patches accepted upstream, getting the patch count to zero.
> 
> 
> 
> It fails for me if I have libfdt installed on build host
> It seems build is doing the include dance which goes all the way into 
> hosts system include directories
> 
> 
> 
>     Signed-off-by: Marek Vasut <marex@denx.de <mailto:marex@denx.de>>
>     Cc: Otavio Salvador <otavio@ossystems.com.br
>     <mailto:otavio@ossystems.com.br>>
>     Cc: Ross Burton <ross.burton@intel.com <mailto:ross.burton@intel.com>>
>     Cc: Richard Purdie <richard.purdie@linuxfoundation.org
>     <mailto:richard.purdie@linuxfoundation.org>>
>     ---
>       .../u-boot/files/MPC8315ERDB-enable-DHCP.patch        | 19
>     -------------------
>       ...t-common_2018.01.inc => u-boot-common_2018.03.inc} |  6 ++----
>       ...fw-utils_2018.01.bb <http://fw-utils_2018.01.bb> =>
>     u-boot-fw-utils_2018.03.bb <http://u-boot-fw-utils_2018.03.bb>} |  0
>       ...t-mkimage_2018.01.bb <http://t-mkimage_2018.01.bb> =>
>     u-boot-mkimage_2018.03.bb <http://u-boot-mkimage_2018.03.bb>} |  0
>       .../u-boot/{u-boot_2018.01.bb <http://u-boot_2018.01.bb> =>
>     u-boot_2018.03.bb <http://u-boot_2018.03.bb>}   |  0
>       5 files changed, 2 insertions(+), 23 deletions(-)
>       delete mode 100644
>     meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch
>       rename meta/recipes-bsp/u-boot/{u-boot-common_2018.01.inc =>
>     u-boot-common_2018.03.inc} (68%)
>       rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2018.01.bb
>     <http://u-boot-fw-utils_2018.01.bb> => u-boot-fw-utils_2018.03.bb
>     <http://u-boot-fw-utils_2018.03.bb>} (100%)
>       rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2018.01.bb
>     <http://u-boot-mkimage_2018.01.bb> => u-boot-mkimage_2018.03.bb
>     <http://u-boot-mkimage_2018.03.bb>} (100%)
>       rename meta/recipes-bsp/u-boot/{u-boot_2018.01.bb
>     <http://u-boot_2018.01.bb> => u-boot_2018.03.bb
>     <http://u-boot_2018.03.bb>} (100%)
> 
>     diff --git
>     a/meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch
>     b/meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch
>     deleted file mode 100644
>     index ecaa1796a4..0000000000
>     --- a/meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch
>     +++ /dev/null
>     @@ -1,19 +0,0 @@
>     -Enabled dhcp client functionality for Yocto reference
>     -hardware MPC8315E-RDB.
>     -
>     -Upstream-Status: Pending
>     -
>     -Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com
>     <mailto:ed.bartosh@linux.intel.com>>
>     -
>     -Index: git/configs/MPC8315ERDB_defconfig
>     -===================================================================
>     ---- git.orig/configs/MPC8315ERDB_defconfig
>     -+++ git/configs/MPC8315ERDB_defconfig
>     -@@ -12,6 +12,7 @@ CONFIG_CMD_PCI=y
>     - CONFIG_CMD_SATA=y
>     - CONFIG_CMD_USB=y
>     - # CONFIG_CMD_SETEXPR is not set
>     -+CONFIG_CMD_DHCP=y
>     - CONFIG_CMD_MII=y
>     - CONFIG_CMD_PING=y
>     - CONFIG_CMD_DATE=y
>     diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2018.01.inc
>     b/meta/recipes-bsp/u-boot/u-boot-common_2018.03.inc
>     similarity index 68%
>     rename from meta/recipes-bsp/u-boot/u-boot-common_2018.01.inc
>     rename to meta/recipes-bsp/u-boot/u-boot-common_2018.03.inc
>     index d2073ea0c7..8ffae365a9 100644
>     --- a/meta/recipes-bsp/u-boot/u-boot-common_2018.01.inc
>     +++ b/meta/recipes-bsp/u-boot/u-boot-common_2018.03.inc
>     @@ -7,10 +7,8 @@ PE = "1"
> 
>       # We use the revision in order to avoid having to fetch it from the
>       # repo during parse
>     -SRCREV = "f3dd87e0b98999a78e500e8c6d2b063ebadf535a"
>     +SRCREV = "f95ab1fb6e37f0601f397091bb011edf7a98b890"
> 
>     -SRC_URI = "git://git.denx.de/u-boot.git
>     <http://git.denx.de/u-boot.git> \
>     -    file://MPC8315ERDB-enable-DHCP.patch \
>     -"
>     +SRC_URI = "git://git.denx.de/u-boot.git
>     <http://git.denx.de/u-boot.git>"
> 
>       S = "${WORKDIR}/git"
>     diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.01.bb
>     <http://u-boot-fw-utils_2018.01.bb>
>     b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.03.bb
>     <http://u-boot-fw-utils_2018.03.bb>
>     similarity index 100%
>     rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.01.bb
>     <http://u-boot-fw-utils_2018.01.bb>
>     rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.03.bb
>     <http://u-boot-fw-utils_2018.03.bb>
>     diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb
>     <http://u-boot-mkimage_2018.01.bb>
>     b/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.03.bb
>     <http://u-boot-mkimage_2018.03.bb>
>     similarity index 100%
>     rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb
>     <http://u-boot-mkimage_2018.01.bb>
>     rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2018.03.bb
>     <http://u-boot-mkimage_2018.03.bb>
>     diff --git a/meta/recipes-bsp/u-boot/u-boot_2018.01.bb
>     <http://u-boot_2018.01.bb>
>     b/meta/recipes-bsp/u-boot/u-boot_2018.03.bb <http://u-boot_2018.03.bb>
>     similarity index 100%
>     rename from meta/recipes-bsp/u-boot/u-boot_2018.01.bb
>     <http://u-boot_2018.01.bb>
>     rename to meta/recipes-bsp/u-boot/u-boot_2018.03.bb
>     <http://u-boot_2018.03.bb>
>     --
>     2.16.2
> 
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 
> 

--------------901DCD67A260514772DBD5F5
Content-Type: text/x-patch;
 name="0001-u-boot-pil-fix-cross-compile-for-qemux86.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename="0001-u-boot-pil-fix-cross-compile-for-qemux86.patch"

From f037effcf106808fdb42ab84e1424e0d616104a0 Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <mnhu@prevas.dk>
Date: Tue, 3 Apr 2018 15:36:50 +0200
Subject: [PATCH] u-boot-pil: fix cross compile for qemux86
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Hundebøll <mnhu@prevas.dk>
---
 recipes-bsp/u-boot/u-boot-pil_git.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-bsp/u-boot/u-boot-pil_git.bb b/recipes-bsp/u-boot/u-boot-pil_git.bb
index e57ed8c..b5a3f09 100644
--- a/recipes-bsp/u-boot/u-boot-pil_git.bb
+++ b/recipes-bsp/u-boot/u-boot-pil_git.bb
@@ -1,5 +1,6 @@
 DESCRIPTION = "PIL U-Boot"
 
+inherit pythonnative
 require recipes-bsp/u-boot/u-boot.inc
 
 DEPENDS += "bc-native dtc-native swig-native"
@@ -13,4 +14,9 @@ LIC_FILES_CHKSUM = "file://Licenses/gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a
 SRC_URI = "git://${TOPDIR}/src/u-boot;protocol=file;nobranch=1"
 SRCREV ?= "9fa7d5863214935fe0f2aca5a4c5edfe25deb848"
 
+do_compile_prepend() {
+    export STAGING_LIBDIR="${STAGING_LIBDIR_NATIVE}"
+    export STAGING_INCDIR="${STAGING_INCDIR_NATIVE}"
+}
+
 S = "${WORKDIR}/git"
-- 
2.17.0


--------------901DCD67A260514772DBD5F5--
