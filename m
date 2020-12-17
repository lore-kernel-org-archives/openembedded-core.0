Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.92.74.88])
 by mx.groups.io with SMTP id smtpd.web10.5770.1608199423238532583
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Dec 2020 02:03:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=Se7fQDGH;
 spf=pass (domain: outlook.com, ip: 40.92.74.88, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kk3oW+U/dFZyrRBfCYmirJ/Ni2W63LrUTPSvHR2zIczxCRSbQs8OghzEWu50BhxDX6p8aV+NjW/r/ygUgdwLLrVg76j23wvTWVdfLDMTEvcH6d4bTKdvkKBR1LQTKRsfDrxQIMP+Sw6MzJ1Cj9PZ1GZ5Ax1XMm+7HbCViFBlpQdL6p49MSIs0DbbVmBKnPkvXKbZFtuqJv0ydYmSKhsvFoFxuNNf7MWMII9c+E9wyz+HiVbuBxDccU/7b3hlb4Pj6QCdi9z7f1H2M3ofbxEpJTtblxcL8m2bpg22r0MTLimOGGIESVXeDxpo7a29YhF9vXhpIiwV5ZX9N76Q2B6Fjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eb9EcOox3sXHWTbcf6Oh88lVxuV0/T9VPtD7PyXNIDw=;
 b=oUuVl7j/KSJm4+7IaQ3KNOg51qG4vhkVB2bN40+KzAAdZfeGMXBhjluPMsZeV6ZyIuszAAETyh6lHiOd/ttL1BaMb8Du+lgt0nwPhd+vtG/DbW9vNAWyYxIfTn9iKc8JUJ6YwEi7grzoFq1yufdFCMtPz1+/DENI6jvm0OkxUgB33IdES0ZG5JlqxpiQ6/2ot2EDyq2FOZ6uQDnvJ3XnsUigBIpuTAvMqL1HECvpIcYLuueVlsLzFbuHmpkBkXndBcFPYZo+RS1QAHyOfnWge9xzRE7gGzC9QKncZkbiKyLF4WX3YTFf69BYHVin2+lGjPAu2KdPrh8KFhgnQKoGyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eb9EcOox3sXHWTbcf6Oh88lVxuV0/T9VPtD7PyXNIDw=;
 b=Se7fQDGHcXgSqlIVnK9iFz0018qDxjjK35j69T0PzJMKptOpAwHg2ITEWlhApa3o/3LO932vYy+jovTQPLWKAAd2sqKRaavEMDITCTnUq5yWIx21UleoITIpU+mjY8xrqEcQV8dMJ5ioUSDz9TrWUd45m2e3S1i33WIBSkNeQK/Nz36H8gFDI1Imv7SpXgYNOKQ1h8oAY9x2h1o5i/I9E/niKCnhXoEvkKD8GW+sPW4mFKHbk6Vx4gj8sJYeXrojXZCgNN/mjYh+1kjBr0gOSzbq42Wr+S/f+BzBRicMrE43rPYFJYxljJI2OD6IobCEhMLG/3klWJ4ef3EHSeWhpw==
Received: from DB3EUR04FT011.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0c::4b) by
 DB3EUR04HT125.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0c::80)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22; Thu, 17 Dec
 2020 10:03:41 +0000
Received: from AM9PR09MB4739.eurprd09.prod.outlook.com
 (2a01:111:e400:7e0c::53) by DB3EUR04FT011.mail.protection.outlook.com
 (2a01:111:e400:7e0c::276) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22 via Frontend
 Transport; Thu, 17 Dec 2020 10:03:41 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:8C1ADC7AFD911B502675120F137227D9765E5E7DD15EA4A0571D11C0542EBD93;UpperCasedChecksum:F94B71101DAFBC0B980ACEA03D5797051704D7EA8592E0C693062B45AA8B6011;SizeAsReceived:8656;Count:47
Received: from AM9PR09MB4739.eurprd09.prod.outlook.com
 ([fe80::f948:8335:6703:e772]) by AM9PR09MB4739.eurprd09.prod.outlook.com
 ([fe80::f948:8335:6703:e772%3]) with mapi id 15.20.3654.026; Thu, 17 Dec 2020
 10:03:41 +0000
