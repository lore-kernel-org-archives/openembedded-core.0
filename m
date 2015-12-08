Return-Path: <bhuvanchandra.dv@toradex.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0142.outbound.protection.outlook.com [157.56.112.142])
	by mail.openembedded.org (Postfix) with ESMTP id 7F12760110
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 07:03:31 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=bhuvanchandra.dv@toradex.com; 
Received: from [10.18.0.138] (115.115.225.206) by
	DB3PR05MB266.eurprd05.prod.outlook.com (10.141.4.23) with Microsoft
	SMTP Server (TLS) id 15.1.337.19; Tue, 8 Dec 2015 07:03:29 +0000
Reply-To: <bhuvanchandra.dv@toradex.com>
References: <1448527865-13315-1-git-send-email-bhuvanchandra.dv@toradex.com>
To: <openembedded-core@lists.openembedded.org>
From: Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>
Organization: Toradex
Message-ID: <566680AB.2090400@toradex.com>
Date: Tue, 8 Dec 2015 12:33:07 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1448527865-13315-1-git-send-email-bhuvanchandra.dv@toradex.com>
X-Originating-IP: [115.115.225.206]
X-ClientProxiedBy: SG2PR03CA0008.apcprd03.prod.outlook.com (25.160.233.18) To
	DB3PR05MB266.eurprd05.prod.outlook.com (10.141.4.23)
X-Microsoft-Exchange-Diagnostics: 1; DB3PR05MB266;
	2:PwifaMFGhdSq1xRMDazofNNEu6kchjbUoRKMhPrGz7fjvQXvahHJEzqmhskQsaoXaIKXdCTvWbiyTw0aMt9DeZ8l5gr8r7ZFukwC6H07R1L1Ug3FtMAM2cw9EUROqUlEsCzwd4ib/c8io+16qN4SJQ==;
	3:WC4ToQMTAx73eqcleDgIb+mLECw5eYAsESJ6ILXXacFDatCOOahjTjCDLznawRcf60XaNDrm7GV75c6C7w0Xtl1TFLNN+NYV14KESkIaP7SqVRmOQ5M9YvH4Sygr/ngk;
	25:PVtAMrMvw6j5795aXXYrGv0oOqHHQ6LaHVqeqffuL6EODZup237cmjrf7IubDA46eg2Lp8lVom/CS0GAObXh8hvCNvonU3o81EEnuJ5Ey3zgsEFUxY3/lviJlYqPINCnh9W5/Ti24tRavZEqk4U4mGgwu9T4gIlGuD4dFrnGhw6AAG/hN/Z3tcL++A/+BrcITw10CDVS7z+n2UU1EAhsSGfT+X7L4UORYlRNJfMmvYABvy/gvuyyFM1SHzBrPiYt+wyE+WXjjU8OjphrOsOSDw==;
	20:nrCYMq/FceDJUEpTEYnP1bM2/uIeQTK47DDF3DnqdPz1L5cq7xAmNZC3d6KU+VDJ7WVNJNZcAehXTFPvOpIqJIPc3c1v5XU2Pcb2qJtDS8zoggKhXXN/zt1tTJda3e0jEampi6jlKNox6sS2TLN3fUdhOs7/Fneu+Xhk4vYaccSFkiCglZ64K+EwPDmcZPhEcW7B4X2vYpsgkE2mMzrBUYUXLK3qUey3fvijoO2hSOF2hh0YemJzlratpp9onAEKeD7GfaQffGuchtmRnjj34xXkWgEudmZXrZIH55ySIlw/H3wrg6cDZbPZ4z7ZJJsC508malTBSf7bmvS41HayuQ==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB3PR05MB266;
X-Microsoft-Antispam-PRVS: <DB3PR05MB266AF0E85D4D1AC1D57B4DB8D080@DB3PR05MB266.eurprd05.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(90676262408878);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(520078)(5005006)(8121501046)(3002001)(10201501046);
	SRVR:DB3PR05MB266; BCL:0; PCL:0; RULEID:; SRVR:DB3PR05MB266; 
