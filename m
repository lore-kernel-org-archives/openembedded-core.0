Received: from EUR06-VI1-obe.outbound.protection.outlook.com (EUR06-VI1-obe.outbound.protection.outlook.com [40.92.17.51])
 by mx.groups.io with SMTP id smtpd.web12.30203.1620025029112372174
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 May 2021 23:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=cCbbxxw8;
 spf=pass (domain: outlook.com, ip: 40.92.17.51, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pk2xEjNjvKHkAMzwVseE+OSwqHxOzZ2hYlpCo8sMpO35tALlQOqg2IMj0khbTItS0r2dHbPo6LNda9GTEPa3ggkJz6glbtAoKW3gpY3uccsGP9EufagF2GkpQzczqHYKlmR2D0noLws+0ziWAY5zDXNcW0GCnyb46poDqa53+skvgC8mhjszqNRRW9UbtKX2tm7fLUYY0+qt/GpI/zE7YyjQzODrz69eg6c+d6TNv40gd73yPy41jiaIQShUV0BjurhEjgG4MzKjrAIXBdELizEdceafwFRS6+4oryPUCd5md2kBJKT5QN206nzH+rPb9T1Ly9sjrK7iOgbqFiTkQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=osHNqdZ8D0X/ABj9P6+QSDd1t+qInHEHLfP6w4ypJ+8=;
 b=jbARK+or15rGo/8IOEctSTSSTFzjvP5mIsxsSZKqPtdVnUPRb5uQUdCjx/4sLTYZ0qPHiE6MgE9hYQcxynE+i0xrkpu52d+Yz0LQ6qxHscONyE/dcn4iKQ+lvzGZHpg7lbGBXxv1SEH8ATA7ZEQfRtZv9EtnC/m43L7dQH/JPBFXNBJ1nbhGsd1MIZfJXgobb6RAQcfBLh2elPd/cKthpnSp1wT+4oYAwNtq8S5pNgf0lOhG3y9XPCzK4DQVcUXNPXelo4F7QqL/jfKpsVky8O4P1x5eSgxe2ynZVwXrZVdIdAvQknnTjkccDvokpV3Z7is4NydHIROlBYoNDaw5eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=osHNqdZ8D0X/ABj9P6+QSDd1t+qInHEHLfP6w4ypJ+8=;
 b=cCbbxxw83Ig0JVTJ38bYmQzWRHWZUycw8/mYDwLX0HRIFsS2fH5IrcIBTHIThz6dpH8zjAFLdSOKCp4dLPYHFTVnONm383J++OAee61qgFSAokAwCzmP6AuNQ/P1cc0aEr9rrgjf3uyfbbYSnoujoI/ytVouAANdL5jvU1Sci0n5YQbOg7mLcOtv16NS/JlbOyYfmtCfvCnmv0MkWiIW2u2h/xqHVzVaGBsGAbMWOREh+msXym3gvLN43InQxapP4z5c8UA0QA4PhX5PCl0z3yRClkR/pKkkrERFFVzJByJ/Ht/uycAmnwe1aHtnSGWeo59iFV/sUWfLrt4CBdEeNA==
Received: from VI1EUR06FT003.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc37::52) by
 VI1EUR06HT071.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc37::409)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27; Mon, 3 May
 2021 06:57:06 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:fc37::53) by VI1EUR06FT003.mail.protection.outlook.com
 (2a01:111:e400:fc37::75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend
 Transport; Mon, 3 May 2021 06:57:06 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:FD6D8FFDD451E8D7F70527E17014FE8EBB03CA51A8D9C72245EEB5AEF0F81A45;UpperCasedChecksum:8E692FD8CC051288BAC964AA32872403EFDF8150E553860869E0C7610BA6E957;SizeAsReceived:8664;Count:48
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::9c9b:9858:17df:de84]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::9c9b:9858:17df:de84%6]) with mapi id 15.20.4087.044; Mon, 3 May 2021
 06:57:06 +0000