Subject: Re: [OE-core] [PATCH] ltp: fix rpc build error
To: openembedded-core@lists.openembedded.org, kory.maincent@bootlin.com
References: <20201217095506.28531-1-kory.maincent@bootlin.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB473969D9F9FE59640D07DBEEA8C40@AM9PR09MB4739.eurprd09.prod.outlook.com>
Date: Thu, 17 Dec 2020 11:03:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201217095506.28531-1-kory.maincent@bootlin.com>
X-TMN: [2Iyg3oJff+aEYHHwVog+LCCXYmjqjmmJ]
X-ClientProxiedBy: AS8PR04CA0075.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::20) To AM9PR09MB4739.eurprd09.prod.outlook.com
 (2603:10a6:20b:282::12)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <bd7e88e5-bbf9-23fd-6ecc-4c7cddc91f1f@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.80.121) by AS8PR04CA0075.eurprd04.prod.outlook.com (2603:10a6:20b:313::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Thu, 17 Dec 2020 10:03:40 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 116b3e12-578d-4dbe-0be4-08d8a27307f4
X-MS-TrafficTypeDiagnostic: DB3EUR04HT125:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KncOWrS2sEqt8UE5C2w3DpjhxX86fTMDLeowsRp1cK0+bC2pp/qqWsdIUOkEPmM6k5KeGx+HyFncnTbPVl0PLtfSqkhLiGRveqqwN6r25pV+wuhUIv61wl67LkQrKN1H9mj47sBrE682CwEPXgnp5ZAQzxSdivV+zYdO9xziUdkHdlnr+qO849zBKeA8UsQZ0xuvvdle6aSNMZ0dVncSKVJCqD5gUKkaI7ZBhv2aLIMrcYEk+KKvmz1zAvD1d04UKkY1Hco2kmOMFPnUQX7sr8ARdYCLR3BtSQuJ+Am1eQ0=
X-MS-Exchange-AntiSpam-MessageData: 
	TB3VRyeBVnGJB0ACM3R5LB/G2z0Ax3Plt+h7JtoykxQjbnx0j8o3TDNZkJR/uK7Tw+93a4di1B/x6uMDQcgwDjg0Xjx8FHHrjrrl1ORntMBguTHl4Cc2znhGaNw8q0ypoNBIEWNeeJV0DFUvLfYJgg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 10:03:41.0621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 116b3e12-578d-4dbe-0be4-08d8a27307f4
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3EUR04FT011.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3EUR04HT125
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 17.12.20 10:55, Kory Maincent wrote:
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>   meta/recipes-extended/ltp/ltp_20200930.bb | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-extended/ltp/ltp_20200930.bb b/meta/recipes-extended/ltp/ltp_20200930.bb
> index 7acf15b360..9b17d68f67 100644
> --- a/meta/recipes-extended/ltp/ltp_20200930.bb
> +++ b/meta/recipes-extended/ltp/ltp_20200930.bb
> @@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "\
>       file://utils/benchmark/kernbench-0.42/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>   "
>   
> -DEPENDS = "attr libaio libcap acl openssl zip-native"
> +DEPENDS = "attr libaio libcap acl openssl zip-native libtirpc"

Can we have that as a PACKAGECONFIG entry, please? otherwise I think it 
will change the behavior of the existing setups.
Also the dependency has a `PROVIDES = "virtual/librpc"`, so I think 
depending on virtual/librpc should be the safest way

>   DEPENDS_append_libc-musl = " fts "
>   EXTRA_OEMAKE_append_libc-musl = " LIBC=musl "
>   EXTRA_OECONF_append_libc-musl = " LIBS=-lfts "
> @@ -44,12 +44,12 @@ TARGET_CC_ARCH += "${LDFLAGS}"
>   
>   export prefix = "/opt/${PN}"
>   export exec_prefix = "/opt/${PN}"
> +export libdir = "/usr/lib"
> +export incdir = "/usr/include"

Those should be ${libdir} and ${incdir} if I'm not mistaken

>   
>   PACKAGECONFIG[numa] = "--with-numa, --without-numa, numactl,"


>   EXTRA_AUTORECONF += "-I ${S}/testcases/realtime/m4"
>   EXTRA_OECONF = " --with-realtime-testsuite --with-open-posix-testsuite "
> -# ltp network/rpc test cases ftbfs when libtirpc is found
> -EXTRA_OECONF += " --without-tirpc "

Should be part of a PACKAGECONFIG entry, with `--without-tirpc` being 
the default

>   
>   do_install(){
>       install -d ${D}${prefix}/
> 
> 
> 
> 
> 