X-Microsoft-Exchange-Diagnostics: 1; DB3PR05MB266;
	4:ddHHNb5yu8WnFF+nbtJXFz5Qo8Acha+0Mm7Lp+1P83/ZUS1dERSb6NVpD9C3uzoSrMPBCG5VHpTkU+TEysHreahjpfXaSBD+rewAA9FSIi+mw/AaWiT+KIlvBUrSO+acluHfFIHLvHcC0cmovyxQPoH6QFsCJ20TXORgPyqg0QkXg5GrWWDjBiXcyAuZ/adARFSnsdwfKaXXYujcMZVEq5aVMrNT4s13D/bmIYQ1/pCM6AwmdfkwhdlTJ6lvI22w7frCADDaOOUjyRv7Kc5qN6pSuYOTLl483dIkk2RO+CnnlUPlsC8W+Lo82XbuuBVnmfhfMtodTRpeu30/S6oK6avla93C7aFGJ5S/cAzQw6x90YFtz7DSJ8XLQW3eGzgQJkV1vz7DSJFedndVWdcy5R8Wt3gMgu95TLVr5tLrlwmAX/NXAR4wvMW1upwz3MKX
X-Forefront-PRVS: 0784C803FD
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(6049001)(377454003)(479174004)(189002)(199003)(24454002)(122386002)(77096005)(87976001)(80316001)(99136001)(40100003)(5001960100002)(19580405001)(76176999)(43066003)(86362001)(47776003)(19580395003)(65816999)(2351001)(23746002)(101416001)(42186005)(106356001)(65956001)(50986999)(83506001)(54356999)(189998001)(87266999)(105586002)(53806999)(66066001)(33656002)(81156007)(110136002)(4001350100001)(97736004)(65806001)(2950100001)(36756003)(64126003)(230700001)(586003)(59896002)(50466002)(5004730100002)(3846002)(1096002)(6116002)(5008740100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB3PR05MB266; H:[10.18.0.138];
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: toradex.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; DB3PR05MB266;
	23:RpPJNsx0Ys27JusD6gm8/7VclHyUp3MEE6iRyY?=
	=?Windows-1252?Q?okE/YpLUutLfzYbORIIJ3OX/18Jh/gdYriUT55auOvTceoluTSGcPeM/?=
	=?Windows-1252?Q?LMe52eBInmBZ51A+7YjupY/BWPOMKjGwxx99I5LR1hIhE5waWdNf3lS2?=
	=?Windows-1252?Q?lo6CsixgzFhfHMnIMuALsgx25YSEwRZlR44PnGu8sVsAwLwqUdDhO3ZM?=
	=?Windows-1252?Q?TS5oTVFAhGOJTcCUmGncB9auVC7vIM+QhdmpRX8FYpmOEt7ByPmQLQ7s?=
	=?Windows-1252?Q?eycZs+aXRv0ZBXQZ9nFobTV4HHRZi9saftLW7sDejjxFmDu4pFCVTj/c?=
	=?Windows-1252?Q?Lyi+/UX1G155IQSca4O7/P8Vv9vYmhX/SPAEXGFpT4KRqZMPD9apZBjz?=
	=?Windows-1252?Q?0hh/qtrj9QgDovmftFSyj6PVyfB9qv0FH1lSayYacFf/EV6CLWu38BrH?=
	=?Windows-1252?Q?SbdD5ID3I4uWZowo0ZjuaVxyPy8OzxcpEkNh4DlzokYBxwoi7soFD/DT?=
	=?Windows-1252?Q?MhsXDwg+Vl/bBTkXAbubk1fqJOPE3udG5DIwX7zZJW5PZvh0XWeNHq6/?=
	=?Windows-1252?Q?czBMYrpkXe6Csh+elhbor/uNp83U6rb+u4A1SZZTcwx/RspqM7EgaMZg?=
	=?Windows-1252?Q?2rW9B8bnpkpoPq1qts9oJGlStQz6MmlZbvuM3U8OtlYm3+sDGuVKxhF4?=
	=?Windows-1252?Q?Ox/BYyFQGuvOpVvVh7lkt2Cg0YlLb83MIx4ZCh+H1hDy31HaPBrpSz3G?=
	=?Windows-1252?Q?lXGPhezN8VIoVGz2id+qvfUl6Mb+HRhKxY866NtQSFMBzJeFa0UqiCpe?=
	=?Windows-1252?Q?CcEOm2hL1FLLk6xHhJSAzHcT84GlBq69GM1u5MWURf2YK0Du13Oc9D7R?=
	=?Windows-1252?Q?SPRbgX0D8pPCq4sZjnrlQvRuj2SGY3Yvw4pNbIUzbD8z1ajwu10fRhYx?=
	=?Windows-1252?Q?k8K18GekZQsnOrIeniqjUyQ7RPtl/MYn4ajjHlHtGxVEtragJc6Zel2H?=
	=?Windows-1252?Q?HScDjchuYh9HKAvelFmNdQ6YWcAAWC7cPIKXVLVzGhIxm8Muu2m5g4SG?=
	=?Windows-1252?Q?HSyK6BdBXJVnifASdzqg+PE0z31Iy6m6jTXMf2Xk59bELvDKAgiC8TDA?=
	=?Windows-1252?Q?kyDLdFr8kjaubiTUfl2FwIeRbNvYCuN9CUC2YhbUW3XSUiZzwhqT4Lp+?=
	=?Windows-1252?Q?DDXt8wvtRNqRKXJXoapkLMflYQfI7kEtWUAGUcQHQiWRogaA6XiDTGBz?=
	=?Windows-1252?Q?Yr51buRy+nO3zUADaQPRBcH94b2o4IA/IX6dpVO2p07EfEUuh7qsbxc2?=
	=?Windows-1252?Q?nmFWaHsWH8WJQ3HANZMMjoiwrmpv3yWiLSVtlbnhcMIIFybjqVnHkdMx?=
	=?Windows-1252?Q?YV7CdnPhp8UrSU1xguYz+SmmRkkjXs02+s3qaH9dRSWc5Fx8kRap97mw?=
	=?Windows-1252?Q?G+o35Sif/p7l5Xiis6vR6Pp/WyU33JFxpefRqYxg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB3PR05MB266;
	5:7fm9QmLEff+wYgRrIU62W0ZGzy4wnhm/WR+wp2SNEdTB5gRSODYPptAggdaK0wIC/6wxrSk7L2WcXAP3HfEm9yFKevif6Q5Hld5B/blymmPEq/4dhDcEA3X9HbCM+VJZEr0Mw60q/VVfOmskU0lhUA==;
	24:ciJG5ENwuoBc5d3yy+iCjrKD2/+n5sMB1xNhyjg/6phEFK7vfBzhzKydo6ntg0IfXG+KrxOAN1F0sWT43CF875ix+KVH1s+XFhR8dQuHHYw=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2015 07:03:29.3329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR05MB266
Subject: Re: [fido][PATCH] linux-firmware: rtl8192cx: Add latest available firmware
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
> index 16ebf6a..e81bce0 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> @@ -145,13 +145,13 @@ FILES_${PN}-rtl-license = " \
>
>   LICENSE_${PN}-rtl8192cu = "Firmware-rtlwifi"
>   FILES_${PN}-rtl8192cu = " \
> -  /lib/firmware/rtlwifi/rtl8192cufw.bin \
> +  /lib/firmware/rtlwifi/rtl8192cufw*.bin \
>   "
>   RDEPENDS_${PN}-rtl8192cu += "${PN}-rtl-license"
>
>   LICENSE_${PN}-rtl8192ce = "Firmware-rtlwifi"
>   FILES_${PN}-rtl8192ce = " \
> -  /lib/firmware/rtlwifi/rtl8192cfw.bin \
> +  /lib/firmware/rtlwifi/rtl8192cfw*.bin \
>   "
>   RDEPENDS_${PN}-rtl8192ce += "${PN}-rtl-license"
>
>

-- 
Best regards,
Bhuvan