Subject: Re: [OE-core] [PATCH] cml1.bbclass: Return sorted list of cfg files
To: openembedded-core@lists.openembedded.org
References: <20210503063600.1595267-1-raj.khem@gmail.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Cc: Khem Raj <raj.khem@gmail.com>
Message-ID: 
 <AM9PR09MB4642187F03FA1776B00F4688A85B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Mon, 3 May 2021 08:57:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210503063600.1595267-1-raj.khem@gmail.com>
X-TMN: [V8sizmpcdV7iR0FaEvOiM2g5zWwdjk+j]
X-ClientProxiedBy: AM6PR08CA0004.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::16) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <04462492-8643-5d6a-c688-af1e8e80fe7d@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.90.12) by AM6PR08CA0004.eurprd08.prod.outlook.com (2603:10a6:20b:b2::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25 via Frontend Transport; Mon, 3 May 2021 06:57:04 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 30da002e-eccb-4839-d834-08d90e00a90e
X-MS-TrafficTypeDiagnostic: VI1EUR06HT071:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6WoDKRYxdDd6Pw7PiBDbmZK4IVHm5QvDGyLq+7Bgbiv9kTEoUGmALY0lhSAbisew4o1xYcRVJAxsr6DccRx1+OYfEXXxptYsoJRmvkiEJRSAb9eu/LRk4ko8M1bp/0GcWAhsVz+Jce43XJfZMNoTYKkAjtbx4Ph2aqmGB6tuM4XH39WEoR8E14Eo2+rPG9h3i2zfwZM3tcPQOsc9LDQsh/8+UA1T5I2RnrVadMo0Aw1638P0/SygE5aZKfyEGJ8Zl32noogdA6bj4XBrhE4QJUTjlb1jJ2Gy3XL3/WuqkvDtahBeVmLpEJhWw6jXME1HnTp2MNFKOcMtUOlhHKvgAm5lc3MQKvuk94WWdr1xAoO2R14rnGab5xPN5WT+gHED3X57XkeY9eMEyhdD4kubP+zXFbBSbE6sen9zmig6fsSEpu2TeeR/Y3Ggop4Qgauf
X-MS-Exchange-AntiSpam-MessageData: 
	BmQ8Kx/DHKhdn9sMlv76ywmC/fc73MIY95B5qwWMAcFNnT7hmDqmZ8+VSIY0piIbXO8z0NNVbgZmU//Kic++aGXbZx7IiRINL+o0mgti6mGT3HtUpApXs7jMHyUtXpVyPnuSjhWrIgRfIoBZqP9bxw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30da002e-eccb-4839-d834-08d90e00a90e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 06:57:06.0654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR06FT003.eop-eur06.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR06HT071
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03.05.21 08:36, Khem Raj wrote:
> Since these files are passed to merge_config.sh its better to use a
> sorted list, so we can be sure that this list is always fed in same
> order irrespective of python versions on host
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/classes/cml1.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
> index d319d66ab2..1c3d70b48d 100644
> --- a/meta/classes/cml1.bbclass
> +++ b/meta/classes/cml1.bbclass
> @@ -6,7 +6,7 @@ def find_cfgs(d):
>           if s.endswith('.cfg'):
>               sources_list.append(s)
>   
> -    return sources_list
> +    return sorted(sources_list)

Just as a thought, wouldn't it be better to have the ordering defined 
based on recipe/layer meta data?

Previously ordering was more or less based on the inode number of the 
files - now it's alphabetically.

I know that config fragments should be self containing, but seen enough 
real world examples where that isn't the case, so for them this might 
cause a breaking change (tbf the behavior before wasn't fully 
deterministic as well)

But this issue isn't limited to this particular piece of code here and 
might need some more general solution.

>   
>   cml1_do_configure() {
>   	set -e
> 
> 
> 
> 
> 
