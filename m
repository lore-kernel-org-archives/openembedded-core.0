Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.92.67.71])
 by mx.groups.io with SMTP id smtpd.web11.16261.1590337486543429700
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 May 2020 09:24:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=UmUu9FOJ;
 spf=pass (domain: outlook.com, ip: 40.92.67.71, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UDaK/zUnE66b1Zr9HS1wy+B1OnnC81T/Q6UZvV0aeIQrHINNAr39hYmtDEGyWDYyMDnC0NnGQEsr9E0kIz38U9WUK9iYR9oGvNQd61n5svU3qJ9yV+6MMmG8/qnIr/lEsaeMnR9Am1yjWB98s936UY/Tyolk2cQ32or14ZJZZJkHi1iaPgdm5TDOvZbE4hvzktIFNEdnhguBcd3wyaYhltrNf5AXp41Lefv5YW/HQP6r4yLcynA8QxFmDQq1XAyJxqpMIQ7wAAuySnk8r4TX0NfHpH23w0VS6HL27PlkOYoxRsrWJrpJVvQjXrtP7ZT6/sK3tsrjzqnHNvk6sTVarg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IePnee3e10iVIQe2tlib7j4C71oT1II2nPbYifex31A=;
 b=faH/DhQe4p8+J5Zrk6KSTgYT0a8WFe2Fd9xSXQ1V5br9o8yl+n58MZrIjGOaOz8nqtQpwf8YuExzmx0oEigqgSt2ob/VrlYsO7hW3hDm8KOIVl2PXPT+PIKIdRoKPzM3C72Ce8fi1b3JHlEluugddAv+HVKwZsz0Gm/qWqACApy1ZBr47xFtzkblCpcEu2GPQ6uDBLKdCzX20Ye92hOO2uxsdCM8QTn6xqCXDDcNxPSsus1+JLnEK1Wcd2HAEScRCgZ/9kk0Hn00CyXgwq/1dxnHALLIwQFrikpyVoJP0m3VU6shcvsTgttJw+oF1xSuFjoTgiDxxu+Rk91SFNWX3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=outlook.com; dmarc=pass action=none header.from=outlook.com;
 dkim=pass header.d=outlook.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IePnee3e10iVIQe2tlib7j4C71oT1II2nPbYifex31A=;
 b=UmUu9FOJTujb3jVM6OWzDlEj6kPVzXXsKG4MeK6YVWayvNag7xj2/xZoQVzsQIGK8NrQ26384hQMELik98HXQ1LLCIOKR2f5axMH52f/tkTaqPyvdEW33c+DC1XuOVcZO2AExrhDzBAo+zweZkLpf+ThBQ2z1Ld1K+Od3Re7FZeL0//67U9dekhRkPe1nElw1H+RZCchg6wMfzWnNsOW6RrogpmLDulYqco7wEqUvlwrBEYhA1y662B53k4HKShQ2qiZJeCzhfFt6kXtI0wtUzdBXDd6mzLpUg0KCopc9+ptDwxOnASZ3s+byKHzn64BfdCnMfkloqMrxaaA2uRS9Q==
Received: from VE1EUR02FT003.eop-EUR02.prod.protection.outlook.com
 (2a01:111:e400:7e1e::46) by
 VE1EUR02HT072.eop-EUR02.prod.protection.outlook.com (2a01:111:e400:7e1e::405)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Sun, 24 May
 2020 16:24:44 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e1e::49) by VE1EUR02FT003.mail.protection.outlook.com
 (2a01:111:e400:7e1e::112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend
 Transport; Sun, 24 May 2020 16:24:44 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:727E71B3BD4195AB7FD5C1C2CA3B379E7C3FE867D277AA8623E5A381D8CA19C8;UpperCasedChecksum:176E56299F40F26B8D74897A07AF59059FC34C53323CC90F20C7316E5451202E;SizeAsReceived:8826;Count:49
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590%6]) with mapi id 15.20.3021.029; Sun, 24 May 2020
 16:24:44 +0000
Subject: Re: [OE-core] [PATCH] u-boot: change ${PN} to u-boot when install/deploy u-boot-init-env
To: openembedded-core@lists.openembedded.org, Ming Liu <liu.ming50@gmail.com>
References: <20200524161751.22577-1-liu.ming50@gmail.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM7PR05MB688123B693168D342F209BB3A8B20@AM7PR05MB6881.eurprd05.prod.outlook.com>
Date: Sun, 24 May 2020 18:24:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <20200524161751.22577-1-liu.ming50@gmail.com>
X-ClientProxiedBy: AM6P191CA0075.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::16) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <6ec01598-61e4-4cd1-febc-c89e4841396c@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.20] (87.141.95.224) by AM6P191CA0075.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend Transport; Sun, 24 May 2020 16:24:43 +0000
X-Microsoft-Original-Message-ID: 
 <6ec01598-61e4-4cd1-febc-c89e4841396c@outlook.com>
