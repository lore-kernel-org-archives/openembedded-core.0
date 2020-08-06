Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.45])
 by mx.groups.io with SMTP id smtpd.web10.7465.1596723418993703246
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2020 07:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=LKy3nj2q;
 spf=pass (domain: arm.com, ip: 40.107.7.45, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HpzvX33yvmWFgipeTA6+IKWn6h3ctb7y4HQW6jUUL7I=;
 b=LKy3nj2qY18UiAdKlIWuzdRxuMZrg7wWS8jX9FU1JkZ81W754WL15oWeHyu3QJPQHHubcGHyLc5U+0eBqZxUNH5A77WJfCEC+rUR9BbqY8bWjdqOLVYa9KCz/ZAW3pDgPr1nqk6Jll0a+BFC5AAT/2s6e0wZX/FcShUCB50YXss=
Received: from AM5PR0402CA0011.eurprd04.prod.outlook.com
 (2603:10a6:203:90::21) by AM0PR08MB4564.eurprd08.prod.outlook.com
 (2603:10a6:208:12f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Thu, 6 Aug
 2020 14:16:56 +0000
Received: from AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::b7) by AM5PR0402CA0011.outlook.office365.com
 (2603:10a6:203:90::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15 via Frontend
 Transport; Thu, 6 Aug 2020 14:16:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT027.mail.protection.outlook.com (10.152.16.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Thu, 6 Aug 2020 14:16:55 +0000
Received: ("Tessian outbound 7a6fb63c1e64:v64"); Thu, 06 Aug 2020 14:16:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c688726cf8f0ca3a
X-CR-MTA-TID: 64aa7808
Received: from 9a83bbe4a591.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 19172908-B53A-443F-A256-D7702019BFB9.1;
	Thu, 06 Aug 2020 14:16:50 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9a83bbe4a591.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 06 Aug 2020 14:16:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dek9Dodx0gvWvqDwSaP03TYnFTa5gt0HeX77pdjTNBh0SHckHnIJ5jmCOax95R3ISMR760ug4SmOegbHabPu9gXj/InG6baxqCnBWt359dVYU4SI4KaM7UIl1Yrr45sCOen6lq1TREA1KkD9X6tUhpHeA1UbIBrPlho5JXPotOSo7phtQgvcuhBsfXt+MUO+IrFQXUitLcN6ds5Mweb8tIwuGckODuxSmbYIbU9oKLES1prYHI96kXjYnJUMlJL9cMdsFVNXzQqj5KHjilwvEQnMOrgwU571EgMLXety++YUIumU9Rl6c9Q9FsUwzcPZtGvRg4eS0CDMiLb1JIWXdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HpzvX33yvmWFgipeTA6+IKWn6h3ctb7y4HQW6jUUL7I=;
 b=clmrDiRT3CrRnxUqOr6UDUQV+G9d19yK8mpjU1wYpPz3lqZwoC/TTwPp06Qz4cf1XB70XOtNYpRHzbnvBIw6xV/UQ62VdWX1jI3WzcKdleaAtcn7uTdyvcAJR0VpHl2VSyISLkQpCvD6EOARJmETr6ie5K+LacVP8je8nDU+7OpgeGwC/PdTDtqV7xzGBHNHsIp8aQumIh2AGDMt7tfte5SO2FO+UMg/oI4VWSkeI8inmgoHmwsvFKMYQNsgUvjn6JXVp1VoIDV+5IEwM9U2RCDfDh2829z9/pI/eyx0XDEiASaSf5ahMYmt14URKdYEMHTKTG6K0v6xdZ6j4DdGJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HpzvX33yvmWFgipeTA6+IKWn6h3ctb7y4HQW6jUUL7I=;
 b=LKy3nj2qY18UiAdKlIWuzdRxuMZrg7wWS8jX9FU1JkZ81W754WL15oWeHyu3QJPQHHubcGHyLc5U+0eBqZxUNH5A77WJfCEC+rUR9BbqY8bWjdqOLVYa9KCz/ZAW3pDgPr1nqk6Jll0a+BFC5AAT/2s6e0wZX/FcShUCB50YXss=
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9)
 by DB8PR08MB5484.eurprd08.prod.outlook.com (2603:10a6:10:111::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Thu, 6 Aug
 2020 14:16:49 +0000
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5]) by DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5%7]) with mapi id 15.20.3261.019; Thu, 6 Aug 2020
 14:16:49 +0000
