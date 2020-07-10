Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.42])
 by mx.groups.io with SMTP id smtpd.web11.6313.1594368942297060904
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 01:15:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=AVo3bC58;
 spf=pass (domain: windriver.com, ip: 40.107.94.42, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HhXkpZAF07qE/ZSRrDdy29l9Yo1alCt6tZhJVTvMSI+ZLSoeScNwTkTBlth5xPhMULN7IUkDrY9ksyb+SDL/vZwlxAbF6SF2mXoy2PvzoRCBeHMCtBsvXNzEsD8krZDZx01/wTv0umGM4Iklu254g2ITZYU6pp1sjLSmkP8TjludUFEHh1yKbMUMk1DXAKVOsMXwQVpktoEqTQv2kXsL69WuDnBRgDyZ7X5mVx1BQJILTX+FIIWNpTASrKHkFuKI7YFANBbN27sPhv7yI59J6srShXKQX2Ki+XLRhBo2ajh6Ro7iEic3ifpt1HtTBv83kNV0SO8kkEvErXGkPYaLCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZF2mfygrZIgah+YEa92v3L9YDFHLU3HSCL2BstgFO9c=;
 b=XcMyh1FGv0QfIlZE1CJcV2XkuTiLSn016D+3ak3tCwtWdY0qOtwDBKrs16r7Nm/OrD+vIzyC1476b0aQJrdA2RmYXGDamrsdJjEj5ZDdvnjcBEei+uRrxHnZcF0vcK2xWBiZ8weWL2JZUkNktBOnM6ASIMN+0jgyz0WOojTI7gTlL3V7Hd6YCcKTZq7l7/zDo3a+Yrvzlj1Z23P/Chn3n7M4+I2MGA+L3J5IRHWeP9gJa3ofFlzEGf2j4GFfmiKMpmq/iKaXUTIlUoNCsnDjqLxF/SbJkDuCxGxbNreZOqb/kCYp43b5mUCC11RU1tmwbpAdo7zppBSAHhhrgXBfRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZF2mfygrZIgah+YEa92v3L9YDFHLU3HSCL2BstgFO9c=;
 b=AVo3bC58TA0GyIn9N+jufHRGCOXUORcbg95N4iQmh5Uddu+S/oaaO+5efFpfx2sT4LJxVgnxO6H2gua+jqOkzFYJAcUXygHHtNa2hoi20sqY2D12Ttk3dk6Wow0GetK7oUvKGldDqQ6SfoZ4EAQ0jVK/1bJYkrDw1ZK/HkrskOc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
 by BYAPR11MB3623.namprd11.prod.outlook.com (2603:10b6:a03:b5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23; Fri, 10 Jul
 2020 08:15:41 +0000
Received: from BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::19f6:49b4:700d:c360]) by BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::19f6:49b4:700d:c360%3]) with mapi id 15.20.3153.032; Fri, 10 Jul 2020
 08:15:40 +0000
Subject: Re: [OE-core] [PATCH v3] netbase: use git fetcher
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
References: <161F1A6116A44000.17108@lists.openembedded.org>
 <1620523CAB9A3A43.7755@lists.openembedded.org>
Message-ID: <21bcfaa1-b7b0-ce6f-eda3-818599902dc1@windriver.com>
Date: Fri, 10 Jul 2020 16:13:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <1620523CAB9A3A43.7755@lists.openembedded.org>
X-ClientProxiedBy: YTOPR0101CA0051.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::28) To BYAPR11MB2598.namprd11.prod.outlook.com
 (2603:10b6:a02:cb::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.138] (60.247.85.82) by YTOPR0101CA0051.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend Transport; Fri, 10 Jul 2020 08:15:39 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d192d2cc-2f43-49eb-f268-08d824a96f17