X-TMN: [kpHdCtoTWiMOltqbd7rhUmiotlP02XCS]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: a347f738-4c60-4ab8-6e0e-08d7fffef7cc
X-MS-TrafficTypeDiagnostic: VE1EUR02HT072:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eSsD285ssx2GzAUVQkkyEKB/KOLR1HsEjC6xpuB/vJQ0+MHe+7Rcxn18bLgO/bq3AZqqDksEQx7HSp86rkjJmQ6488cBawDAmiYMsJdF6eKInJi+JaKUF9jgSqeZNim/pYoLwKRS9Ere3E8yOddJIb8jRVCnulLND/DCxfVOOBFWQAhd0XkACD0utuYpCsJyUraJgpTxpjlBr57+TjsKK6v/yjuQrPz6/7p+LjAcIiZB5JEReZyFX4j/zY5Xs3Bv
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	VAoEdfzRDiZeMNNcZvpIphs2XoVsIpVvcfNMSsBSWUOG0Zc1YreH+hvcbyfhgWx+eiFf4q+a/V2SfSbMQ3H4QgWV8fcttJUYgilW7HPDR5QZXI/D4e3luY4qSz3WSJX7zCB2MZ+IoRJihDwOT60WNw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a347f738-4c60-4ab8-6e0e-08d7fffef7cc
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2020 16:24:44.2998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR02HT072
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

I know of a project which requires building multiple u-boot-versions 
within a single run (secure and not-secure) so this hardcoding esp. of 
the DEPLOY fragments doesn't work there and may lead to completely 
nondeterministic outputs in the DEPLOY dir.
If you could extract the currently hardcoded file name to a var, which 
then could be overridden for the specific context, the patch could 
really be helpful

On 24.05.20 18:17, Ming Liu wrote:
> From: Ming Liu <ming.liu@toradex.com>
> 
> It's really inconvenient to have ${PN} as part of the name of
> u-boot-init-env, for instance, in BSP layers, it could be u-boot-fslc,
> u-boot-qoriq, u-boot-toradex, and so on.
> 
> Considerring there is only one virtual/bootloader for a build, we could
> replace ${PN} with u-boot to not have to distinguish different names
> when accessing it.
> 
> Signed-off-by: Ming Liu <ming.liu@toradex.com>
> ---
>   meta/recipes-bsp/u-boot/u-boot.inc | 28 ++++++++++++++--------------
>   1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> index 80f828df52..188e5295cf 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -156,10 +156,10 @@ do_install () {
>                       ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}
>   
>                       # Install the uboot-initial-env
> -                    install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${D}/${sysconfdir}/${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR}
> -                    ln -sf ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/${PN}-initial-env-${MACHINE}-${type}
> -                    ln -sf ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/${PN}-initial-env-${type}
> -                    ln -sf ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/${PN}-initial-env
> +                    install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${D}/${sysconfdir}/u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR}
> +                    ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env-${MACHINE}-${type}
> +                    ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env-${type}
> +                    ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env
>                   fi
>               done
>               unset  j
> @@ -170,9 +170,9 @@ do_install () {
>           ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
>   
>           # Install the uboot-initial-env
> -        install -D -m 644 ${B}/u-boot-initial-env ${D}/${sysconfdir}/${PN}-initial-env-${MACHINE}-${PV}-${PR}
> -        ln -sf ${PN}-initial-env-${MACHINE}-${PV}-${PR} ${D}/${sysconfdir}/${PN}-initial-env-${MACHINE}
> -        ln -sf ${PN}-initial-env-${MACHINE}-${PV}-${PR} ${D}/${sysconfdir}/${PN}-initial-env
> +        install -D -m 644 ${B}/u-boot-initial-env ${D}/${sysconfdir}/u-boot-initial-env-${MACHINE}-${PV}-${PR}
> +        ln -sf u-boot-initial-env-${MACHINE}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env-${MACHINE}
> +        ln -sf u-boot-initial-env-${MACHINE}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env
>       fi
>   
>       if [ -n "${UBOOT_ELF}" ]
> @@ -245,7 +245,7 @@ PACKAGE_BEFORE_PN += "${PN}-env"
>   
>   RPROVIDES_${PN}-env += "u-boot-default-env"
>   FILES_${PN}-env = " \
> -    ${sysconfdir}/${PN}-initial-env* \
> +    ${sysconfdir}/u-boot-initial-env* \
>       ${sysconfdir}/fw_env.config \
>   "
>   
> @@ -269,10 +269,10 @@ do_deploy () {
>                       ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_BINARY}
>   
>                       # Deploy the uboot-initial-env
> -                    install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${DEPLOYDIR}/${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR}
> +                    install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${DEPLOYDIR}/u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR}
>                       cd ${DEPLOYDIR}
> -                    ln -sf ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR} ${PN}-initial-env-${MACHINE}-${type}
> -                    ln -sf ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR} ${PN}-initial-env-${type}
> +                    ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} u-boot-initial-env-${MACHINE}-${type}
> +                    ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} u-boot-initial-env-${type}
>                   fi
>               done
>               unset  j
> @@ -287,10 +287,10 @@ do_deploy () {
>           ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
>   
>           # Deploy the uboot-initial-env
> -        install -D -m 644 ${B}/u-boot-initial-env ${DEPLOYDIR}/${PN}-initial-env-${MACHINE}-${PV}-${PR}
> +        install -D -m 644 ${B}/u-boot-initial-env ${DEPLOYDIR}/u-boot-initial-env-${MACHINE}-${PV}-${PR}
>           cd ${DEPLOYDIR}
> -        ln -sf ${PN}-initial-env-${MACHINE}-${PV}-${PR} ${PN}-initial-env-${MACHINE}
> -        ln -sf ${PN}-initial-env-${MACHINE}-${PV}-${PR} ${PN}-initial-env
> +        ln -sf u-boot-initial-env-${MACHINE}-${PV}-${PR} u-boot-initial-env-${MACHINE}
> +        ln -sf u-boot-initial-env-${MACHINE}-${PV}-${PR} u-boot-initial-env
>       fi
>   
>       if [ -e ${WORKDIR}/fw_env.config ] ; then
> 
> 
> 
> 
