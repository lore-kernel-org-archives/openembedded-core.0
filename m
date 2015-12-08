Return-Path: <bhuvanchandra.dv@toradex.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0102.outbound.protection.outlook.com [157.55.234.102])
	by mail.openembedded.org (Postfix) with ESMTP id 8AAC56FF64
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 07:03:31 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=bhuvanchandra.dv@toradex.com; 
Received: from [10.18.0.138] (115.115.225.206) by
	AMSPR05MB264.eurprd05.prod.outlook.com (10.242.95.27) with Microsoft
	SMTP Server (TLS) id 15.1.337.19; Tue, 8 Dec 2015 07:03:29 +0000
Reply-To: <bhuvanchandra.dv@toradex.com>
References: <1448529155-14970-1-git-send-email-bhuvanchandra.dv@toradex.com>
To: <openembedded-core@lists.openembedded.org>
From: Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>
Organization: Toradex
Message-ID: <566680AA.8070206@toradex.com>
Date: Tue, 8 Dec 2015 12:33:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1448529155-14970-1-git-send-email-bhuvanchandra.dv@toradex.com>
X-Originating-IP: [115.115.225.206]
X-ClientProxiedBy: SG2PR03CA0003.apcprd03.prod.outlook.com (25.160.233.13) To
	AMSPR05MB264.eurprd05.prod.outlook.com (10.242.95.27)
X-Microsoft-Exchange-Diagnostics: 1; AMSPR05MB264;
	2:a4CO7nJwYoWA1jP1yN4KQOUaGvm0rHsTthY6uxF3wEM/dgTmOFG4jPEj+KXj1k0A4hDTudfNaVTzHuM9jNqbUeprS+VFSdkmCNBBzY4KlSrEpKmObbFDSOWiJQAyGs5tRQxmf+Ue6XmKMkdgCxoNWg==;
	3:AQZQrOILrvGnXaob7EvCfUpu81o9osLRXU7vXNQXEgCtxUYEx95WQ9FmTSZLw3oduvbFRXkDoFbCvpdcZi8EGJEXU3upA81g3qGWxVVnXOCjZ4DOnzkRStMgSb/9x6Rx;
	25:ZbPeToH9Z7f0N/5yw53UuemiQtiWeqT+p2cy0DDR39adAOSXfrvIVWePczO4T+bF6glcGHXooOMCL85ukRBqV5DMxEw3cx2O+lpUwWODhj1f90gh5EX9+tjiyC8T6mjV/3SEcZrxupK2vSAk6PgOTW1fVwFscGAIuIwpIsoIq+mJyOc+tQKsdDIuHFaZPXX6CYZ45qhuud5gjhhRBJRbsJjLoBlDwrz0VNMuYxhxeYaTPZ+/mSavTlOrqKh5hbxH4aLJXnevvnmItkdd880lQg==;
	20:7LwjAkW/3/lhPI6azaynUrgPsP1meiVdRawwOc0bmSdu4MoLK/hyFNT94dUZkJ8cy3Viv6ZB65L7szLd2+FBKVD+z4sAqQTaG5M9GKfPQ+YSfhBOCufp4J5PD30rXxwYILdeiwsrMZFPvtrneMGK1OGuuo1TcRJ2CnXbdomi0ctYzAq+kejwYDgXCkG0iCwR9OhxDrbV95CG3xi7hQivteiQUQOOvXiZV5/h4tN4LoUvRJrIyRSaHDhjmdlOwc5DK4fXxpm++r7GGdvqUba34WYG7VQ8Uq0MBAw4H/nz+YP052KVP/NwH+QpgfwT01gsyB9Wpj3IP+jHlhs4tdtvmQ==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AMSPR05MB264;
X-Microsoft-Antispam-PRVS: <AMSPR05MB264DD6A52A25199488A34D58D080@AMSPR05MB264.eurprd05.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(90676262408878);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(520078)(5005006)(3002001)(10201501046);
	SRVR:AMSPR05MB264; BCL:0; PCL:0; RULEID:; SRVR:AMSPR05MB264; 
X-Microsoft-Exchange-Diagnostics: 1; AMSPR05MB264;
	4:ZZdF2axiLndwNlHh4pLUvWm7AXaoMuVNrBXkIzKOnqakp6omsbvyv3Q4OfVJkifZwpQJc0WtxAznHpYR3D/izm4ro6qM9+H6GuTyi7k7T59kynceUQBOAGCOXw0hDsB93cYXgrHLwiAlQoBIA3ZKgCAlPKjkQ5y22eIcVRxdpu+UbvAMfoB56F1Ly7WCwMgRyhNzJD+1aRM6PaQTXcb8ruYsLjICkgmhI+c9X4tKxR6efXqOJsrOfbv535DWveNveLDrHOnAViTtLKFGhZrp9LAmtKwCuZbwRaLjmlQGFAuExA04EVNgUGYEEOpsgGJIaeTHbYnt1nrY1LR5CWVtIMyKfe/87HJWehSZkNtLRXP1rENBX+cY9T6hj3wNGF9wTHRR3LhV618EVTNwXw86w/g/bt/9xZlvt82tx/YulER29KKhFVgWWmlrPd7JKXeo
