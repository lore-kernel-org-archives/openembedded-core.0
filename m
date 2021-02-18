Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.92.74.13])
 by mx.groups.io with SMTP id smtpd.web10.5460.1613647391503785572
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 03:23:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=fQ2Yxv1l;
 spf=pass (domain: outlook.com, ip: 40.92.74.13, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ic1I647BRwDY3N2F9o6+iSqcn0QQNiHTHcAViyIBpDZOy1g3AKaMp8pXlk8EQEK/y18SOPZA89je4OTTMxMy3IIPf697C4sv3/Gr+hXlISNXXFsodsQBMLS6tfUoczmeIizRabmGQZZeKfmibGxiiCuKlzCcWtpNtlAwRRJ4y44eB2O+5rQkDNuNmanhIqql6ED05XFHXBtBFtr7M59uKII15psgSw91Xz+l0PP/VjXmzHgK4YHi70br3PoM9LJA/bX+8sfhdBsda/hMMLptQQ0oSOfZB6pfMl5SvHDaqaJQ0soMegdBhbJMBI+NqS/2ksE6KpRm5HqCUfV7r6Q3Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sc+BHdIB2Ft5cpK5YBEYrOJOGGoh5j1gypwTZaqb3nk=;
 b=kqIVY6uQj8hXxZI8n6XcfcibKqdUhC5gr/2+3Ra42tlQ4oMUCKq674kdXXKU13/DSu8ABH9tDyEryjS1fmGJaRbD5ZVGvcIpLdlnAeRRJohNjVLxXrQJmKyY+anBYowopBCBWuQoXWgfEnP6QX4w5QnLfpHJFA23lSlO0PCtwbuahFL72o8HR/2Gt3K6rm7H4EjpGJraUFz7zkIzPcdoWvy3O6CfULuN31qXbCTKk1ladGJ695vZ6kZoGTzGEzynjFOogwVubDZZ2XpoiyTbbc7TpV2tJUfRzz8Nqk3MZF79H/Na8igBlDN0ensxMJaxD8aJJ6h9EEQlX/Av7YxwRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sc+BHdIB2Ft5cpK5YBEYrOJOGGoh5j1gypwTZaqb3nk=;
 b=fQ2Yxv1luRsuO4Jl3+FaSk3ms78wXa5xw1ZX+bnZ3oF1+uNEDsc14NC/2kN+e03pqem5qxawb9RaxjCq/ml18DbCpSL/eJkI1AsyRC33LGkhB0Fqq6geSeeMwul9sTEOh+hZa1Vty0/JqTfSXGDwV/imE+A0nEF6DhIF1CqY55G7LQHmFNQJ/ilpFnGyhZAReMWSrIscVd98bzGa3wq9zU1Vin0a0Ty72D3vy8xC9E1lNcIufzFs1IwasmVAETVvCF04DweGRjZcswKel/oX4cpqgyCf3yplezhASurSdLYZGiD/jlx/zAPWjKblPKuTFIRqzrnBPOXleD4c9F5XUg==
Received: from DB3EUR04FT011.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0c::48) by
 DB3EUR04HT072.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0c::463)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Thu, 18 Feb
 2021 11:23:09 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:7e0c::45) by DB3EUR04FT011.mail.protection.outlook.com
 (2a01:111:e400:7e0c::276) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Thu, 18 Feb 2021 11:23:09 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:529211CBB4306C4AB7F53E39F6208BB2526F9FA5ABD1EBFC1399BAD12DB0978F;UpperCasedChecksum:1DBB93395F18FA56D4A3B827536CD26D49A700EFA8BFEB47E8A943FB3CF9200F;SizeAsReceived:8691;Count:47
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::35f3:a85d:b2c5:d4b4]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::35f3:a85d:b2c5:d4b4%4]) with mapi id 15.20.3868.028; Thu, 18 Feb 2021
 11:23:09 +0000