Subject: Re: [OE-core] [PATCH v2] kernel-fitimage: build configuration for image tree when dtb is not present
To: openembedded-core@lists.openembedded.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: nd@arm.com
References: <16238590BAEEF4BF.5706@lists.openembedded.org>
From: "Usama Arif" <usama.arif@arm.com>
Message-ID: <9d97ca08-04a6-6029-7a39-c96aad082fa0@arm.com>
Date: Thu, 6 Aug 2020 15:16:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <16238590BAEEF4BF.5706@lists.openembedded.org>
X-ClientProxiedBy: LO2P265CA0024.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::36) To DB8PR08MB5481.eurprd08.prod.outlook.com
 (2603:10a6:10:114::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.1.198.43] (217.140.106.52) by LO2P265CA0024.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:62::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Thu, 6 Aug 2020 14:16:49 +0000
X-Originating-IP: [217.140.106.52]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a2f771e5-e200-4290-747a-08d83a135fe1
X-MS-TrafficTypeDiagnostic: DB8PR08MB5484:|AM0PR08MB4564:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB456478F40FC0CE229582D6E192480@AM0PR08MB4564.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 l336647McFZz2A8dgAY4DlW0ufj0SQZienm/L+YfkcV+sS8f7dDjz7fGsnso+BTsGYk/Y81UKRP0UgzzwwMcbopnxQ+ioSSRoiuJeS0+7JyoSRjXGYKfepZ6rHJzF63zVIUxSqYkruINSE/+wXck+EOmHgOlUW46G9/T0C9ZRgBcm2UPgzPxcgZL7Xzs+RhNojRXJMj5bxRgadlmkW6zqbxvNsrQdusthtol2q0yiTMQG4sHdA+Fm1iZ4DTM2JmZZKXO16ZWiDKQDcMc+zxmU2/Pih/SyfIuJST7VinY+QuLNRDFvErZlFWQhqSiH66L+RTaow5yP/lRHghTibktfYdhF/kKpKQuVL6+d2ANyJGNezPNgiEPu5C/EJxqkm+m2MngzeOLi+FeCJZRFzLFD43xY58zBvEFgMT85uc2iVrDjHXoLXj86eFmD+Nr4N6TOTwsm6yXkiZs4fT/gn3Q5Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5481.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(346002)(366004)(376002)(136003)(6916009)(186003)(16526019)(86362001)(31686004)(2616005)(956004)(36756003)(26005)(53546011)(478600001)(83380400001)(8676002)(52116002)(966005)(31696002)(2906002)(66476007)(4326008)(66946007)(6486002)(44832011)(5660300002)(316002)(8936002)(66556008)(16576012)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 l8arx2MIOYbRV9+CD838KT4swChVyMmhhD4KQIGIlAcrp3S96w22XhkXOrirLKjuWi4bnKDjuRnhrxHvFlGxq3LfkOQ/7MHAg/zfrsG9UxIEdNUb7yxFTLI4BOhqruIrScBzqk/bc/rWT9WRz3/ZFmSECMZl4VCQEZBKBfWxpffPOJ9Coq28WsKoonSs/5uVnSJflU5i9FJVTmglULE/O6gpKHGEd4z2+Oy067dOR3HDPHwLgwRAc9/S7TYYnUNYPQ+FT8QJnYYb7zrIW/D8WkrUAXDUo8HIAbtZBHRohlDlbN0vppPhuS3WHmZR46MOoGueRdRLprT03qDh9a70k+XmLhowLzGcCVlWaTtYuh98odPl/MG0o69+lC7luUB/kEebvQ/NXU64xpcqHqOz0gM8Y18pdJMEOUknjD1FgaCprVOgxcmxybl9RJiQNBaKL3h7FIw5ngQWRPvOvDvPnUgJenqqdChg0+vGiWAe1PSBYPPRCMykMVsqmKyRS+sQQGktRRONbPRR2M5VNOmvDYoO2ZYtw0aFHVKuAeQ4nFr/+4YSxHRAkDkBGxcj2Qf2tx9KnMTy92BhYiIfgt+m9nJVV1MDJDa5XuTrj6WMR8rwIhqayhxrsLm7XKimvLCzJ2ZZhrKAkpTSSjogFu7Maw==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5484
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6d3d57cb-5660-409f-cfa5-08d83a135bd2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	12yXO5YgCuEV6D8dq2bycWGyls3/nYxWKtbZFggwalZLnT4FQgi4iz/jEbGwfN25xOkJgJ4lNs2FaiAEz3HQEx//m0y1S/PSIxt+mFLSTywssB54PI4fGA1UZKBLORsWN537R/T67jEsl3HrBztH5iP5utmEUip3BRR5qNhIeHPnife7k0JqNc58PKHYYUfUwfn/YRtXu9YnMfYk+ZqfaKHHaho8AmQRQcfbCzRqJILKqu/LubOV/HskYhep8FuiKAK8jp36K/Gfrh3tfx5CiqRURLe3+9RsJRccAlJq44ot6Y7q2Yz1qE8dAVbx3UIl7ChlREKkuMTa2QVlfCTCKK9bkWvm52pTwXFhcxm7a4MV3F3HQ3t8Gm0kmnt5wxnd8Ws9//Es6nB8F9qCOAgcdPFqZ/19nVYJoWt5qSPSx1pOy8UMkEqzQA+7SKmbLZ6NpXjqurQWuUlCN5H1CR11BPIWJOfK8G6fBj89JEsJqnLoeZRDJY6NMUv3zNX8ltOK
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(39860400002)(346002)(376002)(46966005)(4326008)(53546011)(47076004)(70586007)(82740400003)(82310400002)(16526019)(8936002)(2906002)(83380400001)(356005)(478600001)(186003)(966005)(6862004)(26005)(6486002)(36906005)(81166007)(5660300002)(316002)(336012)(31696002)(86362001)(44832011)(956004)(2616005)(16576012)(8676002)(36756003)(70206006)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2020 14:16:55.9795
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f771e5-e200-4290-747a-08d83a135fe1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4564
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

