Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.92.73.91])
 by mx.groups.io with SMTP id smtpd.web09.7436.1620991619768859839
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 May 2021 04:27:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=BwN2L8nh;
 spf=pass (domain: outlook.com, ip: 40.92.73.91, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mKmpG47gahsgZxdKfqx8LKYwRW0loexv2WF45rjg1FuDY2oGF2f6JDMFi77N2kMqt1seGW8E7T2Cq7rSL3lUHOKFsUCrjIO33m7wyk3vQ3j/gKrf1Y3IUrMlgFXnamsQZv54kpwIO/BpddqjdJH0muPXlXzwYbXQ3xqkAc2x5F2xKxQVfr+052q9a3zAjpp9xEhzsx44ma5dqLfVOcl9QZjOS7GISOqpi6olUsgT8IjysBSCwGwb+vjop+nYmqPSFELWhbfXUlULW10VfaOcJlz/HokchpJpWN7zrYOc8CdfRhE8idOiBDZUjGv082lRhiEOx7dqs9q4y0pUJr5myA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3oW6wcERpWLOrHnLWxIgvfgn4WqOD6vT6Ssi0C9ZEWY=;
 b=Cp9zyINaBEMt6JS1/aYNgZ0w1dxDC9Dgv/6cC1YNnZUfHf7uOGwxvZq4FpVq0L5RJ15Fz1EGGKMiCqToqEOJjo1Brvm5x0CYGC9DU7UjHAChZf1wLUqCQYN2gIXWjNiI9ZcBeHoNk+TPrz+Lj+RgfhmPEKV8D0G84INC+XVmJwUE/0vKfkGDjF4o5tk2oufKjsAUZOba9x3Ac04VFvsXlKo+ke3XuMrjQ0cE43Ik7kg3k2QioJ/XC9qeT5sbjNgBqJE8ehik5oaoiLqi05IVnklzL5foWSQoA3tQ6tuF06MowWRAeYAqxzzLndExCry+n4Lrt08/rwdKX6Vd1XOgDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3oW6wcERpWLOrHnLWxIgvfgn4WqOD6vT6Ssi0C9ZEWY=;
 b=BwN2L8nhOLIrk3mL8c+F6aj7XhCc6jwmi1HqE1qNQrtZ7jwn1ZzQohbhnn5cWNASMgELPUw9dLkMudmYOR8cREW762MPdmQVIarYOoNMpVa9u7KEWZ+m3Pjvx9LKLljoKJteUdr61dCGGNPsPsENRSc8+cBbSW9oYfJeklVFhkddDCWuKc5K8WWUjn9zi8e4wWdHmsD1N1WEfOdxJ7R6zw6jp4Yt+oX1L0z+wpQaWOthXJ26ZQP2pRpEZFtdbnVnTtm+TWNMOQK/OxO56af1WhAtL4UvXchI78yy2meYRGKcCXSSR17iR0zYn1B1VEkoQm8qNd2H4OyqpftXA2uZqQ==
Received: from VI1EUR04FT011.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0e::45) by
 VI1EUR04HT148.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0e::379)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Fri, 14 May
 2021 11:26:57 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:7e0e::42) by VI1EUR04FT011.mail.protection.outlook.com
 (2a01:111:e400:7e0e::67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend
 Transport; Fri, 14 May 2021 11:26:57 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:E7DD7ABB4A068FBFA0265B8428F51D1B0D3400EE497D93904780C39FA493D4D1;UpperCasedChecksum:6489940A8859A4718F1B14D653C27AE77FB643119E6FBE0ACC4B88106AC67733;SizeAsReceived:7859;Count:47
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::9c9b:9858:17df:de84]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::9c9b:9858:17df:de84%6]) with mapi id 15.20.4129.028; Fri, 14 May 2021
 11:26:57 +0000
Subject: Re: [OE-core] is there an easy to prevent *creation* of some recipe's packages?
To: openembedded-core@lists.openembedded.org,
 "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <15ece592-a5f2-5ca7-db9c-2fd614ea6eea@crashcourse.ca>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB46423C546EF564C11A177062A8509@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Fri, 14 May 2021 13:26:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <15ece592-a5f2-5ca7-db9c-2fd614ea6eea@crashcourse.ca>
