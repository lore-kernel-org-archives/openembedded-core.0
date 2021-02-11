Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.100])
 by mx.groups.io with SMTP id smtpd.web09.5642.1613028091318366448
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Feb 2021 23:21:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=k1799gY+;
 spf=pass (domain: outlook.com, ip: 40.92.90.100, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XHKiWsUufrCVqJBQf6KuNCX5ve0/pc2rMzhsweJzFKLyXbzPxVmamKFT/grY5eH9yfiRUqOhntERILws1GgmGEELZKVaQU33Co+iLpeyTHo29XbZHcCGDn3DyD2QVnqqiE+llunjYpA9gROE4mulQCtueQyczb7GRO4VXMXIoo+WHiOvQ0fm1dW6tblLx4UQXyzXxkENZvsvRONafE5Pz/chxLzpZTKliTkP02w5lONoVta0EVuSW4UvEAIq3FWV5cyxL/Zl+ncSz6loVCkVXv7ORNbu38m+VtFFMTE0qfBzd5rvbf+4NZeBk7VC1o++B+9DqGK5qzEl9nx8owPwrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aV2Ryb5TszdxCJutPv/EuBjCL3J4GMotCl3i2A4GR4U=;
 b=kK4QUVSYv54/OadqoCZ8oEmRx/NHYqlF9x1H/soqKznGQ/Qtpx0N5k41TB+4vecee1W2nmfMiuy/mD4UQPRYvT1Pr5i41+gnXkqoV1b8faBrMlPigEpifzZkljulv2bPFf+GsCiEUnqC/RN+gPp404HhVKYgdqCSoWIgARInr8jC5sWyVNidVzvCqhD2ONIApugyKKOWTbW/SalUbIcEyekVqb/4fhG99+L6z7HrxyzRkW/OdF3tRySyyZeiPSJDWzbnL29SV3k7ZjIoq9B6HOhuo70SvwbB1aEVvm4yfLd+xxNIMjdRN6tu89cKS6HZlUWsVV0NuZtdYYPW7oiHWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aV2Ryb5TszdxCJutPv/EuBjCL3J4GMotCl3i2A4GR4U=;
 b=k1799gY+iRXHofJXSueIMgezZK4G9leiq1Oshh1MxZ0/Sz56FClaySnC7ZDzcUKBAW3sSTj25GzkXMhKVNae2bhyaIF4PLUIdsM8QWQMyoKsKXKz9mYH6oFqUoChGE3Zpm/YBcjrfQqqBR05ixkmlW23u8UfRKaWKuzj5tWPegVOVQTGjwMyltzap+PQ1hAAcSGLVXiaYoxxAYQ9tN1/S/7mKFNjstaOhZ22NJzdr0A6tFxC9IfYz34I59IkJFL764ZdJDgA2Bfrq9aiYyfMdSsLYq/dO5rAzon/4N/g0Xzo74Xsh0+8GVAr+wWSePLqv4sGJK6aDO9ZhyW1her/CA==
Received: from AM6EUR05FT033.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc11::4e) by
 AM6EUR05HT030.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc11::348)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Thu, 11 Feb
 2021 07:21:28 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (10.233.240.58) by
 AM6EUR05FT033.mail.protection.outlook.com (10.233.241.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25 via Frontend Transport; Thu, 11 Feb 2021 07:21:28 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:4825E0FDD9FD866C7C4D21A5715DB66050A6A661107416F99DA38E5E53BFAC07;UpperCasedChecksum:6B4C55D6168D4ABA6F584F8E4D02A62F69BC90615DD28CD74323135D9926DC32;SizeAsReceived:8695;Count:47
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d88:562c:471c:9560]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d88:562c:471c:9560%6]) with mapi id 15.20.3846.029; Thu, 11 Feb 2021
 07:21:28 +0000
