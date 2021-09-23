Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.92.89.31])
 by mx.groups.io with SMTP id smtpd.web08.1742.1632385414192213244
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Sep 2021 01:23:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=a9QxEFWM;
 spf=pass (domain: outlook.com, ip: 40.92.89.31, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ExY2PoKtEPTEtCuirKfy2Lw75C1DOKv7txNIkI/dYqAm3vyTMVbO79BKx22UzGDM6qOsmEnWMthe0Q8mzUncWFpY4ZTshv5WpQtlogqSO/89y1G2Ozt9gFz5pCUdx8LWGR4HQa5xC+OaQ0Hd2DrDHfiGMd9BDQrpbsmhvKN9i1FhBfaorx5FI1NZJfaYfAY9fWgkWvW/yTjNMsq4hRjsRfmQnEewJ1wnxePhbW83NTfPN48vrHZnV+C8uBgKqyqP/dC/MUIDB+m0N++diT0R793YyzTAxil/wfArnrugxht8XsoUO7zK3bjRgpkh3wEMRK8KBnuqvvhCvEJgllK8JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=SW3bFbJDw80zZYkJW5cEeSQNjw/fd0deu0CLgZOu5h0=;
 b=e7kFlDaQPNDeVm2pXLRpRUBnKlLsgXF3S40ayp79QXHoLGYNGkPljtCwtzJz+zWsuR9Wdj7gPKPWo15CndfRT53d03hVCRVOsz42fPrmXOMTJNJ/Npt/066lLDkSNFuObVhcVT0d362XhxkbxLwfn7m7y+TJFIM4v/qjpGhKw3/a1Yyn0Nk3cIMXcVEk8v9nwCn0oxZVHNeDFYRh1alFyUF2z2tOVFbKTyab0KuWmrDRn6Hp7GuEYe15UC01Yoxfwe2XEFHNB9NW+IvB6zaFLFZFG+KqePgC4SISaNyvv2lano/2UchGWgAqzOpH6OtXVVSDPV2C/lLTz4REJ9WsDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SW3bFbJDw80zZYkJW5cEeSQNjw/fd0deu0CLgZOu5h0=;
 b=a9QxEFWM/0+P4ivv+kvRXnfj8U+A07qXJJBveuQQGpviT0WChlekt8zwwIYrMInVFiEV1HDs8tqQYokn+zRi5PkAaIpvNZNo5i/1v+ELBcpoAc9ThjCQkmyky25eryrzWCmAHxopi4dIUkqk6OzH7wsOVm2bcSDNG++iOXv4rxiM3CDe/i311kTvu9GCFglPHGmOSA4Lm0u0dFh/2D/cMG/y/foxrQYEh5LRnKUf8LG3UHB71CuL9HaKu3Wq1NmGmOBw0SPa/ADhPLR61ak00yE1TRjsrTlo7lL1UfNJa/jRlHixkhPJcZc+da0GCxrrbHgphpqG9cgVoLZD5UGjyA==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM4PR0902MB1828.eurprd09.prod.outlook.com (2603:10a6:200:96::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Thu, 23 Sep
 2021 08:23:32 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::79a5:dec1:4b6a:6e33]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::79a5:dec1:4b6a:6e33%3]) with mapi id 15.20.4544.015; Thu, 23 Sep 2021
 08:23:32 +0000
Subject: Re: [OE-core] [PATCH] create-spdx: Don't collect natives sources
To: Saul Wold <Saul.Wold@windriver.com>,
 openembedded-core@lists.openembedded.org, JPEWhacker@gmail.com
References: <20210922221420.4115636-1-saul.wold@windriver.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642D180F4CE760601B2A4D4A8A39@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 23 Sep 2021 10:23:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210922221420.4115636-1-saul.wold@windriver.com>
X-TMN: 
 [YsI+R4KtHYqx8WfR0Q7tmA9epmLk5Mxs+vS5vlE3ZdXhk0yxewEkX/ma9oqxLn5QuuSNdGWcC8c=]
X-ClientProxiedBy: FR0P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::6) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <fa26110b-37f0-3e2e-7cf8-2fb40686480e@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:8109:9a80:3b94:11df:cd87:699f:18eb] (2a02:8109:9a80:3b94:11df:cd87:699f:18eb) by FR0P281CA0041.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.8 via Frontend Transport; Thu, 23 Sep 2021 08:23:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c7ceb02-6c70-4bfd-df46-08d97e6b6da2
X-MS-TrafficTypeDiagnostic: AM4PR0902MB1828:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CzIDCUtrKyEbBT3WbCFkSPOkhM0UxnIQvUJ747Kjc9jgcv4i510ifNP2EOxqBMFMra2VSIKMcnilbPt3CjTn9rMcyrjbuDRbWL6aORlY2dhYORJKEad5h9mLzbvoW2xeoG5wYoXXFb8uEYqgYKQXcuB/Xkzn+bHiLGbYzquOWpAGfp8E7TRk7Awg/21VYvSVpre1tQwpwLFBg4OM4QhIwglDZTrpTyeEzGrQriDut3atuo/slZ6HOZ4DoDD0/APCw9QqLQRR5jtS1JTftCUakEKwqqr1QsCZU+9SIap9DslySzPLpZUwF86E67m0FcA4gmQ+e5sHJBVGLBnppHqM8DhtKnmkeiwdf9KAFYSE00W5T9RC2P2m4D6DvphNEZPyMk5TiZtIqbeXibb24crynQNsUocxCJo8ySlRKho2t0vI2TG++38sTPHWjB4Fz3pW1CMa44kNhZXcGjg87++q5nhhe63Ch2ICeajtKpypefkhc1mOrenE21asj17FoFVtmLV3/VzV67HkkJ0TaHlYAw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	u8sp5hfljutwlsDYMLvT6sM52RgVNkZybYIkGH0LkEMnjNoI2lFeG8jKyurcQMCImXoeh/krDIZb01p6qu+oMQeW0eLG7L1F7bb4M0VbRwt8/32iGc8Lh101PFptLM1joV7LTubSg6BCvplorQY10LPS8jXZl9fLB8WO4mUmokYh6l2UBVRrP7lGd5KiUPOswUKB1YcoN9vv+pGLy49a1A==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c7ceb02-6c70-4bfd-df46-08d97e6b6da2
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 08:23:32.1510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0902MB1828
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 23.09.21 00:14, Saul Wold wrote:
> When the collect_dep_sources() runs, it collects sources from both native
> and non-native recipes. Later when the GENERATED_FROM matching occurs it
> may find the file (via checksum) from the native recipe since it's the
> same checksum as the target file. The that are generated DocumentRefs
> point to the native recipe rather than the target recipe DocumentRef.
> 
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>   meta/classes/create-spdx.bbclass | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
> index 3c73c21c04..8f7fae43f1 100644
> --- a/meta/classes/create-spdx.bbclass
> +++ b/meta/classes/create-spdx.bbclass
> @@ -336,6 +336,10 @@ def collect_dep_sources(d, dep_recipes):
>   
>       sources = {}
>       for dep in dep_recipes:
> +        # Don't collect sources from native recipes as they
> +        # match non-native sources also.
> +        if "-native" in dep.recipe.name:

That looks a bit too fuzzy to me - I would have expected

if dep.recipe.name.endswith("-native"):

here. Otherwise this is very prone to false positives


> +            continue
>           recipe_files = set(dep.recipe.hasFiles)
>   
>           for spdx_file in dep.doc.files:
> 
> 
> 
> 
> 