X-MS-TrafficTypeDiagnostic: BYAPR11MB3623:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3623B3D896EDC5CFA864F4E0F1650@BYAPR11MB3623.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 046060344D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7085IaPcDFepx0QNlxfBvDLUpJ8dT5Dt/GVOGYKNd3gjIwauIB3cYYvI6/PzLoFWzN9ZsuVJTpHFurnSO6XarvYN4SY9Ceb6UsGUJKYRRRgKN+0hyeBQa/AA5dy4Y5JtU+vpuvcc/GtFqi1YB2Y1FUCBX36JwKy7oGidqRkCujLgi6vPdzhMKwV5TuwOMAsTSvGDkS5rku2RWCLgyMJGqa8q0a7mkIrDyNhZMpAmDfUtIv7Xnqt6ik9LJ2J73Nt4+CIhkSE0lSsx36JU+x8AeR4O6i3LznvhFpx1thEGw4gJG4vu5SJnWvEB6T3JdG6yopD3Glvj76UNeeq2NNSMP8wx06z43Z6ANK622ntceE8Qek69ThAFPRKuW8tTGAF+vLkyeLxciOq7fUM+JxghLHzcNuRyeEhE+L+CJ2a+HGUpbjTVVPDDmreY8CJW+3L2DA90Iv34MXttKF1C4bjysNZ/PUDjedkebC9Kiy7d/s6TIXRME6C/YLXAf1JStGMn+nvSI1BKb9PTsoQlN4CM6w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(346002)(376002)(396003)(39850400004)(136003)(52116002)(6666004)(16576012)(66946007)(66556008)(66476007)(316002)(8936002)(31686004)(16526019)(2906002)(8676002)(26005)(36756003)(83380400001)(966005)(478600001)(5660300002)(53546011)(6486002)(31696002)(6706004)(186003)(956004)(86362001)(6916009)(2616005)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	l9sdgWwDcuqf1XcAv1xa57crZUOQSRTzWhjLkLxgEBkubmBNZYs+8OVz1GkrLWP+3fmEKlvuTmftWyXVIz8VycJzvQo6tTQNplhumaMjF/kaqfLDXejsHCHrRh/ynjXS+t80wXI2BGFta/gYGC4CjcXD+/u2E2JdjGz9P3qI3lNDodK+njU/fBf/RzyNEVYZ2jHOaB0najuWP5V0ZJGUAIQiwhX25U5Kh+N26Lfxf3B3J+kFS9SXwipgps1Pba5F/D+Z6QenGmd/HOxSgGkR9fM2lgs/nZV0dWQxgyyBakgHYQU8Qeh76aTq5L2qTmRA66DEtUoOzZlI49DJeWLNcYXgDzwkFac5hYxVq7QFZxeAjKwb+m6fmY7u5DBeByZLC4LheCCTEzEvq0N5G/vVfPPUSQdIbQCbpktMiJKblXdh2BEIG3TwHkzu63/7vFd2pFmdwIxHqi1zikelI+A30qlOt13CidGe4HZF9r7kSXg=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d192d2cc-2f43-49eb-f268-08d824a96f17
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2020 08:15:40.6337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4I6UyVTA6NrwfOp7qshyaq1kVAz0Nwr8Vv3rS1WIsXKB/kGDoYTtSUVoQ9ubvGuUfcX5r6GiDGU63lGI3/S6Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3623
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Please ignore this patch.

Thanks,

On 7/10/20 3:01 PM, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Use git repo as the the previous URL only stores the latest
> source file and fails to locate the source tar file if we
> don't upgrade timely.
> ---
>   meta/recipes-core/netbase/netbase_6.1.bb | 19 ++++++++++++++++---
>   1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-core/netbase/netbase_6.1.bb b/meta/recipes-core/netbase/netbase_6.1.bb
> index bc0049c0201..491e6bf4cbf 100644
> --- a/meta/recipes-core/netbase/netbase_6.1.bb
> +++ b/meta/recipes-core/netbase/netbase_6.1.bb
> @@ -6,10 +6,10 @@ LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
>   PE = "1"
>   
> -SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.tar.xz"
> +SRC_URI = "git://salsa.debian.org/md/netbase.git;protocol=https"
> +SRCREV = "0fc1e4ce39328f7388badace0aaf7b7294d5ed61"
>   
> -SRC_URI[md5sum] = "e5871a3a5c8390557b8033cf19316a55"
> -SRC_URI[sha256sum] = "084d743bd84d4d9380bac4c71c51e57406dce44f5a69289bb823c903e9b035d8"
> +S = "${WORKDIR}/git"
>   
>   UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/netbase/"
>   do_install () {
> @@ -18,3 +18,16 @@ do_install () {
>   	install -m 0644 ${S}/etc/protocols ${D}${sysconfdir}/protocols
>   	install -m 0644 ${S}/etc/services ${D}${sysconfdir}/services
>   }
> +
> +# The reproducible test failed in autobuilder env as
> +# https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20200630-_jn1koza/packages/diff-html/
> +# But I didn't reproduce it locally when run "oe-selftest -r reproducible.ReproducibleTests.test_reproducible_builds"
> +# Per the logic in meta/classes/reproducible_build.bbclass, it should use
> +# get_source_date_epoch_from_git to get the SOURCE_DATE_EPOCH after we
> +# switch to use git fetcher, don't understand why the SOURCE_DATE_EPOCH
> +# is different between reproducibleA and reproducibleB during reproducible
> +# test in autobuilder env. The only difference is reproducibleA use sstate
> +# but reproducibleB not. Maybe the sstate in autobuilder env has some problem?
> +# Anyway, use the default value for SOURCE_DATE_EPOCH from meta/classes/reproducible_build_simple.bbclass
> +# to fix the gap as a workaround.
> +export SOURCE_DATE_EPOCH = "1520598896"
> 
> 
> 
> 
