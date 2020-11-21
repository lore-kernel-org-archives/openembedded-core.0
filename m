Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.92.66.32])
 by mx.groups.io with SMTP id smtpd.web09.3373.1605945709480787240
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Nov 2020 00:01:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=cFQxtvWm;
 spf=pass (domain: outlook.com, ip: 40.92.66.32, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LjY80MFiMuc49d8sbTosITaNShStmrlm1/X6SCDSqf6/WS9bfVEk7Y51B/DooAAbkl2l2WsVm9Hcya1UcaTMVhSnjJUbgVA9tUGkXzXKBv8YwFl5XbDsZdAyeXivZGB2sy80/5v+MDTsXeYhZuACD3Uf0WThCoNoo2kz+4F6fkjef38i5/7dYjIGaFS5qxrqXAToh3r1u6LtI0marX8ysjQ4eBXFBG3KwdTEw6c+yr0D5WOKY5nM/RtKqVXA7I8unBz5zU1DdrZehivBUjjCwtZV4QfFNQdFGNzPaZqbae4betpWkoYaxK+sHTk0uG686pI3bnfPV+/UlrLM7AjRGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYUJKPzc+Zzp8v9Y8qruLmSmJ8uc8G/TezGJ3MIpfHE=;
 b=Y1pFvCbkvAI3Rl0HrkcVPY0IjbgQgpe/yDTdmGEmRc1xTZgBEcIUT6ViOO3yMneWKrmVjEkn/9jemH3DcnEsni1k/thLBtK1izxo1/OKlekdZpZX8s/pd7QfkjOtIYfdRJowGThD8YVu9Cxsh4TE2UAydA2BppgQpSBLqiuk/l7wke4npX4TWsljvVily0J/nv1vLMpTqWqhexWFxZkLlhFu3TA/HoJIurKWf8W+H6k2SnBr0vi1DpVE2wg8bwu0VNrcZa5s03R9UBWL8KG7px475ja1ybeTATDRzOkZ0lKK7v7nGhdkw2dZ3cXM8gfVgXenfhxrkocEdxfhP0GNEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYUJKPzc+Zzp8v9Y8qruLmSmJ8uc8G/TezGJ3MIpfHE=;
 b=cFQxtvWm3Z8kAafJMISG0XT5tKPlv6gAhxasmraRutH4TB2EkA46t4jh/C+T43eYzdetAYcjrGbwqpqVmPEhp5yl8xLrhG6b726Zyptuj6Wrovi/7E8UvCW9jr+RxUVNjXPyW0jUNVhIkV4/ji8tJ2oo7OVSdpodtT8JhafyAMmKYM0FZH5+6GW3DccgxQAq6asf7TbwLlLsuut5fzZabJa9a/KDZWEbFhhGazLa1aFQCXA34CaCFIbXC2A/EqF20bmhGi3gKJIDlb+Hi0roIAsR9dKGRkgleNA61rgqHuRz05DdF9AkSRAvDwxCF+8eZwJrDe9zCB7yxxk2gzYkvA==
Received: from VE1EUR01FT033.eop-EUR01.prod.protection.outlook.com
 (2a01:111:e400:7e19::4d) by
 VE1EUR01HT112.eop-EUR01.prod.protection.outlook.com (2a01:111:e400:7e19::307)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Sat, 21 Nov
 2020 08:01:44 +0000
Received: from VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 (2a01:111:e400:7e19::4f) by VE1EUR01FT033.mail.protection.outlook.com
 (2a01:111:e400:7e19::230) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Sat, 21 Nov 2020 08:01:44 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:E5F442138D8CBBEBC1926F5F7F09AB6DD15F55CE49827858457261CBDC81E810;UpperCasedChecksum:9322191ADE7B615F56707D3669DD46A1F92E11F6885B77D1752AC837407F5DC6;SizeAsReceived:8684;Count:47
Received: from VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 ([fe80::10f9:f756:6d75:96c3]) by VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 ([fe80::10f9:f756:6d75:96c3%6]) with mapi id 15.20.3589.021; Sat, 21 Nov 2020
 08:01:44 +0000
Subject: Re: [OE-core] [meta-oe][PATCH v3] heaptrack: add bitbake recipe
To: openembedded-core@lists.openembedded.org, Sinan Kaya <okaya@kernel.org>
References: <20201121031705.21220-1-okaya@kernel.org>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <VI1PR01MB6462348D471590E1A52A010DA8FE0@VI1PR01MB6462.eurprd01.prod.exchangelabs.com>
Date: Sat, 21 Nov 2020 09:01:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201121031705.21220-1-okaya@kernel.org>
X-TMN: [KaGl/7WuBdplFQDYpZkxoyjIeSL8LxJv]
X-ClientProxiedBy: AM6P193CA0056.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::33) To VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:154::12)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <bbcaafcc-5efc-e54b-89e2-0f54204ee20c@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (79.215.13.166) by AM6P193CA0056.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Sat, 21 Nov 2020 08:01:44 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 0ed79165-17a0-45a4-180f-08d88df3b016
X-MS-TrafficTypeDiagnostic: VE1EUR01HT112:
X-MS-Exchange-MinimumUrlDomainAge: github.com#4792
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NvrPC6Odmrm8zGr62dlfGIFg81pcbA5wpPBw1dqYLe/Nj3YD0R648k/pEmj87jF8KM8H/07j8mEDaSaOcC23YuZ0rOhKGpWyhRh4BGBsp/Qi8npokBn5HBoLtlbpj5BCVsAKqiLOXTQfK79AayJxsSERFotUfdHCCbim7QqtF+C2pn8eCXQkcxyqjTyJC/r2jVsjMTM0l/swWY+EIjscpoWLnPGWJvLffXml/pqOMrWE2hi/jWGzu6dmkWAUbGYi
X-MS-Exchange-AntiSpam-MessageData: 
	Xkll7k//xxA79jzHxWY85qEsIe97409HxQVcj7GxN3teFYbj1uy5Eyr08lCVMr6FLuU/49jY9fHDsFinmgU7ADQGEWo4x0y0eA03J1GW9Az77qDoorBaPgR3Ri90ezTPZvsujF7HL0pL85mrMjOzng==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ed79165-17a0-45a4-180f-08d88df3b016
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2020 08:01:44.8521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT033.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR01HT112
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 21.11.20 04:17, Sinan Kaya wrote:
> Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>
> Signed-off-by: Sinan Kaya <okaya@kernel.org>
> ---
>   .../heaptrack/heaptrack_git.bb                 | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>   create mode 100644 meta-oe/recipes-devtools/heaptrack/heaptrack_git.bb
> 
> diff --git a/meta-oe/recipes-devtools/heaptrack/heaptrack_git.bb b/meta-oe/recipes-devtools/heaptrack/heaptrack_git.bb
> new file mode 100644
> index 0000000000..efee3bbec4
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/heaptrack/heaptrack_git.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION = "Heaptrack"
> +HOMEPAGE = "https://phabricator.kde.org/source/heaptrack/"
> +LICENSE = "LGPL-2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> +
> +DEPENDS = "zlib boost libunwind elfutils"
> +
> +SRC_URI = "git://github.com/KDE/heaptrack.git;protocol=https"
> +
> +SRCREV = "f8d9e665196614b606eaab9c6fc81d65a88a2af1"

Why this very outdated version?
Latest tag (1.2.0) points to 
https://github.com/KDE/heaptrack/commit/bc9e3744bcc47de978673d1e382f4125a1ab5fa8

> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE += " -DHEAPTRACK_BUILD_GUI=OFF"

the leading space is not needed IMO

> +
> +BBCLASSEXTEND = "native nativesdk"
> 
> 
> 
> 
> 
