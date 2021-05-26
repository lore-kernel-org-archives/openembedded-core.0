Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.92.67.82])
 by mx.groups.io with SMTP id smtpd.web10.9810.1622045276652644421
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 09:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=aT7KCDTg;
 spf=pass (domain: outlook.com, ip: 40.92.67.82, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kgiRhnqsOD6Pg9RDOgNWHRncTFh85PLk4wRtFrntZB5Lbd835/l3dH0267lfKJqNLntytgM0yStHBKofeQnlgd3YtFU3caDnrUV3Nmx2mLUSdGZ24h0VisBiY7TC566BmefOMenPFctkHFlYEFAwRiwhv+GKNEq9O5GERAXtiO+8utsnmPsczQkVdO+/yG0D0cOZMql6/nBgsqJLxUuGyewj5ay9PpYb8IeLYXIMoGovN1q688n1DaKYf55WKukmoa9Gtfmy/YDpEcKlA9v1Ykc7bCW5bQOH3fpiKOkL9+xLlUHzbmPwzkfRWEc7t1wxRl9N28Cp+nUuaV4UF1trdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHV1MNMb3E1hNEPCK7pVMEqzZeGSJoL8X9setXZxIIo=;
 b=EwUJFkln7yVRpQi81trwpq7ikiQjCypdyQWOzcinq6QUkEJ6V8TaKQbGO2UqMkncAM91UPIXImyczxSlkU6dTQT/x+83A1SCkHQzPe/VpK4QCqLhQxbpHesJtpmjxVEyiDfJapNmOk7C4vJIzBht3OdOiM7tkAYau5UI9tNWVA1dKkMDqg5uaboERAdEFsDZR+XKz2Fmwmju4fUTLbR3UlHBD2Or9PoGFKGod8WEZyCMT2WSLB8A/LNviMfSp2pklUjNBBF5bc1Pd92SlSZ26OHFAoQZybSEtl+vXIOoZKTL8OBm5okXm5UxpVIQr+inXtma5JODp9f0dK7guAVHhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHV1MNMb3E1hNEPCK7pVMEqzZeGSJoL8X9setXZxIIo=;
 b=aT7KCDTgXtHhwHJ6bDv2xbuGkju9BAEahNXXkhceFxT2E6BENlxTPgfI/s1Gi3CD0s71TC6ttD8fZ/EXwMb7sQEka3qpAk93g/irK2e21VPm0zoC7AwOFrEgIugbuk6AYc9Mu2A0mpg4ydXBJUdrzn6hjDJVaXLj5eOcgiBjdZWwzZQ6QH6dYQLGaMIqwa8rpAb44eSVFRV5csyTcfVV9InWbn321a+eOjtbDQIow2Ojd/pDSpllV2AWq2ZYdRLOvfi/XH9pP1KHkcIO1ziQxA3mYpSrR5jHr4Ww9FniBjuFn0JWHtMB+2Flj2V+zLCnfiP8zDBtFrT6WzxRJyo4kA==
Received: from AM5EUR02FT032.eop-EUR02.prod.protection.outlook.com
 (2a01:111:e400:7e1c::41) by
 AM5EUR02HT187.eop-EUR02.prod.protection.outlook.com (2a01:111:e400:7e1c::278)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 26 May
 2021 16:07:54 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:7e1c::52) by AM5EUR02FT032.mail.protection.outlook.com
 (2a01:111:e400:7e1c::109) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend
 Transport; Wed, 26 May 2021 16:07:53 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:734C4A32D2983501B58EB431AAF155ADE81A8DF1D84A0993FD27EBE3029D4F6A;UpperCasedChecksum:D7B774E33ACFAF29F45303445D0E10D8B3800FD2D4D3CA124674EFADDA63EA8D;SizeAsReceived:8653;Count:48
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::9c9b:9858:17df:de84]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::9c9b:9858:17df:de84%6]) with mapi id 15.20.4173.021; Wed, 26 May 2021
 16:07:53 +0000