X-Forefront-PRVS: 0784C803FD
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(6049001)(377454003)(24454002)(189002)(479174004)(199003)(5001960100002)(81156007)(66066001)(97736004)(65816999)(65806001)(122386002)(47776003)(105586002)(106356001)(189998001)(43066003)(87976001)(65956001)(110136002)(40100003)(99136001)(53806999)(101416001)(33656002)(2950100001)(59896002)(83506001)(86362001)(42186005)(36756003)(23746002)(5004730100002)(2351001)(50466002)(64126003)(76176999)(3846002)(19580405001)(80316001)(5008740100001)(4001350100001)(6116002)(54356999)(230700001)(50986999)(87266999)(19580395003)(586003)(77096005)(1096002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AMSPR05MB264; H:[10.18.0.138];
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: toradex.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; AMSPR05MB264;
	23:oDxqXC55JV3jA5jkpEFXobqtj+OuOXUlhRc1kw?=
	=?Windows-1252?Q?QOK+wVVXF+C0/osSyebKdEvkpF54KTIY3lYE/R9jrVZdzHPwKMOL+vFY?=
	=?Windows-1252?Q?yydBlOdqAfCwP4HpotEr5itmTuP2QJsPtmX0Tt8NKAvftZitdoR+hvwa?=
	=?Windows-1252?Q?04zOadyfgDm98hnTqKoK0rn4CIQTmvModkWPtLgWdEJmN0Lk7lv9hJjU?=
	=?Windows-1252?Q?UkfQQ+4BrXdp90+qO4YbqnTaetmyg0indE4mO2ONyeQYPSdo0OQLgBsy?=
	=?Windows-1252?Q?c5tqPDMXyVlJZpEvBkzTO5A8daL6SJjv+6iavqqpp+UJTsMTfG21lz3L?=
	=?Windows-1252?Q?9Ae+kLfg3I10DMwG1B4YfBGtlQ3ox+zYB56o6wuwFWi54NUNTwrIxeXb?=
	=?Windows-1252?Q?RCx0OADzheyztvrYsfSpfCsF8a7BEC1t71qA/yuqM47kxZD+7ZBev1SL?=
	=?Windows-1252?Q?GwIDm9HW03AFq23WBODo5IB8K0zIuQOoCCAIwlnHWBD0XgD1u6ZIkYcH?=
	=?Windows-1252?Q?W5at7L6R+ngtahoalKCBJIqau9QmaCoVVu/BJ5WOqVJykWdyyZjF6Top?=
	=?Windows-1252?Q?tULuYlribhTZTwv/QdRZ2Av7Y53m9nO3eEVmqly2zeYSgYh+O8Tg2lZ8?=
	=?Windows-1252?Q?1EBNXgfsro9+rT+i+dcfZ0USpLME2qksvwFvLCkY/O7C9Ak8Jt3m3NDO?=
	=?Windows-1252?Q?1ql+qh1AptHiVVCb6/RX2fI/GjvJiPL5269MKhvadc9PvPRpuPB6HCFB?=
	=?Windows-1252?Q?8BlEm92TxBUYPLrF61OHXoQ/PC3yVhC4iyaOHCDwTXDQ0jWX+8yYYOdS?=
	=?Windows-1252?Q?jxGOLfN+FiYoOSPWhG8bWdOpAvNnv25hnSeNKORGiLM+HdEAKlEPKke+?=
	=?Windows-1252?Q?wCK07Xf/QH/XsiqH4DTydrra3qomTo8HFw+O4M7/HeJDplqmbXe1Lnvj?=
	=?Windows-1252?Q?QX/LA3oWpNw9DLbt73gbFoVAnYZoLUKbnY2tw2GFWy0bfrxepxfka4Hj?=
	=?Windows-1252?Q?xt96rzWmf2jZ+tFT4u18KHTuqC1bPjIIQCmbsVvtobFJlXZIw+FvO8Gt?=
	=?Windows-1252?Q?Mey/H0qtjYuA7zY4gnQveJmDDnJr6HIn2bLGohNqHSDtmsVEg/BAYPuY?=
	=?Windows-1252?Q?lhJ+xpY2KQC2b24VTi8PdRcESG2qSheV09IyoaXKeanSRETP/xzRiQza?=
	=?Windows-1252?Q?zKfgTrLE8NUtXkhIWOuFy5SHf2uwZzV8+oNOzXupFbe2iVpvlxJzovRy?=
	=?Windows-1252?Q?yaGSedZm+CVkydfYeSMlWR6XVqsZH6Ompiok+Hs2NMazJWTULcwONFuj?=
	=?Windows-1252?Q?JUZcS2TQa97nosGdMoSfePYxZe+483by7+o42C1YwmSJt8ReGh+razwG?=
	=?Windows-1252?Q?2Dq2uqr3+MuYQZsOUr0I8OlLQiF6co+GEV2nBW/WUrwrYoSL8kLuhoKY?=
	=?Windows-1252?Q?TNvyeKC6pu7A91ZHzLwzvAAB4KrpZdskTjIID7EQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; AMSPR05MB264;
	5:WkGCDKkeivg0Tsuw4VVw/x2IAM2Rr+sG0yDkUGtLa0EH2LQL+usL0ifIb6QQ8iCCdvJKJwmY/x8d+pdfEoMWpb26bIFcA8VWeIiAO2qn+KhogyZqhnYxjqqc4Vxjd3/ECm/02jlvaRDZEl4+EaowkA==;
	24:IVGMsb8Nuut6DIVg1OJqq9scUYKY7Jl5k2KhvQUEQPa8Muq3KXbX549xfWY/XvbtQF3Nk9S/pl0T3gUsQRVIY/sB0CiPCFMprwHYc/Ajbdo=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2015 07:03:29.2441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMSPR05MB264
Subject: Re: [PATCH] linux-firmware: rtl8192cx: Add latest available firmware
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
X-List-Received-Date: Tue, 08 Dec 2015 07:03:35 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/2015 02:42 PM, Bhuvanchandra DV wrote:
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
> index 615fbdb..3c5729d 100644
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

