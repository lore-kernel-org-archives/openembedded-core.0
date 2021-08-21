Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.92.73.15])
 by mx.groups.io with SMTP id smtpd.web08.2754.1629577578777022263
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Aug 2021 13:26:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=XHtKGOTI;
 spf=pass (domain: outlook.com, ip: 40.92.73.15, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L6CpF3PUY+HYUJ6dvLUAM3nLW+0YtN7XruIO1l2yOyPLz4/FXyHYUpEDZ5icaRmxpk1LTKOj+wyfP3NZKUStpb71pJvEErnkLDx58JwsfXT8h5QWElkBQkrpJH/pgKPkPrXbTyP5sirNgZsJo1cklEQzj3xqOosgrVUPGQC03S7MMrVZqVaD6YrepOlXBiK/j8nQCBNemfbIoOF3fJrcRSgIFA+oZhg7McialEjOCJp0D+s22TBzQ5OoL8Q88awmBzpaN0UGDgTe3pm2Rkuoo79ippMno6/q6xmr5jHuEyJRstWYjnCmdGk6+NPs9cxGK4dEpYCCADwKZz5Evk+ESQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POHHynrUeZO63Xt9lDKjUHMdd01tc0DT4zXtRtI12A4=;
 b=JKddw5AGH2WLGfZHlVRfuamp3rcW7xRvJayDR4X5qKw35TpuR0GwH9dHsOFK53CZ0ecs0kNfKK/DHonDQ5qNQsvuidb35Qxqh4OcqQb6wKoZiaBkf97+kYbJuyyW1grzvY33992hVptaZduQnldKxDGECFTq4sZbr96D3OEFN5vcpcCF2PeFk0pEmnmTSwghSiOS/scN6FAieY1CbXNh8RxPvoAgyuU0GmXbjHuixcEobOp920lXIw8u9OLvKhYee2UUZXG2JuvhX7FrUe3VyDNcCUZ6QwMiqYRhKAJ9jtxcbR3+F/0uUYi+m5Ke0d3SfEtlPgBVMKQbTinbpfT9JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POHHynrUeZO63Xt9lDKjUHMdd01tc0DT4zXtRtI12A4=;
 b=XHtKGOTIMwpxSskrp46FA8GaISnB1BJN9UPf/BMQNTl8Eyo2Zl9JENOoRlNchec/0FCCIqsN6ConJvHe2tXbrJuk+5V+NwRjfi/Ows7FFDtCaxzcsgH723D3Imyd/9IpUwgu3WQdbPh1pfQglFiM+cU2oxyTelxMjvtjnsp1jByLOOn2up3oNvV1Ajmh7ptKdUZggGtwgv26Bl5STSkTTsAp6DaeqKPPXI2hVZXKrAurYSOlvSXjjmWbKFtYjJnWlL2IRR6yznf6sk5nlUxgL+tz9MSyq/AtnWVSlAITJ2w/XpsZ6sC/J5S11wdVrykcKCSiTOn8+Le46BlqudjbEQ==
Received: from DB3EUR04FT011.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0c::41) by
 DB3EUR04HT061.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0c::232)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Sat, 21 Aug
 2021 20:26:15 +0000
Received: from AS8PR09MB4645.eurprd09.prod.outlook.com
 (2a01:111:e400:7e0c::48) by DB3EUR04FT011.mail.protection.outlook.com
 (2a01:111:e400:7e0c::276) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Sat, 21 Aug 2021 20:26:15 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:093D5E104D446B2DEE9E173D7C84FCD4793409ED50488F29F88E4E5F1C31486E;UpperCasedChecksum:22C1C328D4EC9D6684826B23509228155C37313C7B6EA736903EEB11AC430DEC;SizeAsReceived:8861;Count:48
Received: from AS8PR09MB4645.eurprd09.prod.outlook.com
 ([fe80::49b5:84e5:baa1:a314]) by AS8PR09MB4645.eurprd09.prod.outlook.com
 ([fe80::49b5:84e5:baa1:a314%7]) with mapi id 15.20.4436.022; Sat, 21 Aug 2021
 20:26:15 +0000
Subject: Re: [OE-core] [PATCH] goarch.bbclass: Disable GO_DYNLINK by default
To: Oliver Kranz <o.kranz.88@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com
References: <20210821200919.3064381-1-o.kranz.88@gmail.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AS8PR09MB46459A00E870A5B364082DCFA8C29@AS8PR09MB4645.eurprd09.prod.outlook.com>
Date: Sat, 21 Aug 2021 22:26:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210821200919.3064381-1-o.kranz.88@gmail.com>
X-TMN: 
 [B4FCBpJ83zvu1U1iV8Avcg9oP7CrZYZIVwPy3HzEE9flDyzaz6w5iEvqqIGGd8ENNsgyeP6wMd0=]
