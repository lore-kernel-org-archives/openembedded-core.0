Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.92.74.95])
 by mx.groups.io with SMTP id smtpd.web10.9624.1621421235254734143
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 May 2021 03:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=BoKY8M4N;
 spf=pass (domain: outlook.com, ip: 40.92.74.95, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GPajtp/RCWED5fZVQx+66YhBfsFN+Xqnd62aZhhyMTlKvvUg/8z4ysg9gvUTlOE7N1H8GSpfgeqfNa1lFCknDc+XsVuRb1f1ggmP4r6Th1nIJZGZDprfB0IleKgVALBu9vrNhbWI17PPg+Mh77Lqat5ZxeCeMvGqkajcOYmJQvJOuPdwu7Xv6jxxzadRXLINHOg2L+YZjB0vEf7TsPWJDAbqZ1HApW4cBzd5im95a2TuFXy3pNHO0Pxzu6cna1mCWMYn6JeC/dosSQ9FbN4boLURHMdt5TeC7Ifn9/mu15jix1z4t9f0mf1V2wprQYJ2rOYpj/t6LY4+LmY8aDCAOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/zMB7PbIxEGoIfFHlkBIUT3Vsz3LpxvsOYmKXqe0YOo=;
 b=XPfMl0x1mG0vRKoFX/QWGgAi5bptjuHh73/cXRVjGZZ5dHWG17hKkqoG4jS2C/Sb1AAYkXU2Y2ZC9XyhhRnK1Jrmka+CNq+wi5fIbry97dOpi4681BXRjViilUfTKHJs8v8qOnljK1losfZ/CudmqJBclEhZRrtSLSp2ALgfv9CbvYChLUb8qbdNfJaAGG2yXzrnUXs2DF3XsZJeBkdn5Ky3442tmp/DRBEbfTk2hxjBSxPv1SK/P7CuXNNSPACTulmiIUP6CvBTWQ9fUrFWa7Sdblddn1nNUfKRiztDyT7pDWU25j7pdI0wQwCDC7mIvz/OCefCG7AEEubJyMkZcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/zMB7PbIxEGoIfFHlkBIUT3Vsz3LpxvsOYmKXqe0YOo=;
 b=BoKY8M4NXtNerytK2Of+h9e9lLI708r4Jr9GS2woQbSBzIokc7sEYCcnbEQXGr3kkI7Dv1vPYVc0Ss/xdsl4Y5YWMflVYy9wumGhIyl7kPs/VQ0wHjtOidbELdcgC31bNN//sW2eSMlb8u8re5abdsrOLBfeWbr2XIJ1ELRYDUi2fl52C311PWfOK3cwZCyHeIaWyFP5nr836zlXWFs+/42bc04cSnIcHmk/RHIYQfl5bpMTDv150e2x75g1oiBnKedWZCK4TjchY+G/ZPYwxnoGhKxSdyAE9lMBhBv1ojcBFsygzWl2tDZTLrQzzDgCf37HULbUHq0+RbokD/dK7g==
Received: from DB3EUR04FT011.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0c::53) by
 DB3EUR04HT077.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0c::424)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 19 May
 2021 10:47:13 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:7e0c::50) by DB3EUR04FT011.mail.protection.outlook.com
 (2a01:111:e400:7e0c::276) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend
 Transport; Wed, 19 May 2021 10:47:13 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:A1E3A55054594BA67616FA872369F4138FE03FB10323C84C6529BD9B51764606;UpperCasedChecksum:9E703236D1DD1E64F956E237B3655BFD09ADAF60B603EAF6219653C0D3B47C00;SizeAsReceived:8696;Count:47
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::9c9b:9858:17df:de84]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::9c9b:9858:17df:de84%6]) with mapi id 15.20.4129.032; Wed, 19 May 2021
 10:47:13 +0000
Subject: Re: [OE-core] [PATCH] sstatesig.py: make it fatal error when sstate manifest isn't found
To: Martin Jansa <Martin.Jansa@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20210519102302.2674317-1-Martin.Jansa@gmail.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642AC4E6EAC764B936940BAA82B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Wed, 19 May 2021 12:47:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210519102302.2674317-1-Martin.Jansa@gmail.com>
X-TMN: [SEgQmODqB2uf2atjUVdF3OrfHhXEwKSZ]
X-ClientProxiedBy: AM6P195CA0067.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::44) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <65c039a3-17c2-a2a7-53fb-25ee9d6841e6@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.87.130) by AM6P195CA0067.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::44) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 10:47:11 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 49744d43-b94e-43ac-7e0b-08d91ab3756d
X-MS-TrafficTypeDiagnostic: DB3EUR04HT077:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UihZjUs6mKuFQDwAEf/0VUecmmGRajwkbE6jZ2umQvP2o5kgEz5q1kP6zNGYn4d3Op3hKwo7bR01tx+AI59Q4kk4EXfBXUhe9r9YkXKqADXZQxFORGViFeJXlhKLZ+O1bx+FYGPtw2UDPfxz8/FLQ2dLMc79gj77d8I962MR5FlqT5GuqU/fzyCeLnjYGeA+30Un/Ch6p8mVPW8GQ88LSbQ5onbCB6SpdvYTMvpRsAt2v99UM/0hEQaupFDpIwcYCSbUStl2nECdPZJGCbECxjUbqCZTdyxy4HcAnIF+K6NUhd13uY+F9sXiUWotT0qM+YV9HVgGQ+a5xp8748oozdoGeKU3WVwHsXTbFtO0wFNoE1mC/5kXZZBpqwXyt9jreVojP+mOg4V/OUz0qPCfMhQMaN+EsbAzdETUdybejnXHRDO3ghnTi3eKna6NOyURNiI+jnESwfdwhxa429JkrQ==
X-MS-Exchange-AntiSpam-MessageData: 
	QQWTwL22cEC6z+l1KE5BZaLVC/rP3Er3w4fsSzPwSyE+hoaxmNd00O3kRHMsL0TWWHTSVTaQKx7wwBvLR54BaATYMNUz5tCZ49CF4K6ppadp3Q9ymzEHlISINHOMg4irXeOc+9fOV+rTt7vyLmRDPg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49744d43-b94e-43ac-7e0b-08d91ab3756d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 10:47:12.9836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3EUR04FT011.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3EUR04HT077
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 19.05.21 12:23, Martin Jansa wrote:
> * all known issues in this area were fixed, make it fatal that it
>    cannot be overlooked if someone triggers this issue again
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta/lib/oe/sstatesig.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index 6cd6e11acc..e86a09b332 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -453,7 +453,7 @@ def find_sstate_manifest(taskdata, taskdata2, taskname, d, multilibcache):
>           manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-%s-%s.%s" % (pkgarch, taskdata, taskname))
>           if os.path.exists(manifest):
>               return manifest, d2
> -    bb.error("Manifest %s not found in %s (variant '%s')?" % (manifest, d2.expand(" ".join(pkgarchs)), variant))
> +    bb.fatal("Manifest %s not found in %s (variant '%s')?" % (manifest, d2.expand(" ".join(pkgarchs)), variant))
>       return None, d2

doesn't that make the return statement obsolete? also how can an error 
be overlooked? It does make the task triggering this issue fail, so how 
is a fatal better in this case (besides abnormally terminating the task)

>   
>   def OEOuthashBasic(path, sigfile, task, d):
> 
> 
> 
> 
> 