Subject: Re: [OE-core] [RFC PATCH] rpm: limit xz threading
To: openembedded-core@lists.openembedded.org
References: <20210526143021.3920457-1-ross.burton@arm.com>
Cc: Ross Burton <ross@burtonini.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB464243195811A0A545893993A8249@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Wed, 26 May 2021 18:07:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210526143021.3920457-1-ross.burton@arm.com>
X-TMN: [5tOVYPLVGcGkJf82lkHyG07NhdSjlZOL]
X-ClientProxiedBy: AM6PR10CA0066.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::43) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <e24481eb-12ea-3830-3dca-870bbbe9b253@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.92.63) by AM6PR10CA0066.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::43) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend Transport; Wed, 26 May 2021 16:07:53 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: b0f138dc-484f-4fbf-df55-08d920606b27
X-MS-TrafficTypeDiagnostic: AM5EUR02HT187:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	k6Wp/35lFJPlN9BDjSw8VnOGXZdgoWIChshqmU23gFHwZNP9OP8BE+05RsbQOMUxy9Cwlg5VbmDBHpnu122HukzCm8Xa5CIMCekd4+7tAsMMtKjNKuFrPU3UqAxlD5XAztPitkPwMmsNDjCocGSnR+3acc0G9X83s6NiX2DOq+Gh2T3ysP0Xdce/usxrhlnG6/KAH4qABA6gg4F2asXOZP1ucD1rTIDyNPVdvdOU8cgyxNRvhX9B8EnvKpWJbmfznP704y9ZHk4gwtj0hUQwg3HRWJ7n+OXL0rEuORjsGysCwX3TWzLjwqQsgqLEV953vu7eCnAr/y6Gu671WYBpUMnpiedJZ8REhNM6jV/gZvapyI3fV351UTlPemogWLxepw35xCVwJyd6ssIeYrJVlXn1pty1FcynI4lHEa2JD1vrafbfgiNhmNLxZ5X5wHd9EPXW8PISrp8lF5IsLd10zw==
X-MS-Exchange-AntiSpam-MessageData: 
	EHI8urDBypzrVPJYNLrevXPVN733RPezFzsaJVmgaKObmTNVrdLCEIVlZR52YfjgKWeF8PpBBt0hOam0qP8TdacPSRJCTGnbIc9MBDWk/+mwayl5PgZFcrdUQbERVMRYa28Ujtn7+Mz2gsW+hQIw4Q==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0f138dc-484f-4fbf-df55-08d920606b27
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 16:07:53.8769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR02FT032.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5EUR02HT187
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 26.05.21 16:30, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   .../rpm/files/less-threads.patch              | 24 +++++++++++++++++++
>   meta/recipes-devtools/rpm/rpm_4.16.1.3.bb     |  1 +
>   2 files changed, 25 insertions(+)
>   create mode 100644 meta/recipes-devtools/rpm/files/less-threads.patch
> 
> diff --git a/meta/recipes-devtools/rpm/files/less-threads.patch b/meta/recipes-devtools/rpm/files/less-threads.patch
> new file mode 100644
> index 0000000000..d6db85f28a
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/files/less-threads.patch
> @@ -0,0 +1,24 @@
> +Instead of telling XZ to use as many threads as there are processor cores, just
> +hardcode this to 4.

at this point I read 4

> +
> +On large systems with lots of cores, XZ will use unreasonable amounts of memory.
> +For example, my ThunderX2 reports 256 cores and rpmbuild takes 3.8GB of resident
> +memory when packaging cmake. Limiting RPM to just 8 threads reduces this to
> +1.2GB without massively reducing the compression speed.
> +
> +Upstream-Status: Inappropriate
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +diff --git a/rpmio/rpmio.c b/rpmio/rpmio.c
> +index 52be6a38d..c4034e9e5 100644
> +--- a/rpmio/rpmio.c
> ++++ b/rpmio/rpmio.c
> +@@ -799,7 +799,7 @@ static LZFILE *lzopen_internal(const char *mode, int fd, int xz)
> + #ifdef HAVE_LZMA_MT
> + 	    } else {
> + 		if (threads == -1)
> +-		    threads = rpmExpandNumeric("%{getncpus}");
> ++		    threads = 8;

...but here it's 8 :thinking: (I know 2xthreads == cores, still I find 
the commit messages very confusing). Wouldn't it make more sense to 
externalize the value, so that patch might become upstreamable?

> + 		lzma_mt mt_options = {
> + 		    .flags = 0,
> + 		    .threads = threads,
> diff --git a/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb b/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
> index 95a6f5cf71..f7e9378061 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
> @@ -40,6 +40,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.16.x \
>              file://0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch \
>              file://0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch \
>              file://0001-tools-Add-error.h-for-non-glibc-case.patch \
> +           file://less-threads.patch \
>              "
>   
>   PE = "1"
> 
> 
> 
> 
> 