Subject: Re: [OE-core] [PATCH 1/2] insane: Add test for native/nativesdk inherit order
To: openembedded-core@lists.openembedded.org, tomasz.dziendzielski@gmail.com
References: <20210124095546.3329-1-tomasz.dziendzielski@gmail.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB46421810B3B2B59AAB545357A88C9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 11 Feb 2021 08:21:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210124095546.3329-1-tomasz.dziendzielski@gmail.com>
X-TMN: [QKovPreY9G8zT88yeVgBgBGs5s73QiaG]
X-ClientProxiedBy: AM6P191CA0093.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::34) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <0dcccfaf-d461-5652-0837-b7218aeb5755@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.90.166) by AM6P191CA0093.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27 via Frontend Transport; Thu, 11 Feb 2021 07:21:27 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 973859f4-b449-4d1c-580e-08d8ce5da56d
X-MS-TrafficTypeDiagnostic: AM6EUR05HT030:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CCeK9yr0bhqpq+j/rJr4T//cg/5eolSgSEKFrE/modI9OsLLfCGQR4BgPelGk2GQRpiEJUpts3lkS4M3I6T+bJGbkJntDf53XocJk2xSs979yT83RCw2dkbginMDZxuT9xXRw3rfjk829SW7qCR8jQnNT8s28a+GY4eEjhwHsVza3L7tLWoGGVFwoBkRgv5GNlUfglJApL/GLxaRXuyGuq6KB2bV23K6nbyWrsXa2FkOxGWUm94HCboC9fxjsbbHMehAl54R9HO28GAtoh8NYVrrcFmSq3v35o4vpiLRFQMpi9RS3I5voA/Jp1rlprQjxf3XMAekqbcj860TcPfb0ywHcLgbVu9Tpy2oEC16dWLg7wE8vHkK1Ev72rhKHhqGTxwvBcphP+P0uQ32wN7MFK+9NPRRwxxslSXIUOI/ZTHsH0szZZ7RwsAaVpWaIA/d
X-MS-Exchange-AntiSpam-MessageData: 
	uEp2reWjAFVnCna/dsYiE8yVootoVLc2QGpSog85RWoqR4bQHslNdKkUx3lwCnT7t+qlPtHZiyHMiCIvbz2amKHtfxkKZDjHrSHMANW0rNIpw4PZF/Rssi6xjy40nf7hCgtRsRqQ18qg7Nj/qtYP4w==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 973859f4-b449-4d1c-580e-08d8ce5da56d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 07:21:28.6573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	AM6EUR05FT033.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6EUR05HT030
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

After this patch got merged I notice some "noise" in my builds.

For bbappends which inherit unrelated classes I get a lot of warning like

Issue: nativesdk-openssh: native/nativesdk class is not inherited last, 
this can result in unexpected behaviour. Classes inherited after 
native/nativesdk: my-custom-class.bbclass [native-last]

First it doesn't give any hint that this is caused by the bbappend and
secondly I have no idea how to fix that (if that is even possible).

So I would like to have at least an option to ignore these warnings for 
classes I'm sure don't cause any conflict - something more granular then 
just to deactivate this pretty useful check.

Thoughts?


On 24.01.21 10:55, Tomasz Dziendzielski wrote:
> Classes native/nativesdk should be inherited last to prevent unexpected
> behaviour.
> 
> [YOCTO #5729]
> 
> Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
> ---
>   meta/classes/insane.bbclass | 28 +++++++++++++++++++++++++++-
>   1 file changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 105d2a5ce8..3597943ddd 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -27,7 +27,7 @@ WARN_QA ?= " libdir xorg-driver-abi \
>               infodir build-deps src-uri-bad symlink-to-sysroot multilib \
>               invalid-packageconfig host-user-contaminated uppercase-pn patch-fuzz \
>               mime mime-xdg unlisted-pkg-lics unhandled-features-check \
> -            missing-update-alternatives \
> +            missing-update-alternatives native-last \
>               "
>   ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
>               perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
> @@ -1366,6 +1366,32 @@ python () {
>           d.setVarFlag('do_package_qa', 'rdeptask', '')
>       for i in issues:
>           package_qa_handle_error("pkgvarcheck", "%s: Variable %s is set as not being package specific, please fix this." % (d.getVar("FILE"), i), d)
> +
> +    for native_class in ['native', 'nativesdk']:
> +        if bb.data.inherits_class(native_class, d):
> +
> +            inherited_classes = d.getVar('__inherit_cache', False) or []
> +            needle = os.path.join('classes', native_class)
> +
> +            bbclassextend = (d.getVar('BBCLASSEXTEND') or '').split()
> +            # BBCLASSEXTEND items are always added in the end
> +            skip_classes = bbclassextend
> +            if bb.data.inherits_class('native', d) or 'native' in bbclassextend:
> +                # native also inherits nopackages and relocatable bbclasses
> +                skip_classes.extend(['nopackages', 'relocatable'])
> +
> +            for class_item in reversed(inherited_classes):
> +                if needle not in class_item:
> +                    for extend_item in skip_classes:
> +                        if os.path.join('classes', '%s.bbclass' % extend_item) in class_item:
> +                            break
> +                    else:
> +                        pn = d.getVar('PN')
> +                        package_qa_handle_error("native-last", "%s: native/nativesdk class is not inherited last, this can result in unexpected behaviour. " % pn, d)
> +                        break
> +                else:
> +                    break
> +
>       qa_sane = d.getVar("QA_SANE")
>       if not qa_sane:
>           bb.fatal("Fatal QA errors found, failing task.")
> 
> 
> 
> 
> 