Subject: Re: [OE-core] [PATCH] ruby: Do not use ucontext implementation for coroutines on musl/riscv
To: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
References: <20210218035220.3828246-1-raj.khem@gmail.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB46420DA765CB5143252F750EA8859@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 18 Feb 2021 12:23:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210218035220.3828246-1-raj.khem@gmail.com>
X-TMN: [taAz3q+VD1ohYqZl9X2ikUxeBzNEBAJ2]
X-ClientProxiedBy: AM6P193CA0038.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::15) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <e4fd0978-134f-9e05-12e8-9d6c29c9ccfa@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.86.125) by AM6P193CA0038.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 11:23:09 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 82a3c39c-731a-4bf7-fd51-08d8d3ff91f7
X-MS-TrafficTypeDiagnostic: DB3EUR04HT072:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rhPUnnAFtSUOKwiypaVEnvw36zKs3YUe61NcQOaKd8Y+5MsKMmFKDtDKemSN2WoDEaEnonlxUelXok2pBFekZof98WuJ/Bhi8kNjeT3b7alopuij3s4f5PGNeAmFZtNuCMAuXUeQib58mCbEGAAxgaLXdUdrn444GuTKVdH1iYthCZfmpRxi/HJPzFNVOgfdIyTHMbwIM37uNHp8ZFclmGuHTUdkwoqpReZDOsr8YZopw+d625t3AsL73pmgc+9HVuqCWAtZmkAa6zJZ9aNLoOWexs2f4RE49ShXpxJBq7oNvpJJo4OC0oP7oIGOXmT+uS4wSgGw8dLDfFyv4jZuqZCLE4YKkRG7CTaCHR26Dylq2412ET6hcFcx18PpC9tlr/gWd2RbT9Thl8jCE0IMj0xH6ssulkj78uz13L4CyjM=
X-MS-Exchange-AntiSpam-MessageData: 
	QheTQUtZ6v/p1QrSV78MqAiSgZkiq2QsDKY2v6LhsnItEEHfyd8W5UBFPiS/XSKdJRn0ZhStyHDXYLG5Z7ABWHhqFHR3Ud8nqrf2FEia//WgYOc/RqzbU6FxcP0+jFx82xg/k8oki36CS5Cfoitivw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a3c39c-731a-4bf7-fd51-08d8d3ff91f7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 11:23:09.5688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3EUR04FT011.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3EUR04HT072
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

I think I saw something similar on x86 builds (or was it arm32, don't 
remember) - so it might be worth discussing to make this setting the 
default and configurable to the user - thoughts?

On 18.02.21 04:52, Khem Raj wrote:
> The coroutine implementation in ruby has either arch specific
> implementations or it falls back to slower ucontext API based
> implementation assuming libc will provide the needed APIs, however musl
> does not implement ucontext APIs like glibc, therefore fallback is to
> use libucontext library on musl. However, libucontext is not ported to
> riscv yet. which means on musl/riscv ruby is unbuildable, however a
> third option is to use copy implementation for coroutines, which will be
> not as good performance-wise, but it will do the job, therefore for now
> use copy implementation for rv32/rv64 when using musl
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/recipes-devtools/ruby/ruby_3.0.0.bb | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/meta/recipes-devtools/ruby/ruby_3.0.0.bb b/meta/recipes-devtools/ruby/ruby_3.0.0.bb
> index 5e143ee87f..28e12c3cd7 100644
> --- a/meta/recipes-devtools/ruby/ruby_3.0.0.bb
> +++ b/meta/recipes-devtools/ruby/ruby_3.0.0.bb
> @@ -32,6 +32,13 @@ EXTRA_OECONF_append_libc-musl = "\
>       ac_cv_func_isinf=yes \
>   "
>   
> +EXTRA_OECONF_append_libc-musl_riscv64 = "\
> +    --with-coroutine=copy \
> +"
> +EXTRA_OECONF_append_libc-musl_riscv32 = "\
> +    --with-coroutine=copy \
> +"
> +
>   do_install() {
>       oe_runmake 'DESTDIR=${D}' install
>   }
> 
> 
> 
> 
> 