X-TMN: [viqZuegZ41rNdBaeOpZZf8mc1XHIDPcX]
X-ClientProxiedBy: AM6P192CA0021.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::34) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <b0640bb4-15ca-d3fa-451d-39eb76c3ee25@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.93.18) by AM6P192CA0021.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend Transport; Fri, 14 May 2021 11:26:56 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: cb1f5349-555f-4e1a-094c-08d916cb2ede
X-MS-TrafficTypeDiagnostic: VI1EUR04HT148:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TwLgYzzIzEGWJvLk/OM2nZx22KVDHbyVDlCGU/HXiuDQUFpha671HQKhTpwVcMNttiJL+i9QJ5XUnbieEJh3QPFhspEyKa7ZYQy7yG8fms4IUSPrrezrAqrmA2JbAXYCvRpX68svNhL5lnzxp7JtFw0MDSpKtoxfP375OwXM86cVl9nmw3uqyogq5xw6zJ2vHb7sB6pabMC3kMQQFpQJy6jPFKQAjC+83Q5H+Wh1hkDQx/VgXjaIm02VwdSG/41XZp9tlfu8Ok0o0naufx7kBZV9AGka/gG9aYbHwmcqgo+EQBPS5u0yjvSXrssAnsR7Kja4uyFO9QhLRNkBEah5Oa4D9qC795s7PfI9TNgmID65TbebnWw7HyUDxPDxMPOzCBFmegZuHAbmGGjRBHzmhQLSQaG6SgTX0c8GRgIdYfbQWP+gxWbIlomuqk1JQEug349MHcB0+CLS/kcwhj7o8xfQ9EnVZhDvxyQ8jBv6EdI=
X-MS-Exchange-AntiSpam-MessageData: 
	cbHM+upnpg29wDfxEVv/xzMG2AJUSrOVPe/8eGzAbqSa06LQ4ZAvmuiZ+45xxeoi2zGFztQr+abdHGjFdwbYZ92ZaRORivcNb9tUg5hnpM+4IjyRWJhiSg8npGKSCfhJsW5o7lwApzZtUTBQwfBMmg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb1f5349-555f-4e1a-094c-08d916cb2ede
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 11:26:57.2918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR04FT011.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR04HT148
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 14.05.21 13:16, Robert P. J. Day wrote:
> 
>    pretty sure i know the answer to this one, but was asked the other
> day and wanted to make sure. in order to speed up the normal OE build,
> someone suggested bypassing the creation of packages that weren't
> going to be relevant, such as -dev, -doc and so on -- the idea was
> that that could make a significant difference in build time.

I pretty much doubt it will speed up anything.
If for instance the -dev package will be removed from PACKAGES it is 
very likely that the files of that package will end up in the base 
package ${PN}, which results in larger target packages that need to be 
installed (and potentially further RDEPENDS)

Furthermore this will break DEPENDS for recipes that do rely on the -dev 
package - so chances are high that this will break (or magically change) 
something further down the line.

One thing that you can do to speed up the build process in terms of 
packaging time is to delete any **really** not needed files in a 
do_install_append, if no proper configuration option (cmake flag, make 
flag, PACKAGECONFIG) does exist which prevents the creation of these 
files in the first place.

I would recommend not to mess with the packaging defaults for reasons 
such as speeding things up - as this is IMHO addressing the issue at the 
wrong end - just make sure the files in <workdir>/image won't get created

> 
>    i pointed out that, based on default package definition as found in
> bitbake.conf:
> 
>    PACKAGE_BEFORE_PN ?= ""
>    PACKAGES = "${PN}-src ${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc
>    ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
>    PACKAGES_DYNAMIC = "^${PN}-locale-.*"
>    FILES = ""
> 
>    FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/*   ${libdir}/lib*${SOLIBS} \
>              ${sysconfdir} ${sharedstatedir} ${localstatedir} \
>       ... snip ...
> 
> for every recipe you build, those *are* the packages that will be
> built and populated, short of overriding those values. i suggested
> that, in normal behaviour, if you check the generated WORKDIR for any
> recipe, you would first find the full package breakdown under
> packages-split/, where individual package contents can be examined,
> and you could further check out the rpms under deploy-rpms/, which
> would be built regardless of whether you chose to install them or not.
> (that's correct, yes?)
> 
>    i finally suggested that, sure, if you do some ugly hacking, i
> guess you could save time by not even creating some of those packages,
> but i speculated that that wouldn't be a significant saving and that
> it wasn't worth trying to cut corners like that and you were more
> likely to break things than save any meaningful build time.
> 
>    thoughts?
> 
> rday
> 
> 
> 
> 
> 
