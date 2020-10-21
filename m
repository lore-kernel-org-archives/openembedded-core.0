Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.92.73.35])
 by mx.groups.io with SMTP id smtpd.web09.16995.1603307331189403961
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2020 12:08:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=A6HIBdqd;
 spf=pass (domain: outlook.com, ip: 40.92.73.35, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oOlPm3J2fnSM5w69RxA/nX+Qwou5X+EYsYAw6wtL9iVeN9P6EHCfXBHBtJQOROnME0ZuPq1i6oZrHkRaCFHj6RY1DDc04sbQIbQu6eBiQ4afOlXbAIt80xc/G9y8VldhXKtH28CikYc6tVzPXN+ZpO2wpl+JswmB79rXdOTduF+L7tKIutg2OSAhlpG1sLHorSivt7I2SC6rspW7cAWo71od9VKWR9V/R2l101lN0cMWzSHoFxclj0QoHo85WiOlk8mvFPG9Bfob4mo2jYyBoH1d041I8M+tS9IBQSjggsIF7IIe016rtR+g2/SvaDO6WuzDKtsa4pJwK65OhWakOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jdqaXf3oBtrbx1Z4tpxvby3HAjpVyK94vH8GRln0xM=;
 b=eDU465SKATt8GgIyK2dwYkR9yH6+QimuVFSv1LxWoGVEoYk3bVFRZX8EUbF3m+pCm2JAC0EcW0xXgXE9jauw6m089V5uE5zu6o/fIXObl165LS/Pzx2Jg6+OcSt7OjD6N4TF6+YYxCikyiZZ7N8TzcswHTVUt31VSU7Ok0ucCI94BMB9PXq2Uxa3DkojrGbEPE3eqY0h9rJCqyBb1eHkL47PW+HToLYaRer/85tcIojuopZNwHxHnzg3V8SvCn0R5bWJDSZGluzWxfmJ8hAgn0kDi3GnqLo1V/P72ViUYQFB+/B8uCQ41LCfIDc7LD83dspJQsgsa/7HbI4whg41Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jdqaXf3oBtrbx1Z4tpxvby3HAjpVyK94vH8GRln0xM=;
 b=A6HIBdqd/XYRvRHnPqUkx+3NVqdiQuWI3CuGIWuBGnHwNonKTYI8j0wTEbE3oJdparMbQLvX4q+ge94s4lZnpacUYt1nW+/6/Og0REqjRfCg+4DRaffolKlGiHwftF9DExIKRc56LysdZHO2L0rD6bICYaba7U7yJRb3oWFHZBkwGdT+mKaUq4ZQcSY92Khqdfx+g6u2PfFqLYoCZR5iUTJKL0kzzoT6sU+jbpIbxwgMtuKNYZarb1r2BwLTxuL7KqW/+OkTPAf+/uEF2FxJTrLpJLzwInEDzRoSvq6S/VJh5vKlrkxp4JOih9MhI9v16saNxDvquo9vBsK2BNg0bA==
Received: from VI1EUR04FT060.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0e::4e) by
 VI1EUR04HT149.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0e::380)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 21 Oct
 2020 19:08:48 +0000
Received: from VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 (2a01:111:e400:7e0e::46) by VI1EUR04FT060.mail.protection.outlook.com
 (2a01:111:e400:7e0e::354) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Wed, 21 Oct 2020 19:08:47 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:E99AA7408ECBD90B73FC2F9C285E24DA2D8DC2E8E286448FE418FF4E41305576;UpperCasedChecksum:47C971FA46FB6586190545849B5021EF9E59CD51455BF57CA3C45C6A10F6503B;SizeAsReceived:8691;Count:47
Received: from VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 ([fe80::a1a8:ed42:7e0f:10dc]) by VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 ([fe80::a1a8:ed42:7e0f:10dc%8]) with mapi id 15.20.3455.037; Wed, 21 Oct 2020
 19:08:47 +0000
