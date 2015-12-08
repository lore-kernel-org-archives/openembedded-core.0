Return-Path: <bhuvanchandra.dv@toradex.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0122.outbound.protection.outlook.com [157.56.112.122])
	by mail.openembedded.org (Postfix) with ESMTP id EAB43605BB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 07:03:38 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=bhuvanchandra.dv@toradex.com; 
Received: from [10.18.0.138] (115.115.225.206) by
	DB3PR05MB267.eurprd05.prod.outlook.com (10.141.4.26) with Microsoft
	SMTP Server (TLS) id 15.1.337.19; Tue, 8 Dec 2015 07:03:36 +0000
Reply-To: <bhuvanchandra.dv@toradex.com>
References: <1448527919-13545-1-git-send-email-bhuvanchandra.dv@toradex.com>
To: <openembedded-core@lists.openembedded.org>
From: Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>
Organization: Toradex
Message-ID: <566680B2.2090205@toradex.com>
Date: Tue, 8 Dec 2015 12:33:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1448527919-13545-1-git-send-email-bhuvanchandra.dv@toradex.com>
X-Originating-IP: [115.115.225.206]
X-ClientProxiedBy: SG2PR03CA0012.apcprd03.prod.outlook.com (25.160.233.22) To
	DB3PR05MB267.eurprd05.prod.outlook.com (10.141.4.26)
X-Microsoft-Exchange-Diagnostics: 1; DB3PR05MB267;
	2:F8wX8Zv4gHtyynL+pGsL3PphPLh9tGu0eYEsYCgExT5Uk0Z3jQqAhg3dMatzTMvI9MdFbHNddgLU3t2DIZQCSLbqn/zqQ9PF3lyx3G6F+7AMOJjpFrY2sFuBSRgWr6m6U9My9F/sFgDnSq+S+ruHcA==;
	3:PtxztoL/LVganyRuq9wf0N+U/xsVMsmGV09swYzAdZCmua/Jnv7aWlnvN1fokcfV/xzfe/4jIK558H3NuDCeaFtSw0l4i+iEqLVtjkpdjv2pKcllEx+OZBW8+sSSJZWi;
	25:N8BPltowQdhcSv+87Birf/P9IiI7hnmeYgaZU3QiCUCluvvZulLgG3CjJH0o3eZBSI+wINI7DV6aqXyDkdZ5W/jmAHcGDgn7uxtYeijYr6D0/lPmCyn3QMeC4gd3lpeEIoKpFOPbf+Iq35sG5AM2YyZiGhKZHxOgAKEPVChhhay5m8ofShMYfwX1ussJHcFnPVgMqeMVLjm5GacDYThvehgzx+494DgONT62WG68NeOGhwCjGWIakUzIGhOitkOySXHNJfj+D07XDdaeeopS4Q==;
	20:nhQKNoeJUFZNWE8Vn73A519rmK4gPFrR/8qlbRns8/DiRovKBtoWHzK7Ia7LHIBLCaZaHbhrsgpcsP42TtPPNKGlWczq8Cn1UrjXNbe76RrtF4vtslTr2uXj0/Nqcs8CitbiDIVUM74K8yYqPerwGdkHk2CE7Z/u/gTKANVsXdsfNqz43WDD4vLNGqyTbAwDNPgSXfl4RGl0sKvSdWC9s16lZfBMZLjmIbxIQJvSjgd+0ARvAYStv16ObSVBPuCfqOcDpal9e5WQRlExQ3LNQJVKPCgsm/DEBY37xDK1UhXj3NDaUhGEL4hu/9BayE8uQoGXsj3o8GYfQn0AUavxVw==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB3PR05MB267;
X-Microsoft-Antispam-PRVS: <DB3PR05MB2676DB70804D5458A20C1108D080@DB3PR05MB267.eurprd05.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(90676262408878);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(520078)(5005006)(3002001)(10201501046);
	SRVR:DB3PR05MB267; BCL:0; PCL:0; RULEID:; SRVR:DB3PR05MB267; 
