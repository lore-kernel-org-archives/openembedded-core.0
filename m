Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.42])
 by mx.groups.io with SMTP id smtpd.web10.19113.1599568991885440340
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2020 05:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=fpOQll/W;
 spf=pass (domain: arm.com, ip: 40.107.14.42, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ChAtFomMYFTm6kZmfy7Eoowj2EOZF4ZWPVHdjYjw2O4=;
 b=fpOQll/WXaktCR/z6FLT3nIhn9dj/qVPkVEviCq6qsSgBO6gExZZUqqhIBY6yB9+tx0q7Fg9tLj2fhX4a4HmICanYnhSRuVy85QHn9kInjMBW+gS+gBrrGOJK20/1KxZoZrm1z8CnF/JOl38sl1EQfhUi61h1+SWJNuWszM3Bi8=
Received: from DB8PR06CA0060.eurprd06.prod.outlook.com (2603:10a6:10:120::34)
 by VI1PR08MB4256.eurprd08.prod.outlook.com (2603:10a6:803:f1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Tue, 8 Sep
 2020 12:43:09 +0000
Received: from DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::4d) by DB8PR06CA0060.outlook.office365.com
 (2603:10a6:10:120::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend
 Transport; Tue, 8 Sep 2020 12:43:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT053.mail.protection.outlook.com (10.152.21.119) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.16 via Frontend Transport; Tue, 8 Sep 2020 12:43:08 +0000
Received: ("Tessian outbound a0bffebca527:v64"); Tue, 08 Sep 2020 12:43:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 63685ae2cc760d10
X-CR-MTA-TID: 64aa7808
Received: from 7552514d4d89.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 534DC228-4263-434D-A688-9EE9F6B3C765.1;
	Tue, 08 Sep 2020 12:43:03 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7552514d4d89.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 08 Sep 2020 12:43:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nJSMpU/wcydheTfJsCI0Wv3VAFzt7teOdcLFonFPNpiCNW5LxdBRECrKJFRB7DRLiEkFq/eoRFawTtdDzmso1u4MwsH6C7SKzwv0MzN9GHCaXilibdv/YlyF0vszbWBdhvPi4tMq8Jz/3Gb14ZIpnkAOpZWO8OtOvDxm6uQYHkCfmVjDOcrW3T6ePKivZyfncC4T7P++UwMrD2D8dn55thSweZ/do7CqsvA3y2VDStzfwpvhFhLQIuLX1ErppAyb++Z2BvplQkdJIFwEepOtss7fmYRIxdIueYN3zX+8fDEXR/325ElQ/2wCcLOReQUAJsQ7xeGNUxAtC7HHAicnBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ChAtFomMYFTm6kZmfy7Eoowj2EOZF4ZWPVHdjYjw2O4=;
 b=IPoeOmleneAqQfq1o4svZX6hcokh2YAO8QobXXuLn8WT1eieQks0hExq4qHsHoSJmF//q48lHb1RLM3e5lOHfbyS2hOljBukhigsN8xGhxSEjrFvUyAFOp0s7HppMLs+rO55ljuuJtIedcMhhD0t9A+RTyeWMu5jYoO22OPMNy+wzH6AWpuUN99DwXVagDZiooKjhIU9fgZlN1oEAWOOd6rHFzl0EtRWU54Xh/OQMNJ0dfY6vvMy7R601GcNvm32eLYC+8JV1D/xFRbxAo/LVrgnJ7U1uuzLzowgUhMK+RDbAXzESFIm3qVxBHL9hcVGBbkx32qNUvs0Y6yXcGtY+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ChAtFomMYFTm6kZmfy7Eoowj2EOZF4ZWPVHdjYjw2O4=;
 b=fpOQll/WXaktCR/z6FLT3nIhn9dj/qVPkVEviCq6qsSgBO6gExZZUqqhIBY6yB9+tx0q7Fg9tLj2fhX4a4HmICanYnhSRuVy85QHn9kInjMBW+gS+gBrrGOJK20/1KxZoZrm1z8CnF/JOl38sl1EQfhUi61h1+SWJNuWszM3Bi8=
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9)
 by DB7PR08MB4217.eurprd08.prod.outlook.com (2603:10a6:10:7d::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Tue, 8 Sep
 2020 12:43:02 +0000
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5]) by DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5%6]) with mapi id 15.20.3348.019; Tue, 8 Sep 2020
 12:43:02 +0000