Subject: Re: [OE-core] [PATCH] Add new recipe for squashfs-tools-ng
To: openembedded-core@lists.openembedded.org, luca.boccassi@gmail.com
References: <20201021155857.2841570-1-luca.boccassi@gmail.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <VI1PR01MB6462255CF43C3222C6DF6281A81C0@VI1PR01MB6462.eurprd01.prod.exchangelabs.com>
Date: Wed, 21 Oct 2020 21:08:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201021155857.2841570-1-luca.boccassi@gmail.com>
X-TMN: [2KyLeD3uhyFp7xrzp9sZDZnk4QIabPuQ]
X-ClientProxiedBy: AM6P192CA0100.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::41) To VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:154::12)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <4d0f2672-8c56-8e02-730e-8d08427a1fb6@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.91.234) by AM6P192CA0100.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Wed, 21 Oct 2020 19:08:46 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: e03b7720-16bc-4fba-d54d-08d875f4bcb7
X-MS-TrafficTypeDiagnostic: VI1EUR04HT149:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lYHZGl09i6bcnb6kZa3zoLlRwvsL7x8psOArINV1oRbtIVO1lM0tIWJZ9PUdOaE4paXPSPe4M8xtenyxb6h/WBSs0gYSyRILPp/etTrqLVvj48IhFa6Oo0nK5PX/fid6+kt10/7e8glCriR1xkG50v78EFed8xs4troE94P40ygkupERhCFPi3Mzs4IuN4lpfqa0ROPbUP1vwYNXIJPgDCySh6FHAOpsIvIrLngawgNW8Xd/pjYvYfSdb1vY/YOf
X-MS-Exchange-AntiSpam-MessageData: 
	1MjxaTeQFRncBKMsG1nYlRDf+6cSdYiwA+KVpBxvTflQ47bT6JMz8BUslr8V0+JSTvT9hDEWbBavsx1nPQ9TvE38bCWeGWnYz3HNPGSVebgFcnqSSDlc84I9caLPisHfpxUVpwzuGUcYAytQC6bDpw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e03b7720-16bc-4fba-d54d-08d875f4bcb7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2020 19:08:47.8011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR04FT060.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR04HT149
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 21.10.20 17:58, Luca Bocassi wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
> 
> The main difference with squashfs-tools is the availability
> of a shared library and a programmatic interface, rather
> than just command-line tools.
> 
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
>   .../squashfs-tools-ng_git.bb                  | 37 +++++++++++++++++++
>   1 file changed, 37 insertions(+)
>   create mode 100644 meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_git.bb
> 
> diff --git a/meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_git.bb b/meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_git.bb
> new file mode 100644
> index 0000000000..bbc5f86ae9
> --- /dev/null
> +++ b/meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_git.bb
> @@ -0,0 +1,37 @@
> +SUMMARY = "New set of tools for working with SquashFS images"
> +SECTION = "base"
> +LICENSE = "GPLv3+ & LGPL-3.0+"

A bit of nitpick, but with all the license files mentioned below the 
LICENSE setting looks wrong to me.
I would at least expect some BSD and zLib SPDX identifiers here.

To be super exact one would have to take the PACKAGECONFIG into account 
to get the correct value

> +LIC_FILES_CHKSUM = "file://COPYING.md;md5=c0de2c0aca56349dab98e97992316f7e \
> +                    file://licenses/GPLv2.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> +                    file://licenses/GPLv3.txt;md5=1ebbd3e34237af26da5dc08a4e440464 \
> +                    file://licenses/hash_table.txt;md5=874823605326caeaabaa95bfbd0f9fb0 \
> +                    file://licenses/LGPLv3.txt;md5=3000208d539ec061b899bce1d9ce9404 \
> +                    file://licenses/LZ4.txt;md5=ebc2ea4814a64de7708f1571904b32cc \
> +                    file://licenses/xxhash.txt;md5=f042a9be092bd6d7fe6f217d8d00f4ca \
> +                    file://licenses/xz.txt;md5=1c389b9610ccfdb25f7abaea6a0bb5a4 \
> +                    file://licenses/zlib.txt;md5=ae27c72096606131f760e5f59cf98b06 \
> +                    file://licenses/zstd.txt;md5=8df8137b630239cbdd4c0674124cb0c8"
> +
> +PV = "1.0.2"
> +SRCREV = "b96f0fc154feef531be76034bf6e38925636146f"
> +SRC_URI = "git://github.com/AgentD/squashfs-tools-ng.git;protocol=https \
> +"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> +
> +PACKAGECONFIG ??= "gzip xz lzo lz4 zstd ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}"
> +PACKAGECONFIG[gzip] = "--with-gzip,--without-gzip,zlib"
> +PACKAGECONFIG[xz] = "--with-xz,--without-xz,xz"
> +PACKAGECONFIG[lzo] = "--with-lzo,--without-lzo,lzo"
> +PACKAGECONFIG[lz4] = "--with-lz4,--without-lz4,lz4"
> +PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
> +PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
> +
> +PACKAGES =+ "libsquashfs"
> +FILES_libsquashfs = "${libdir}/libsquashfs*${SOLIBS}"
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> +CVE_PRODUCT = "squashfs"
> 
> 
> 
> 
> 
