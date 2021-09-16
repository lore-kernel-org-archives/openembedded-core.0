Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.37])
 by mx.groups.io with SMTP id smtpd.web11.8882.1631786433962421528
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Sep 2021 03:00:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=iWGXZ4A8;
 spf=pass (domain: outlook.com, ip: 40.92.90.37, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iy2rIu4TJBvtuQLSbBMBZzYUj32bO5vTUBZI5LlQmac80dFmQx3EKzHQ74u8HQXQSmy9JvnraBlmEuKu29GRP2lp6CglcwJOTJBdbqbNbHWBGA2z4EncO6gzwcUn6bCffxgR8srE6Zlwl60Em02rO943KXwN7cZpJiihSQZtW+4twKtR8NQH7keE0ev7dyoPgut9lVq2huoLJpa0c9DkRJNd8WRsu3P6IdDqiJdjVDLQoz2Iqm6HILUksZZUnDjDG+fPkwo4ptemwrCogo2wF20kvFYouImRpMs2m+asaZLpz7/NwyqX3roH4w49DAfVFtymSPLoLOOaPjjoAvsGIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=bGW6lB7l7VY5BmSdrD39tQDPEIXXj2IeLkeAQO6qiis=;
 b=OsBbJpQCLWOXzzlFClk+3+FOs/Ddf2vDObvrcOdT4Y4uetcWQyP/Sy+yKr06YBY+tCRm8SCCmMxGj5sz5eJ2YAre6P0Ck7yYqiezBpQakathTWsUNxE3K01HxE0ycTeA4wKOsM3aHviWCc20Wla18LHkKaf6kkZdvRFvqOkKCZu/tCa/S+GHcnVFelwydITqWZ1Pg2OvBywgGmwiIyz7od0fvieBB6a8/0ftiZVuogWpgcHCMBeBXNAQRwkXDcdR9xEyzw3mQZABmLBjoSeEvI67JHLXRhjCBE6+D+3dtXVIQaOm5HBL9tRc0SxnN8LuStOhmnVeZ1bUm8ak2ZPaYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bGW6lB7l7VY5BmSdrD39tQDPEIXXj2IeLkeAQO6qiis=;
 b=iWGXZ4A8mwMbY1D3UlHxqdHwiw5dU9fddDXxlqZncI8mKaFepgqYq0ZzvQ34V1bGs8dxRYdYex9fz/JDnpCbdEcZuj6INxaK1bSX8GoX65P6Em9j+d2UhBvb1CwQ6gXcBzNB4tSvAvLL61enXf1kARSs6kEn4B4dwC4Lb58etkFObMAO7VrXEQnQsLuEDQoIhDrl8gANjwRGh8vbjNwAO7uF03gW23IP6qm08rqFRGnEQ0hRbRNOzRvJPMmD8rXJ4DbkmENoMLtyDoF3hg/etnikaQPEL4vUFbawY5vunwZ9VNL1sYNiB9TRd5pEESS64o3nil7jx2HbrNAJDRmdPw==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM9PR09MB4548.eurprd09.prod.outlook.com (2603:10a6:20b:281::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 10:00:31 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::79a5:dec1:4b6a:6e33]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::79a5:dec1:4b6a:6e33%3]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 10:00:31 +0000
Subject: Re: [OE-core] Undeterministic expat fetching failure
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 OE-core <openembedded-core@lists.openembedded.org>
References: <AM9PR09MB464214DEFF6D34CE649495DAA8DC9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <61f59e11f840eead9ccc3700648a5d7a5edaf79c.camel@linuxfoundation.org>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642FDD64C962E816FA78DB6A8DC9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 16 Sep 2021 12:00:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <61f59e11f840eead9ccc3700648a5d7a5edaf79c.camel@linuxfoundation.org>
X-TMN: 
 [2OkJHPgdxCXs0Kn8yruUct/OxB9Cd85+l3GaRh0TvqwDSdh47oXTBfIobce3T8jsgOwScHG+/F0=]