Subject: Re: [PATCH] kernel-fitimage: generate openssl RSA keys for signing fitimage
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
References: <20200908122835.38284-1-usama.arif@arm.com>
From: "Usama Arif" <usama.arif@arm.com>
Message-ID: <195ee8ef-96b3-112a-6954-bb5df8e65e4f@arm.com>
Date: Tue, 8 Sep 2020 13:43:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200908122835.38284-1-usama.arif@arm.com>
X-ClientProxiedBy: LNXP123CA0008.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::20) To DB8PR08MB5481.eurprd08.prod.outlook.com
 (2603:10a6:10:114::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.1.198.43] (217.140.106.53) by LNXP123CA0008.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:d2::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend Transport; Tue, 8 Sep 2020 12:43:01 +0000
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2bbd4c0c-8171-46dd-5a99-08d853f4bd67
X-MS-TrafficTypeDiagnostic: DB7PR08MB4217:|VI1PR08MB4256:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB42569BBAD455C19E80035F4F92290@VI1PR08MB4256.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 8JuA380CPs557ja+P8LLBCKopUbagnLsSpm7CGchj0UQ+xgMVfYGzDmeCNeMM+ORf5dXgfm/sOxF7VviogUsgWbYz2hdbRi4zJd60gV7DoBcMWTi/XkjeLGkXZWiZ3gRan0KVcIH8v0iTEANH6dgAnmW6oN4yvjdl7soRPqJUvRrsqGMf5kob0yDoD+ZF4G3ArLhysDzZpm4QcOEMRFZG093TlB26BAB2Cx2vC7MzmpEv8/Y9O6wVvfnLmn7GMmls3wXuTzo5Jy1LqsNubnVynt++jQEEzZYDwpTFGcso7/2BLlRD/c9VlGGzUGVT2zxbo75Tb0A4gSXLZciab5F0FLOs9qORF+hzc2Lr1LOuyR93idadRrP6GQQ3yLz81b4XltQzEpZXy3OL/lkWad/eYxy8YdjqNl6d/ZycdtadtEpaUouU1icl2mtiLKDA9pmmL6aF3ohlXoS/AJP3iavTw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5481.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(6486002)(478600001)(2616005)(956004)(186003)(16526019)(5660300002)(66556008)(66476007)(66946007)(31696002)(83380400001)(31686004)(86362001)(2906002)(4326008)(966005)(6916009)(8936002)(8676002)(316002)(53546011)(16576012)(26005)(52116002)(36756003)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 zpRbATs5yXSNjbYXsr4eMO+3gmoCWP3z0xjJR/AounFLhfjcS2TMvfoKaclHFgKJpTV/e9QdL/zSm8hL5vUb8sZ9B0KvQbegNowTer2h5BUR1P+xGjItG+ZHuulWjGeTbXPbTW6/PsjWaIqYwE+AguIc6srJV3e9Pyjvxqx5moBfeZRl8agu8UggJEkdzNL1PoCBirpPCvaKbEcAGZQBjaat8UFwboAaL5jsu/qIlqX03Lx2L51QQjIb0CrbNgP629Ic36tbyxNLvUY5o2A6L/ESl5XhJQgPfDB966OEMENLpp5bt36FUuiEN7Qn57ZqwnHfMtkg/MIP2H7XfdZIGUYXOPQ+J1Yp3HdLq9UvZN5PwumqY7VH995nVIMtisc528VrQ7JwaFxfoTVE0H8naahbv+DUuY6sDHwewsHeCieC8XKCgKidBB3R0q998TSn+ivuvueEsCbeUE1paf1qyf7YnifsOEDSbUMHSIqsR3lLQBZWa7UVs8d7bcRErJWTs6LBbqi37JQiXZk+Lmqx8uKTOMybu0CImIumhtv7jF8wVaGMvKSf66fy7QJjnHqp+iQ1Ip1uqXDofPg3/P1nC003z6FY8eehyCfzgu/F7p+JdvNQ1Zxkpw38YOxWtwPCVGzVVcszXvJFDq5q+4e8jw==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB4217
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	49f51332-5382-4229-c7ca-08d853f4b95e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Sdx07kId1NUfbib072lcU8lpyrMpXmpZ0cmaseIMQtLdOILMn7WxdSV3nUBCT6BlET/A08o6VvV2PV89fbqYR6uevLi7Orq8xQ7z4i35B9FU1cady0yCKGIQP89FO09eW6JQPUuuPz8/i++jPb5OwX7KrULfe/cT1agrGzznHG/Qid8gaGfXR8WNCQ0gbn7o7mxwcfUe0pMIpD2KJhcx9h7zOEw3EMbyNHF/WuZqK+zr5ZChD2o4K3D+5wJvAeGRQvjzanzDdclcSetjy15KsHptdgB6x8fsub2tNRrKH4wW8Oqy6NGwIVtQlCf/AnfJLRyUpzGpoPcRUMEWZKjWY5g81T8EQdoPxMY/9CP/5veTQlossOd76g5YSjT6QUzHtRKkk1GsQ/mmZzZYvmTUsiAapTUwBaODx6ymF0wc0R93neyogCGIRXY62qyP0SQ6oq7pwUhwCoHdRUfRKisuTsc94bOxiGbfTi8V/0mDek3r/Rk1LF01j0T4E9uD9pzL
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(396003)(376002)(46966005)(44832011)(2616005)(2906002)(956004)(336012)(82310400003)(5660300002)(53546011)(16526019)(83380400001)(356005)(16576012)(4326008)(186003)(478600001)(26005)(31686004)(6486002)(36756003)(70206006)(82740400003)(70586007)(81166007)(47076004)(6916009)(8676002)(31696002)(8936002)(86362001)(316002)(966005)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2020 12:43:08.7658
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bbd4c0c-8171-46dd-5a99-08d853f4bd67
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4256
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 08/09/2020 13:28, Usama Arif wrote:
> The keys are only generated if they dont exist. The key
> generation can be turned off by setting FIT_GENERATE_KEYS to "0".
> The default key length for private keys is 2048 and the default
> format for public key certificate is x.509.
> 
> Signed-off-by: Usama Arif <usama.arif@arm.com>
> ---
>   meta/classes/kernel-fitimage.bbclass | 44 ++++++++++++++++++++++++++++
>   1 file changed, 44 insertions(+)
> 
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index fa4ea6feef..1fa8c8f05c 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -56,6 +56,22 @@ FIT_HASH_ALG ?= "sha256"
>   # fitImage Signature Algo
>   FIT_SIGN_ALG ?= "rsa2048"
>   
> +# Generate keys for signing fitImage
> +FIT_GENERATE_KEYS ?= "${@bb.utils.contains('UBOOT_SIGN_ENABLE', '1', '1', '0', d)}"
> +
> +# Size of private key in number of bits
> +FIT_SIGN_NUMBITS ?= "2048"
> +
> +# args to openssl genrsa (Default is just the public exponent)
> +FIT_KEY_GENRSA_ARGS ?= "-F4"
> +
> +# args to openssl req (Default is -batch for non interactive mode and
> +# -new for new certificate)
> +FIT_KEY_REQ_ARGS ?= "-batch -new"
> +
> +# Standard format for public key certificate
> +FIT_KEY_SIGN_PKCS ?= "-x509"
> +
>   #
>   # Emit the fitImage ITS header
>   #
> @@ -522,6 +538,34 @@ do_assemble_fitimage_initramfs() {
>   
>   addtask assemble_fitimage_initramfs before do_deploy after do_bundle_initramfs
>   
> +do_generate_rsa_keys() {
> +	if [ "${UBOOT_SIGN_ENABLE}" = "0" ] && [ "${FIT_GENERATE_KEYS}" = "1" ]; then
> +		bbwarn "FIT_GENERATE_KEYS is set to 1 eventhough UBOOT_SIGN_ENABLE is set to 0. The keys will not be generated as they won't be used."
> +	fi
> +
> +	if [ "${UBOOT_SIGN_ENABLE}" = "1" ] && [ "${FIT_GENERATE_KEYS}" = "1" ]; then
> +
> +		# Generate keys only if they don't already exist
> +		if [ ! -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key ] || \
> +			[ ! -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".crt]; then
> +
> +			# make directory if it does not already exist
> +			mkdir -p "${UBOOT_SIGN_KEYDIR}"
> +
> +			echo "Generating RSA private key for signing fitImage"
> +			openssl genrsa ${FIT_KEY_GENRSA_ARGS} -out \
> +				"${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key \
> +				"${FIT_SIGN_NUMBITS}"
> +
> +			echo "Generating certificate for signing fitImage"
> +			openssl req ${FIT_KEY_REQ_ARGS} "${FIT_KEY_SIGN_PKCS}" \
> +				-key "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key \
> +				-out "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".crt
> +		fi
> +	fi
> +}
> +
> +addtask generate_rsa_keys before do_assemble_fitimage after do_compile
>   
>   kernel_do_deploy[vardepsexclude] = "DATETIME"
>   kernel_do_deploy_append() {
> 

The relevant yocto-docs changes for this patch are in 
https://lists.yoctoproject.org/g/docs/message/340