X-Microsoft-Exchange-Diagnostics: 1; DB3PR05MB267;
	4:gfROXwv9B3sDfbVORrHjm2hmrxE6x07fL0HlD1yeRaus6wMV/yXCBaTT3yGL9lPebNISGM9Lc9yt02v5oBprTX8JzaQQ8H+h9kFeeYQD75zgPbp+HwkD5bVaX7a3vuzBdsZV8pUmZ3My4I/Hgg8DPqKtoy2rUxq9REMbBZynU44cWf5mzOT51WHlJo+9p+wAH0OoFT1gUQeiN7XlZwluRsBIFOqp2M0V4wiWehEj7OAdPjhhSGU/VXK+7zWRfLauyQF8ToQ9IXc5HUCdjSKUZrShO3Dplm31FvHTCCOJxl0jea4nBWaV5pSdXXaZZ/ISDS4TR+adYW/C+J00s9F40ixFkTHC04bdz/vGkA4xdyolZMcQDFvg41EQ+4cqG/RCDHLFiMR5ncZ3Q/h/x/qOMMRDK95MwkQ1+LmQru26uEFbZy3XzHnndOrnTwSr5fST
X-Forefront-PRVS: 0784C803FD
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(6049001)(199003)(24454002)(479174004)(189002)(377454003)(43066003)(65806001)(5008740100001)(4001350100001)(5001960100002)(64126003)(101416001)(33656002)(87976001)(59896002)(81156007)(189998001)(97736004)(105586002)(53806999)(106356001)(66066001)(2351001)(110136002)(47776003)(2950100001)(77096005)(65956001)(36756003)(23746002)(122386002)(42186005)(80316001)(83506001)(65816999)(19580405001)(5004730100002)(87266999)(50986999)(86362001)(76176999)(6116002)(1096002)(54356999)(40100003)(3846002)(99136001)(230700001)(19580395003)(586003)(50466002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB3PR05MB267; H:[10.18.0.138];
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: toradex.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; DB3PR05MB267;
	23:4ktUZjTHkeB9elmaTtZRzykc9TXUqrCdUleEJ+?=
	=?Windows-1252?Q?mtjnQbvJYtXCjb0GUCBSaCLgOt3JYOMzhpxdA1lGklGfR2WxpIfBU1Ap?=
	=?Windows-1252?Q?hbt8w5F3CQo4/xaeL/NRCbGGEkgUZ5+OVnuJGj2GVg3BPKNQ7D1PX1Kg?=
	=?Windows-1252?Q?umH5j75CJ7wFsWNEhesfE52hhocSMtv5svAAubUJGfqFCrddOYSot0sx?=
	=?Windows-1252?Q?8zxzsk5eb1lPMWln8/7W6QK47mFtt0VaxcmHbZyx0GxBS2qIM/9KlOaG?=
	=?Windows-1252?Q?mINtb9pENuwUUjENVOM2Yh2EeJkkCC+CcBcWnO4MRqjOFxSZ5+Yjf5Do?=
	=?Windows-1252?Q?d9TnWpqbYzn5KYvmhSlUPd5Vs2b3PrvGLgp02bu+NhPSHcMiY0jMwcmc?=
	=?Windows-1252?Q?CcsZ4a8eq2wooQy1/5SqAcLxPGS3IXIT+rqBqC/Tkjr5+gWX/fq4X/Av?=
	=?Windows-1252?Q?42PFIZwTSUxHvu8uRK1ylXgWvfRdxLsw9JnvnuR0T9C8qbG/JmdaTYy+?=
	=?Windows-1252?Q?sj7grCjaawVBhfsNGxl1chmtbImOLr1JN5YY2E/LzR10LRlJkPcFXUYx?=
	=?Windows-1252?Q?LjqP0gLIYhOfblX4Q9h+VRitJiW4kqqhublsHsjfPAdzmKBzVT25/1qi?=
	=?Windows-1252?Q?fnjlb3NTqlzbYakxPlQ0mD9Tnwnv6Ag+Pv1GxFbRu/updOzwE56DM8bW?=
	=?Windows-1252?Q?zzprloz+sBEc8GuSF8H2DPMTNKjIUNjoBMy7DyC9Cy7eAa7RXCkcWNtt?=
	=?Windows-1252?Q?WrrQM4BgiCLLM22uwm4DgKdf65fWIzwUA2x4rfRF52IroOBfTMMrrNwa?=
	=?Windows-1252?Q?qgmrPtw5OyuuP9MGwgISr1Gn2n5SahXV2YYdQkvzo+J8BNDb+jLPydj0?=
	=?Windows-1252?Q?p4tOL3Ni26nr5CqhwoYNcZQ+ViX5hV/rZaMqCJHn7pxPeZp88KWZIA+2?=
	=?Windows-1252?Q?prvv+dOkpQBq220U5Im/PqHKwuvuWO9PiwYBVxqit4SioazZPgDVlEJq?=
	=?Windows-1252?Q?g3SZ3bbLUIxElP8E7p8W6yEslCrp+JgM9dnFgYL/ph98I9GSRmNtBTjf?=
	=?Windows-1252?Q?6ogr43SORDXHt1UP915fDaklS4ZWonhg1sLTZ9sXcQied1YfkIPbf8MY?=
	=?Windows-1252?Q?VlK5Z5CvNxPSgDZu49DLMyDH004jSHYrS7J/MzhCJjX7f2ThqCeknDrV?=
	=?Windows-1252?Q?GWP2CQG7paCRfWci7JuaeY6QEbhms7no+e1z5AQKNpXrqFLxbboDD8Dt?=
	=?Windows-1252?Q?R/5R5Jnu8FYw4o2PRm4+ULhI0DSWwjkFf7W8LTIMb94Va5aoSr6cmd3q?=
	=?Windows-1252?Q?MreaZfIcIu++NdRCOHkdTuaKBk4RbqZzpSwS5Q7AjfHzJu8zCIpak7dd?=
	=?Windows-1252?Q?nXIKfJmSFC4Uhl53yF67IkHLT0KyoZcsSu+t1iZNoe0VU5/avwfsYUIJ?=
	=?Windows-1252?Q?yc9Pyii92gBui5XMusvVRGVm3dn8vn5zLQYSpAhQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB3PR05MB267;
	5:cpnWLQNEb2F1o9QNqCmpgc7hy5YOsUI2gjjBpb31nCFGtGVKEYWDgBa5djZhOXBpHKIphL03xLKhlbalH5cKw+dDC68E5w7ubDWjlH7SkVnTReXL1A8XQh/d79hCEmGri0rKu2u8qviR68WEsUSbPg==;
	24:1sRKK4TX772JJ3SvEPW5UVXFV6trTfjqDlDltnrO/zuOIuPh1bFcH+D3TWZK0+eBdFXVxBNxU50BG5zNc1idcX9JLpAm68jmwtD16WWmNV4=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2015 07:03:36.3818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR05MB267
Subject: Re: [jethro][PATCH] linux-firmware: rtl8192cx: Add latest available firmware
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
X-List-Received-Date: Tue, 08 Dec 2015 07:03:40 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/2015 02:21 PM, Bhuvanchandra DV wrote:
> Add latest available firmware binaries for RTL8192CX chipsets.
> These new firmwares have been released in 2012, have been used
> by the mainline kernel as preferred firmware since 3.13 and
> even backported to stable branches.
>
> Signed-off-by: Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>
> ---

Ping!

>   meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> index 4939ca6..0878ab1 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> @@ -260,10 +260,10 @@ FILES_${PN}-rtl-license = " \
>     /lib/firmware/LICENCE.rtlwifi_firmware.txt \
>   "
>   FILES_${PN}-rtl8192cu = " \
> -  /lib/firmware/rtlwifi/rtl8192cufw.bin \
> +  /lib/firmware/rtlwifi/rtl8192cufw*.bin \
>   "
>   FILES_${PN}-rtl8192ce = " \
> -  /lib/firmware/rtlwifi/rtl8192cfw.bin \
> +  /lib/firmware/rtlwifi/rtl8192cfw*.bin \
>   "
>   FILES_${PN}-rtl8192su = " \
>     /lib/firmware/rtlwifi/rtl8712u.bin \
>

-- 
Best regards,
Bhuvan