I had submitted patches for both the documentation of kernel-fitimage in 
yocto mega manual as well as test for kernel-gitimage in oeqa. Just 
wanted to check if there were any review comments for this patch to 
progress?

Thanks,
Usama

On 20/07/2020 18:18, Usama Arif via lists.openembedded.org wrote:
> This patch adds support for adding configuration node even
> when dtb is not part of the FIT image. The conf and default
> node number are therefore changed to point to kernel ID rather
> than dtb ID when dtb does not exist.
> 
> Change-Id: Ia5a2940d1d29ade1d9847c64327c2a582d51c123
> Signed-off-by: Usama Arif <usama.arif@arm.com>
> ---
>   meta/classes/kernel-fitimage.bbclass | 29 ++++++++++++++++++++++++++--
>   1 file changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index 72b05ff8d1..fa4ea6feef 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -257,12 +257,21 @@ fitimage_emit_section_config() {
>   	# Test if we have any DTBs at all
>   	sep=""
>   	conf_desc=""
> +	conf_node="conf@"
>   	kernel_line=""
>   	fdt_line=""
>   	ramdisk_line=""
>   	setup_line=""
>   	default_line=""
>   
> +	# conf node name is selected based on dtb ID if it is present,
> +	# otherwise its selected based on kernel ID
> +	if [ -n "${3}" ]; then
> +		conf_node=$conf_node${3}
> +	else
> +		conf_node=$conf_node${2}
> +	fi
> +
>   	if [ -n "${2}" ]; then
>   		conf_desc="Linux kernel"
>   		sep=", "
> @@ -287,12 +296,18 @@ fitimage_emit_section_config() {
>   	fi
>   
>   	if [ "${6}" = "1" ]; then
> -		default_line="default = \"conf@${3}\";"
> +		# default node is selected based on dtb ID if it is present,
> +		# otherwise its selected based on kernel ID
> +		if [ -n "${3}" ]; then
> +			default_line="default = \"conf@${3}\";"
> +		else
> +			default_line="default = \"conf@${2}\";"
> +		fi
>   	fi
>   
>   	cat << EOF >> ${1}
>                   ${default_line}
> -                conf@${3} {
> +                $conf_node {
>   			description = "${6} ${conf_desc}";
>   			${kernel_line}
>   			${fdt_line}
> @@ -434,6 +449,13 @@ fitimage_assemble() {
>   	#
>   	fitimage_emit_section_maint ${1} confstart
>   
> +	# kernel-fitimage.bbclass currently only supports a single kernel (no less or
> +	# more) to be added to the FIT image along with 0 or more device trees and
> +	# 0 or 1 ramdisk.
> +	# If a device tree is to be part of the FIT image, then select
> +	# the default configuration to be used is based on the dtbcount. If there is
> +	# no dtb present than select the default configuation to be based on
> +	# the kernelcount.
>   	if [ -n "${DTBS}" ]; then
>   		i=1
>   		for DTB in ${DTBS}; do
> @@ -445,6 +467,9 @@ fitimage_assemble() {
>   			fi
>   			i=`expr ${i} + 1`
>   		done
> +	else
> +		defaultconfigcount=1
> +		fitimage_emit_section_config ${1} "${kernelcount}" "" "${ramdiskcount}" "${setupcount}" "${defaultconfigcount}"
>   	fi
>   
>   	fitimage_emit_section_maint ${1} sectend
> 
> 
> 
> 
