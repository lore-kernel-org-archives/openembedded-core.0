Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.92.89.30])
 by mx.groups.io with SMTP id smtpd.web12.1163.1605739241331913779
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2020 14:40:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=mSRadH1w;
 spf=pass (domain: outlook.com, ip: 40.92.89.30, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FDmoaqEzop0YSBzsGb/fsuzglvFHXYy59MRS85bGvrx4GPCTkBFZI64uMLyQ/AKKs/EiCgfIcWVch0L2Yp7CldESJJaC6XMmXKOFZWmTIKInyaY0FcHE0qLHZsk2slz0Z//DHGHB4ml0nQCxNPab6jTu93cTLeP4pniXxINkq6c23ErDdEeaNTWZzcXn7gPFKhD9NZizw6faXubLI/gco6GaiNGhZFpIVkDd+Sl/Xa1U0EtrmIh3M0YLsStyrPWNHXIYkwMePW6CqcRWgEbgZoyeB5q4yMdpMFU+zqYgGpwj4Qz7+YeRktMZmFR8OhkjL4gwE0UcNgmzU8D8Imj+6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w4HrY6j5prp0vDw0POAQhw0D9mfi2Y76/Gyc+Rp3Crc=;
 b=j17g5az66Rd5JOvba1XvG2cex2BhIpyjK5RRtG4VFQBPiU60j6bwl10+1uf7k/poP1QCdOz39QICzEjumvcSCpsg5dpVfEi+HPNg20mbUKAP/sUKSuVTwdkPRIpWt4JKEleuM4Sj9u3GXL43V42FimmGkD33w7IkTXxxGC1Bi1FcfpwlSwtfr0yihpApz9wp9Gp++SffW0C2cXQv/9Qdd2pWcvur2N//r3HWbBjO7j/PUXsCgf2SaFOGsnwy4nAx7/HvQfZ58fZlNhH7McmEu1o/5A53oNgffdT6O2wxg0dhjBmxNRs/CrGqkh/MshcXBiXHzbfepJeJvpvJIrSdZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w4HrY6j5prp0vDw0POAQhw0D9mfi2Y76/Gyc+Rp3Crc=;
 b=mSRadH1wroG7/3nGwY5UCsTmWY17RSIXmXCMzcFUJZysO/jXAxSBWz+BP5E5ZIOxr66gWNo1JK7wQqlNOKhODUBYofJoLKflv3URzuN31aJhitNnVMKDM52t9L9Ebt+1qOifmFP3tAw3P2n3lFxqKUCII1Dt+hgUHaFKaOIoZoh2PA8s9wv8b8SsLhlveq9rBWebaAnOCSHWvDlVBo+U89GSPgB0/YRv2r6RWcZACC5DKg5l4gi81QvC7E15OH6riBvhUW+wzaL575sO2a8TbR/ync9gq2juSq2YvoHXCclx/3yDSrN2uHep8HB+MoYc3+dbtccm4LdTzU/NXDh9EQ==
Received: from AM6EUR05FT007.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc11::4e) by
 AM6EUR05HT234.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc11::250)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Wed, 18 Nov
 2020 22:40:39 +0000
Received: from VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 (2a01:111:e400:fc11::52) by AM6EUR05FT007.mail.protection.outlook.com
 (2a01:111:e400:fc11::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Wed, 18 Nov 2020 22:40:39 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:A7EF699DDBD689282C8FAE04E148350B67DDABDF72E9C39155E671EACE8A9E49;UpperCasedChecksum:7B4B6FA76620EEC91DC629936CC2C56A07CDAAB1D2757CD286169E68EAFF21E3;SizeAsReceived:8698;Count:47
Received: from VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 ([fe80::10f9:f756:6d75:96c3]) by VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 ([fe80::10f9:f756:6d75:96c3%6]) with mapi id 15.20.3589.021; Wed, 18 Nov 2020
 22:40:39 +0000
Subject: Re: [OE-core] [meta-oe][PATCH] volatile-binds: add /srv to mount and install
To: openembedded-core@lists.openembedded.org, okaya@kernel.org
References: <20201118223708.9664-1-okaya@kernel.org>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <VI1PR01MB64628148F729E6775EBD6651A8E10@VI1PR01MB6462.eurprd01.prod.exchangelabs.com>
Date: Wed, 18 Nov 2020 23:40:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201118223708.9664-1-okaya@kernel.org>
X-TMN: [tYSbKvIpIEsykkXjTxoJNJ1Shq2dMheO]
X-ClientProxiedBy: AM6PR08CA0034.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::22) To VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:154::12)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <5895f31b-3c36-13f0-d03f-6421b4801001@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.85.68) by AM6PR08CA0034.eurprd08.prod.outlook.com (2603:10a6:20b:c0::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 22:40:38 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: adcd69fc-d18d-4726-7559-08d88c12f909
X-MS-TrafficTypeDiagnostic: AM6EUR05HT234:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4RX/TFaJuxxlENjv6Ig2s5ZYV5IbOxkQ++tXGSkXrAET7+qyzsRs6T9M9yKiEkqa0KkYN6Qd98brmy8wbCNp/ubrc+Gwp4K8I74iSDH0BQwBzqeDJC7+BzK/h7O/vt+hGeUiBI5hhBq02uSiQ9VQerE5ihSAU9qSDxUW76cP25n05bSBQaqaSl9rpakg5V0MyYsYwl3ypOIr5ND/61OwMUDmH8Qx3CsKeYD4ORM2sZVs641bnixs6WAl79Hman+C
X-MS-Exchange-AntiSpam-MessageData: 
	Vcx98YX6TBYczOReGFzYy1C9fHUY4nweHYCpZRbWex2xWmdgC0x4/2YropBWnwC6mFoF4H1GFKmyaGI3UOFapb3Khz97MpFO8f/UPqSPvM4e9cw8q2KNMYeDWBSc+gJGPg5N3qglr8CEDDxspqj0vQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adcd69fc-d18d-4726-7559-08d88c12f909
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 22:40:39.1129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	AM6EUR05FT007.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6EUR05HT234
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.11.20 23:37, Sinan Kaya wrote:
> Signed-off-by: Sinan Kaya <okaya@kernel.org>
> ---
>   meta/recipes-core/volatile-binds/volatile-binds.bb | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-core/volatile-binds/volatile-binds.bb b/meta/recipes-core/volatile-binds/volatile-binds.bb
> index b273293e9a8..08bda6d14bc 100644
> --- a/meta/recipes-core/volatile-binds/volatile-binds.bb
> +++ b/meta/recipes-core/volatile-binds/volatile-binds.bb
> @@ -36,6 +36,7 @@ def volatile_systemd_services(d):
>   SYSTEMD_SERVICE_${PN} = "${@volatile_systemd_services(d)}"
>   
>   FILES_${PN} += "${systemd_unitdir}/system/*.service"
> +FILES_${PN}_append = " ${servicedir}"

Just out of interest, why does that need to be an append?
Why can't that be part of the line above?

>   
>   do_compile () {
>       while read spec mountpoint; do
> @@ -64,6 +65,7 @@ do_compile[dirs] = "${WORKDIR}"
>   
>   do_install () {
>       install -d ${D}${base_sbindir}
> +    install -d ${D}${servicedir}
>       install -m 0755 mount-copybind ${D}${base_sbindir}/
>   
>       install -d ${D}${systemd_unitdir}/system
> 
> 
> 
> 
> 