X-ClientProxiedBy: AM8P251CA0020.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::25) To AS8PR09MB4645.eurprd09.prod.outlook.com
 (2603:10a6:20b:292::8)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <d1c2f077-a3ff-94ea-7d8f-0e13c805ca0b@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:8109:9a80:3b94:7c30:a29b:6f9e:1941] (2a02:8109:9a80:3b94:7c30:a29b:6f9e:1941) by AM8P251CA0020.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Sat, 21 Aug 2021 20:26:14 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 50642cb1-1a56-476e-d639-08d964e1ec8a
X-MS-TrafficTypeDiagnostic: DB3EUR04HT061:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	232SMWSWo0t4qibqdu1Ey26SNKKhF4sHQrHtsxbQtoUcoCU7a9/qyv14iguiLFcU9HwJjW0Ylx/cqfpY4qWS6iXStOmSBNNIolYzA8ptCXsvNrwwI6mUzmfy1f6BPAnZJxCucDoKpuYATu9cFxZl3duD77vTy3tGvs/rB8C7KA+gM+EoB3B4GIUsTo8o/15RfTn5C8cm6r1rueLuVR4qf/1K8sOSaWrtd2irLcWoJ1F0THOnZB0Kg6OJO3vzQD1ifPkZxQLIw/UWjo+vHNS8iGjTEn67eRbv3KPbNmyCkshj9xhYyhczWxcW677lH5qaxIC62lI4L42NCHyHxA8qghMNlPEgaovfqz6FG7OIteqReCEhqiv0fCug6yOugdWycjjYJMYlwyEtDOOEiIcxBcjocr1KuTICRZfSSGsVMFDtItIQ3lC9h7iobdnX7A8IN9/tOwINYbSm7lTmkjsUs2E4iSXFeuMwJqrKruMx4gg=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	CYWwmpG30aoZmDFh2IucZj4IPMv8jTReG98TXF3Rhs3JvF7IjcDTF3o4WAlgTy8lGZXdnOjb7xve9z6MpdO95m3sGNRPIvKQ6thfaJV1t+4joirEncmj/VHxke9IZ35XyZGboibQs6+64ewWUCl3RGpfxcSJvBUXr18gG8EooFu2+OKAMGO90EhUb4awYgQEdfC/nEMSyRqHMmQdASfMDg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50642cb1-1a56-476e-d639-08d964e1ec8a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2021 20:26:15.1882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3EUR04FT011.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3EUR04HT061
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

I'd truly like to oppose the idea of static linking by default, how 
juicy this idea may sound...
But if we switch to static linking, literary no one can be be sure about 
licensing anymore (to me one of the major weak spots of go).

And I'm quite missing some numbers to back the claim that overall image 
size decreases - for a certain component that might be true, but what 
about the example of having a lot of go components in the system?

Judging from the commit message all I see as an advantage is that one 
single module (which isn't even served by the core layer) is now building.

Could you please provide some numbers for the rest?

On 21.08.21 22:09, Oliver Kranz wrote:
> Static linking has the following benefits:
>   - go-md2man (-> podman) compiles
>   - imagesize reduces, combined linking overhead needs
>      to be > 37643776 (go-runtime) for dynamic linking
>      to be beneficial
>   - reflects the default golang setup
> 
> User can still enable it, if they needs to.
> docker-ce, k3s, skopeo are ignoring the flag anyways.
> 
> Signed-off-by: Oliver Kranz <o.kranz.88@gmail.com>
> ---
>   meta/classes/goarch.bbclass | 10 +---------
>   1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
> index 92fec16b82..6e9128e44a 100644
> --- a/meta/classes/goarch.bbclass
> +++ b/meta/classes/goarch.bbclass
> @@ -31,15 +31,7 @@ BASE_GOARM:armv5 = '5'
>   
>   # Go supports dynamic linking on a limited set of architectures.
>   # See the supportsDynlink function in go/src/cmd/compile/internal/gc/main.go
> -GO_DYNLINK = ""
> -GO_DYNLINK:arm ?= "1"
> -GO_DYNLINK:aarch64 ?= "1"
> -GO_DYNLINK:x86 ?= "1"
> -GO_DYNLINK:x86-64 ?= "1"
> -GO_DYNLINK:powerpc64 ?= "1"
> -GO_DYNLINK:powerpc64le ?= "1"
> -GO_DYNLINK:class-native ?= ""
> -GO_DYNLINK:class-nativesdk = ""
> +GO_DYNLINK ?= ""
>   
>   # define here because everybody inherits this class
>   #
> 
> 
> 
> 
> 