X-ClientProxiedBy: AM0PR03CA0004.eurprd03.prod.outlook.com
 (2603:10a6:208:14::17) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <bb27428f-c6b4-1f44-fee8-782c29e20291@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:8109:9a80:3b94:11df:cd87:699f:18eb] (2a02:8109:9a80:3b94:11df:cd87:699f:18eb) by AM0PR03CA0004.eurprd03.prod.outlook.com (2603:10a6:208:14::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 10:00:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9e9efd9-8aa5-40e2-744d-08d978f8d1cf
X-MS-TrafficTypeDiagnostic: AM9PR09MB4548:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	65+uyR4T1Jl1HBjNuynl/iu5XVoazh600FaQF62Ewwu8jzmJfsKRRvuGN0kXJZYsEIurdVwKqxux1BiXQJ+qW9is2QGnjiy5FShsDK/N/nWrtd8pqKRHUWcOLcMyNpuSkupHbsSu2HD+s43XA/oLN+QKKpv8eaNmjHyR90UrrNTgfZa27kjebdC8iji2MKI0UljVF8CAfL8Jcek+9Er2cRmKLI57/6r7kbJp/ZPus6984ul/f9ZB638DVM3f4x2+XwA91pbH2Oh9kWj1poxUJJY3T1T9+CRX2mEUVx2DcgieNba5sLAUVgtGR5L7Onsa2MHMVi2TmAJXazH4DsA0DddlVHLT5dxQWfGT+mO03brJQZJxZo5iOaJ98JcXxf4rOFJ3sjjWpeurNqsrwDHfwOPnVIdsITnMwiBrWp5FeHkFRLdcNT9s35U/uowYE2WHj2Kvjlxv9hr/QsdZeJ53eX8DmHPJZQVSO+SNkViBjn0=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	2sx3UdrPI16JrRVj5xhekIvkJZzUid3sbEKujIyxXy52B1Q/JHr/hdFPkWOPSjq+JIIxwQ9Ir4v9f/9sToTyjdeQzvKAaG0cXUg7imV0MShi10DHCjTMGaIosxMIw1UJXd8QgZ2+eE73UnOCwBnXYcpgElB4J4LyFQuDd4En2KXBqN9UX7oDRpQg1zWn82FWmyCNWVu25WTI8ThOomMrpQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9e9efd9-8aa5-40e2-744d-08d978f8d1cf
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 10:00:31.8933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR09MB4548
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 16.09.21 11:53, Richard Purdie wrote:
> On Thu, 2021-09-16 at 11:31 +0200, Konrad Weihmann wrote:
>> Hi all,
>>
>> ERROR: expat-2.2.10-r0 do_fetch: Fetcher failure: Fetch command export
>> PSEUDO_DISABLED=1; export
>> PATH="/opt/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/opt/build/sources/poky/scripts:/opt/build/build/tmp/work/core2-64-scatest-linux/expat/2.2.10-r0/recipe-sysroot-native/usr/bin/x86_64-scatest-linux:/opt/build/build/tmp/work/core2-64-scatest-linux/expat/2.2.10-r0/recipe-sysroot/usr/bin/crossscripts:/opt/build/build/tmp/work/core2-64-scatest-linux/expat/2.2.10-r0/recipe-sysroot-native/usr/sbin:/opt/build/build/tmp/work/core2-64-scatest-linux/expat/2.2.10-r0/recipe-sysroot-native/usr/bin:/opt/build/build/tmp/work/core2-64-scatest-linux/expat/2.2.10-r0/recipe-sysroot-native/sbin:/opt/build/build/tmp/work/core2-64-scatest-linux/expat/2.2.10-r0/recipe-sysroot-native/bin:/opt/build/sources/poky/bitbake/bin:/opt/build/build/tmp/hosttools";
>> export HOME="/github/home"; /usr/bin/env wget -t 2 -T 30 --passive-ftp
>> --no-check-certificate -P
>> /opt/build/build/tmp/work/core2-64-scatest-linux/expat/downloads
>> 'https://downloads.sourceforge.net/expat/expat-2.2.10.tar.bz2'
>> --progress=dot -v failed with exit code 8, output:
>> --2021-09-16 09:13:26--
>> https://downloads.sourceforge.net/expat/expat-2.2.10.tar.bz2
>> Resolving downloads.sourceforge.net (downloads.sourceforge.net)...
>> 204.68.111.105
>> Connecting to downloads.sourceforge.net
>> (downloads.sourceforge.net)|204.68.111.105|:443... connected.
>> HTTP request sent, awaiting response... 404 Not Found
>> 2021-09-16 09:13:26 ERROR 404: Not Found.
>>
>> that one happens like every 100th attempt - and this seems to be an
>> issue of sourceforge. (I got a hunch that actually not all mirrors of SF
>> do still have the yanked version 2.2.10).
> 
> I suspect you're right and this is something to do with some mirrors deleting
> removed files and some not.
> 
>> Also the projects moved to github a while ago - are there any reasons
>> why the recipe still pulls it from sourceforge?
>>
>> If not I could spin up a patch to fetch form GH with git
> 
> Tarball releases are a lot more efficient for the system. Git based recipes make
> the versioning less obvious and easier to break, are harder to mirror and thrown
> more data around causing more build IO. There are therefore pros and cons to
> tarballs vs. git urls.
> 
> Sourceforge does appear to continue to store tarball releases.

How about pulling the release tarball from github instead?
https://github.com/libexpat/libexpat/releases/download/R_2_2_10/expat-2.2.10.tar.bz2 
should be fine IINM

> 
> Cheers,
> 
> Richard
> 
> 
> 
